package services;

import model.domain.InventoryItem;
import model.domain.Stoc;

import java.util.List;

public interface InventoryService {

    List<Stoc> findAll();

    List<InventoryItem> findAllItems();

    Stoc save(Stoc entity);
}
