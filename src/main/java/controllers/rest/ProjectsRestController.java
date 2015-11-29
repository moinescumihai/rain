package controllers.rest;

import model.common.JSONResponse;
import model.common.JSONResponseWithId;
import model.domain.*;
import model.forms.ClientFormModel;
import model.forms.PersonOnProjectFormModel;
import model.forms.ProiectFormModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.ClientServiceImpl;
import services.ProjectCategoryService;
import services.ProjectsService;

import javax.validation.Valid;
import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("app/secure/projects")
public class ProjectsRestController {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProjectsRestController.class);

    @Autowired
    private ProjectsService projectsService;
    @Autowired
    private MessageSource messageSource;
    @Autowired
    private ClientServiceImpl clientService;
    @Autowired
    private ProjectCategoryService projectCategoryService;

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

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/getprojects", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Proiect> getProjects() {
        return projectsService.findAll();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_SUPERUSER')")
    @RequestMapping(value = "/get-users-on-project/{idProiect}", method = RequestMethod.GET)
    @ResponseBody
    public List<Persoana> getUsersOnProject(@PathVariable long idProiect) {
        return projectsService.getUsersOnProject(idProiect);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_SUPERUSER')")
    @RequestMapping(value = "/unassign-user-from-project/{idUserOnProject}", method = RequestMethod.GET)
    @ResponseBody
    public JSONResponseWithId removeUserFromProject(@PathVariable long idUserOnProject) {
        JSONResponseWithId response = new JSONResponseWithId();

        UserOnProject removed = projectsService.removePersoanaFromProiect(idUserOnProject);
        response.setMessage(String.format("%s a fost exclus din %s", removed.getPersoana().getFullName(), removed.getProiect().getNumeProiect()));
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/getclients", method = RequestMethod.GET)
    @ResponseBody
    public List<Client> getClients() {
        return clientService.findAll();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/getcategories", method = RequestMethod.GET)
    @ResponseBody
    public List<CategorieProiect> getCategories() {
        return projectCategoryService.findAll();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @RequestMapping(value = "/deleteproject/{id}", method = RequestMethod.GET)
    @ResponseBody
    public JSONResponse deleteProject(@PathVariable long id) {
        JSONResponse response = new JSONResponse();
        try {
            projectsService.delete(id);
            response.setMessage("Proiectul a fost &#x219;ters");
        } catch (DataAccessException e) {
            response.setMessage("Proiectul nu a fost &#x219;ters");

        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addproject", method = RequestMethod.POST)
    @ResponseBody
    public JSONResponse addProiect(@Valid @RequestBody ProiectFormModel proiect, BindingResult result) {
        JSONResponse response = new JSONResponse();
        if (result.hasErrors()) {
            Map<String, String> errors = getValidationErrorMap(result);
            if (proiect.getDataEndEstimativa() != null && proiect.getDataStart() != null && proiect.getDataEndEstimativa().before(proiect.getDataStart())) {
                String message = messageSource.getMessage("PreaMica.proiect.dataEndEstimativa", new Object[]{""}, null);
                errors.put("dataEndEstimativa", message);
            }
            response.setErrorsMap(errors);
        } else {
            try {
                projectsService.saveProject(proiect);
                response.setMessage("S-a ad&abreve;ugat proiectul: " + proiect.getNumeProiect());
            } catch (DataAccessException e) {
                response.setMessage("Proiectul nu a fost ad&abreve;ugat");
            }
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addclient", method = RequestMethod.POST)
    @ResponseBody
    public JSONResponse addClient(@Valid @RequestBody ClientFormModel client, BindingResult result) {
        JSONResponse response = new JSONResponse();
        if (result.hasErrors()) {
            Map<String, String> errors = getValidationErrorMap(result);
            response.setErrorsMap(errors);
        } else {
            try {
                clientService.saveClient(client);
                response.setMessage("S-a ad&abreve;ugat clientul: " + client.getNumeClient());
            } catch (DataAccessException e) {
                response.setMessage("Clientul nu a fost ad&abreve;ugat");
            }
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addcategory", method = RequestMethod.POST)
    @ResponseBody
    public JSONResponse addCategory(@Valid @RequestBody CategorieProiect categorieProiect, BindingResult result) {
        JSONResponse response = new JSONResponse();
        if (result.hasErrors()) {
            Map<String, String> errors = getValidationErrorMap(result);
            response.setErrorsMap(errors);
        } else {
            try {
                projectCategoryService.save(categorieProiect);
                response.setMessage("S-a ad&abreve;ugat categoria: " + categorieProiect.getNume());
            } catch (DataAccessException e) {
                response.setMessage("Categoria nu a fost ad&abreve;ugat&abreve;");
            }
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/add-persoana-to-project", method = RequestMethod.POST)
    @ResponseBody
    public UserOnProject addPersoanaToProiect(@RequestBody PersonOnProjectFormModel personOnProject) {
        return projectsService.assignPersoanaToProiect(personOnProject);
    }

    private Map<String, String> getValidationErrorMap(BindingResult result) {
        Map<String, String> errors = new HashMap<>();
        List<FieldError> fieldErrors = result.getFieldErrors();
        for (FieldError fieldError : fieldErrors) {
            String[] resolveMessageCodes = result.resolveMessageCodes(fieldError.getCode());
            String messageCode = resolveMessageCodes[0];
            String message = messageSource.getMessage(messageCode + "." + fieldError.getField(), new Object[]{fieldError.getRejectedValue()}, null);
            errors.put(fieldError.getField(), message);
        }
        return errors;
    }
}
