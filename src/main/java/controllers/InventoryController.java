package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InventoryController {

    @RequestMapping(value = "/inventory", method = RequestMethod.GET)
    public ModelAndView inventory() {
        ModelAndView model = new ModelAndView();

        model.setViewName("inventory");

        return model;
    }
}
