package services;

import model.domain.ResurseUmane;
import model.repository.ResurseUmaneRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Service;
import services.user.UserService;

import java.util.Collections;
import java.util.List;

@Service
public class ResurseUmaneServiceImpl implements ResurseUmaneService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ResurseUmaneServiceImpl.class);
    private static final String TOTI = "toti";

    @Autowired
    private ResurseUmaneRepository resurseUmaneRepository;
    @Autowired
    private UserService userService;


    @Override

    public ResurseUmane findByIdUser(long id) {
        try {
            return resurseUmaneRepository.findByIdUser(id);
        } catch (DataAccessException e) {
            LOGGER.error("RESURSE_UMANE.NOT_FOUND", e);
            throw new NotFoundException("RESURSE_UMANE.NOT_FOUND", e);
        }
    }

    @Override
    public ResurseUmane findOne(long id) {
        return resurseUmaneRepository.findOne(id);
    }

    @Override
    public ResurseUmane findByUsername(String username) {
        return findByIdUser(userService.findByUsername(username).getIdUser());
    }

    @Override
    public List<ResurseUmane> findAllPersoane() {
        try {
            return (List<ResurseUmane>) resurseUmaneRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("RESURSE_UMANE.NO_RESURSE_UMANE", e);
            return Collections.emptyList();
        }
    }

    @Override
    public List<ResurseUmane> getPersoaneByFirstLetter(String firstLetter) {
        if (firstLetter.equalsIgnoreCase(TOTI)) {
            return findAllPersoane();
        } else {
            return resurseUmaneRepository.findAllByNumeStartingWithOrderByNumeAsc(firstLetter);
        }
    }
}
