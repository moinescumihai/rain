package controllers.rest;

import model.common.JSONResponse;
import model.domain.CategorieProiect;
import model.domain.Client;
import model.domain.Proiect;
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
import services.ClientsService;
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
    private ClientsService clientsService;
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

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/getclients", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Client> getClients() {
        return clientsService.findAll();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/getcategories", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<CategorieProiect> getCategories() {
        return projectCategoryService.findAll();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    @RequestMapping(value = "/deleteproject/{id}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public JSONResponse deleteProject(@PathVariable long id) {
        JSONResponse response = new JSONResponse();
        try {
            projectsService.delete(id);
            response.setMessage("Deleted project successfully");
        } catch (DataAccessException e) {
            response.setMessage("Project not added");

        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addproject", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public JSONResponse addProiect(@Valid @RequestBody Proiect proiect, BindingResult result) {
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
                projectsService.save(proiect);
                response.setMessage("Added new project: " + proiect.getNumeProiect());
            } catch (DataAccessException e) {
                response.setMessage("Project not added");
            }
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addclient", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public JSONResponse addClient(@Valid @RequestBody Client client, BindingResult result) {
        JSONResponse response = new JSONResponse();
        if (result.hasErrors()) {
            Map<String, String> errors = getValidationErrorMap(result);
            response.setErrorsMap(errors);
        } else {
            try {
                clientsService.save(client);
                response.setMessage("Added new client: " + client.getNumeClient());
            } catch (DataAccessException e) {
                response.setMessage("Client not added");
            }
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addcategory", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public JSONResponse addCategory(@Valid @RequestBody CategorieProiect categorieProiect, BindingResult result) {
        JSONResponse response = new JSONResponse();
        if (result.hasErrors()) {
            Map<String, String> errors = getValidationErrorMap(result);
            response.setErrorsMap(errors);
        } else {
            try {
                projectCategoryService.save(categorieProiect);
                response.setMessage("Added new category: " + categorieProiect.getNume());
            } catch (DataAccessException e) {
                response.setMessage("Category not added");
            }
        }
        return response;
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
