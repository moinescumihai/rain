package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportsController {

    @RequestMapping(value = "/reports", method = RequestMethod.GET)
    public ModelAndView reports() {
        ModelAndView model = new ModelAndView();

        model.setViewName("reports");

        return model;
    }
}
