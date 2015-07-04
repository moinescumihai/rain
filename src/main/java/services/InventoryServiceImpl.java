package services;

import model.domain.InventoryItem;
import model.domain.Stoc;
import model.repository.InventoryItemRepository;
import model.repository.LocRepository;
import model.repository.StocRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
    private LocRepository locRepository;
    @Autowired
    private ResurseUmaneService resurseUmaneService;
    @Autowired
    private InventoryItemRepository inventoryItemRepository;


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
}
