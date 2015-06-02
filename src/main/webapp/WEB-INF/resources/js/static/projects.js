var addProjectForm = $('#modal-addProiect-form');
var addClientForm = $('#modal-addClient-form');
var addCategoryForm = $('#modal-addCategory-form');

function getClients() {
    var clientsSelect = $('#addProject-form-client');
    clientsSelect.html(EMPTY);
    clientsSelect.append("<option></option>");
    clientsSelect.append($("<option>").val("0").text('Internal project'));
    $.ajax({
        type: 'get',
        url: '/app/secure/projects/getclients',
        contentType: "application/json",
        async: false,
        success: function (response) {
            if (typeof response !== 'undefined') {
                for (var i = 0; i < response.length; i++) {
                    clientsSelect.append($("<option>").val(response[i].idClient).text(response[i].numeClient));
                }
            }
            clientsSelect.trigger(chosenUpdated);
        },
        error: function (e) {
            showNotification("Error. Please try again later." + e.Message, "Error", DANGER);
        }
    });
}

function getCategories() {
    var categoriesSelect = $('#addProject-form-category');
    var parentCategoriesSelect = $('#addCategory-form-categorie-parinte');
    categoriesSelect.html(EMPTY);
    parentCategoriesSelect.html(EMPTY);
    categoriesSelect.append("<option></option>");
    parentCategoriesSelect.append("<option></option>");
    categoriesSelect.append($("<option>").val("0").text('UNCATEGORISED'));
    parentCategoriesSelect.append($("<option>").val("0").text('UNCATEGORISED'));
    $.ajax({
        type: 'get',
        url: '/app/secure/projects/getcategories',
        contentType: "application/json",
        async: false,
        success: function (response) {
            if (typeof response !== 'undefined') {
                for (var i = 0; i < response.length; i++) {
                    categoriesSelect.append($("<option>").val(response[i].idCategorieProiect).text(response[i].nume));
                    parentCategoriesSelect.append($("<option>").val(response[i].idCategorieProiect).text(response[i].nume));
                }
            }
            categoriesSelect.trigger(chosenUpdated);
            parentCategoriesSelect.trigger(chosenUpdated);
        },
        error: function (e) {
            showNotification("Error. Please try again later." + e.Message, "Error", DANGER);
        }
    });
}

function deleteProject(id) {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        method: 'get',
        dataType: "json",
        url: '/app/secure/projects/deleteproject/' + id,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            showNotification(response.message, 'Success', SUCCESS);
        },
        error: function () {
            showNotification("Error. Please try again later.", "Error", ERROR);
        }
    });
}

function getProjects() {
    var projectContainer = $('#project-container');
    projectContainer.empty();
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        method: 'get',
        dataType: "json",
        url: '/app/secure/projects/getprojects',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            var items = [];
            var projectString;
            if (response.length <= 0) {
                items.push('<h2><a class="text-muted"> No projects are defined </a></h2>');
            }
            $.each(response, function (i, proj) {
                var idProiect = proj.idProiect;
                var numeProiect = proj.numeProiect;
                var dataEnd = proj.dataEndEstimativa;
                projectString = '<div id="proiect-item' + idProiect + '" class="project-item">'
                    + '<a id="project-options' + idProiect + '" tabindex="0" class="btn-xs dropdown-carret popup-marker" data-load="idProiect=' + idProiect
                    + '" data-placement="bottom"><span class="caret"></span></a>'
                    + '&nbsp;<span id="proiect-nume-' + idProiect + '" class="proiect-nume">' + numeProiect + '</span>'
                    + '<span id="proiect-date-' + idProiect + '" class="proiect-date"> - due date: ' + dataEnd + '</span>'
                    + '</div>';
                items.push(projectString);
            });
            projectContainer.html(items.join(''));
        }
    });

};

