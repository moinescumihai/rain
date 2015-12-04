package services.repository;


import model.domain.UserRole;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserRoleRepository extends CrudRepository<UserRole, Long> {
    List<UserRole> findAllByUsernameEquals(String username);
}
