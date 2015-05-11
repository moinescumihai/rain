package services.user;

import model.domain.User;
import model.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.LockModeType;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    @Lock(LockModeType.READ)
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    @Transactional
    public List<User> findAll() {
        return (List<User>) userRepository.findAll();
    }

    @Override
    @Transactional
    @Lock(LockModeType.READ)
    public User findByUsername(String username) {
        try {
            return userRepository.findByUsername(username);
        } catch (DataAccessException e) {
            LOGGER.error(e.getMessage(), e);
            throw new UsernameNotFoundException("USERNAME.NOT_FOUND");
        }
    }
}
