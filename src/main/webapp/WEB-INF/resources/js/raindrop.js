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

function chosenUnselect(element) {
    $(element).val(UNSELECT);
    $(element).trigger(chosenUpdated);
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

function showNotif(message, title, type) {

    var delay = 3500;
    var icon;
    if (typeof(type) === "undefined") {
        type = SUCCESS;
    }
    switch (type) {
        case SUCCESS:
            icon = 'fa fa-check-circle-o';
            break;
        case INFO:
            icon = 'fa fa-info-circle';
            break;
        case WARNING:
        case DANGER:
            icon = 'fa fa-exclamation-triangle';
            break;
        case PRIMARY:
            icon = 'fa fa-thumb-tack';
            break;
        default:
            icon = 'fa fa-info-circle';
            break;
    }
    var id = title.replace(/ /g, '');
    var alert = '<div id="' + id + '" class="notifications-index"></div>';
    $.notify(
        {
            // options
            icon: icon,
            title: title,
            message: message
        }, {
            // settings
            element: 'body',
            position: null,
            type: type,
            allow_dismiss: true,
            newest_on_top: true,
            showProgressbar: false,
            placement: {
                from: "top",
                align: "center"
            },
            offset: 60,
            spacing: 10,
            z_index: 5031,
            delay: 0,
            mouse_over: null,
            animate: {
                enter: 'animated fadeInUp',
                exit: 'animated fadeOutDown'
            },
            onShow: null,
            onShown: null,
            onClose: null,
            onClosed: null,
            icon_type: 'class',
            template: '<div data-notify="container" style="word-break: break-all;" class="col-xs-11 col-sm-4 alert alert-{0}" role="alert">' +
            '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">&times;</button>' +
            '<span data-notify="icon"></span> ' +
            '<span data-notify="title">{1}</span><br><hr> ' +
            '<span data-notify="message">{2}</span>' +
            '<div class="progress" data-notify="progressbar">' +
            '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
            '</div>' +
            '<a href="{3}" target="{4}" data-notify="url"></a>' +
            '</div>'
        }
    )
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
    var time;
    var date;

    if (!locale) {
        locale = 'en'
    }
    var dateTime = dateParam.split(" ");//dateTime[0] = date, dateTime[1] = time
    date = dateTime[0].split("-");
    return new Date(date[0], date[1], date[2]).toLocaleString(locale, options);
}

function toJSDateTime() {
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
    var time;
    var date;

    if (!locale) {
        locale = 'en'
    }
    var dateTime = dateParam.split(" ");//dateTime[0] = date, dateTime[1] = time
    date = dateTime[0].split("-");
    if (dateTime[1]) {
        date[1] = parseInt(date[1]) - 1;
        time = dateTime[1].split(":");
        //(year, month, day, hours, minutes, seconds, milliseconds)
        returnDate = new Date(date[0], date[1], date[2], time[0], time[1], time[2], 0).toLocaleString(locale, options);
    } else {
        returnDate = new Date(date[0], date[1], date[2]).toLocaleString(locale, options);
    }
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
                .concat('<div class="modal-dialog modal-lg">')
                .concat('<div class="modal-content">')
                .concat('<div class="modal-header">')
                .concat('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>')
                .concat('<h4 class="modal-title">').concat(title).concat('</h4></div>')
                .concat('<form id="' + id + '-form">')
                .concat('<div class="modal-body">')
                .concat(content)
                .concat('</div><div class="modal-footer">')
                .concat(buttons)
                .concat('</div></form></div></div></div>');

        $('body').append(modalHtml);

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
            .concat('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>')
            .concat('<h4 class="modal-title"><span class="fa fa-question-circle">&nbsp;</span>').concat("Are you sure?").concat('</h4></div>')
            .concat('<div class="modal-body">')
            .concat('<h4>' + title + '</h4>')
            .concat('</div><div class="modal-footer">')
            .concat(buttons)
            .concat('</div></div></div></div>');

    $('body').append(modalHtml);
    $(modalId).modal('show');

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
        if (element.hasClass("chosen-select")) {
            element.closest("div.form-group").find(".help-block").html(error);
        } else {
            error.insertAfter(element);
        }
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
    (function () {
        var projectDropdown = $('#project-dropdown');
        projectDropdown.empty();
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
                if (response.length <= 0) {
                    items.push('<li><a class="text-muted"> No projects are defined </a></li>');
                }
                $.each(response, function (i, proj) {
                    items.push('<li><a href="/app/secure/projects/' + proj.idProiect + '">' + proj.numeProiect + '</a></li>');
                });
                projectDropdown.html(items.join('') + '<li class="divider"></li><li><a href="/projects" class="bg-info"> See all projects  <i class="fa fa-arrow-right"></i> </a></li>');
            }
        });

    })();

    $(".chosen-select").chosen({
        disable_search_threshold: 10,
        allow_single_deselect: true,
        inherit_select_classes: true,
        search_contains: true,
        width: '100%'
    });

    $('.date-picker').datepicker({
        todayBtn: true,
        todayHighlight: true,
        weekStart: 1,
        autoclose: true,
        orientation: 'left top'
    });

    rightSlidebar = new $.slidebars();
    document.documentElement.addEventListener("mousemove", function (event) {
        var screenEdge = screen.width - 20;
        if (event.pageX > screenEdge) {
            rightSlidebar.slidebars.open('right');
        }
    });

    $('a').on('click', function (e) {
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

    $('#modal-userProfile').on('show.bs.modal', function () {
        getProfile();
    });

});