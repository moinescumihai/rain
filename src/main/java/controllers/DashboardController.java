package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.ProfileService;

@Controller
public class DashboardController {

    @Autowired
    private ProfileService profileService;

    @RequestMapping(value = {"/dashboard", "/"}, method = RequestMethod.GET)
    public ModelAndView overview() {
        ModelAndView model = new ModelAndView();
        model.addObject("loggedInUser", profileService.getLoggedInRaindropUser());
        model.setViewName("dashboard");

        return model;
    }
}
