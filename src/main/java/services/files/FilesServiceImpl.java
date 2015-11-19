package services.files;

import model.domain.Attachment;
import model.domain.Stoc;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import services.repository.AttachmentRepository;
import services.repository.StocRepository;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Service
public class FilesServiceImpl implements FilesService {
    private static final Logger LOGGER = LoggerFactory.getLogger(FilesServiceImpl.class);

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
        String fileName = pathOnServer.substring(pathOnServer.lastIndexOf(File.separatorChar) + 1);

        Attachment image = new Attachment();
        image.setIdStoc(idStoc);
        image.setFileName(fileName);
        image.setSize(imageFile.getSize());
        image.setOriginalFileName(originalFilename);
        image.setPath(pathOnServer);
        image.setParent(attachmentRepository.findOne(1L));

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
    public List<Attachment> listFiles(long id) {
        List<Attachment> files;
        if (id == 0) {
            files = attachmentRepository.findAllByIsDirectoryAndParent(1, null);
        } else {
            files = (List<Attachment>) attachmentRepository.findOne(id).getChildren();
        }

        return files;
    }

    @Override
    public long getFolderForPath(String path) {
        return attachmentRepository.findByPathEquals(path).getIdAttachment();
    }
}
