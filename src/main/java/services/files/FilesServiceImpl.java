package services.files;

import com.google.common.collect.Lists;
import common.utils.UserUtils;
import model.common.TreeFile;
import model.domain.Attachment;
import model.domain.Stoc;
import model.repository.AttachmentRepository;
import model.repository.StocRepository;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@Service
public class FilesServiceImpl implements FilesService {
    private static final Logger LOGGER = LoggerFactory.getLogger(FilesServiceImpl.class);

    @Autowired
    private ServletContext servletContext;
    @Autowired
    private AttachmentRepository attachmentRepository;
    @Autowired
    private StocRepository stocRepository;


    @Override
    public String writeFileToDisk(MultipartFile file) {
        byte[] bytes;
        String originalFileName = file.getOriginalFilename();
        String fileName = String.format("%s.%s", RandomStringUtils.randomAlphanumeric(8), originalFileName.substring(originalFileName.lastIndexOf(".") - 1));
        String contextDirName = System.getProperty("catalina.home") + File.separator + "attachments";
        File dir = new File(contextDirName);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // Create the file on server
        String filePath = dir + File.separator + fileName;
        File serverFile = new File(filePath);
        try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
            serverFile.createNewFile();
            bytes = file.getBytes();
            stream.write(bytes);
        } catch (IOException e) {
            LOGGER.error(e.getMessage(), e);
        }

        return serverFile.getAbsolutePath();
    }

    @Override
    @Transactional
    public Attachment saveStocImage(long idStoc, MultipartFile imageFile) {
        String pathOnServer = writeFileToDisk(imageFile);
        String originalFilename = imageFile.getOriginalFilename();
        String fileName = pathOnServer.substring(pathOnServer.lastIndexOf(File.separatorChar));

        Attachment image = new Attachment();
        image.setIdStoc(idStoc);
        image.setFileName(fileName);
        image.setSize(imageFile.getSize());
        image.setOriginalFileName(originalFilename);
        image.setPath(pathOnServer);
        image.setCreatDe(UserUtils.getLoggedInUsername());
        image.setCreatLa(new Timestamp(System.currentTimeMillis()));

        image = attachmentRepository.save(image);
        Stoc stocToBeUpdated = stocRepository.findOne(idStoc);
        stocToBeUpdated.setImagine(image);
        stocRepository.save(stocToBeUpdated);

        return image;
    }

    @Override

    public Attachment getStocImage(long idStoc) {
        long idAttachment = stocRepository.findOne(idStoc).getImagine().getIdAttachment();
        return attachmentRepository.findOne(idAttachment);
    }

    @Override
    public List<TreeFile> listFiles(long id, String name, long level, String url) {
        List<Attachment> allFiles = (List<Attachment>) attachmentRepository.findAll();
        List<TreeFile> treeFiles = Lists.newArrayList();
        for (Attachment file : allFiles) {
            treeFiles.add(new TreeFile(file.getIdAttachment(), file.getOriginalFileName(), file.getPath(), file.getSize()));
        }
        return treeFiles;
    }
}
