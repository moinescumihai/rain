package services.repository;


import model.domain.ResurseUmane;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ResurseUmaneRepository extends CrudRepository<ResurseUmane, Long> {
    ResurseUmane findByIdUser(Long idUser);

    List<ResurseUmane> findAllByNumeStartingWithOrderByNumeAsc(String firstLetter);
}
