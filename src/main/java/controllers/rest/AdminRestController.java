package controllers.rest;

import model.common.JSONResponseWithId;
import model.domain.Persoana;
import model.forms.PersoanaFormModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.ProfileService;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@RequestMapping("/app/secure/admin")
public class AdminRestController {

    @Autowired
    private ProfileService profileService;

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
    @RequestMapping(value = "/activate-user/{idUser}", method = RequestMethod.GET)
    @ResponseBody
    public Persoana activateUser(@PathVariable("idUser") long idUser) {
        return profileService.activateUser(idUser);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/deactivate-user/{idUser}", method = RequestMethod.GET)
    @ResponseBody
    public Persoana deactivateUser(@PathVariable("idUser") long idUser) {
        return profileService.deactivateUser(idUser);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/add-user", method = RequestMethod.POST)
    @ResponseBody
    public JSONResponseWithId addUser(@RequestBody PersoanaFormModel persoanaFormModel) {
        JSONResponseWithId response = new JSONResponseWithId();
        Persoana persoana = profileService.addPersoana(persoanaFormModel);
        String message = String.format("Utilizatorul %s a fost ad&abreve;ugat &icirc;n sistem", persoana.getFullName());
        response.setMessage(message);

        return response;
    }
}
