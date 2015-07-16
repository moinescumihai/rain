package model.repository;


import model.domain.History;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface InventoryHistoryRepository extends CrudRepository<History, Long> {
    History findFirstByIdStocOrderByIdTranzactieStocDesc(Long idArticol);

    List<History> findByIdStocOrderByIdTranzactieStocDesc(Long idArticol);
}
