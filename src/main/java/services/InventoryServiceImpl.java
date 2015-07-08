package services;

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
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.LockModeType;
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
    @Qualifier("tranzactieStocRepository")
    @Autowired
    private TranzactieStocRepository tranzactieStocRepository;


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
}
