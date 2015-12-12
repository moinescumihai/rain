package services.inventory;

import com.google.zxing.BarcodeFormat;
import common.utils.UserUtils;
import model.common.FileBean;
import model.domain.*;
import model.forms.GrupStocFormModel;
import model.forms.InventarFormModel;
import model.forms.StocFormModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import services.ResurseUmaneService;
import services.files.FilesService;
import services.repository.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

@Service
public class InventoryServiceImpl implements InventoryService {
    private static final Logger LOGGER = LoggerFactory.getLogger(InventoryServiceImpl.class);

    @Autowired
    private StocRepository stocRepository;
    @Autowired
    private StareStocRepository stareStocRepository;
    @Autowired
    private TranzactieStocRepository tranzactieStocRepository;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private BarcodeService barcodeService;
    @Autowired
    private ColetRepository coletRepository;
    @Autowired
    private CategorieStocRepository categorieStocRepository;
    @Autowired
    private GrupStocRepository grupStocRepository;
    @Autowired
    private LocRepository locRepository;
    @Autowired
    private ResurseUmaneService resurseUmaneService;
    @Autowired
    private FilesService filesService;

    @Override
    @Transactional
    public List<Stoc> findAllItems() {
        try {
            return stocRepository.findAllByDeletedEquals(0);
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_INVENTORY_ITEMS", e);
            return Collections.emptyList();
        }
    }

