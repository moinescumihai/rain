package controllers.rest;

import model.domain.Persoana;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.ResurseUmaneService;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("app/secure/hr")
public class HrRestController {
    private static final Logger LOGGER = LoggerFactory.getLogger(HrRestController.class);
    @Autowired
    private ResurseUmaneService resurseUmaneService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("mm-dd-yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
        binder.registerCustomEditor(long.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                if (text.trim().length() == 0) {
                    text = "0";
                }
                long ch = Long.parseLong(text);
                setValue(ch);
            }
        });
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_HR')")
    @RequestMapping(value = "/get-persoane-by-first-letter/{firstLetter}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Persoana> getPersoane(@PathVariable String firstLetter) {
        return resurseUmaneService.getPersoaneByFirstLetter(firstLetter);
    }

//    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
//    @RequestMapping(value = "/addproject", method = RequestMethod.POST, produces = "application/json")
//    @ResponseBody
//    public JSONResponse addProiect(@Valid @RequestBody Proiect proiect, BindingResult result) {
//        JSONResponse response = new JSONResponse();
//        if (result.hasErrors()) {
//            Map<String, String> errors = getValidationErrorMap(result);
//            if (proiect.getDataEndEstimativa() != null && proiect.getDataStart() != null && proiect.getDataEndEstimativa().before(proiect.getDataStart())) {
//                String message = messageSource.getMessage("PreaMica.proiect.dataEndEstimativa", new Object[]{""}, null);
//                errors.put("dataEndEstimativa", message);
//            }
//            response.setErrorsMap(errors);
//        } else {
//            try {
//                projectsService.save(proiect);
//                response.setMessage("Added new project: " + proiect.getNumeProiect());
//            } catch (DataAccessException e) {
//                response.setMessage("Project not added");
//            }
//        }
//        return response;
//    }


}
