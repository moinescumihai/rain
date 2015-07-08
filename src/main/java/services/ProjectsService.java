package services;

import model.domain.Proiect;

import java.util.List;

public interface ProjectsService {

    List<Proiect> findAll();

    Proiect findOne(long id);

    Proiect save(Proiect entity);

    void delete(long id);

    long emptyTrash();
}
