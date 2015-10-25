package services.repository;


import model.domain.Stoc;
import model.domain.TranzactieStoc;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TranzactieStocRepository extends CrudRepository<TranzactieStoc, Long> {
    TranzactieStoc findFirstByIdStocOrderByIdTranzactieStocDesc(Stoc articol);

    List<TranzactieStoc> findByIdStocOrderByIdTranzactieStocDesc(Stoc articol);
}
