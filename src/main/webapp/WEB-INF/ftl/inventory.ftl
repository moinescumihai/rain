[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#include "formMacros.ftl"]
[#include "content.ftl"]
[@layout.basic]
    [@sidebar]
    <div>
    [@searchbox "inventory-search" "inventory-table"/]
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
    [/@content]
[/@layout.basic]
<script src="/js/static/inventory.js"></script>