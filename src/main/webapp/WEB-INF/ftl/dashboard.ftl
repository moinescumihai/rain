[#ftl]
[#import "layouts/layouts.ftl" as layout/]
[#include "content.ftl" /]
[#include "formMacros.ftl" /]
[@layout.basic]
    [@dashboard]
    <div class="container jumbotron centered">
        [@selectBox "test" "APPTITLE" ]

            [#assign seq = ["winter", "spring", "summer", "autumn", "dudu" , "mudu", "fudu", "spring", "summer", "autumn", "dudu" , "mudu", "fudu" ] /]
            [#list seq as x]
            <option value="${x_index + 1}"> ${x}</option>
            [/#list]
        [/@selectBox]

        [@selectBoxMulti "testing" "APPTITLE" ]

            [#assign seq = ["winter", "spring", "summer", "autumn", "dudu" , "mudu", "fudu", "spring", "summer", "autumn", "dudu" , "mudu", "fudu"] /]
            [#list seq as x]
            <option value="${x_index + 1}"> ${x}</option>
            [/#list]
        [/@selectBoxMulti]

        [@input "test" "APPTITLE" "WELCOMETORAINDROP" /]

        [@password "parola" "APPTITLE" "WELCOME" /]

        [@textarea "text-min-area" "APPTITLE" "WELCOME"/]

        [@checkbox "checkbox" "APPTITLE" "WELCOME" "a"/]
        [@button "btn1" "APPTITLE"/]
        [@button "btn1" "APPTITLE" "success" "cog fa-spin"/]
        [@buttonSubmit "btn1" "APPTITLE"/]
        [@buttonCloseModal "btn1" "APPTITLE"/]
    </div>
    [/@dashboard]
[/@layout.basic]
<script type="text/javascript">
    $(document).ready(function(){
       $('#dashboard').addClass('active');
    });
</script>