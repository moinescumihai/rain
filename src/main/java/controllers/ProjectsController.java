//package controllers;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.servlet.ModelAndView;
//import repository.Industrie;
//import repository.ListaTari;
//import repository.dao.IndustrieDAO;
//import repository.dao.TariDAO;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@Controller
//public class ProjectsController {
//
//
//    @Autowired
//    private IndustrieDAO industrieDAO;
//    @Autowired
//    private TariDAO tariDAO;
//
//
//    @RequestMapping(value = "/projects", method = RequestMethod.GET)
//    public ModelAndView getProjects(){
//        ModelAndView model = new ModelAndView();
//
//        Map<Integer,String> listaIndustrie = new HashMap<>();
//        List<Industrie> industries = industrieDAO.getAll();
//        for (Industrie industry : industries) {
//            listaIndustrie.put(industry.getIdIndustrie(), industry.getNume());
//        }
//        Map<Integer,String> listaTari = new HashMap<>();
//        List<ListaTari> tari = tariDAO.getAll();
//        for (ListaTari tariList : tari) {
//            listaTari.put(tariList.getIdTara(), tariList.getNume());
//        }
//        model.addObject("listaIndustrie", listaIndustrie);
//        model.addObject("listaTari", listaTari);
//        model.setViewName("projects");
//        return model;
//    }
//}
