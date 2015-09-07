package services.inventory;

import model.domain.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface InventoryService {

    List<Stoc> findAllItems();

    Stoc save(Stoc entity);

    Stoc update(Stoc entity);

    List<StareStoc> findAllStari();

    TranzactieStoc findLastTranzactieForArticol(Long idArticol);

    List<TranzactieStoc> findAllTranzactiiForArticol(Long idArticol);

    String generateBarcode(String id);

    String downloadBarcode(String barcode, HttpServletResponse response);

}
