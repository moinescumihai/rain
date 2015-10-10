package services.inventory;

import model.domain.Loc;

public interface LocService {
    Loc findById(long idLoc);
}
