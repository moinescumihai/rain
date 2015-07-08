package services.user;

import model.domain.User;
import org.springframework.stereotype.Service;

import java.util.List;


public interface UserService {
    User save(User user);

    List<User> findAll();

    User findByUsername(String username);
}
