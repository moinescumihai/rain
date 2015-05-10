package controllers;

import model.domain.Industrie;
import model.domain.ListaTari;
import model.repository.IndustrieRepository;
import model.repository.ListaTariRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ProjectsController {

    @Autowired
    private IndustrieRepository industrieDAO;
    @Autowired
    private ListaTariRepository tariDAO;


    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public ModelAndView getProjects() {
        ModelAndView model = new ModelAndView();

        Map<Integer, String> listaIndustrie = new HashMap<>();
        for (Industrie industry : industrieDAO.findAll()) {
            listaIndustrie.put(industry.getIdIndustrie(), industry.getNume());
        }
        Map<Integer, String> listaTari = new HashMap<>();
        for (ListaTari tariList : tariDAO.findAll()) {
            listaTari.put(tariList.getIdTara(), tariList.getNume());
        }
        model.addObject("listaIndustrie", listaIndustrie);
        model.addObject("listaTari", listaTari);
        model.setViewName("projects");
        return model;
    }
}
