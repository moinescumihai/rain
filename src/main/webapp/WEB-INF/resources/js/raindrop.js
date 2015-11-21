const SUCCESS = 'success';
const DANGER = 'danger';
const ERROR = 'error';
const WARNING = 'warning';
const PRIMARY = 'primary';
const INFO = 'info';
const EMPTY = '';
const UNSELECT = [];
const ZERO = 0;
const chosenUpdated = 'chosen:updated';
var $changePasswordForm = $('#modal-changePassword-form');
var $changePasswordModal = $('#modal-changePassword');

jQuery.validator.addMethod("samePasswords", function (value, element, param) {
    return this.optional(element) || passwordsAreTheSame();
}, "Parolele nu se potrivesc");

if (!('contains' in String.prototype)) {
    String.prototype.contains = function (str, startIndex) {
        return -1 !== String.prototype.indexOf.call(this, str, startIndex);
    };
}

$.extend($.fn.dataTable.defaults, {
    "aLengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "Toate"]],
    stateSave: true,
    fixedHeader: true,
    select: 'single',
    "language": {
        "url": '/fonts/ro_RO.txt'
    }
});

var passwordsAreTheSame = function () {
    return $('#changePassword-form-password').val() === $('#changePassword-form-repeatPassword').val();
};

var popoverDefaultSettings = {
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
    closeable: false,//display close button or not
    padding: true//content padding
};

var startSpinner = function () {
    $("#overlay").show();
};

var stopSpinner = function () {
    $("#overlay").hide();
};

var generateFormattedDate = function (date) {
    if (date) {
        var year = date.getFullYear();
        var month = date.getMonth() <= 8 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
        var day = date.getDate() <= 9 ? '0' + date.getDate() : date.getDate();
        return day + '-' + month + '-' + year;
    } else {
        return '';
    }
};

var formSubmit = function () {
    document.getElementById("logoutForm").submit();
};

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function () {
    $('.navbar-toggle:visible').click();
});

var showNotification = function (message, title, type) {
    if (typeof(type) === "undefined") {
        type = SUCCESS;
    }

    toastr.options = {
        closeButton: true,
        debug: false,
        progressBar: false,
        positionClass: 'toast-top-center',
        onclick: null,
        showDuration: '7500',
        hideDuration: '1500',
        timeOut: '10500',
        extendedTimeOut: '10000',
        showEasing: 'swing',
        hideEasing: 'linear',
        showMethod: 'fadeIn',
        hideMethod: 'fadeOut'
    };
    toastr[type](message, title)
};

var toJSDate = function (dateParam, locale) {
    var options = {
        weekday: 'long',
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        "second": '2-digit',
        "minute": '2-digit',
        "hour": '2-digit'
    };
    var date;

    if (!locale) {
        locale = 'en'
    }
    //dateTime[0] = date, dateTime[1] = time
    date = dateParam[0].split("-");
    return new Date(date[0], date[1], date[2]).toLocaleString(locale, options);
};

var toJSDateTime = function (dateParam) {
    var locale = 'ro';
    var returnDate;
    var options = {
        weekday: 'long',
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        "second": '2-digit',
        "minute": '2-digit',
        "hour": '2-digit'
    };

    returnDate = new Date(dateParam).toLocaleString(locale, options);
    return returnDate;
};

