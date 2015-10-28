var addProjectForm = $('#modal-addProiect-form');
var addClientForm = $('#modal-addClient-form');
var addCategoryForm = $('#modal-addCategory-form');
var projectsTable;

var getClients = function (container) {
    var clientsSelect = $('#' + container);
    clientsSelect.html(EMPTY);
    clientsSelect.append("<option></option>");
    $.ajax({
        type: 'get',
        url: '/app/secure/projects/getclients',
        contentType: 'application/json',
        success: function (response) {
            $.each(response, function (index, client) {
                clientsSelect.append($("<option>").val(client.idClient).text(client.numeClient));
            });
            clientsSelect.trigger(chosenUpdated);
        },
        error: function (e) {
            showNotification('Error. Please try again later.' + e.Message, 'Error', DANGER);
        }
    });
};

var getCategories = function (container) {
    var categoriesSelect = $('#' + container);
    categoriesSelect.html(EMPTY);
    categoriesSelect.append('<option></option>');
    $.ajax({
        type: 'get',
        url: '/app/secure/projects/getcategories',
        contentType: 'application/json',
        success: function (response) {
            $.each(response, function (index, category) {
                categoriesSelect.append($('<option>').val(category.idCategorieProiect).text(category.nume));
            });
            categoriesSelect.trigger(chosenUpdated);
        },
        error: function (e) {
            showNotification('Error. Please try again later.' + e.Message, 'Error', DANGER);
        }
    });
};

var deleteProject = function (id) {
    var token = $('meta[name="_csrf"]').prop('content');
    var header = $('meta[name="_csrf_header"]').prop('content');

    $.ajax({
        method: 'get',
        dataType: 'json',
        url: '/app/secure/projects/deleteproject/' + id,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            getProjects();
            showNotification(response.message, 'Success', SUCCESS);
        },
        error: function () {
            showNotification('Error. Please try again later.', 'Error', ERROR);
        }
    });
};

var getProjects = function () {
    var projectContainer = $('#project-container');
    projectContainer.html(EMPTY);
    var token = $("meta[name='_csrf']").prop('content');
    var header = $("meta[name='_csrf_header']").prop('content');

    var tableHeader = '<table id="project-table" class="table table-hover table-responsive">'
        + '<thead><tr class="text-table-head">'
        + '<td>Nume</td>'
        + '<td>Categorie</td>'
        + '<td>Dat&abreve; start</td>'
        + '<td>Dat&abreve; final</td>'
        + '</tr></thead><tbody>';

    $.ajax({
        method: 'get',
        dataType: 'json',
        url: '/app/secure/projects/getprojects',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            var rows = [];
            var projectString;

            $.each(response, function (index, project) {
                var idProiect = project.idProiect;
                var numeProiect = project.numeProiect;
                var categorie = project.idCategorieProiect.nume;
                var dataNow = new Date();
                var dataEnd = toJSDateTime(project.dataEndEstimativa);
                var dataStart = toJSDateTime(project.dataStart);
                var isOverdue = dataNow > new Date(project.dataEndEstimativa);
                var overdue = '';
                if (isOverdue && project.idStatusProiect == '3') {
                    overdue = '<span class="fa fa-exclamation-circle text-danger" data-toggle="tooltip" data-placement="bottom" title="Project is overdue">&nbsp;</span>';
                }
                projectString = '<tr id="proiect-item' + idProiect + '" class="project-item"><td>'
                    + '<a id="project-options' + idProiect + '" tabindex="0" role="button" class="btn-xs popup-marker" data-load="idProiect=' + idProiect
                    + '" data-placement="bottom"><span class="fa fa-sliders"></span></a>'
                    + '&nbsp;&nbsp;<span id="proiect-nume-' + idProiect + '" class="proiect-nume">' + overdue + numeProiect + '</span></td>'
                    + '<td>' + categorie + '</td>'
                    + '<td><p id="proiect-data-start-' + idProiect + '" class="proiect-date"> ' + dataStart + '</p></td>'
                    + '<td><p id="proiect-data-end-' + idProiect + '" class="proiect-date"> ' + dataEnd + '</p>'
                    + '</td></tr>';
                rows.push(projectString);
            });
            var tableFooter = '</tbody></table>';
            projectContainer.html(tableHeader + rows.join('') + tableFooter);
            projectsTable = $('#project-table').DataTable({
                "sDom": 'ltipr',
                "columns": [
                    {
                        "bSortable": true,
                        "orderable": true,
                        "searchable": true
                    }, {
                        "bSortable": true,
                        "orderable": true,
                        "searchable": true
                    },
                    {
                        "bSortable": false,
                        "orderable": false,
                        "searchable": true
                    },
                    {
                        "bSortable": false,
                        "orderable": false,
                        "searchable": true
                    }
                ]
            });
            $('#project-search').on('keyup', function () {
                projectsTable.search(this.value).draw();
            });
            $('[data-toggle="tooltip"]').tooltip();
        }
    });

};

