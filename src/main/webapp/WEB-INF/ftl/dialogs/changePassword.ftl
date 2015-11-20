[#ftl]
[#include "../formMacros.ftl"]

[@modalContainer]
    [@input "changePassword-form-password" "password" "USER.NEW_PASSWORD" "USER.NEW_PASSWORD.PLACEHOLDER" "" "12"/]
    [@input "changePassword-form-repeatPassword" "repeatPassword" "USER.REPEAT_PASSWORD" "USER.REPEAT_PASSWORD.PLACEHOLDER" "" "12"/]
    [@checkbox "changePassword-form-showPassword" "showPassword" "SHOW_PASSWORD" "" "" "12"/]
[/@modalContainer]