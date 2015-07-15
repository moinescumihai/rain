package services;

import model.domain.InventoryItem;
import model.domain.StareStoc;
import model.domain.Stoc;
import model.domain.TranzactieStoc;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface InventoryService {

    List<Stoc> findAll();

    List<InventoryItem> findAllItems();

    Stoc save(Stoc entity);

    List<StareStoc> findAllStari();

    TranzactieStoc findLastTranzactieForArticol(Long idArticol);

    List<TranzactieStoc> findAllTranzactiiForArticol(Long idArticol);

    String generateBarcode(String id);

    String downloadBarcode(String barcode, HttpServletResponse response);
}
