package services;

import com.google.zxing.BarcodeFormat;
import model.common.FileBean;
import model.domain.InventoryItem;
import model.domain.StareStoc;
import model.domain.Stoc;
import model.domain.TranzactieStoc;
import model.repository.InventoryItemRepository;
import model.repository.StareStocRepository;
import model.repository.StocRepository;
import model.repository.TranzactieStocRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import services.inventory.BarcodeService;

import javax.persistence.LockModeType;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@Service
public class InventoryServiceImpl implements InventoryService {
    private static final Logger LOGGER = LoggerFactory.getLogger(InventoryServiceImpl.class);

    @Autowired
    private StocRepository stocRepository;
    @Autowired
    private StareStocRepository stareStocRepository;
    @Autowired
    private InventoryItemRepository inventoryItemRepository;
    @Autowired
    private TranzactieStocRepository tranzactieStocRepository;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private BarcodeService barcodeService;


    @Override
    @Transactional
    public List<Stoc> findAll() {
        try {
            return (List<Stoc>) stocRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_INVENTAR", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    @Lock(LockModeType.READ)
    public List<InventoryItem> findAllItems() {
        try {
            return (List<InventoryItem>) inventoryItemRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_INVENTORY_ITEMS", e);
            return Collections.emptyList();
        }
    }

    @Override
    @Transactional
    @Lock(LockModeType.READ)
    public Stoc save(Stoc entity) {
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
    @Transactional
    @Lock(LockModeType.READ)
    public TranzactieStoc findLastTranzactieForArticol(Long idArticol) {
        try {
            return tranzactieStocRepository.findFirstByIdStocOrderByIdTranzactieStocDesc(idArticol);
        } catch (DataAccessException e) {
            LOGGER.error("INVENTAR.NO_SUCH_ID_ARTICOL_IN_TRANZACTIE", e);
            throw new IllegalArgumentException("INVENTAR.NO_SUCH_ID_ARTICOL_IN_TRANZACTIE");
        }
    }

    @Override
    public List<TranzactieStoc> findAllTranzactiiForArticol(Long idArticol) {
        try {
            return tranzactieStocRepository.findByIdStocOrderByIdTranzactieStocDesc(idArticol);
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
            }
            barcodeService.encode(f, id, BarcodeFormat.CODE_128);

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
}
