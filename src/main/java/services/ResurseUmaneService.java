package services;

import model.domain.Persoana;
import model.domain.User;

import java.util.List;

public interface ResurseUmaneService {
    Persoana findByIdUser(User id);

    Persoana findOne(long id);

    Persoana findByUsername(String username);

    List<Persoana> findAllPersoane();

    List<Persoana> getPersoaneByFirstLetter(String firstLetter);

    Persoana findByFullNameEquals(String fullName);

    Persoana activateUser(long idUser);

    Persoana deactivateUser(long idUser);

    Persoana updatePersoana(Persoana persoana);
}
