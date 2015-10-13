package services.files;

import model.common.TreeFile;
import model.domain.Attachment;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface FilesService {
    String writeFileToDisk(MultipartFile file);

    Attachment saveStocImage(long idStoc, MultipartFile attachment);

    Attachment getStocImage(long idStoc);

    List<TreeFile> listFiles(long id, String name, long level, String url);
}