$(document).ready(function () {
    $('#projects').addClass('active');

    getProjects();
    getClients('addProject-form-client');
    getCategories('addProject-form-category');
    getCategories('addCategory-form-categorie-parinte');

    $(document).on('mouseover', '.project-item', function () {
        $(this).find('a.popup-marker').webuiPopover($.extend({}, popoverDefaultSettings, {
                    type: 'html',//content type, values:'html','iframe','async'
                    url: '',//if not empty ,plugin will load content by url
                    title: '',//the popover title ,if title is set to empty string,title bar will auto hide
                    content: function (e) {
                        var retValue;
                        var data = $($(this)[0]).data('load').split('=');
                        var idProject = data[1];
                        retValue = '<div class="col-md-6"><ul class="popover-options">'
                            + '<li><a><span class="fa fa-cog fa-fw">&nbsp;</span>&nbsp; Set&abreve;ri</a></li>'
                            + '<li><a><span class="fa fa-archive fa-fw">&nbsp;</span>&nbsp; Arhiv&abreve;</a></li>'
                            + '<li><a id="pop-proj-del-' + idProject + '"><span class="fa fa-trash-o fa-fw">&nbsp;</span>&nbsp; &\#350;terge</a></li>'
                            + '</ul></div>'
                            + '<div class="col-md-6"><ul class="popover-options">'
                            + '<li><a><span class="fa fa-group fa-fw">&nbsp;</span>&nbsp; Persoane</a></li>'
                            + '<li><a><span class="fa fa-tasks fa-fw">&nbsp;</span>&nbsp; Sarcini</a></li>'
                            + '<li><a><span class="fa fa-paperclip fa-fw">&nbsp;</span>&nbsp; Fi&\#x219;iere</a></li>'
                            + '<li><a><span class="fa fa-line-chart fa-fw">&nbsp;</span>&nbsp; Rapoarte</a></li>'
                            + '</ul></div>';

                        return retValue;
                    }
                }
            )
        )
    });

    $(document).on('click', 'a[id^="pop-proj-del-"]', function (e) {
        var idProject = $(this).prop('id').replace('pop-proj-del-', '');
        confirmModal('delete-project-confirm-' + idProject, 'E&#x219;ti sigur c&abreve; vrei s&abreve; &#x219;tergi proiectul?');
    });

    $(document).on('click', 'button[id^=delete-project-confirm-]', function (e) {
        var idProject = $(this).prop('id').replace('delete-project-confirm-', '');
        var modalConfirm;
        idProject = idProject.replace('-yes', '');
        modalConfirm = $('#delete-project-confirm-' + idProject);
        deleteProject(idProject);
        modalConfirm.modal('hide');
        $('body').remove(modalConfirm);
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
        if (!$(this).valid()) {
            return;
        }
        var token = $("meta[name='_csrf']").prop('content');
        var header = $("meta[name='_csrf_header']").prop('content');

        var nume = $('#addCategory-form-nume').val();
        var idCategorieParinte = $('#addCategory-form-categorie-parinte').val();

        var data = {
            "nume": nume,
            "idCategorieParinte": idCategorieParinte
        };

        $.ajax({
            type: 'post',
            url: $(this).prop('action'),
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
                        var err = '<span class="text-danger small form-error" id="' + key + 'Id">' + response.errorsMap[key] + '</span>';
                        $("[id^='" + key + "-error']").html(err);
                    }
                } else {
                    addCategoryForm.trigger('reset');
                    $('#modal-addCategory-close').click();
                    showNotification(response.message, 'Success', SUCCESS);
                }
            },
            error: function () {
                showNotification('Error. Please try again later.', 'Error', ERROR);
            }
        });
        e.preventDefault();
    });

    $(document).on('hidden.bs.modal', '#modal-addCategory', function (e) {
        getCategories('addProject-form-category');
        getCategories('addCategory-form-categorie-parinte');
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
        var token = $("meta[name='_csrf']").prop('content');
        var header = $("meta[name='_csrf_header']").prop('content');

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
        var idTara = $('#addClient-form-tara').val();
        var data = {
            "numeClient": numeClient, "website": website, "email": email, "telefon": telefon,
            "fax": fax, "idIndustrie": idIndustrie, "adresa": adresa, "oras": oras, "judet": judet,
            "codPostal": codPostal, "idTara": idTara
        };

        $.ajax({
            type: 'post',
            url: $(this).prop('action'),
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
                    $('#modal-addClient').modal('hide');
                    $('.chosen-select').trigger(chosenUpdated);
                    showNotification(response.message, 'Success', SUCCESS);
                }
            },
            error: function () {
                showNotification("Error. Please try again later.", "Error", ERROR);
            }
        });
    });

    $(document).on('hidden.bs.modal', '#modal-addClient', function (e) {
        getClients('addProject-form-client');
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

    addProjectForm.on('submit', function (event) {
        if (!$(this).valid()) {
            return;
        }
        var token = $("meta[name='_csrf']").prop("content");
        var header = $("meta[name='_csrf_header']").prop("content");

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
            url: $(this).prop('action'),
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
                    $('#modal-addProiect').modal('hide');
                    addProjectForm.trigger('reset');
                    $('.chosen-select').trigger(chosenUpdated);
                    showNotification(response.message, 'Success', SUCCESS);
                    getProjects();
                }
            },
            error: function () {
                showNotification('Error. Please try again later.', 'Error', ERROR);
            }
        });
        event.preventDefault();
    });

});
