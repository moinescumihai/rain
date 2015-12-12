package services;

import common.utils.UserUtils;
import model.domain.Persoana;
import model.domain.Proiect;
import model.domain.UserOnProject;
import model.forms.PersonOnProjectFormModel;
import model.forms.ProiectFormModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import services.repository.ProiectRepository;
import services.repository.StatusProiectRepository;
import services.repository.UserOnProjectRepository;

import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class ProjectServiceImpl implements ProjectsService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectServiceImpl.class);
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
    @Autowired
    private UserOnProjectRepository userOnProjectRepository;
    @Autowired
    private ResurseUmaneService resurseUmaneService;


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
        Pattern pattern = Pattern.compile("^([a-zA-Z0-9]{4}).*$");
        Matcher matcher = pattern.matcher(entity.getNumeProiect());
        Proiect proiect = new Proiect();
        proiect.setNumeProiect(entity.getNumeProiect());
        while (matcher.find()) {
            proiect.setCodProiect(matcher.group(1).toUpperCase());
        }
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

    @Override
    public List<Persoana> getUsersOnProject(long idProiect) {
        List<Persoana> usersOnProject;
        Proiect proiect = proiectRepository.findOne(idProiect);
        try {
            usersOnProject = userOnProjectRepository.findAllByProiectEquals(proiect);

        } catch (DataAccessException e) {
            LOGGER.info(String.format("No users assigned to project %s", proiect.getNumeProiect()));
            usersOnProject = Collections.emptyList();
        }
        return usersOnProject;
    }

    @Override
    public UserOnProject removePersoanaFromProiect(Persoana persoana, Proiect proiect) {
        UserOnProject toDelete = userOnProjectRepository.findByPersoanaAndProiectEquals(persoana, proiect);

        return removePersoanaFromProiect(toDelete.getIdUserOnProject());
    }

    @Override
    public UserOnProject removePersoanaFromProiect(long idUserOnProject) {
        UserOnProject toDelete = userOnProjectRepository.findOne(idUserOnProject);

        userOnProjectRepository.delete(toDelete);

        return toDelete;
    }

    @Override
    @Transactional
    public UserOnProject assignPersoanaToProiect(PersonOnProjectFormModel personOnProject) {
        Persoana persoana = resurseUmaneService.findByFullNameEquals(personOnProject.getFullName());
        Proiect proiect = proiectRepository.findOne(personOnProject.getIdProiect());
        UserOnProject mapping = userOnProjectRepository.findByPersoanaAndProiectEquals(persoana, proiect);
        if (mapping == null) {
            mapping = new UserOnProject();
            mapping.setPersoana(persoana);
            mapping.setProiect(proiect);

            userOnProjectRepository.save(mapping);
        }

        return mapping;
    }

    @Override
    public Proiect findProjectByKey(String projectKey) {
        return proiectRepository.findOneByCodProiectEquals(projectKey);
    }

    @Override
    public Proiect markAsFavourite(long idProiect) {
        Proiect proiect = proiectRepository.findOne(idProiect);
        Persoana persoana = resurseUmaneService.findByUsername(UserUtils.getLoggedInUsername());
        persoana.setFavorit(proiect);

        resurseUmaneService.updatePersoana(persoana);
        return proiect;
    }


}
