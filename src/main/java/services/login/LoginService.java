package services.login;

import model.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import services.user.UserService;

import java.sql.Timestamp;


@Service
public class LoginService implements ApplicationListener<InteractiveAuthenticationSuccessEvent> {

    @Autowired
    private UserService userService;

    @Transactional
    @Override
    public void onApplicationEvent(InteractiveAuthenticationSuccessEvent event) {
        String userName = ((UserDetails) event.getAuthentication().
                getPrincipal()).getUsername();
        User user = userService.findByUsername(userName);
        user.setLastLogin(new Timestamp(System.currentTimeMillis()));
        userService.save(user);
    }

    @Override
    public String toString() {
        return "LoginService{" + "userService=" + userService + '}';
    }
}