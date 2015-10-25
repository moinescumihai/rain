package services;

import model.domain.Proiect;
import model.forms.ProiectFormModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import services.repository.ProiectRepository;
import services.repository.StatusProiectRepository;

import java.util.Collections;
import java.util.List;

@Service
public class ProjectsServiceImpl implements ProjectsService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectsServiceImpl.class);
    private static final int DELETED = 1;
    private static final int NOT_DELETED = 0;

    @Autowired
    private ProiectRepository proiectRepository;
    @Autowired
    private StatusProiectRepository statusProiectRepository;
    @Autowired
    private ClientServiceImpl clientService;
    @Autowired
    private ProjectCategoryService projectCategoryService;

    @Override
    public List<Proiect> findAll() {
        try {
            return proiectRepository.findAllByDeletedEquals(NOT_DELETED);
        } catch (DataAccessException e) {
            LOGGER.error("PROJECTS.NO_PROJECTS", e);
            return Collections.emptyList();
        }
    }

    @Override
    public Proiect findOne(long id) {
        Proiect proiect;
        try {
            proiect = proiectRepository.findOne(id);
            return proiect;
        } catch (DataAccessException e) {
            String msg = "PROJECTS.NO_PROJECT_FOUND";
            LOGGER.error(msg, e);
            throw new RuntimeException(msg, e);
        }
    }

    @Override
    @Transactional
    public Proiect saveProject(ProiectFormModel entity) {
        Proiect proiect = new Proiect();
        proiect.setNumeProiect(entity.getNumeProiect());
        proiect.setDescriere(entity.getDescriere());
        proiect.setIdStatusProiect(statusProiectRepository.findOne(entity.getIdStatusProiect()));
        proiect.setIdClient(clientService.findOne(entity.getIdClient()));
        proiect.setIdCategorieProiect(projectCategoryService.findOne(entity.getIdCategorieProiect()));
        proiect.setDataStart(entity.getDataStart());
        proiect.setDataEndEstimativa(entity.getDataEndEstimativa());

        return proiectRepository.save(proiect);
    }

    @Override
    public void delete(long id) {
        Proiect proiect;
        try {
            proiect = proiectRepository.findOne(id);
            proiect.setDeleted(DELETED);
            proiectRepository.save(proiect);
        } catch (DataAccessException e) {
            String msg = "ERROR While deleting project";
            LOGGER.error(msg, e);
            throw new RuntimeException(msg, e);
        }
    }

    @Override
    public long emptyTrash() {
        List<Proiect> toDelete;
        try {
            toDelete = proiectRepository.findByDeletedEquals(DELETED);
            proiectRepository.delete(toDelete);
            return toDelete.size();
        } catch (DataAccessException e) {
            String msg = "ERROR While emptying project trash ";
            LOGGER.error(msg, e);
            throw new RuntimeException(msg, e);
        }
    }
}
