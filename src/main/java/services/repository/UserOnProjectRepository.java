package services.repository;

import model.domain.Proiect;
import model.domain.ResurseUmane;
import model.domain.UserOnProject;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserOnProjectRepository extends CrudRepository<UserOnProject, Long> {
    List<ResurseUmane> findAllByProiectEquals(Proiect proiect);

    UserOnProject findByPersoanaAndProiectEquals(ResurseUmane persoana, Proiect proiect);
}
