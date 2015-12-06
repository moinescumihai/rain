package controllers;

import model.domain.Industrie;
import model.domain.StatusProiect;
import model.domain.Tara;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.ListaTariService;
import services.ProfileService;
import services.repository.IndustrieRepository;
import services.repository.StatusProiectRepository;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ProjectsController {

    @Autowired
    private IndustrieRepository industrieRepository;
    @Autowired
    private ListaTariService listaTariRepository;
    @Autowired
    private StatusProiectRepository statusProiectRepository;
    @Autowired
    private ProfileService profileService;

    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public ModelAndView getProjects() {
        ModelAndView model = new ModelAndView();

        Map<String, String> listaStatus = new HashMap<>();
        for (StatusProiect statusProiect : statusProiectRepository.findAll()) {
            listaStatus.put(String.valueOf(statusProiect.getIdStatusProiect()), statusProiect.getNumeStatus());
        }
        Map<String, String> listaIndustrie = new HashMap<>();
        for (Industrie industry : industrieRepository.findAll()) {
            listaIndustrie.put(String.valueOf(industry.getIdIndustrie()), industry.getNume());
        }
        Map<String, String> listaTari = new HashMap<>();
        for (Tara tariList : listaTariRepository.getTari()) {
            listaTari.put(String.valueOf(tariList.getIdTara()), tariList.getNume());
        }
        model.addObject("listaIndustrie", listaIndustrie);
        model.addObject("listaTari", listaTari);
        model.addObject("listaStatus", listaStatus);
        model.addObject("loggedInUser", profileService.getLoggedInRaindropUser());
        model.setViewName("projects");
        return model;
    }
}
