[#ftl]
[#include "../formMacros.ftl"]

[@rowBreak/]
[@container]
    [@hiddenInput "user-form-idPersoana" "idPersoana"/]
    [@adminInput "user-form-username" "username" "USER.USERNAME" "USER.USERNAME" "" "6"/]
    [@infobox "defaultPassword" "INFOBOX.DEFAUL_PASSWORD"  "5" "11" "width-43"/]
    [@rowBreak/]
    [@adminInput "user-form-nume" "nume" "USER.LASTNAME" "USER.LASTNAME.PLACEHOLDER" "" "6"/]
    [@adminInput "user-form-prenume" "prenume" "USER.NAME" "USER.NAME.PLACEHOLDER" "" "6"/]
    [@rowBreak/]
    [@hiddenSelectNotAdmin "user-form-roles" "roles" "USER.ROLES" "12"]
        [@embedableMultiSelectBox "user-form-roles" "roles" "USER.ROLES"]
            [@security.authorize access="hasAnyRole('ROLE_ADMIN')"]
            <option value="1">Administrator</option>
            [/@security.authorize]
        <option value="7">Fi&#x219;iere</option>
        <option value="3">Persoane</option>
        <option value="5">Inventar</option>
        <option value="6">Rapoarte</option>
        <option value="4">Timp</option>
        <option value="8" selected>Utilizator</option>
        [/@embedableMultiSelectBox]
    [/@hiddenSelectNotAdmin]
    [@rowBreak/]
    [@adminInput "user-form-email" "email" "USER.EMAIL" "USER.EMAIL.PLACEHOLDER" "" "6"/]
    [@adminInput "user-form-workTel" "workTel" "USER.WORKPHONE" "USER.PHONE.PLACEHOLDER" "" "6"/]
    [@adminInput "user-form-tel" "tel" "USER.MOBILEPHONE" "USER.PHONE.PLACEHOLDER" "" "6"/]
    [@adminInput "user-form-fax" "fax" "USER.FAX" "USER.PHONE.PLACEHOLDER" "" "6"/]
[/@container]
