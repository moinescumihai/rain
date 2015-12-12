package controllers.rest;

import common.utils.UserUtils;
import model.common.JSONResponseWithId;
import model.domain.StatusTask;
import model.domain.Task;
import model.forms.TaskFormModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.tasks.TaskService;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/app/secure/tasks")
public class TasksRestController {

    @Autowired
    private TaskService taskService;

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
    @RequestMapping(value = "/get-task/{idTask}", method = RequestMethod.GET)
    @ResponseBody
    public Task getTaskById(@PathVariable long idTask) {
        return taskService.getTaskById(idTask);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/get-tasks", method = RequestMethod.GET)
    @ResponseBody
    public List<Task> getTasks(@RequestParam(value = "proiect", required = false) String projectKey) {
        if (UserUtils.isUserInRole("ROLE_ADMIN") || UserUtils.isUserInRole("ROLE_SUPERUSER")) {
            return taskService.getCurrentTasks(projectKey);
        } else {
            return taskService.getCurrentTasksForUser(UserUtils.getLoggedInUsername(), projectKey);
        }
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/get-all-status", method = RequestMethod.GET)
    @ResponseBody
    public List<StatusTask> getAllStatus() {
        return taskService.getAllStatusTask();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER', 'ROLE_USER')")
    @RequestMapping(value = "/update-task", method = RequestMethod.POST)
    @ResponseBody
    public JSONResponseWithId updataTask(@RequestBody Task model) {
        JSONResponseWithId response = new JSONResponseWithId();
        try {
            Task success = taskService.updateTask(model);
            response.setId(1);
            response.setMessage(success.getCod() + " a fost marcat ca " + success.getIdStatusTask().getNume());
        } catch (DataAccessException e) {
            response.setId(-1);
            response.setMessage("Eroare la mutare");
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER', 'ROLE_USER')")
    @RequestMapping(value = "/add-task", method = RequestMethod.POST)
    @ResponseBody
    public JSONResponseWithId addTask(@RequestBody TaskFormModel model) {
        JSONResponseWithId response = new JSONResponseWithId();
        try {
            Task success = taskService.addTask(model);
            response.setId(1);
            response.setMessage("Sarcin&abreve; ad&abreve;ugat&abreve; cu success ");
        } catch (DataAccessException e) {
            response.setId(-1);
            response.setMessage("Sarcina nu a fost ad&abreve;ugat&abreve;!");
        }
        return response;
    }
}
