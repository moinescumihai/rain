package services;

import model.domain.ResurseUmane;

import java.util.List;

public interface ResurseUmaneService {
    ResurseUmane findByIdUser(long id);

    ResurseUmane findOne(long id);

    ResurseUmane findByUsername(String username);

    List<ResurseUmane> findAllPersoane();
}
