package services.repository;


import model.domain.Persoana;
import model.domain.Stoc;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface StocRepository extends CrudRepository<Stoc, Long> {
    List<Stoc> findAllByDeletedEquals(Integer deleted);

    List<Stoc> findAllByIdPersoanaAndDeleted(Persoana persoana, Integer deleted);

    Stoc findOneByCodStocEquals(String codStoc);
}
