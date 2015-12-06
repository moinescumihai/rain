package services.files;

import model.domain.Attachment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface FilesService {
    String writeFileToDisk(MultipartFile file);

    Attachment saveStocImage(long idStoc, MultipartFile attachment);

    Attachment getStocImage(long idStoc);

    List<Attachment> listFiles(long id);

    long getFolderForPath(String path);

    List<Attachment> getFilesForProject(long idProject);
}
