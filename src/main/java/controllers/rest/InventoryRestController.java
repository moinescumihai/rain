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
    @RequestMapping(value = "/getcategories", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<CategorieStoc> getAllCategorii() {
        return inventoryService.findAllCategorii();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR')")
    @RequestMapping(value = "/gettypes", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<GrupStoc> getAllTipuri() {
        return inventoryService.findAllTipuri();
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_INVENTAR')")
    @RequestMapping(value = "/getplaces", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List<Loc> getAllPlaces() {
        return inventoryService.findAllLocuri();
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
    public JSONResponseWithId addStoc(@RequestBody StocFormModel stoc) {
        JSONResponseWithId response = new JSONResponseWithId();
        try {
            Stoc addedStoc = inventoryService.save(stoc);
            response.setId(addedStoc.getIdStoc());
            response.setMessage("S-a ad&abreve;ugat articolul: " + stoc.getNumeStoc());
        } catch (DataAccessException e) {
            response.setId(-1);
            response.setMessage("Articolul nu s-a ad&abreve;ugat");
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addcategory", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public JSONResponseWithId addCategory(@RequestBody CategorieStoc categorieStoc) {
        JSONResponseWithId response = new JSONResponseWithId();
        try {
            CategorieStoc categorie = inventoryService.saveCategorie(categorieStoc);
            response.setId(categorie.getIdCategorieStoc());
            response.setMessage("S-a ad&abreve;ugat categoria: " + categorieStoc.getNumeCategorie());
        } catch (DataAccessException e) {
            response.setId(-1);
            response.setMessage("Categoria nu s-a ad&abreve;ugat");
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addtype", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public JSONResponseWithId addType(@RequestBody GrupStocFormModel grupStoc) {
        JSONResponseWithId response = new JSONResponseWithId();
        try {
            GrupStoc tip = inventoryService.saveGrup(grupStoc);
            response.setId(tip.getIdGrupStoc());
            response.setMessage("S-a ad&abreve;ugat tipul: " + grupStoc.getNumeGrup());
        } catch (DataAccessException e) {
            response.setId(-1);
            response.setMessage("Tipul nu s-a ad&abreve;ugat");
        }
        return response;
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')")
    @RequestMapping(value = "/addplace", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public JSONResponseWithId addPlace(@RequestBody Loc loc) {
        JSONResponseWithId response = new JSONResponseWithId();
        try {
            Loc saveLoc = inventoryService.saveLoc(loc);
            response.setId(saveLoc.getIdLoc());
            response.setMessage("S-a ad&abreve;ugat locul: " + loc.getNumeLoc());
        } catch (DataAccessException e) {
            response.setId(-1);
            response.setMessage("Locul nu s-a ad&abreve;ugat");
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
