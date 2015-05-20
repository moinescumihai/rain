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
            [#include "dialogs/addProjectForm.ftl"]
        [/@modalForm]
        [@modalForm "modal-addClient" "MODAL.ADDCLIENT" "/app/secure/clients/addclient" "MODAL.ADDCLIENT" "group"]
            [#include "dialogs/addClientForm.ftl"]
        [/@modalForm]
    [/@content]
[/@layout.basic]
<script type="text/javascript">
    $(document).ready(function () {
        $('#projects').addClass('active');

        $('#modal-addProiect-form').on('submit', function (e) {
            e.preventDefault();
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");

            var numeProiect = $('#addProject-form-nume').val();
            var idStatusProiect = $('#addProject-form-status').val();
            var descriere = $('#addProject-form-descriere').val();
            var idClient = $('#addProject-form-client').val();
            var idCategorieProiect = $('#addProject-form-category').val();
            var dataStart = $('#addProject-form-start-date').val();
            var dataEndEstimativa = $('#addProject-form-end-date').val();
            var data = {
                "numeProiect" : numeProiect, "idStatusProiect" : idStatusProiect,
                "descriere": descriere, "idClient": idClient,
                "idCategorieProiect": idCategorieProiect,
                "dataStart": dataStart, "dataEndEstimativa": dataEndEstimativa
            };

            $.ajax({
                type: 'post',
                url: $(this).attr('action'),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                dataType: 'json',
                contentType: 'application/json',
                mimeType: 'application/json',
                data:  JSON.stringify(data),
                success: function (response) {debugger;
                    if (typeof response.errorsMap != null) {
                        for (var key in response.errorsMap) {
                            var err = "<span class=\"form-field-error\" id=\"" + key + "Id\">" + response.errorsMap[key] + "</span>";
                            $("[id^='" + key + "-error']").html(err);
                        }
                    } else {
                        $(this).trigger('reset');

                        showNotification(response, SUCCESS, SUCCESS);
                    }
                },
                error: function () {
                    showNotification("Error. Please try again later.", "Error", DANGER);
                }
            });
        });

    });

</script>