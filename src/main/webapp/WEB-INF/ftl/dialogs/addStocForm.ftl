[#ftl]
[#include "../formMacros.ftl"]

[@rowBreak/]
[@container]
    [@input "addStoc-form-numeStoc" "numeStoc" "MODAL.STOC_NAME" "MODAL.NAME" "" "4"/]
    [@elementWithModalLink "modal-addPlace" "INVENTAR.ADDPLACE" "4"]
        [@embedableSelectBox "addStoc-form-idLoc" "idLoc" "INVENTAR.LOC" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@embedableSelectBox]
    [/@elementWithModalLink]
    [@pictureUpload "image-file" "STOC.PICTURE"/]
    [@rowBreak/]
    [@elementWithModalLink "modal-addCategory" "MODAL.ADDCATEGORY" "4"]
        [@embedableSelectBox "addStoc-form-idCategorieStoc" "idCategorieStoc" "INVENTAR.CATEGORIE" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@embedableSelectBox]
    [/@elementWithModalLink]
    [@elementWithModalLink "modal-addType" "MODAL.ADDTYPE" "4"]
        [@embedableSelectBox "addStoc-form-idGrupStoc" "idGrupStoc" "INVENTAR.TIP" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@embedableSelectBox]
    [/@elementWithModalLink]
    [@rowBreak/]
    [@textarea "addStoc-form-detalii" "detalii" "MODAL.DETAILS" "MODAL.DETAILS.PLACEHOLDER" "8"/]
[/@container]