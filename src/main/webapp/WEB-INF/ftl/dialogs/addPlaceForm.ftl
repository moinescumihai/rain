[#ftl]
[#include "../formMacros.ftl"]
[@modalContainer]
    [@input "addPlace-form-numeLoc" "numeLoc" "INVENTAR.LOC" "INVENTAR.LOC.PLACEHOLDER" "" "5"/]
    [@input "addPlace-form-cauta" "adresa" "ADDRESS" "SEARCH" "" "7"/]
<div id="location-picker" class="location-picker"></div>
    [@inputReadOnly "addPlace-form-latitudine" "latitudine" "INVENTAR.LOC.LATITUDINE" /]
    [@inputReadOnly "addPlace-form-longitudine" "longitudine" "INVENTAR.LOC.LONGITUDINE" /]
[/@modalContainer]
