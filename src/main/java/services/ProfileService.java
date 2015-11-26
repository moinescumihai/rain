package services;

import model.domain.ResurseUmane;

import java.util.List;

public interface ProfileService {
    ResurseUmane getRaindropUser(String username);

    ResurseUmane getLoggedInRaindropUser();

    String changePassword(String password);

    List<ResurseUmane> getEnabledUsers();
}
