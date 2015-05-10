package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NotificationsController {

    @RequestMapping(value = "/notifications", method = RequestMethod.GET)
    public ModelAndView hr() {
        ModelAndView model = new ModelAndView();

        model.setViewName("notifications");

        return model;
    }
}
