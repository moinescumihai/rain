package controllers.rest;

import model.domain.ListaTari;
import model.domain.ResurseUmane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.ListaTariService;
import services.ProfileService;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
    public ResurseUmane getRaindropUser(@PathVariable("username") String username, Model model) {
        Map<String, String> listaTari = new HashMap<>();
        for (ListaTari tariList : listaTariService.getTari()) {
            listaTari.put(String.valueOf(tariList.getIdTara()), tariList.getNume());
        }
        model.addAttribute("listaTari", listaTari);
        return profileService.getRaindropUser(username);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public ResurseUmane getLoggedInUser() {
        return profileService.getLoggedInRaindropUser();
    }
}