    @Override
    public List<Stoc> findItemsForUser() {
        Persoana user = resurseUmaneService.findByUsername(UserUtils.getLoggedInUsername());
        try {
            return stocRepository.findAllByIdPersoanaAndDeleted(user, 0);
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_INVENTORY_ITEMS", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    public Stoc save(StocFormModel entity) {
        Stoc stoc = new Stoc();
        stoc.setIdCategorieStoc(categorieStocRepository.findOne(entity.getIdCategorieStoc()));
        stoc.setIdGrupStoc(grupStocRepository.findOne(entity.getIdGrupStoc()));
        stoc.setNumeStoc(entity.getNumeStoc());
        stoc.setIdStare(stareStocRepository.findOne(1L));
        stoc.setIdLoc(locRepository.findOne(entity.getIdLoc()));
        stoc.setDetalii(entity.getDetalii());

        stoc = saveDefaultStoc(stoc);
        Colet colet = new Colet();
        colet.setNumeColet(String.valueOf(UUID.randomUUID()));
        colet = coletRepository.save(colet);
        buildAndSaveTranzactieStoc(stoc, colet, stoc.getDetalii());

        return stoc;
    }

    @Override
    @Transactional
    public Stoc edit(StocFormModel entity) {
        Stoc stoc = stocRepository.findOne(entity.getIdStoc());
        stoc.setNumeStoc(entity.getNumeStoc());
        stoc.setIdCategorieStoc(categorieStocRepository.findOne(entity.getIdCategorieStoc()));
        stoc.setIdGrupStoc(grupStocRepository.findOne(entity.getIdGrupStoc()));
        stoc.setIdStare(stareStocRepository.findOne(entity.getIdStare()));
        stoc.setIdLoc(locRepository.findOne(entity.getIdLoc()));
        stoc.setIdPersoana(resurseUmaneService.findOne(entity.getIdResurseUmane()));
        stoc = stocRepository.save(stoc);
        buildAndSaveTranzactieStoc(stoc, null, entity.getDetalii());

        return stoc;
    }

    private TranzactieStoc buildAndSaveTranzactieStoc(Stoc entity, Colet idColet, String detalii) {
        TranzactieStoc previousTranzanction = tranzactieStocRepository.findFirstByIdStocOrderByIdTranzactieStocDesc(entity);
        if (previousTranzanction != null && idColet == null) {
            idColet = previousTranzanction.getIdColet();
        }
        StareStoc idStareAnterioara = previousTranzanction == null ? stareStocRepository.findOne(1L) : previousTranzanction.getIdStare();
        TranzactieStoc newStockAdded = new TranzactieStoc();
        newStockAdded.setIdStoc(entity);
        newStockAdded.setIdLoc(entity.getIdLoc());
        newStockAdded.setIdPersoana(entity.getIdPersoana());
        newStockAdded.setIdStareAnterioara(idStareAnterioara);
        newStockAdded.setIdStare(entity.getIdStare());
        newStockAdded.setIdColet(idColet);
        newStockAdded.setDetalii(detalii);
        newStockAdded.setDataTranzactie(new Timestamp(System.currentTimeMillis()));

        return tranzactieStocRepository.save(newStockAdded);
    }

    private Stoc saveDefaultStoc(Stoc entity) {
        String codStoc = String.valueOf(UUID.randomUUID());
        entity.setCodStoc(codStoc);

        return stocRepository.save(entity);
    }

    @Override
    public List<StareStoc> findAllStari() {
        try {
            return (List<StareStoc>) stareStocRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_STARI", e);
            return Collections.emptyList();
        }
    }

    @Override
    public Stoc findArticol(Long idArticol) {
        return stocRepository.findOne(idArticol);
    }

    @Override
    public Stoc findArticolByCodStoc(String codStoc) {
        return stocRepository.findOneByCodStocEquals(codStoc);
    }

    @Override
    public TranzactieStoc findLastTranzactieForArticol(Long idArticol) {
        try {
            Stoc stoc = stocRepository.findOne(idArticol);
            return tranzactieStocRepository.findFirstByIdStocOrderByIdTranzactieStocDesc(stoc);
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_SUCH_ID_ARTICOL_IN_TRANZACTIE", e);
            throw new IllegalArgumentException("INVENTAR.NO_SUCH_ID_ARTICOL_IN_TRANZACTIE");
        }
    }

    @Override
    public List<TranzactieStoc> findAllTranzactiiForArticol(Long idArticol) {
        try {
            Stoc stoc = stocRepository.findOne(idArticol);
            return tranzactieStocRepository.findByIdStocOrderByIdTranzactieStocDesc(stoc);
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_SUCH_ID_ARTICOL_IN_TRANZACTIE", e);
            return Collections.emptyList();
        }
    }

    @Override
    public String generateBarcode(String id) {
        File f;
        try {
            String dirPath = "/WEB-INF" + File.separatorChar + "resources" + File.separatorChar + "barcode";
            String contextDirName = servletContext.getRealPath(dirPath);
            File dir = new File(contextDirName);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String filename = dir + File.separator + id + ".png";
            f = new File(filename);
            if (!f.exists()) {
                f.createNewFile();
                barcodeService.encode(f, id, BarcodeFormat.CODE_128);
            }

        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return null;
        }

        return f.getAbsolutePath();
    }

    @Override
    public String downloadBarcode(String barcode, HttpServletResponse response) {
        String dirPath = "/WEB-INF" + File.separatorChar + "resources" + File.separatorChar + "barcode";
        String contextDirName = this.servletContext.getRealPath(dirPath);
        File dir = new File(contextDirName);
        String filename = dir + File.separator + barcode + ".png";
        FileBean file = new FileBean();
        File serverFile = new File(filename);

        byte[] bytes = null;
        try (BufferedInputStream stream = new BufferedInputStream(new FileInputStream(serverFile))) {
            bytes = new byte[(int) serverFile.length()];
            stream.read(bytes);
        } catch (IOException e) {
            LOGGER.error(e.getMessage(), e);
        }
        file.setFile(bytes);
        file.setFilename(barcode + ".png");

        response.setContentLength(file.getFile().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getFilename() + "\"");

        try {
            FileCopyUtils.copy(file.getFile(), response.getOutputStream());
        } catch (IOException e) {
            LOGGER.error(e.getMessage(), e);
        }

        return "success";
    }

    @Override
    public List<Loc> findAllLocuri() {
        try {
            return (List<Loc>) locRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_LOCURI", e);
            return Collections.emptyList();
        }
    }

    @Override
    public Loc saveLoc(Loc entity) {
        return locRepository.save(entity);
    }

    @Override
    public List<CategorieStoc> findAllCategorii() {
        try {
            return (List<CategorieStoc>) categorieStocRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_CATEGORII", e);
            return Collections.emptyList();
        }
    }

    @Override
    public CategorieStoc saveCategorie(CategorieStoc entity) {
        return categorieStocRepository.save(entity);
    }

    @Override
    public List<GrupStoc> findAllTipuri() {
        try {
            return (List<GrupStoc>) grupStocRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_GRUP", e);
            return Collections.emptyList();
        }
    }

    @Override
    public List<GrupStoc> findTipuriByCategorieStoc(Long idCategorieStoc) {
        try {
            return grupStocRepository.findAllByIdCategorieStocEquals(categorieStocRepository.findOne(idCategorieStoc));
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_GRUP", e);
            return Collections.emptyList();
        }
    }

    @Override
    public List<Persoana> findAllPersoane() {
        return resurseUmaneService.findAllPersoane();
    }

    @Override
    public GrupStoc saveGrup(GrupStocFormModel entity) {
        GrupStoc grupStoc = new GrupStoc();
        grupStoc.setIdCategorieStoc(categorieStocRepository.findOne(entity.getIdCategorieStoc()));
        grupStoc.setNumeGrup(entity.getNumeGrup());
        return grupStocRepository.save(grupStoc);
    }

    @Override
    public Stoc removeStoc(Long idStoc) {
        Stoc stoc = stocRepository.findOne(idStoc);
        stoc.setDeleted(1);
        return stocRepository.save(stoc);
    }

    @Override
    @Transactional
    public boolean iesire(InventarFormModel model) {
        Stoc stoc;
        Colet colet = new Colet();
        colet.setNumeColet(String.valueOf(UUID.randomUUID()));
        coletRepository.save(colet);
        StareStoc stareStoc = stareStocRepository.findOne(model.getTipIesire());
        for (long idArticol : model.getArticole()) {
            stoc = stocRepository.findOne(idArticol);
            stoc.setIdLoc(locRepository.findOne(model.getIdLoc()));
            stoc.setIdPersoana(resurseUmaneService.findOne(model.getIdPersoana()));
            stoc.setIdStare(stareStoc);
            stocRepository.save(stoc);
            buildAndSaveTranzactieStoc(stoc, colet, model.getDetalii());
        }
        return true;
    }

    @Override
    @Transactional
    public boolean intrare(InventarFormModel model) {
        Stoc stoc;
        Colet colet = new Colet();
        colet.setNumeColet(String.valueOf(UUID.randomUUID()));
        coletRepository.save(colet);
        StareStoc stareStoc = stareStocRepository.findOne(2L);
        for (long idArticol : model.getArticole()) {
            stoc = stocRepository.findOne(idArticol);
            stoc.setIdLoc(locRepository.findOne(model.getIdLoc()));
            stoc.setIdPersoana(null);
            stoc.setIdStare(stareStoc);
            stocRepository.save(stoc);
            buildAndSaveTranzactieStoc(stoc, colet, model.getDetalii());
        }
        return true;
    }
}
