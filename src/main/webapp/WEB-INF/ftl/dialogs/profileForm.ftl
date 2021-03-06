[#ftl]
[#include "../formMacros.ftl"]

[@rowBreak/]
<div role="tabpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#useressentials" role="tab" data-toggle="tab">[@spring.message "ESSENTIALS"/]</a></li>
        <li><a href="#userdetails" role="tab" data-toggle="tab">[@spring.message "DETAILS"/]</a></li>
        <li><a href="#useraddress" role="tab" data-toggle="tab">[@spring.message "ADDRESS"/]</a></li>
        <li><a href="#useraccount" role="tab" data-toggle="tab">[@spring.message "ACCOUNT"/]</a></li>
    [@security.authorize ifAnyGranted="ROLE_ADMIN"]
        <li><a href="#userlegal" role="tab" data-toggle="tab">[@spring.message "LEGAL"/]</a></li>
    [/@security.authorize]
    </ul>
    <!-- Tab content -->
    <div class="tab-content">
        <div class="tab-pane fade in active" id="useressentials" role="tabpanel">
        [@container]
            [@input "userProfile-form-prenume" "prenume" "USER.NAME" "USER.NAME.PLACEHOLDER" "" "6"/]
            [@input "userProfile-form-nume" "nume" "USER.LASTNAME" "USER.LASTNAME.PLACEHOLDER" "" "6"/]
            [@emailInput "userProfile-form-email" "email" "USER.EMAIL" "USER.EMAIL.PLACEHOLDER" "" "6"/]
            [@input "userProfile-form-pozitie" "pozitie" "USER.JOBTITLE" "USER.JOBTITLE.PLACEHOLDER" "" "6"/]
        [/@container]
    </div>
    <div class="tab-pane fade" id="userdetails" role="tabpanel">
    [@container]
            [@input "userProfile-form-workTel" "workTel" "USER.WORKPHONE" "USER.WORKPHONE.PLACEHOLDER" "" "6"/]
            [@input "userProfile-form-mobilTel" "mobilTel" "USER.MOBILEPHONE" "USER.MOBILEPHONE.PLACEHOLDER" "" "6"/]
            [@input "userProfile-form-homeTel" "homeTel" "USER.HOMEPHONE" "USER.HOMEPHONE.PLACEHOLDER" "" "6"/]
            [@input "userProfile-form-fax" "fax" "USER.FAX" "USER.FAX.PLACEHOLDER" "" "6"/]
        [/@container]
    </div>
    <div class="tab-pane fade" id="useraddress" role="tabpanel">
    [@container]
        [@input "userProfile-form-adresa" "adresa" "USER.STRADA" "USER.STRADA.PLACEHOLDER" "" "6"/]
        [@input "userProfile-form-oras" "oras" "USER.ORAS" "USER.ORAS.PLACEHOLDER" "" "6"/]
        [@input "userProfile-form-judet" "judet" "USER.JUDET" "USER.JUDET.PLACEHOLDER" "" "6"/]
        [@input "userProfile-form-codPostal" "codPostal" "USER.ZIP" "USER.ZIP.PLACEHOLDER" "" "6"/]
        [@selectBox "userProfile-form-tara" "idTara" "USER.COUNTRY" "USER.COUNTRYSELECT" "SEARCH.NO_RESULTS" "6" /]
    [/@container]
    </div>
    <div class="tab-pane fade" id="useraccount">
    [@container]
        [@elementWithModalLink "modal-changePassword" "USER.PASSWORD.CHANGE"]
        [@readonlyEmbedableInput "userProfile-form-username" "idUser" "USER.USERNAME" "USER.USERNAME.PLACEHOLDER" "" "12"/]
    [/@elementWithModalLink]
    [/@container]
    </div>
    <div class="tab-pane fade" id="userlegal">
    [@container]
        [@input "userProfile-form-cnp" "cnp" "USER.CNP" "USER.CNP.PLACEHOLDER" "" "6"/]
        [@datepicker "userProfile-form-dataNastere" "dataNastere" "USER.DATANASTERE" "USER.DATANASTERE.PLACEHOLDER" "6"/]
        [@rowBreak/]
        [@input "userProfile-form-serieCi" "serieCi" "USER.CI.SERIE" "USER.CI.SERIE.PLACEHOLDER" "" "6"/]
        [@input "userProfile-form-nrCi" "nrCi" "USER.CI.NUMAR" "USER.CI.NUMAR.PLACEHOLDER" "" "6"/]
        [@rowBreak/]
        [@datepicker "userProfile-form-dataAngajare" "dataAngajare" "USER.DATAANGAJARE" "USER.DATAANGAJARE.PLACEHOLDER" "6"/]
        [@input "userProfile-form-zileConcediu" "zileConcediu" "USER.ZILECONCEDIU" "USER.ZILECONCEDIU.PLACEHOLDER" "" "6"/]
    [/@container]
    </div>
</div>
</div>