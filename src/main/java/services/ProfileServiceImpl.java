package services;

import common.utils.UserUtils;
import model.domain.Persoana;
import model.domain.User;
import model.domain.UserRole;
import model.forms.PersoanaFormModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import services.user.UserService;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

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
    public Persoana getRaindropUser(String username) {
        return resurseUmaneService.findByUsername(username);
    }

    @Override
    public Persoana getLoggedInRaindropUser() {
        return getRaindropUser(UserUtils.getLoggedInUsername());
    }

    @Override
    public String changePassword(String password) {
        User userCurent = getLoggedInRaindropUser().getIdUser();
        userCurent.setPassword(passwordEncoder.encode(password));
        userCurent.setLastPassChange(new Timestamp(new Date().getTime()));
        userService.save(userCurent);

        LOGGER.info(String.format("Utilizatorul %s si-a schimbat parola", userCurent.getUsername()));
        return "Parola a fost schimbata cu success";
    }

    @Override
    public List<Persoana> getEnabledUsers() {
        return resurseUmaneService.findAllPersoane()
                .stream()
                .filter(persoana -> persoana.getIdUser().getEnabled() == 1 &&
                        !persoana.getIdUser().getUsername().equals(UserUtils.getLoggedInUsername()))
                .collect(Collectors.toList());
    }

    @Override
    public List<Persoana> getAllUsers() {
        return resurseUmaneService.findAllPersoane();
    }

    @Override
    public Persoana activateUser(long idUser) {
        return resurseUmaneService.activateUser(idUser);
    }

    @Override
    public Persoana deactivateUser(long idUser) {
        return resurseUmaneService.deactivateUser(idUser);
    }

    @Override
    public List<UserRole> getRolesForUser(long idUser) {
        return userService.getRolesForUser(idUser);
    }

    @Override
    public Persoana addPersoana(PersoanaFormModel persoanaFormModel) {
        return null;
    }
}
