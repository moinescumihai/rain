[#ftl]
[#include "../formMacros.ftl"]
[@container]
    [@input "addCategory-form-nume" "nume" "MODAL.CATEGORY.NEWCATEGORY" "MODAL.CATEGORY.INPUT" "" "7"/]
    [@input "addCategory-form-codCategorie" "codCategorie" "MODAL.CATEGORY.COD" "MODAL.CATEGORY.COD_PLACEHOLDER" "" "7"/]

    [@selectBox "addCategory-form-categorie-parinte" "idCategorieParinte" "MODAL.CATEGORY.PARENTCATEGORY" "MODAL.CATEGORY.SELECTPARENTCATEGORY" "SEARCH.NO_RESULTS" "7" /]
[/@container]