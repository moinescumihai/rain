package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.ProfileService;

@Controller
public class NotificationsController {
    @Autowired
    private ProfileService profileService;
    @RequestMapping(value = "/notifications", method = RequestMethod.GET)
    public ModelAndView hr() {
        ModelAndView model = new ModelAndView();
        model.addObject("loggedInUser", profileService.getLoggedInRaindropUser());
        model.setViewName("notifications");

        return model;
    }
}
