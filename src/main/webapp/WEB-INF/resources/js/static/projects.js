var addProjectForm = $('#modal-addProiect-form'),
    addClientForm = $('#modal-addClient-form'),
    addCategoryForm = $('#modal-addCategory-form'),
    $persoaneHolder = $('#persoane-holder'),
    $persoaneModal = $('#modal-persoane'),
    $addPersoanaForm = $('#add-persoana-to-project-form'),
    $taskModal = $('#modal-tasks'),
    $filesModal = $('#modal-files'),
    $fileHolder = $('#file-holder'),
    alertType = ['alert-primary', 'alert-success', 'alert-warning', 'alert-info'],
    $projectsTableHolder = $('#project-table'),
    $projectsTable;

var getClients = function (container) {
    var clientsSelect = $('#' + container);
    clientsSelect.html(EMPTY);
    clientsSelect.append('<option></option>');
    $.ajax({
        type: 'get',
        url: '/app/secure/projects/getclients',
        contentType: 'application/json',
        success: function (response) {
            if (response.length === 0) {
                clientsSelect.append($('<option>').prop('disabled', true).text('Nu ai definit niciun client'));
            }
            $.each(response, function (index, client) {
                clientsSelect.append($('<option>').val(client.idClient).text(client.numeClient));
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
            if (response.length === 0) {
                categoriesSelect.append($('<option>').prop('disabled', true).text('Nu ai definit nicio categorie'));
            }
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
            $projectsTable.ajax.reload(null, false);
            showNotification(response.message, 'Success', SUCCESS);
        },
        error: function () {
            showNotification('Error. Please try again later.', 'Error', ERROR);
        }
    });
};

var getPersoaneForProject = function (idProject) {
    var token = $('meta[name="_csrf"]').prop('content'),
        header = $('meta[name="_csrf_header"]').prop('content');

    $.ajax({
        method: 'get',
        dataType: 'json',
        url: '/app/secure/projects/get-users-on-project/' + idProject,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            $persoaneHolder.html(EMPTY);
            $persoaneHolder.data('idProiect', idProject);
            $('#add-persoana-to-project-idProiect').val(idProject);
            $.each(response, function (index, mapping) {
                $persoaneHolder.append(
                    '<div id="' + mapping.idUserOnProject + '-user-on-project" class="col-md-3 alert alert-info alert-dismissible" role="alert">' +
                    '<button type="button" class="close" data-dismiss="alert" aria-label="&Icirc;nchide"><span aria-hidden="true">&times;</span></button>' +
                    mapping.persoana.fullName +
                    '</div>');
            });
        },
        error: function () {
            showNotification('Error. Please try again later.', 'Error', ERROR);
        }
    });
};

var unassignUserFromProject = function (idUserOnProject) {
    var token = $("meta[name='_csrf']").prop('content'),
        header = $("meta[name='_csrf_header']").prop('content');

    $.ajax({
        method: 'get',
        dataType: 'json',
        url: '/app/secure/projects/unassign-user-from-project/' + idUserOnProject,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            showNotification(response.message, 'Success', SUCCESS);
        }
    });
};

var getFilesForProject = function (idProject) {
    var token = $("meta[name='_csrf']").prop('content'),
        header = $("meta[name='_csrf_header']").prop('content');

    $.ajax({
        method: 'get',
        dataType: 'json',
        url: '/app/secure/files/get-files-for-project/' + idProject,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            $fileHolder.html(EMPTY);
            displayFiles(response, $fileHolder);
        },
        error: function () {
            showNotification('Error. Please try again later.', 'Error', ERROR);
        }
    });
};

var markAsFavourite = function (idProject) {
    var token = $("meta[name='_csrf']").prop('content'),
        header = $("meta[name='_csrf_header']").prop('content'),
        $taskNavButton = $('#tasks').find('a'),
        newHref;

    $.ajax({
        method: 'get',
        dataType: 'json',
        url: '/app/secure/projects/mark-fav/' + idProject,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (proiect) {
            newHref = $taskNavButton.attr('href').replace(/proiect=.+/, 'proiect=' + proiect.codProiect);
            $taskNavButton.attr('href', newHref);
            getProfile();
            $projectsTable.ajax.reload(null, false);
            showNotification(proiect.numeProiect + ' a fost marcat ca favorit', 'Succes', SUCCESS);
        },
        error: function () {
            showNotification('Error. Please try again later.', 'Error', ERROR);
        }
    });
};

