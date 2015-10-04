package services.files;

import model.domain.Attachment;
import org.springframework.web.multipart.MultipartFile;

public interface FilesService {
    String writeFileToDisk(MultipartFile file);

    Attachment saveStocImage(long idStoc, MultipartFile attachment);

    Attachment getStocImage(long idStoc);
}