$(document).ready(function () {
    $('#projects').addClass('active');

    getProjects();
    getClients();
    getCategories();

    $('body').on('mouseover', '.project-item', function () {
        $(this).find('a.popup-marker').webuiPopover({
            placement: 'bottom',//values: auto,top,right,bottom,left,top-right,top-left,bottom-right,bottom-left,auto-top,auto-right,auto-bottom,auto-left
            width: 'auto',//can be set with  number
            height: 'auto',//can be set with  number
            trigger: 'hover',//values:  click,hover,manual
            style: '',//values:'',inverse
            constrains: null, // constrains the direction when placement is  auto,  values: horizontal,vertical
            animation: 'pop', //pop with animation,values: pop,fade (only take effect in the browser which support css3 transition)
            delay: {//show and hide delay time of the popover, works only when trigger is 'hover',the value can be number or object
                show: null,
                hide: 500
            },
            async: {
                before: function (that, xhr) {
                },//executed before ajax request
                success: function (that, data) {
                }//executed after successful ajax request
            },
            cache: false,//if cache is set to false,popover will destroy and recreate
            multi: false,//allow other popovers in page at same time
            arrow: true,//show arrow or not
            title: '',//the popover title ,if title is set to empty string,title bar will auto hide
            closeable: false,//display close button or not
            padding: true,//content padding
            type: 'html',//content type, values:'html','iframe','async'
            url: '',//if not empty ,plugin will load content by url
            content: function (e) {
                var retValue;
                var data = $($(this)[0]).data('load').split('=');
                var idProject = data[1];
                retValue = '<div class="popover-left-column"><ul class="poject-options">'
                    + '<li><a><span class="fa fa-cog fa-fw">&nbsp;</span>&nbsp; Settings</a></li>'
                    + '<li><a><span class="fa fa-pencil fa-fw">&nbsp;</span>&nbsp; Edit</a></li>'
                    + '<li><a><span class="fa fa-child fa-fw">&nbsp;</span>&nbsp; People</a></li>'
                    + '<li><a><span class="fa fa-paperclip fa-fw">&nbsp;</span>&nbsp; Files</a></li>'
                    + '<li><a id="pop-proj-del-' + idProject + '"><span class="fa fa-trash-o fa-fw">&nbsp;</span>&nbsp; Delete</a></li>'
                    + '<li><a><span class="fa fa-archive fa-fw">&nbsp;</span>&nbsp; Archive</a></li>'
                    + '<li><a><span class="fa fa-line-chart fa-fw">&nbsp;</span>&nbsp; Report</a></li>'
                    + '</ul></div>'
                    + '<div class="popover-right-column"><ul class="poject-options">'
                    + '<li><a><span class="fa fa-history fa-fw">&nbsp;</span>&nbsp; Timeline</a></li>'
                    + '<li><a><span class="fa fa-tasks fa-fw">&nbsp;</span>&nbsp; Tasks</a></li>'
                    + '<li><a><span class="fa fa-bookmark-o fa-fw">&nbsp;</span>&nbsp; Milestones</a></li>'
                    + '<li><a><span class="fa fa-envelope-o fa-fw">&nbsp;</span>&nbsp; Messages</a></li>'
                    + '<li><a><span class="fa fa-bomb fa-fw">&nbsp;</span>&nbsp; Risks</a></li>'
                    + '</ul></div>';

                return retValue;
            }
        });
    });

    $('body').on('click', 'a[id^="pop-proj-del-"]', function (e) {
        var idProject = $(this).attr('id').replace('pop-proj-del-', '');
        confirmModal('delete-project-confirm-' + idProject, 'Are you sure you want to delete this project?');
    });

    $('body').on('click', 'button[id^=delete-project-confirm-]', function (e) {
        var idProject = $(this).attr('id').replace('delete-project-confirm-', '');
        var modalConfirm;
        idProject = idProject.replace('-yes', '');
        modalConfirm = $('#delete-project-confirm-' + idProject);
        deleteProject(idProject);
        modalConfirm.modal('hide');
        $('body').remove(modalConfirm);
    });

    $('body').on('hidden.bs.modal', 'div[id^=delete-project-confirm-]', function () {
        getProjects();
    });

    addCategoryForm.validate({
        rules: {
            required: true,
            nume: {
                minlength: 3
            }
        }
    });

    addCategoryForm.on('submit', function (e) {
        e.preventDefault();
        if (!$(this).valid()) {
            return;
        }
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var nume = $('#addCategory-form-nume').val();
        var idCategorieParinte = $('#addCategory-form-categorie-parinte').val();

        var data = {
            "nume": nume,
            "idCategorieParinte": idCategorieParinte
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
            data: JSON.stringify(data),
            success: function (response) {
                if (response.errorsMap != null) {
                    $('.form-error').html(EMPTY);
                    for (var key in response.errorsMap) {
                        var err = "<span class=\"text-danger small form-error\" id=\"" + key + "Id\">" + response.errorsMap[key] + "</span>";
                        $("[id^='" + key + "-error']").html(err);
                    }
                } else {
                    addCategoryForm.trigger('reset');
                    $('#modal-addCategory-close').click();
                    showNotification(response.message, 'Success', SUCCESS);
                }
            },
            error: function () {
                showNotification("Error. Please try again later.", "Error", ERROR);
            }
        });
    });

    $(document).on('hidden.bs.modal', '#modal-addCategory', function (e) {
        getCategories();
    });

    addClientForm.validate({
        rules: {
            required: true,
            numeClient: {
                minlength: 3
            },
            website: {
                required: false,
                url: true
            },
            email: {
                required: false,
                email: true
            },
            telefon: {
                required: false,
                number: true
            },
            fax: {
                required: false,
                number: true
            }
        }
    });

    addClientForm.on('submit', function (e) {
        e.preventDefault();
        if (!$(this).valid()) {
            return;
        }
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var numeClient = $('#addClient-form-nume').val();
        var website = $('#addClient-form-website').val();
        var email = $('#addClient-form-email').val();
        var telefon = $('#addClient-form-telefon').val();
        var fax = $('#addClient-form-fax').val();
        var idIndustrie = $('#addClient-form-industrie').val();
        var adresa = $('#addClient-form-adresa').val();
        var oras = $('#addClient-form-oras').val();
        var judet = $('#addClient-form-judet').val();
        var codPostal = $('#addClient-form-cod-postal').val();
        var idTara = $('#addClient-form-taral').val();
        var data = {
            "numeClient": numeClient, "website": website, "email": email, "telefon": telefon,
            "fax": fax, "idIndustrie": idIndustrie, "adresa": adresa, "oras": oras, "judet": judet,
            "codPostal": codPostal, "idTara": idTara
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
            data: JSON.stringify(data),
            success: function (response) {
                if (response.errorsMap != null) {
                    $('.form-error').html(EMPTY);
                    for (var key in response.errorsMap) {
                        var err = "<span class=\"text-danger small form-error\" id=\"" + key + "Id\">" + response.errorsMap[key] + "</span>";
                        $("[id^='" + key + "-error']").html(err);
                    }
                } else {
                    addClientForm.trigger('reset');
                    $('#modal-addClient-close').click();
                    showNotification(response.message, 'Success', SUCCESS);
                }
            },
            error: function () {
                showNotification("Error. Please try again later.", "Error", ERROR);
            }
        });
    });

    $(document).on('hidden.bs.modal', '#modal-addClient', function (e) {
        getClients();
    });

    addProjectForm.validate({
        rules: {
            required: true,
            numeProiect: {
                minlength: 5
            },
            descriere: {
                required: false
            }
        }
    });

    addProjectForm.on('submit', function (e) {
        e.preventDefault();
        if (!$(this).valid()) {
            return;
        }
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var numeProiect = $('#addProject-form-nume').val();
        var idStatusProiect = $('#addProject-form-status').val();
        var descriere = $('#addProject-form-descriere').val();
        var idClient = $('#addProject-form-client').val();
        var idCategorieProiect = $('#addProject-form-category').val();
        var dataStart = new Date($('#addProject-form-start-date').val());
        var dataEndEstimativa = new Date($('#addProject-form-end-date').val());
        var data = {
            "numeProiect": numeProiect, "idStatusProiect": idStatusProiect,
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
            data: JSON.stringify(data),
            success: function (response) {
                if (response.errorsMap != null) {
                    $('.form-error').html(EMPTY);
                    for (var key in response.errorsMap) {
                        var err = "<span class=\"text-danger small form-error\" id=\"" + key + "Id\">" + response.errorsMap[key] + "</span>";
                        $("[id^='" + key + "-error']").html(err);
                    }
                } else {
                    addProjectForm.trigger('reset');
                    $('#modal-addProiect-close').click();
                    showNotification(response.message, 'Success', SUCCESS);
                }
            },
            error: function () {
                showNotification("Error. Please try again later.", "Error", DANGER);
            }
        });
    });

});
