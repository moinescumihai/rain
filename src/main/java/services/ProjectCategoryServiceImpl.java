package services;

import model.domain.CategorieProiect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import services.repository.CategorieProiectRepository;

import java.util.Collections;
import java.util.List;

@Service
public class ProjectCategoryServiceImpl implements ProjectCategoryService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ClientServiceImpl.class);

    @Autowired
    private CategorieProiectRepository categorieProiectRepository;

    @Override
    public List<CategorieProiect> findAll() {
        try {
            return (List<CategorieProiect>) categorieProiectRepository.findAll();
        } catch (DataAccessException e) {
            LOGGER.error("PROJECT_CATEGORY.NO_PROJECT_CATEGORY", e);
            return Collections.emptyList();
        }
    }

    @Override
    public CategorieProiect save(CategorieProiect entity) {
        return categorieProiectRepository.save(entity);
    }

    @Override
    public CategorieProiect findOne(long idCategorieProiect) {
        return categorieProiectRepository.findOne(idCategorieProiect);
    }
}
