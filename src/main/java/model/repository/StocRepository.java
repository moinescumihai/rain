package model.repository;


import model.domain.ResurseUmane;
import model.domain.Stoc;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StocRepository extends CrudRepository<Stoc, Long> {
    List<Stoc> findAllByDeletedEquals(Integer deleted);

    List<Stoc> findAllByIdResurseUmaneEquals(ResurseUmane resurseUmane);
}
