package controllers.rest;

import model.common.TreeFile;
import model.domain.Attachment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import services.files.FilesService;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/app/secure/files")
public class FilesRestController {

    @Autowired
    private FilesService filesService;

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

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR')")
    @RequestMapping(value = "/upload-inventory-image/{idStoc}", method = RequestMethod.POST)
    @ResponseBody
    public void uploadInventoryImage(@PathVariable("idStoc") long idStoc, @RequestPart MultipartFile imageFile) {
        filesService.saveStocImage(idStoc, imageFile);
    }


    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR', 'ROLE_FISIERE')")
    @RequestMapping(value = "/get-inventory-image/{idStoc}", method = RequestMethod.GET)
    @ResponseBody
    public Attachment getInventoryImage(@PathVariable("idStoc") long idStoc) {
        return filesService.getStocImage(idStoc);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_FISIERE')")
    @RequestMapping(value = "/list-files", method = RequestMethod.GET)
    @ResponseBody
    public List<TreeFile> listFiles(@RequestParam(value = "id", defaultValue = "0") long id,
                                    @RequestParam(value = "name", defaultValue = "") String name,
                                    @RequestParam(value = "level", defaultValue = "0") long level,
                                    @RequestParam(value = "url", defaultValue = "") String url) {


        return filesService.listFiles(id, name, level, url);
    }
}
