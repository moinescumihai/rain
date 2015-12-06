package services;

import model.domain.Persoana;
import model.domain.Proiect;
import model.domain.UserOnProject;
import model.forms.PersonOnProjectFormModel;
import model.forms.ProiectFormModel;

import java.util.List;

public interface ProjectsService {

    List<Proiect> findAll();

    Proiect findOne(long id);

    Proiect saveProject(ProiectFormModel entity);

    void delete(long id);

    long emptyTrash();

    List<Persoana> getUsersOnProject(long proiect);

    UserOnProject removePersoanaFromProiect(Persoana persoana, Proiect proiect);

    UserOnProject removePersoanaFromProiect(long idUserOnProject);

    UserOnProject assignPersoanaToProiect(PersonOnProjectFormModel personOnProject);

    Proiect findProjectByKey(String projectKey);
}
