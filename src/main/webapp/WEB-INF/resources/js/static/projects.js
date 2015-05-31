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

$(document).ready(function () {
    $('#projects').addClass('active');
    getClients();
    getCategories();

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

    $(document).on('hidden.bs.modal', '#modal-addCategory', function(e) {
        getCategories();
    });

    addClientForm.validate({
        rules: {
            required: true,
            numeClient: {
                minlength: 3
            },
            website: {
                required:false,
                url: true
            },
            email: {
                required:false,
                email: true
            },
            telefon: {
                required:false,
                number: true
            },
            fax: {
                required:false,
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

    $(document).on('hidden.bs.modal', '#modal-addClient', function(e) {
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
                    $('#modal-addProject-close').click();
                    showNotification(response.message, 'Success', SUCCESS);
                }
            },
            error: function () {
                showNotification("Error. Please try again later.", "Error", DANGER);
            }
        });
    });

});
