var SUCCESS = 'success';
var DANGER = 'danger';
var ERROR = 'error';
var WARNING = 'warning';
var PRIMARY = 'primary';
var INFO = 'info';
var EMPTY = '';
var UNSELECT = [];
var ZERO = 0;
var chosenUpdated = 'chosen:updated';
var rightSlidebar;

$.extend($.fn.dataTable.defaults, {
    "aLengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "Toate"]],
    stateSave: true,
    fixedHeader: true,
    select: 'single',
    "language": {
        "url": '/fonts/ro_RO.txt'
    }
});

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

function startSpinner() {
    $("#overlay").show();
}
function stopSpinner() {
    $("#overlay").hide();
}

function generateFormattedDate(date) {
    if (date) {
        var year = date.getFullYear();
        var month = date.getMonth() <= 8 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
        var day = date.getDate() <= 9 ? '0' + date.getDate() : date.getDate();
        return day + '-' + month + '-' + year;
    } else {
        return '';
    }
}

function hideModal() {
    $('.modal.in').modal('hide');
    $('body').removeClass('modal-open');
    $('.modal-backdrop').remove();
}

function formSubmit() {
    document.getElementById("logoutForm").submit();
}

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function () {
    $('.navbar-toggle:visible').click();
});

function showNotification(message, title, type) {
    if (typeof(type) === "undefined") {
        type = SUCCESS;
    }

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "onclick": null,
        "showDuration": "7500",
        "hideDuration": "1500",
        "timeOut": "10500",
        "extendedTimeOut": "10000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    toastr[type](message, title)
}

function toJSDate(dateParam, locale) {
    var options = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
        "second": "2-digit",
        "minute": "2-digit",
        "hour": "2-digit"
    };
    var date;

    if (!locale) {
        locale = 'en'
    }
    //dateTime[0] = date, dateTime[1] = time
    date = dateParam[0].split("-");
    return new Date(date[0], date[1], date[2]).toLocaleString(locale, options);
}

function toJSDateTime(dateParam) {
    var locale = 'ro';
    var returnDate;
    var options = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
        "second": "2-digit",
        "minute": "2-digit",
        "hour": "2-digit"
    };

    returnDate = new Date(dateParam).toLocaleString(locale, options);
    return returnDate;
}

function showModal(id, title, content, buttons) {
    var modalHtml = '';
    var modalId = '#' + id;
    if (!buttons) {
        buttons = '<button type="button" id="' + id + '-close" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times"></span>&nbsp;&nbsp;Close</button>';
    }
    if (id && title && content) {
        modalHtml += '<div class="modal fade" id="' + id + '">'
                .concat('<div class="modal-dialog modal-xlg">')
                .concat('<div class="modal-content">')
                .concat('<div class="modal-header">')
                .concat('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>')
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
}

function confirmModal(id, title) {
    var modalHtml = '';
    var modalId = '#' + id;
    var buttons = '<button type="button" id="' + id + '-yes" class="btn btn-success" onclick="javascript:return true;"><span class="fa fa-check"></span>&nbsp;&nbsp;Yes</button>';
    buttons += '<button type="button" class="btn btn-danger" data-dismiss="modal"><span class="fa fa-times"></span>&nbsp;&nbsp;No</button>';

    modalHtml += '<div class="modal fade" id="' + id + '">'
            .concat('<div class="modal-dialog">')
            .concat('<div class="modal-content">')
            .concat('<div class="modal-header">')
            .concat('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>')
            .concat('<h4 class="modal-title"><span class="fa fa-question-circle">&nbsp;</span>').concat("Are you sure?").concat('</h4></div>')
            .concat('<div class="modal-body">')
            .concat('<h4>' + title + '</h4>')
            .concat('</div><div class="modal-footer">')
            .concat(buttons)
            .concat('</div></div></div></div>');

    $('body').append(modalHtml);
    $(modalId).modal('show');
}

function ajaxSpinnerOn() {
    var modalHtml = '<div class="modal fade" id="modal-spinner">'
        .concat('<div class="modal-dialog spinner-dialog">')
        .concat('<div class="modal-content">')
        .concat('<div class="modal-body text-center">')
        .concat('<i class="fa fa-spin fa-cog fa-5x"></i>')
        .concat('</div></div></div></div>');

    $('body').append(modalHtml);
    $('#modal-spinner').modal('show');
}

function ajaxSpinnerOff() {
    $('#modal-spinner').modal('hide');
}

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
            var id = $(tab_content).attr("id");
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
            var id = $(tab_content).attr("id");
            $('a[href="#' + id + '"]').css('color', '#333');
        }
    },
    errorPlacement: function (error, element) {
        element.closest("div.form-group").find(".help-block").html(error);
    }

});

function getProfile() {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    var nume = $('#userProfile-form-nume');
    var prenume = $('#userProfile-form-prenume');
    var email = $('#userProfile-form-email');
    var pozitie = $('#userProfile-form-pozitie');
    var workTel = $('#userProfile-form-workTel');
    var mobilTel = $('#userProfile-form-mobilTel');
    var homeTel = $('#userProfile-form-homeTel');
    var fax = $('#userProfile-form-fax');
    var adresa = $('#userProfile-form-adresa');
    var oras = $('#userProfile-form-oras');
    var judet = $('#userProfile-form-judet');
    var codPostal = $('#userProfile-form-codPostal');
    var idTara = $('#userProfile-form-idTara');
    var username = $('#userProfile-form-username');
    var cnp = $('#userProfile-form-cnp');
    var tipContract = $('#userProfile-form-tipContract');
    var serieCi = $('#userProfile-form-serieCi');
    var nrCi = $('#userProfile-form-nrCi');
    var dataNastere = $('#userProfile-form-dataNastere');
    var dataAngajare = $('#userProfile-form-dataAngajare');
    var zileConcediu = $('#userProfile-form-zileConcediu');

    $.ajax({
        type: 'get',
        url: '/app/secure/profile/',
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        async: false,
        success: function (response) {
            if (response) {
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
                idTara.val(response.idTara);
                username.val(response.idUser);
                cnp.val(response.cnp);
                tipContract.val(response.tipContract);
                serieCi.val(response.serieCi);
                nrCi.val(response.nrCi);
                dataNastere.val(response.dataNastere);
                dataAngajare.val(response.dataAngajare);
                zileConcediu.val(response.zileConcediu);
            } else {
                showNotification("Error. Please try again later.", "Error", DANGER);
            }
        },
        error: function (e) {
            showNotification("Error. Please try again later." + e.Message, "Error", DANGER);
        }
    });
}

$(document).ready(function () {
    $('#an-copyright').text(new Date().getFullYear());
    $('input[type=file]').bootstrapFileInput();
    $('.file-inputs').bootstrapFileInput();

    $(".chosen-select").chosen({
        disable_search_threshold: 10,
        allow_single_deselect: true,
        inherit_select_classes: true,
        search_contains: true,
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


});
$(document).ajaxStart(function () {
    //ajaxSpinnerOn();
});

$(document).ajaxStop(function () {
    //ajaxSpinnerOff();
});
