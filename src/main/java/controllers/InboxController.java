package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InboxController {

    @RequestMapping(value = "/inbox", method = RequestMethod.GET)
    public ModelAndView hr() {
        ModelAndView model = new ModelAndView();

        model.setViewName("inbox");

        return model;
    }
}
