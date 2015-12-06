package services.repository;

import model.domain.Attachment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AttachmentRepository extends CrudRepository<Attachment, Long> {
    List<Attachment> findAllByIsDirectoryAndParent(Integer isDirectory, Integer parent);

    Attachment findByPathEquals(String path);

    List<Attachment> findAllByIdProiectEqualsOrderByCreatLaDesc(long idProject);
}
