package model.repository;

import model.domain.Attachment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AttachmentRepository extends CrudRepository<Attachment, Long> {
    List<Attachment> findAllByIsDirectoryAndParent(Integer isDirectory, Integer parent);

}