var showModal = function (id, title, content, buttons) {
    var modalHtml = EMPTY;
    var modalId = '#' + id;
    if (!buttons) {
        buttons = '<button type="button" id="' + id + '-close" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times"></span>&nbsp;&nbsp;&Icirc;nchide</button>';
    }
    if (id && title && content) {
        modalHtml += '<div class="modal fade" id="' + id + '">'
                .concat('<div class="modal-dialog modal-xlg">')
                .concat('<div class="modal-content">')
                .concat('<div class="modal-header">')
                .concat('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#10060;<span class="sr-only">&Icirc;nchide</span></button>')
                .concat('<h4 class="modal-title">').concat(title).concat('</h4></div>')
                .concat('<div class="modal-body">')
                .concat(content)
                .concat('</div><div class="modal-footer">')
                .concat(buttons)
                .concat('</div></div></div></div>');

        if (!$(modalId).length) {
            $('body').append(modalHtml);
        } else {
            var modal = $(modalId);
            modal.find('.modal-title').html(title);
            modal.find('.modal-body').html(content);
            modal.find('.modal-footer').html(buttons);
        }

        $(modalId).modal('show');
    } else {
        throw "you must specify mandatory arguments "
    }
};

var confirmModal = function (id, title) {
    var modalHtml = EMPTY;
    var modalId = '#' + id;
    var buttons = '<button type="button" id="' + id + '-yes" class="btn btn-success" onclick="javascript:return true;"><span class="fa fa-check"></span>&nbsp;&nbsp;Da</button>';
    buttons += '<button type="button" class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span>&nbsp;&nbsp;Nu</button>';

    modalHtml += '<div class="modal fade" id="' + id + '">'
            .concat('<div class="modal-dialog">')
            .concat('<div class="modal-content">')
            .concat('<div class="modal-header">')
            .concat('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>')
            .concat('<h4 class="modal-title"><span class="fa fa-question-circle">&nbsp;</span>').concat("E&#x219;ti sigur?").concat('</h4></div>')
            .concat('<div class="modal-body">')
            .concat('<h4>' + title + '</h4>')
            .concat('</div><div class="modal-footer">')
            .concat(buttons)
            .concat('</div></div></div></div>');

    $('body').append(modalHtml);
    $(modalId).modal('show');
};

var ajaxSpinnerOn = function () {
    var modalHtml = '<div class="modal fade" id="modal-spinner">'
        .concat('<div class="modal-dialog spinner-dialog">')
        .concat('<div class="modal-content">')
        .concat('<div class="modal-body text-center">')
        .concat('<i class="fa fa-spin fa-cog fa-5x"></i>')
        .concat('</div></div></div></div>');

    $('body').append(modalHtml);
    $('#modal-spinner').modal('show');
};

var ajaxSpinnerOff = function () {
    $('#modal-spinner').modal('hide');
};

$(window).scroll(function () {
    if ($(document).scrollTop() > 0) {
        $('#scrollUp').fadeIn(400)
    } else {
        $('#scrollUp').fadeOut(400);
    }
});

jQuery.validator.setDefaults({
    ignore: [".ignore", ":hidden:not(select)"],
    focusCleanup: true,
    errorClass: "text-danger",
    errorElement: "span",
    ignoreTitle: true,
    focusInvalid: false,
    highlight: function (element) {
        $(element).closest('.form-group').addClass('has-error');
        if ($(element).parent().hasClass("chosen-search")) {
            $(element).parent().closest("div.form-group").addClass('has-error');
        }
        var tab_content = $(element).closest('.tab-pane');
        if ($(tab_content).find('div.has-error').length > ZERO) {
            var id = $(tab_content).prop("id");
            $('a[href="#' + id + '"]').css('color', '#a94442');
        }
    },
    unhighlight: function (element) {
        if ($(element).hasClass("chosen-select")) {
            $(element).closest("div.form-group").find(".help-block").html(EMPTY);
        }
        if ($(element).parent().hasClass("chosen-search")) {
            $(element).closest("div.form-group").find(".help-block").html(EMPTY);
            $(element).closest("div.form-group").removeClass('has-error');
        }
        $(element).closest('.form-group').removeClass('has-error');
        var tab_content = $(element).closest('.tab-pane');
        if ($(tab_content).find('div.has-error').length == ZERO) {
            var id = $(tab_content).prop("id");
            $('a[href="#' + id + '"]').css('color', '#333');
        }
    },
    errorPlacement: function (error, element) {
        element.closest("div.form-group").find(".help-block").html(error);
    }

});

