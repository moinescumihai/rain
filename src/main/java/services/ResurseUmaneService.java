package services;

import model.domain.ResurseUmane;
import model.domain.User;

import java.util.List;

public interface ResurseUmaneService {
    ResurseUmane findByIdUser(User id);

    ResurseUmane findOne(long id);

    ResurseUmane findByUsername(String username);

    List<ResurseUmane> findAllPersoane();

    List<ResurseUmane> getPersoaneByFirstLetter(String firstLetter);

    ResurseUmane findByFullNameEquals(String fullName);
}