$(document).ready(function () {
    $('#projects').addClass('active');

    getClients('addProject-form-client');
    getCategories('addProject-form-category');
    getCategories('addCategory-form-categorie-parinte');

    try {
        $projectsTable = $projectsTableHolder.DataTable({
            sDom: '<"clear"><"break-row"><"pull-right"B>lrtip<"break-row-lg">',
            ajax: {
                url: '/app/secure/projects/getprojects',
                dataSrc: ""
            },
            buttons: [
                {
                    extend: 'excel',
                    text: '<span class="fa fa-file-excel-o" title="Apasa ALT+X pentru a salva tabelul in format Excel">&nbsp;&nbsp;</span><span>XLS</span>',
                    className: 'btn btn-default',
                    key: {
                        key: 'x'
                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'pdf',
                    text: '<span class="fa fa-file-pdf-o" title="Apasa ALT+F pentru a salva tabelul in format PDF">&nbsp;&nbsp;</span><span>PDF</span>',
                    className: 'btn btn-default',
                    key: {
                        key: 'f'
                    },
                    orientation: 'landscape',
                    title: 'Proiecte',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: '<span class="fa fa-print" title="Apasa ALT+P pentru a trimite la print">&nbsp;&nbsp;</span><span>Print</span>',
                    className: 'btn btn-default',
                    key: {
                        key: 'p'
                    },
                    title: 'Proiecte',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'colvis',
                    text: '<span class="fa fa-adjust">&nbsp;&nbsp;</span><span>Alege coloane vizibile</span>',
                    className: 'btn btn-default'
                }
            ],
            columns: [
                {
                    sWidth: '15px',
                    bSortable: false,
                    orderable: false,
                    data: null,
                    defaultContent: EMPTY,
                    searchable: false
                }, {
                    data: null,
                    defaultContent: EMPTY,
                    sWidth: '15px'
                },
                {
                    data: 'numeProiect',
                    className: 'proiect-nume'
                }, {
                    data: 'idCategorieProiect.nume'
                },
                {data: 'descriere'},
                {
                    data: 'dataStart'
                },
                {
                    data: 'dataEndEstimativa'
                }
            ],
            columnDefs: [
                {
                    targets: [0],
                    searchable: false,
                    bSortable: false,
                    orderable: false,
                    bUseRendered: true,
                    visible: true,
                    fnCreatedCell: function (nTd, sData, oData, i) {
                        $(nTd).parent().addClass('project-item').prop('id', 'proiect-item' + oData.idProiect);
                        $(nTd).html('<a id="project-options' + oData.idProiect + '" tabindex="0" role="button" class="btn-xs popup-marker" data-load="idProiect=' + oData.idProiect
                            + '" data-placement="bottom"><span class="fa fa-sliders"></span></a>');
                    }
                },
                {
                    targets: [1],
                    bUseRendered: true,
                    visible: true,
                    fnCreatedCell: function (nTd, sData, oData, i) {
                        var isFav = profile.favorit.idProiect === oData.idProiect,
                            fav;
                        if (isFav) {
                            fav = '<i class="fa fa-star golden" title="Favorit"></i>';
                        }
                        $(nTd).html(fav);
                    }
                },
                {
                    targets: [2],
                    bUseRendered: true,
                    visible: true,
                    fnCreatedCell: function (nTd, sData, oData, i) {
                        $(nTd).prop('id', 'project-options' + sData);
                    }
                },
                {
                    targets: [5, 6],
                    bUseRendered: true,
                    visible: true,
                    render: function (data, type, row) {
                        if (data) {
                            return generateFormattedDate(new Date(data));
                        } else {
                            return EMPTY;
                        }
                    }
                }
            ]
        });
        $('#project-search').on('keyup', function () {
            $projectsTable.search(this.value).draw();
        });
        $('[data-toggle="tooltip"]').tooltip();
    } catch (err) {
        console.log(err);
    }

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
                            + '<li><a><span class="fa fa-cog fa-fw">&nbsp;</span>&nbsp; Editeaz&abreve;</a></li>'
                            + '<li><a><span class="fa fa-archive fa-fw">&nbsp;</span>&nbsp; Arhiveaz&abreve;</a></li>'
                            + '<li><a id="pop-proj-fav-' + idProject + '"><span class="fa fa-star fa-fw">&nbsp;</span>&nbsp; Favorit</a></li>'
                            + '<li><a id="pop-proj-del-' + idProject + '"><span class="fa fa-trash-o fa-fw">&nbsp;</span>&nbsp; &#350;terge</a></li>'
                            + '</ul></div>'
                            + '<div class="col-md-6"><ul class="popover-options">'
                            + '<li><a id="pop-proj-persoane-' + idProject + '"><span class="fa fa-group fa-fw">&nbsp;</span>&nbsp; Persoane</a></li>'
                            + '<li><a id="pop-proj-task-' + idProject + '"><span class="fa fa-tasks fa-fw">&nbsp;</span>&nbsp; Sarcini</a></li>'
                            + '<li><a id="pop-proj-files-' + idProject + '"><span class="fa fa-paperclip fa-fw">&nbsp;</span>&nbsp; Fi&#x219;iere</a></li>'
                            + '<li><a><span class="fa fa-line-chart fa-fw">&nbsp;</span>&nbsp; Rapoarte</a></li>'
                            + '</ul></div>';

                        return retValue;
                    }
                }
            )
        )
    });

    var persoane = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('fullName'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        // url points to a json file that contains an array of country names, see
        // https://github.com/twitter/typeahead.js/blob/gh-pages/data/countries.json
        prefetch: '../app/secure/inventory/getpersoane'
    });

    $('#add-persoana-to-project-fullName').typeahead({
            hint: true,
            highlight: true,
            minLength: 1
        },
        {
            name: 'persoane',
            display: 'fullName',
            source: persoane,
            templates: {
                empty: [
                    '<div class="empty-message text-muted">',
                    'Utilizatorul nu a fost g&#259;sit',
                    '</div>'
                ].join('\n')
            }
        });

    $(document).on('click', 'a[id^="pop-proj-fav-"]', function (event) {
        var idProject = $(this).prop('id').replace(/pop-proj-fav-/g, '');
        markAsFavourite(idProject);
        event.preventDefault();
    });

    $(document).on('click', 'a[id^="pop-proj-task-"]', function (event) {
        var idProject = $(this).prop('id').replace(/pop-proj-task-/g, '');
        $taskModal.modal('show');

        event.preventDefault();
    });

    $(document).on('click', 'a[id^="pop-proj-files-"]', function (event) {
        var idProject = $(this).prop('id').replace(/pop-proj-files-/g, '');
        $filesModal.modal('show');
        getFilesForProject(idProject);

        event.preventDefault();
    });

    $(document).on('click', 'a[id^="pop-proj-persoane-"]', function (event) {
        var idProject = $(this).prop('id').replace(/pop-proj-persoane-/g, '');
        $persoaneModal.modal('show');
        getPersoaneForProject(idProject);

        event.preventDefault();
    });

    $(document).on('click', 'a[id^="pop-proj-del-"]', function (event) {
        var idProject = $(this).prop('id').replace(/pop-proj-del-/g, '');
        confirmModal('delete-project-confirm-' + idProject, 'E&#x219;ti sigur c&abreve; vrei s&abreve; &#x219;tergi proiectul?');

        event.preventDefault();
    });

    $(document).on('click', 'button[id^=delete-project-confirm-]', function (event) {
        var idProject = $(this).prop('id').replace('delete-project-confirm-', '');
        var modalConfirm;
        idProject = idProject.replace('-yes', '');
        modalConfirm = $('#delete-project-confirm-' + idProject);
        deleteProject(idProject);
        modalConfirm.modal('hide');
        $('body').remove(modalConfirm);

        event.preventDefault();
    });

    addCategoryForm.validate({
        rules: {
            required: true,
            nume: {
                minlength: 3
            },
            idCategorieParinte: {
                required: false
            }
        }
    });

    addCategoryForm.on('submit', function (event) {
        if (!$(this).valid()) {
            return;
        }
        var token = $("meta[name='_csrf']").prop('content'),
            header = $("meta[name='_csrf_header']").prop('content'),
            nume = $('#addCategory-form-nume').val(),
            idCategorieParinte = $('#addCategory-form-categorie-parinte').val(),
            data = {
                nume: nume,
                idCategorieParinte: idCategorieParinte
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

        event.preventDefault();
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

    addClientForm.on('submit', function (event) {

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

        event.preventDefault();
    });

    $(document).on('hidden.bs.modal', '#modal-addClient', function (e) {
        getClients('addProject-form-client');
    });

    $(document).on('close.bs.alert', 'div[id$="-user-on-project"]', function (e) {
        var idUserOnProject = parseInt($(this).prop('id'));
        unassignUserFromProject(idUserOnProject);
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
                    $projectsTable.ajax.reload(null, false);
                }
            },
            error: function () {
                showNotification('Error. Please try again later.', 'Error', ERROR);
            }
        });
        event.preventDefault();
    });

    $addPersoanaForm.validate({
        rules: {
            required: true
        }
    });

    $addPersoanaForm.on('submit', function (event) {
        if (!$(this).valid()) {
            return;
        }
        var token = $("meta[name='_csrf']").prop("content");
        var header = $("meta[name='_csrf_header']").prop("content");

        var idProiect = $('#add-persoana-to-project-idProiect').val();
        var fullName = $('#add-persoana-to-project-fullName').val();
        var data = {
            idProiect: idProiect,
            fullName: fullName
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
                $addPersoanaForm.trigger('reset');
                $addPersoanaForm.closest('.modal').modal('hide');
                getPersoaneForProject(idProiect);
            },
            error: function () {
                showNotification('Error. Please try again later.', 'Error', ERROR);
            }
        });
        event.preventDefault();
    });

});