var getPersoane = function (container) {
    var persoaneSelect = $('#' + container);
    persoaneSelect.html(EMPTY);
    persoaneSelect.append("<option></option>");
    $.ajax({
        type: 'get',
        url: '/app/secure/inventory/getpersoane',
        contentType: "application/json",
        success: function (response) {
            $.each(response, function (index, persoana) {
                persoaneSelect.append($("<option>").val(persoana.idResurseUmane).text(persoana.prenume + ' ' + persoana.nume));
            });
            persoaneSelect.trigger(chosenUpdated);
        },
        error: function (e) {
            showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina." + e.message, "Eroare", DANGER);
        }
    });
};

var getTari = function (container) {
    var select = $('#' + container);
    select.html(EMPTY);
    select.append("<option></option>");
    $.ajax({
        type: 'get',
        url: '/app/secure/profile/get-tari',
        contentType: "application/json",
        success: function (response) {
            $.each(response, function (index, tara) {
                select.append($("<option>").val(tara.idTara).text(tara.nume));
            });
            select.trigger(chosenUpdated);
        },
        error: function (e) {
            showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina." + e.message, "Eroare", DANGER);
        }
    });
};

var getProfile = function () {
    var profile = {},
        token = $("meta[name='_csrf']").prop("content"),
        header = $("meta[name='_csrf_header']").prop("content"),

        nume = $('#userProfile-form-nume'),
        prenume = $('#userProfile-form-prenume'),
        email = $('#userProfile-form-email'),
        pozitie = $('#userProfile-form-pozitie'),
        workTel = $('#userProfile-form-workTel'),
        mobilTel = $('#userProfile-form-mobilTel'),
        homeTel = $('#userProfile-form-homeTel'),
        fax = $('#userProfile-form-fax'),
        adresa = $('#userProfile-form-adresa'),
        oras = $('#userProfile-form-oras'),
        judet = $('#userProfile-form-judet'),
        codPostal = $('#userProfile-form-codPostal'),
        idTara = $('#userProfile-form-tara'),
        username = $('#userProfile-form-username'),
        cnp = $('#userProfile-form-cnp'),
        serieCi = $('#userProfile-form-serieCi'),
        nrCi = $('#userProfile-form-nrCi'),
        dataNastere = $('#userProfile-form-dataNastere'),
        dataAngajare = $('#userProfile-form-dataAngajare'),
        zileConcediu = $('#userProfile-form-zileConcediu');

    $.ajax({
        type: 'get',
        url: '/app/secure/profile/',
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        async: false,
        success: function (response) {
            profile = response;
            nume.val(response.nume);
            prenume.val(response.prenume);
            email.val(response.email);
            pozitie.val(response.pozitie);
            workTel.val(response.workTel);
            mobilTel.val(response.mobilTel);
            homeTel.val(response.homeTel);
            fax.val(response.fax);
            adresa.val(response.adresa);
            oras.val(response.oras);
            judet.val(response.judet);
            codPostal.val(response.codPostal);
            idTara.val(response.idTara.idTara);
            username.val(response.idUser.username);
            cnp.val(response.cnp);
            serieCi.val(response.serieCi);
            nrCi.val(response.nrCi);
            dataNastere.val(response.dataNastere);
            dataAngajare.val(response.dataAngajare);
            zileConcediu.val(response.zileConcediu);
            $('.chosen-select').trigger(chosenUpdated);
        },
        error: function (e) {
            showNotification("Error. Please try again later." + e.Message, "Error", DANGER);
        }
    });
    return profile;
};

Array.prototype.remove = function () {
    var what, a = arguments, L = a.length, ax;
    while (L && this.length) {
        what = a[--L];
        while ((ax = this.indexOf(what)) !== -1) {
            this.splice(ax, 1);
        }
    }
    return this;
};

