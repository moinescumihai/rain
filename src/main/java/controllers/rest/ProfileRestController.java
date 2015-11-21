package controllers.rest;

import model.common.JSONResponseWithId;
import model.domain.ResurseUmane;
import model.domain.Tara;
import model.forms.PasswordString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.ListaTariService;
import services.ProfileService;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/app/secure/profile")
public class ProfileRestController {

    @Autowired
    private ProfileService profileService;
    @Autowired
    private ListaTariService listaTariService;

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

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/{username}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public ResurseUmane getRaindropUser(@PathVariable("username") String username) {
        return profileService.getRaindropUser(username);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/get-tari", method = RequestMethod.GET)
    @ResponseBody
    public List<Tara> getTari() {
        return listaTariService.getTari();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public ResurseUmane getLoggedInUser() {
        return profileService.getLoggedInRaindropUser();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/change-password", method = RequestMethod.POST, consumes = "application/json")
    @ResponseBody
    public JSONResponseWithId changePassword(@RequestBody PasswordString password) {
        JSONResponseWithId response = new JSONResponseWithId();
        String message = profileService.changePassword(password.getPassword());
        response.setMessage(message);

        return response;
    }
}
