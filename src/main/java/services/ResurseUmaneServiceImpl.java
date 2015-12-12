package services;

import model.domain.Persoana;
import model.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Service;
import services.repository.ResurseUmaneRepository;
import services.user.UserService;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ResurseUmaneServiceImpl implements ResurseUmaneService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ResurseUmaneServiceImpl.class);
    private static final String TOTI = "toti";

    @Autowired
    private ResurseUmaneRepository resurseUmaneRepository;
    @Autowired
    private UserService userService;


    @Override
    public Persoana findByIdUser(User id) {
        try {
            return resurseUmaneRepository.findByIdUser(id);
        } catch (DataAccessException e) {
            LOGGER.error("RESURSE_UMANE.NOT_FOUND", e);
            throw new NotFoundException("RESURSE_UMANE.NOT_FOUND", e);
        }
    }

    @Override
    public Persoana findOne(long id) {
        return resurseUmaneRepository.findOne(id);
    }

    @Override
    public Persoana findByUsername(String username) {
        return findByIdUser(userService.findByUsername(username));
    }

    @Override
    public List<Persoana> findAllPersoane() {
        try {
            List<Persoana> toti = (List<Persoana>) resurseUmaneRepository.findAll();
            toti.sort(Comparator.<Persoana>naturalOrder());
            return toti;
        } catch (DataAccessException e) {
            LOGGER.error("RESURSE_UMANE.NO_RESURSE_UMANE", e);
            return Collections.emptyList();
        }
    }

    @Override
    public List<Persoana> getPersoaneByFirstLetter(String firstLetter) {
        if (firstLetter.equalsIgnoreCase(TOTI)) {
            return findAllPersoane();
        } else {
            List<Persoana> persoane = resurseUmaneRepository.findAllByNumeStartingWithOrderByNumeAsc(firstLetter);
            persoane.sort(Comparator.<Persoana>naturalOrder());
            return persoane;
        }
    }

    @Override
    public Persoana findByFullNameEquals(String fullName) {
        String[] numeSiPrenume = fullName.split(" ");
        String nume = numeSiPrenume[0];
        String prenume = numeSiPrenume[1];
        List<Persoana> persoane = (List<Persoana>) resurseUmaneRepository.findAll();
        return persoane.parallelStream().filter(persoana -> persoana.getNume().equals(nume) && persoana.getPrenume().equals(prenume))
                .limit(1L).collect(Collectors.toList()).get(0);
    }

    @Override
    public Persoana activateUser(long idUser) {
        User user = userService.findByIdUser(idUser);
        user.setEnabled(User.Active.YES.getCode());
        userService.save(user);
        return findByIdUser(user);
    }

    @Override
    public Persoana deactivateUser(long idUser) {
        User user = userService.findByIdUser(idUser);
        user.setEnabled(User.Active.NO.getCode());
        userService.save(user);
        return findByIdUser(user);
    }

    @Override
    public Persoana updatePersoana(Persoana persoana) {
        return resurseUmaneRepository.save(persoana);
    }
}
