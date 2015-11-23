package services.repository;import model.domain.Proiect;import model.domain.ResurseUmane;import model.domain.Task;import org.springframework.data.repository.CrudRepository;import java.util.List;public interface TaskRepository extends CrudRepository<Task, Long> {    List<Task> findAllByIdProiectEquals(Proiect proiect);    List<Task> findAllByAssigneeEquals(ResurseUmane resurseUmane);    List<Task> findAllByAssigneeAndCompletAndDeleted(ResurseUmane idResurseUmane, int complet, int deleted);    List<Task> findAllByIdProiectAndCompletAndDeleted(Proiect proiect, int complet, int deleted);    List<Task> findAllByCompletAndDeleted(int complet, int deleted);}