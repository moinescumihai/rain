package services.user;

import model.domain.User;
import model.domain.UserRole;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import services.repository.UserRepository;
import services.repository.UserRoleRepository;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserRoleRepository userRoleRepository;


    @Override
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public List<User> findAll() {
        return (List<User>) userRepository.findAll();
    }

    @Override
    public User findByUsername(String username) {
        try {
            return userRepository.findByUsername(username);
        } catch (DataAccessException e) {
            LOGGER.error(e.getMessage(), e);
            throw new UsernameNotFoundException("USERNAME.NOT_FOUND");
        }
    }

    @Override
    public User findByIdUser(long idUser) {
        return userRepository.findOne(idUser);
    }

    @Override
    public List<UserRole> getRolesForUser(long idUser) {
        User user = userRepository.findOne(idUser);
        return userRoleRepository.findAllByUsernameEquals(user.getUsername());
    }
}
