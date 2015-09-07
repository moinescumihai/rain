package controllers.rest;

import model.common.JSONResponseWithId;
import model.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DataAccessException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import services.inventory.InventoryService;
import services.inventory.LocService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/app/secure/inventory")
public class InventoryRestController {

    @Autowired
    private InventoryService inventoryService;
    @Autowired
    private LocService locService;

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
    @RequestMapping(value = "/getinventory", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Stoc> getAllStockItems() {
        return inventoryService.findAllItems();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR')")
    @RequestMapping(value = "/getstari", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<StareStoc> getAllStari() {
        return inventoryService.findAllStari();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR')")
    @RequestMapping(value = "/tranzactie/history/{idArticol}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<TranzactieStoc> getHistory(@PathVariable Long idArticol) {
        return inventoryService.findAllTranzactiiForArticol(idArticol);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR')")
    @RequestMapping(value = "/tranzactie/{idArticol}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public TranzactieStoc getTranzactie(@PathVariable Long idArticol) {
        return inventoryService.findLastTranzactieForArticol(idArticol);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR')")
    @RequestMapping(value = "/generatebarcode/{barcode}", method = RequestMethod.GET)
    @ResponseBody
    public String generateBarcode(@PathVariable String barcode) {
        return inventoryService.generateBarcode(barcode);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_DOWNLOAD','ROLE_SUPERUSER')")
    @RequestMapping(value = "/downloadbarcode/{barcode}", method = RequestMethod.GET)
    @ResponseBody
    public String barcodeDownload(@PathVariable String barcode, HttpServletResponse response) throws IOException, ServletException {
        return inventoryService.downloadBarcode(barcode, response);
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addstockitem", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public JSONResponseWithId addStoc(@RequestBody Stoc stoc) {
        JSONResponseWithId response = new JSONResponseWithId();
        try {
            Stoc addedStoc = inventoryService.save(stoc);
            response.setId(addedStoc.getIdStoc());
            response.setMessage("Added new inventory item: " + stoc.getNumeStoc());
        } catch (DataAccessException e) {
            response.setMessage("Item not added");
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR')")
    @RequestMapping(value = "/loc/{idLoc}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public Loc getLoc(@PathVariable Long idLoc) {
        return locService.findById(idLoc);
    }

}
