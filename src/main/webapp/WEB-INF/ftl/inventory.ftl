[#ftl]
[#import "layouts/layouts.ftl" as layout]
<style>
    .webui-popover {
        z-index: 2000 !important;
    }
</style>
[#include "formMacros.ftl"]
[#include "content.ftl"]
[@layout.basic]
    [@sidebar]
    <div>
        [@searchbox "inventory-search" "inventory-table"/]

        <div class="list-group">
            [@listItemOpenModal "iesire" "INVENTAR.IESIRE" "modal-iesire" "upload fa-1-5x"/]
            [@listItemOpenModal "intrare" "INVENTAR.INTRARE" "modal-intrare" "download fa-1-5x"/]
            [@listItemOpenModal "addStoc" "INVENTAR.ADDSTOC" "modal-addStoc" "plus fa-1-5x"/]
            [@listItemOpenModal "removeStoc" "INVENTAR.REMOVESTOC" "modal-removeStoc" "minus fa-1-5x"/]
            [@listItemOpenModal "addPlace" "INVENTAR.ADDPLACE" "modal-addPlace" "map-marker fa-1-5x"/]
            [@listItemOpenModal "addCategory" "INVENTAR.ADDCATEGORY" "modal-addCategory" "tags fa-1-5x"/]
            [@listItemOpenModal "addType" "INVENTAR.ADDTYPE" "modal-addType" "ticket fa-1-5x"/]
            [@listItemOpenModal "downloadAllBarcodes" "INVENTAR.DOWNLOAD_ALL" "modal-confirm" "floppy-o fa-1-5x"/]
        </div>
    </div>
    [/@sidebar]
    [@content]
        [@ajaxDataTable "inventory-table"]
        <th> [@spring.message "INVENTAR.ARTICOL"/] </th>
        <th> [@spring.message "INVENTAR.CATEGORIE"/] </th>
        <th> [@spring.message "INVENTAR.TIP"/] </th>
        <th> [@spring.message "INVENTAR.COD"/] </th>
        <th> [@spring.message "INVENTAR.DETALII"/] </th>
        <th> [@spring.message "INVENTAR.ALOCAT"/] </th>
        <th> [@spring.message "INVENTAR.ALOCAT"/] </th>
        [/@ajaxDataTable]

        [@largeModalForm "modal-addStoc" "MODAL.ADDSTOC" "/app/secure/inventory/addstockitem" "INVENTORY.ADDINVENTORY_ITEM" "cubes"]
            [#include "dialogs/addStocForm.ftl"]
        [/@largeModalForm]
    [/@content]
[/@layout.basic]
<script src="/js/static/inventory.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>