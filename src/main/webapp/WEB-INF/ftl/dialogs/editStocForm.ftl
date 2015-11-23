[#ftl]
[#include "../formMacros.ftl"]

[@rowBreak/]
[@modalContainer]
    [@hiddenInput "editStoc-form-idStoc" "idStoc" /]
    [@hiddenInput "editStoc-form-idImagine" "idImagine" /]
    [@input "editStoc-form-numeStoc" "numeStoc" "MODAL.STOC_NAME" "MODAL.NAME" "" "4"/]
    [@elementWithModalLink "modal-addPlace" "INVENTAR.ADDPLACE" "4"]
        [@embedableSelectBox "editStoc-form-idLoc" "idLoc" "INVENTAR.LOC" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@embedableSelectBox]
    [/@elementWithModalLink]
    [@pictureUpload "image-file-update" "STOC.PICTURE_UPDATE"/]
    [@rowBreak/]
    [@elementWithModalLink "modal-addCategory" "MODAL.ADDCATEGORY" "4"]
        [@adminEmbedableSelectBox "editStoc-form-idCategorieStoc" "idCategorieStoc" "INVENTAR.CATEGORIE" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@adminEmbedableSelectBox]
    [/@elementWithModalLink]
    [@elementWithModalLink "modal-addType" "MODAL.ADDTYPE" "4"]
        [@adminEmbedableSelectBox "editStoc-form-idGrupStoc" "idGrupStoc" "INVENTAR.TIP" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@adminEmbedableSelectBox]
    [/@elementWithModalLink]
    [@rowBreak/]
    [@elementWithModalLink "modal-addUser" "MODAL.ADD_USER" "4"]
        [@embedableSelectBox "editStoc-form-idResurseUmane" "idResurseUmane" "INVENTAR.PERSOANA" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
        [/@embedableSelectBox]
    [/@elementWithModalLink]
    [@selectBox "editStoc-form-idStare" "idStare" "STOC.CAPTABEL.STARE" /]
    [@rowBreak/]
    [@textarea "editStoc-form-detalii" "detalii" "MODAL.DETAILS" "MODAL.DETAILS.PLACEHOLDER" "8"/]
[/@modalContainer]