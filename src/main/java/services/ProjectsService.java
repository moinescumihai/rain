package services;

import model.domain.Proiect;
import model.forms.ProiectFormModel;

import java.util.List;

public interface ProjectsService {

    List<Proiect> findAll();

    Proiect findOne(long id);

    Proiect saveProject(ProiectFormModel entity);

    void delete(long id);

    long emptyTrash();
}
