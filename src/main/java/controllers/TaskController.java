package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TaskController {

    @RequestMapping(value = "/tasks", method = RequestMethod.GET)
    public ModelAndView tasks() {
        ModelAndView model = new ModelAndView();


        model.setViewName("tasks");

        return model;
    }
}
