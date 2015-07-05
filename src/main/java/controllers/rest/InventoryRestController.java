package controllers.rest;

import model.domain.InventoryItem;
import model.domain.StareStoc;
import model.domain.TranzactieStoc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.InventoryService;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/app/secure/inventory")
public class InventoryRestController {

    @Autowired
    private InventoryService inventoryService;

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

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTORY')")
    @RequestMapping(value = "/getinventory", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<InventoryItem> getAllStockItems() {
        return inventoryService.findAllItems();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTORY')")
    @RequestMapping(value = "/getstari", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<StareStoc> getAllStari() {
        return inventoryService.findAllStari();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTORY')")
    @RequestMapping(value = "/tranzactie/history/{idArticol}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<TranzactieStoc> getHistory(@PathVariable Long idArticol) {
        return inventoryService.findAllTranzactiiForArticol(idArticol);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTORY')")
    @RequestMapping(value = "/tranzactie/{idArticol}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public TranzactieStoc getTranzactie(@PathVariable Long idArticol) {
        return inventoryService.findLastTranzactieForArticol(idArticol);
    }
}
