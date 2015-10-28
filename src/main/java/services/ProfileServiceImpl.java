package services;

import common.utils.UserUtils;
import model.domain.ResurseUmane;
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
        return resurseUmaneService.findByUsername(username);
    }

    @Override
    public ResurseUmane getLoggedInRaindropUser() {
        return getRaindropUser(UserUtils.getLoggedInUsername());
    }

}
