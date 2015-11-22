package services.repository;


import model.domain.ResurseUmane;
import model.domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ResurseUmaneRepository extends CrudRepository<ResurseUmane, Long> {
    ResurseUmane findByIdUser(User idUser);

    List<ResurseUmane> findAllByNumeStartingWithOrderByNumeAsc(String firstLetter);

    ResurseUmane findByFullNameEquals(String fullName);
}
