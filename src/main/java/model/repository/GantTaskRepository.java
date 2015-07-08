package model.repository;


import model.domain.GantTask;
import org.springframework.data.repository.CrudRepository;

public interface GantTaskRepository extends CrudRepository<GantTask, Long> {
}
