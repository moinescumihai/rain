package services.inventory;

import model.domain.*;
import model.forms.GrupStocFormModel;
import model.forms.InventarFormModel;
import model.forms.StocFormModel;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Service
public interface InventoryService {

    List<Stoc> findAllItems();

    List<Stoc> findItemsForUser();

    Stoc save(StocFormModel entity);

    Stoc edit(StocFormModel entity);

    Stoc findArticol(Long idArticol);

    Stoc findArticolByCodStoc(String codStoc);

    List<StareStoc> findAllStari();

    TranzactieStoc findLastTranzactieForArticol(Long idArticol);

    List<TranzactieStoc> findAllTranzactiiForArticol(Long idArticol);

    String generateBarcode(String id);

    String downloadBarcode(String barcode, HttpServletResponse response);

    List<Loc> findAllLocuri();

    Loc saveLoc(Loc entity);

    List<CategorieStoc> findAllCategorii();

    List<GrupStoc> findAllTipuri();

    List<GrupStoc> findTipuriByCategorieStoc(Long idCategorieStoc);

    List<Persoana> findAllPersoane();

    CategorieStoc saveCategorie(CategorieStoc entity);

    GrupStoc saveGrup(GrupStocFormModel entity);

    Stoc removeStoc(Long idStoc);

    boolean iesire(InventarFormModel iesire);

    boolean intrare(InventarFormModel model);
}
