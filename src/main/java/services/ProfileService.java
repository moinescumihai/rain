package services;

import model.domain.ResurseUmane;

public interface ProfileService {
    ResurseUmane getRaindropUser(String username);

    ResurseUmane getLoggedInRaindropUser();

    String changePassword(String password);
}
