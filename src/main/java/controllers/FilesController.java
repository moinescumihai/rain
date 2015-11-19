package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FilesController {

    @RequestMapping(value = "/files", method = RequestMethod.GET)
    public ModelAndView files() {
        ModelAndView model = new ModelAndView();

        model.setViewName("files");

        return model;
    }
}
