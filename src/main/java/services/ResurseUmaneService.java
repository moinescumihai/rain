package services;

import model.domain.ResurseUmane;

public interface ResurseUmaneService {
    ResurseUmane findByIdUser(long id);

    ResurseUmane findOne(long id);
}
