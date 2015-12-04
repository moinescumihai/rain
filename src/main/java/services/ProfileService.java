package services;

import model.domain.Persoana;
import model.domain.UserRole;
import model.forms.PersoanaFormModel;

import java.util.List;

public interface ProfileService {
    Persoana getRaindropUser(String username);

    Persoana getLoggedInRaindropUser();

    String changePassword(String password);

    List<Persoana> getEnabledUsers();

    List<Persoana> getAllUsers();

    Persoana activateUser(long idUser);

    Persoana deactivateUser(long idUser);

    List<UserRole> getRolesForUser(long idUser);

    Persoana addPersoana(PersoanaFormModel persoanaFormModel);
}