Function.prototype.chain = function () {
    var that = this;
    return function () {
        // New function runs the old function
        var retVal = that.apply(this, arguments);
        // Returns "this" if old function returned nothing
        if (typeof retVal === 'undefined') {
            return this;
        }
        // else returns old value
        else {
            return retVal;
        }
    }
};

var chain = function (obj) {
    for (var fn in obj) {
        if (typeof obj[fn] === 'function') {
            obj[fn] = obj[fn].chain();
        }
    }
    return obj;
};

$(document).ready(function () {
    $('#an-copyright').text(new Date().getFullYear());
    $('input[type=file]').bootstrapFileInput();
    $('.file-inputs').bootstrapFileInput();
    $('[data-toggle="tooltip"]').tooltip();

    getTari('userProfile-form-tara');
    $('.chosen-select').chosen({
        disable_search_threshold: 6,
        allow_single_deselect: true,
        inherit_select_classes: true,
        search_contains: true,
        no_results_text: 'Nu exista optiuni',
        width: '100%'
    });

    $('.date-picker').datepicker({
        format: 'yyyy-mm-dd',
        weekStart: 1
    });

    $('a').on('click', function () {
        var linkLocation = $($(this).attr('href')).offset();
        if (linkLocation)
            $('html,body').animate({scrollTop: linkLocation.top}, "10000", 'linear');
    });

    var profileModalForm = $('#modal-userProfile-form');

    profileModalForm.validate({
        rules: {
            required: true,
            nume: {
                minlength: 3
            },
            prenume: {
                minlength: 3
            },
            email: {
                email: true
            },
            pozitie: {
                required: false
            },
            workTel: {
                required: false
            },
            mobilTel: {
                required: false
            },
            homeTel: {
                required: false
            },
            fax: {
                required: false
            },
            adresa: {
                required: false
            },
            oras: {
                required: false
            },
            judet: {
                required: false
            },
            codPostal: {
                required: false
            },
            idTara: {
                required: false
            },
            username: {
                required: false
            },
            serieCi: {
                required: false
            },
            nrCi: {
                required: false
            },
            dataAngajare: {
                required: false
            },
            zileConcediu: {
                number: true
            }
        }
    });

    $(document).on('shown.bs.modal', '#modal-userProfile', function () {
        getProfile();
    });

    $(document).on('hidden.bs.modal', '#modal-spinner', function () {
        $(this).remove();
    });

    $(document).on('change', '#changePassword-form-showPassword', function () {
        if ($(this).is(':checked')) {
            $('#changePassword-form-password').prop('type', 'text');
            $('#changePassword-form-repeatPassword').prop('type', 'text');
        } else {
            $('#changePassword-form-password').prop('type', 'password');
            $('#changePassword-form-repeatPassword').prop('type', 'password');
        }
    });

    $changePasswordForm.validate({
        onfocusout: false,
        rules: {
            showPassword: {
                required: false
            },
            password: {
                minlength: 8,
                samePasswords: true
            },
            repeatPassword: {
                minlength: 8,
                samePasswords: true
            }
        }
    });

    $changePasswordForm.on('submit', function (event) {
        if (!$(this).valid()) {
            return;
        }
        var $changePassword = $('#changePassword-form-password');
        var $changeRepeatPassword = $('#changePassword-form-repeatPassword'),
            token = $("meta[name='_csrf']").prop('content'),
            header = $("meta[name='_csrf_header']").prop('content'),
            password = $changePassword.val(),
            data = {
                password: password
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
                $changePassword.val(EMPTY);
                $changeRepeatPassword.val(EMPTY);
                $('#changePassword-form-showPassword').prop('checked', false);
                $changePassword.prop('type', 'password');
                $changeRepeatPassword.prop('type', 'password');
                $changePasswordModal.modal('hide');
                showNotification(response.message, 'Success', SUCCESS);
            },
            error: function () {
                showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina.", "Eroare", DANGER);
            }
        });

        event.preventDefault();
    });
});

