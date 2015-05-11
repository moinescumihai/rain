package controllers.rest;

import model.domain.ResurseUmane;
import model.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.ResurseUmaneService;
import services.user.UserService;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("/app/secure/profile")
public class ProfileRestController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProfileRestController.class);

    @Autowired
    private UserService userService;
    @Autowired
    private ResurseUmaneService resurseUmaneService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("mm-dd-yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
        binder.registerCustomEditor(long.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                if (text.trim().length() == 0) {
                    text = "0";
                }
                long ch = Long.parseLong(text);
                setValue(ch);
            }
        });
    }

//    @PreAuthorize("isAuthentificated()")
    @RequestMapping(value = "/{username}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public ResurseUmane getRaindropUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username

        User user = userService.findByUsername(name);
        return resurseUmaneService.findOne(user.getIdUser());
    }
}
