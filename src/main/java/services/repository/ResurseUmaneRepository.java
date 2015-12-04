package services.repository;


import model.domain.Persoana;
import model.domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ResurseUmaneRepository extends CrudRepository<Persoana, Long> {
    Persoana findByIdUser(User idUser);

    List<Persoana> findAllByNumeStartingWithOrderByNumeAsc(String firstLetter);

    Persoana findByFullNameEquals(String fullName);
}
