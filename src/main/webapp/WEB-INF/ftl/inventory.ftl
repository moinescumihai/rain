[#ftl][#import "layouts/layouts.ftl" as layout][#assign security=JspTaglibs["http://www.springframework.org/security/tags"] /]<style>    .webui-popover {        z-index: 2000 !important;    }</style>[#include "formMacros.ftl"][#include "content.ftl"][@layout.basic]    [@sidebar]    <div>        [@searchbox "inventory-search" "inventory-table"/]        <div class="list-group">            [@listItemOpenModal "iesire" "INVENTAR.IESIRE" "modal-iesire" "upload fa-1-5x"/]            [@listItemOpenModal "intrare" "INVENTAR.INTRARE" "modal-intrare" "download fa-1-5x"/]            [@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')"]                [@listItemOpenModal "addStoc" "INVENTAR.ADDSTOC" "modal-addStoc" "plus fa-1-5x"/]                <a id="removeStoc-open" name="removeStoc" title="[@spring.message "INVENTAR.REMOVESTOC" /]" class="list-group-item">                    <i class="fa fa-fw fa-minus fa-1-5x"></i>&nbsp;&nbsp;[@spring.message "INVENTAR.REMOVESTOC" /]                </a>                [@listItemOpenModal "addPlace" "INVENTAR.ADDPLACE" "modal-addPlace" "map-marker fa-1-5x"/]                [@listItemOpenModal "addCategory" "INVENTAR.ADDCATEGORY" "modal-addCategory" "tags fa-1-5x"/]                [@listItemOpenModal "addType" "INVENTAR.ADDTYPE" "modal-addType" "ticket fa-1-5x"/]                [@listItemOpenModal "downloadAllBarcodes" "INVENTAR.DOWNLOAD_ALL" "modal-confirm" "floppy-o fa-1-5x"/]            [/@security.authorize]        </div>    </div>    [/@sidebar]    [@content]        [@ajaxDataTable "inventory-table"]        <th> [@spring.message "INVENTAR.ARTICOL"/] </th>        <th> [@spring.message "INVENTAR.CATEGORIE"/] </th>        <th> [@spring.message "INVENTAR.TIP"/] </th>        <th> [@spring.message "INVENTAR.COD"/] </th>        <th> [@spring.message "INVENTAR.DETALII"/] </th>        <th> [@spring.message "INVENTAR.LOC"/] </th>        <th> [@spring.message "INVENTAR.PERSOANA"/] </th>        <th> [@spring.message "INVENTAR.ADAUGAT"/] </th>        <th> [@spring.message "INVENTAR.ALOCAT"/] </th>        [/@ajaxDataTable]        [@modalForm "modal-iesire" "INVENTAR.IESIRE" "/app/secure/inventory/iesire" "INVENTORY.OK" "upload" "check"]            [#include "dialogs/iesireForm.ftl"]        [/@modalForm]        [@modalForm "modal-intrare" "INVENTAR.INTRARE" "/app/secure/inventory/intrare" "INVENTORY.OK" "download" "check"]            [#include "dialogs/addStocForm.ftl"]        [/@modalForm]        [@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER')"]            [@largeModalForm "modal-addStoc" "MODAL.ADDSTOC" "/app/secure/inventory/addstockitem" "INVENTORY.ADDINVENTORY_ITEM" "cubes"]                [#include "dialogs/addStocForm.ftl"]            [/@largeModalForm]            [@modalForm "modal-addCategory" "MODAL.ADDCATEGORY" "/app/secure/inventory/addcategory" "MODAL.CATEGORY.NEWCATEGORY" "tags"]                [#include "dialogs/addCategoryForm.ftl"]            [/@modalForm]            [@modalForm "modal-addType" "MODAL.ADDTYPE" "/app/secure/inventory/addtype" "MODAL.ADDTYPE" "ticket"]                [#include "dialogs/addTypeForm.ftl"]            [/@modalForm]            [@modalForm "modal-addPlace" "MODAL.ADD_PLACE" "/app/secure/inventory/addplace" "MODAL.ADD_PLACE" "map-marker"]                [#include "dialogs/addPlaceForm.ftl"]            [/@modalForm]            [@largeModalForm "modal-edit-stoc" "MODAL.EDIT_STOC" "/app/secure/inventory/editstockitem" "MODAL.EDIT_STOC_BUT" "cubes" "pencil-square-o"]                [#include "dialogs/editStocForm.ftl"]            [/@largeModalForm]            [@modalForm "modal-removeStoc" "MODAL.REMOVE_ITEM" "/app/secure/inventory/removestockitem" "MODAL.REMOVE_ITEM" "minus-circle" "minus-circle" "danger"]            <span class="lead break-word">[@spring.message "ESTI_SIGUR_CA_VREI_SA_STERGI_STOC"/] <span class="text-info stoc-nume-delete"></span> ?</span>                [@hiddenInput "id-stoc-to-remove" "idStoc"/]            [/@modalForm]        [/@security.authorize]    [/@content][/@layout.basic]<script src="http://maps.google.com/maps/api/js?sensor=false&libraries=places"></script><script src="/js/locationpicker.js"></script><script src="/js/static/inventory.js"></script>