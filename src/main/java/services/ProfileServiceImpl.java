package services;

import common.validator.utils.UserUtils;
import model.domain.ResurseUmane;
import model.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import services.user.UserService;

@Service
public class ProfileServiceImpl implements ProfileService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProfileServiceImpl.class);

    @Autowired
    private UserService userService;
    @Autowired
    private ResurseUmaneService resurseUmaneService;

    @Override
    public ResurseUmane getRaindropUser(String username) {
        String name = UserUtils.getLoggedInUsername();
        if (!name.equals(username)){
            LOGGER.error("USERNAME_DOES_NOT_MATCH");
            throw new IllegalArgumentException("USERNAME_DOES_NOT_MATCH");
        }

        User user = userService.findByUsername(name);
        return resurseUmaneService.findOne(user.getIdUser());
    }

    @Override
    public ResurseUmane getLoggedInRaindropUser() {
        return getRaindropUser(UserUtils.getLoggedInUsername());
    }

}
