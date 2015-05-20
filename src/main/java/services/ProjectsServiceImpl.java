package services;

import model.domain.Proiect;
import model.repository.ProiectRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class ProjectsServiceImpl implements ProjectsService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectsServiceImpl.class);

    @Autowired
    private ProiectRepository proiectRepository;

    @Override
    public List<Proiect> findAll() {
        try {
            return (List<Proiect>) proiectRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("PROJECTS.NO_PROJECTS", e);
            return Collections.emptyList();
        }
    }

    @Override
    public Proiect save(Proiect entity) {
        return proiectRepository.save(entity);
    }
}
