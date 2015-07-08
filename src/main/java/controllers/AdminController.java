package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    @RequestMapping(value = "/administration", method = RequestMethod.GET)
    public ModelAndView reports() {
        ModelAndView model = new ModelAndView();


        model.setViewName("admin");

        return model;
    }
}
