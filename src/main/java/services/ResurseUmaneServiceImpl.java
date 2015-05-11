package services;

import model.domain.ResurseUmane;
import model.repository.ResurseUmaneRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.security.acls.model.NotFoundException;
import org.springframework.stereotype.Service;

@Service
public class ResurseUmaneServiceImpl implements ResurseUmaneService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ResurseUmaneServiceImpl.class);

    @Qualifier("resurseUmaneRepository")
    @Autowired
    private ResurseUmaneRepository resurseUmaneRepository;

    @Override
    public ResurseUmane findOne(long id) {
        try {
            return resurseUmaneRepository.findOne(id);
        } catch (DataAccessException e) {
            LOGGER.error("RESURSE_UMANE.NOT_FOUND", e);
            throw new NotFoundException("RESURSE_UMANE.NOT_FOUND", e);
        }
    }
}
