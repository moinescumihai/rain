package services.user;

import model.domain.User;
import model.domain.UserRole;

import java.util.List;


public interface UserService {
    User save(User user);

    List<User> findAll();

    User findByUsername(String username);

    User findByIdUser(long idUser);

    List<UserRole> getRolesForUser(long idUser);
}
