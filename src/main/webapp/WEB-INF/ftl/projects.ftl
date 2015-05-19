[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#include "content.ftl"]
[#include "formMacros.ftl"]
[@layout.basic]
    [@sidebar]
    <div>
        [@buttonOpenModal "addProiect" "PROJECTS.ADDPROJECT" "modal-addProiect"/]
    </div>
    [/@sidebar]
    [@content]
    <div></div>
        [@modalForm "modal-addProiect" "MODAL.ADDPROJECT" "/app/secure/projects/addproject" "PROJECTS.ADDPROJECT" "book"]
            [#include "dialogs/addProject.ftl"]
        [/@modalForm]
    [/@content]
[/@layout.basic]
<script type="text/javascript">
    $(document).ready(function () {
        $('#projects').addClass('active');

    });

</script>