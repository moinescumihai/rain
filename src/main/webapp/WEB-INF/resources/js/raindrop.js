var SUCCESS = 'success';
var DANGER = 'danger';
var WARNING = 'warning';
var PRIMARY = 'primary';
var INFO = 'info';
var EMPTY = '';
var UNSELECT = -1;
var ZERO = 0;
var chosenUpdated = 'chosen:updated';

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

function toJSDate(dateParam, timeParam, locale) {
    var options = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric",
        "second": "2-digit",
        "minute": "2-digit",
        "hour": "2-digit"
    };

    if (!locale) {
        locale = 'en'
    }
    var dateTime = dateParam.split(" ");//dateTime[0] = date, dateTime[1] = time
    var time;
    var date = dateTime[0].split("-");
    date[1] = parseInt(date[1]) - 1;
    if (timeParam && timeParam == true) {
        time = dateTime[1].split(":");
        //(year, month, day, hours, minutes, seconds, milliseconds)
        return new Date(date[0], date[1], date[2], time[0], time[1], time[2], 0).toLocaleString(locale, options);
    }
    return new Date(date[0], date[1], date[2]).toLocaleString(locale, options);
}

function showModal(id, title, content, buttons) {
    var modalHtml = '';
    var modalId = '#' + id;
    if (!buttons) {
        buttons = '<button type="button" id="' + id + '-close" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times">&nbsp;</span>Close</button>';
    }
    if (id && title && content) {
        modalHtml += '<div class="modal fade" id="' + id + '">'
                .concat('<div class="modal-dialog modal-lg">')
                .concat('<div class="modal-content">')
                .concat('<div class="modal-header">')
                .concat('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>')
                .concat('<h4 class="modal-title">').concat(title).concat('</h4>')
                .concat('</div><div class="modal-body">')
                .concat(content)
                .concat('</div><div class="modal-footer">')
                .concat(buttons)
                .concat('</div></div></div></div>');

        $('body').append(modalHtml);

        $(modalId).modal('show');
    } else {
        throw "you must specify mandatory arguments "
    }
}

function formSubmit() {
    document.getElementById("logoutForm").submit();
}

$(window).scroll(function () {
    if ($(document).scrollTop() > 0) {
        $('#scrollUp').fadeIn(400)
    } else {
        $('#scrollUp').fadeOut(400);
    }
});

$(document).ready(function () {
    $('#an-copyright').text(new Date().getFullYear());

    $(".chosen-select").chosen({
        disable_search_threshold: 10,
        allow_single_deselect: true,
        inherit_select_classes: true,
        search_contains: true,
        width: '100%'
    });

    $('a').on('click', function (e) {
        var linkLocation = $($(this).attr('href')).offset();
        if (linkLocation)
            $('html,body').animate({scrollTop: linkLocation.top}, "10000", 'linear');
    });
});

