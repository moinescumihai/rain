package services.repository;

import model.domain.Persoana;
import model.domain.Proiect;
import model.domain.UserOnProject;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserOnProjectRepository extends CrudRepository<UserOnProject, Long> {
    List<Persoana> findAllByProiectEquals(Proiect proiect);

    UserOnProject findByPersoanaAndProiectEquals(Persoana persoana, Proiect proiect);
}
