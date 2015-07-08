package model.repository;


import model.domain.TranzactieStoc;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TranzactieStocRepository extends CrudRepository<TranzactieStoc, Long> {
    TranzactieStoc findFirstByIdStocOrderByIdTranzactieStocDesc(Long idArticol);

    List<TranzactieStoc> findByIdStocOrderByIdTranzactieStocDesc(Long idArticol);
}
