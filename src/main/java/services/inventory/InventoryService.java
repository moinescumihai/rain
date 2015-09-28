package services.inventory;

import model.domain.StareStoc;
import model.domain.Stoc;
import model.domain.StocFormModel;
import model.domain.TranzactieStoc;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface InventoryService {

    List<Stoc> findAllItems();

    Stoc save(StocFormModel entity);

    Stoc update(Stoc entity);

    List<StareStoc> findAllStari();

    TranzactieStoc findLastTranzactieForArticol(Long idArticol);

    List<TranzactieStoc> findAllTranzactiiForArticol(Long idArticol);

    String generateBarcode(String id);

    String downloadBarcode(String barcode, HttpServletResponse response);

}
