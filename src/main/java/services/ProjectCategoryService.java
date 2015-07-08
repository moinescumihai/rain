package services;

import model.domain.CategorieProiect;

import java.util.List;

public interface ProjectCategoryService {

    List<CategorieProiect> findAll();

    CategorieProiect save(CategorieProiect entity);
}
