package services.repository;


import model.domain.CategorieStoc;
import model.domain.GrupStoc;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface GrupStocRepository extends CrudRepository<GrupStoc, Long> {
    List<GrupStoc> findAllByIdCategorieStocEquals(CategorieStoc idCategorieStoc);
}
