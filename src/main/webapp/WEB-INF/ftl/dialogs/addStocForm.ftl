[#ftl]
[#include "../formMacros.ftl"]

[@rowBreak/]
[@modalContainer]
    [@input "addStoc-form-numeStoc" "numeStoc" "MODAL.STOC_NAME" "MODAL.NAME" "" "4"/]
    [@elementWithLink "modal-addPlace" "INVENTAR.ADDPLACE" "4"]
        [@embedableSelectBox "addStoc-form-idLoc" "idLoc" "INVENTAR.LOC" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@embedableSelectBox]
    [/@elementWithLink]
    [@pictureUpload "image-file" "STOC.PICTURE"/]
    [@rowBreak/]
    [@elementWithLink "modal-addCategory" "MODAL.ADDCATEGORY" "4"]
        [@embedableSelectBox "addStoc-form-idCategorieStoc" "idCategorieStoc" "INVENTAR.CATEGORIE" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@embedableSelectBox]
    [/@elementWithLink]
    [@elementWithLink "modal-addType" "MODAL.ADDTYPE" "4"]
        [@embedableSelectBox "addStoc-form-idGrupStoc" "idGrupStoc" "INVENTAR.TIP" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@embedableSelectBox]
    [/@elementWithLink]
    [@rowBreak/]
    [@textarea "addStoc-form-detalii" "detalii" "MODAL.DETAILS" "MODAL.DETAILS.PLACEHOLDER" "8"/]
[/@modalContainer]