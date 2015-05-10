package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FinancialController {

    @RequestMapping(value = "/financial", method = RequestMethod.GET)
    public ModelAndView financial() {
        ModelAndView model = new ModelAndView();


        model.setViewName("financial");

        return model;
    }
}
