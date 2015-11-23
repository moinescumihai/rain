package services;

import common.utils.UserUtils;
import model.domain.ResurseUmane;
import model.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import services.user.UserService;

import java.sql.Timestamp;
import java.util.Date;

@Service
public class ProfileServiceImpl implements ProfileService {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProfileServiceImpl.class);

    @Autowired
    private UserService userService;
    @Autowired
    private ResurseUmaneService resurseUmaneService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public ResurseUmane getRaindropUser(String username) {
        return resurseUmaneService.findByUsername(username);
    }

    @Override
    public ResurseUmane getLoggedInRaindropUser() {
        return getRaindropUser(UserUtils.getLoggedInUsername());
    }

    @Override
    public String changePassword(String password) {
        User userCurent = getLoggedInRaindropUser().getIdUser();
        userCurent.setPassword(passwordEncoder.encode(password));
        userCurent.setLastPassChange(new Timestamp(new Date().getTime()));
        userService.save(userCurent);

        return "Parola a fost schimbata cu success";
    }
}
