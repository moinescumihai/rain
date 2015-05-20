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
    private IndustrieRepository industrieRepository;
    @Autowired
    private ListaTariRepository listaTariRepository;


    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public ModelAndView getProjects() {
        ModelAndView model = new ModelAndView();

        Map<String, String> listaIndustrie = new HashMap<>();
        for (Industrie industry : industrieRepository.findAll()) {
            listaIndustrie.put(String.valueOf(industry.getIdIndustrie()), industry.getNume());
        }
        Map<String, String> listaTari = new HashMap<>();
        for (ListaTari tariList : listaTariRepository.findAll()) {
            listaTari.put(String.valueOf(tariList.getIdTara()), tariList.getNume());
        }
        model.addObject("listaIndustrie", listaIndustrie);
        model.addObject("listaTari", listaTari);
        model.setViewName("projects");
        return model;
    }
}
