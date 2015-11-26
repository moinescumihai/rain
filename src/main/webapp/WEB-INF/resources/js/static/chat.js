var messageCount = 0,
    wsocket,
    serviceLocation = '/chat',
    $nickName,
    stompClient = null,
    $contactsHolder = $('.chat-sidebar .navmenu-nav'),
    $messageTemplate = '<li class="sidebar-name"><a data-username="$username$" data-name="$fullName$">' +
        '<img width="30" height="30" src="/img/default-avatar.png" />' +
        '<span>$fullName$</span>' +
        '</a></li>';

var getCurrentUser = (function () {
    var memory;
    return function () {
        var user = memory;
        if (typeof user != 'object') {
            $.ajax({
                type: 'get',
                url: '/app/secure/profile/',
                contentType: "application/json",
                async: false,
                success: function (response) {
                    memory = user = response;
                }
            });
        }
        return user;
    };
})();

var connectToChatserver = function (room) {
    wsocket = new SockJS(serviceLocation);
    stompClient = Stomp.over(wsocket);
    stompClient.connect({}, connectCallback, errorCallback);
};

var connectCallback = function (frame) {
    //console.log('Connected: ' + frame);
    stompClient.subscribe('/topic/message', function (calResult) {
        onMessageReceived(calResult.body);
    });
};

var errorCallback = function (error) {
    // display the error's message header:
    showNotification(error.headers.message, 'Eroare', ERROR);
};

var generateContact = function (persoana) {
    var username = persoana.idUser.username,
        fullName = persoana.fullName;
    registerPopup(username, fullName);
    return chain($messageTemplate)
        .replace(/\$username\$/g, username)
        .replace(/\$fullName\$/g, fullName);
};

var loadContacts = function () {
    $.ajax({
        type: 'get',
        url: '/app/secure/profile/get-users',
        contentType: "application/json",
        success: function (response) {
            $.each(response, function (index, persoana) {
                $contactsHolder.append(generateContact(persoana));
            });
        },
        error: function (e) {
            showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina." + e.message, "Eroare", DANGER);
        }
    });
};

var displayMessage = function (chatWindow, message) {
    var $messageLine = (message.sender !== $nickName) ? ('<div class="row msg_container base_receive">'
    + '<div class="col-md-2 col-xs-2 avatar">'
    + '<img src="/img/default-avatar.png" class=" img-responsive ">'
    + '</div>'
    + '<div class="col-xs-10 col-md-10">'
    + '<div class="messages msg_receive">'
    + '<p>' + message.message + '</p>'
    + '<time datetime="' + message.received + '">' + message.sender + ' &middot; ' + toJSDateTime(message.received) + '</time>'
    + '</div>'
    + '</div>'
    + '</div>') :

        ('<div class="row msg_container base_sent">'
        + '<div class="col-xs-10 col-md-10">'
        + '<div class="messages msg_sent">'
        + '<p>' + message.message + '</p>'
        + '<time datetime="' + message.received + '">' + message.sender + ' &middot; ' + toJSDateTime(message.received) + '</time>'
        + '</div>'
        + '</div>'
        + '<div class="col-md-2 col-xs-2 avatar">'
        + '<img src="/img/default-avatar.png" class=" img-responsive ">'
        + '</div>'
        + '</div>');

    chatWindow.append($messageLine);
    if (message.sender !== $nickName) {
        $('#new-message-received').addClass('icon-animated-vertical');
        $('#message-count').addClass('count-circle count-circle-middle count-circle-red');
        $('#message-count').text(messageCount + 1);
    }
    chatWindow.animate({scrollTop: chatWindow.prop('scrollHeight') - chatWindow.height()});
};

var onMessageReceived = function (evt) {
    var msg = JSON.parse(JSON.parse(evt).result),
        chatWindow = $('#' + msg.sender).find('.popup-messages');
    displayMessage(chatWindow, msg);


    //setTimeout(function () {
    //    $('#new-message-received').removeClass('icon-animated-vertical');
    //}, 20000);
};

var sendMessage = function (message, receiver) {
    if (message.length === 0) {
        return;
    }
    $nickName = getCurrentUser().idUser.username;
    var chatMessage = {
            message: message,
            received: new Date(),
            sender: $nickName,
            receiver: receiver
        },
        chatWindow = $('#' + receiver).find('.popup-messages');

    stompClient.send('/app/chat', {}, JSON.stringify(chatMessage));

    displayMessage(chatWindow, chatMessage);
};

function leaveRoom() {
    stompClient.disconnect();
    console.log("Deconectat");
}

//this function can remove a array element.
Array.remove = function (array, from, to) {
    var rest = array.slice((to || from) + 1 || array.length);
    array.length = from < 0 ? array.length + from : from;
    return array.push.apply(array, rest);
};

//this variable represents the total number of popups can be displayed according to the viewport width
var totalPopups = 0;

//arrays of popups ids
var popups = [];

//this is used to close a popup
var closePopup = function (id) {
    for (var iii = 0; iii < popups.length; iii++) {
        if (id === popups[iii]) {
            Array.remove(popups, iii);
            $('#' + id).css('display', 'none');
            calculatePopups();

            return;
        }
    }
};

//displays the popups. Displays based on the maximum number of popups that can be displayed on the current viewport width
var displayPopups = function () {
    var right = 320,
        element;
    var iii = 0;
    for (iii; iii < totalPopups; iii++) {
        if (typeof popups[iii] !== 'undefined') {
            element = $('#' + popups[iii]);
            element.css('right', right + 'px');
            right = right + 320;
            element.css('display', 'block');
            if (iii === 0) {
                element.find('.chat-input').focus();
            }
        }
    }

    for (var jjj = iii; jjj < popups.length; jjj++) {
        element = $('#' + popups[jjj]);
        element.css('display', 'none');
    }
};

//creates markup for a new popup. Adds the id to popups array.
var registerPopup = function (id, name) {
    //id += '-chat';
    for (var iii = 0; iii < popups.length; iii++) {
        //already registered. Bring it to front.
        if (id === popups[iii]) {
            Array.remove(popups, iii);
            popups.unshift(id);
            calculatePopups();

            return;
        }
    }

    var element = '<div class="popup-box chat-popup panel" id="' + id + '">' +
        '<div class="popup-head panel-heading">' +
        '<div class="popup-head-left">' + name + '</div>' +
        '<div class="popup-head-right"><a class="close">&times;</a></div>' +
        '<div style="clear: both"></div></div><div class="popup-messages panel-body">' +
        '</div>' +
        '<div class="panel-footer"><div class="input-group">' +
        '<input id="' + id + '-msg-write" type="text" autocomplete="off" class="form-control input-sm chat-input"' +
        'placeholder="Scrie un mesaj..."/>' +
        '<span class="input-group-btn">' +
        '<button type="button" class="btn btn-primary btn-sm"> Trimite</button>' +
        '</span>' +
        '</div></div></div>';

    document.getElementsByTagName('body')[0].innerHTML = document.getElementsByTagName('body')[0].innerHTML + element;

    popups.unshift(id);

    calculatePopups();
    //connectToChatserver(id);

};

//calculate the total number of popups suitable and then populate the toatal_popups variable.
var calculatePopups = function () {
    var width = window.innerWidth;
    if (width < 540) {
        totalPopups = 0;
    }
    else {
        width = width - 200;
        //320 is width of a single popup box
        totalPopups = parseInt(width / 320);
    }

    displayPopups();
};

//recalculate when window is loaded and also when window is resized.
window.addEventListener('resize', calculatePopups);
window.addEventListener('load', calculatePopups);

$(document).ready(function () {
    getProfile();
    loadContacts();
    connectToChatserver('raindrop');
    $('#messages').on('click', function () {
        $('#chat-window').fadeToggle('600');
    });

    $(document).on('keypress', '.chat-input', function (event) {
        if (event.keyCode === ENTER_KEY) {
            var chatInput = $(this),
                message = chatInput.val(),
                receiver = chatInput.closest('.chat-popup').prop('id');
            sendMessage(message, receiver);
            chatInput.val(EMPTY).focus();

            event.preventDefault();
        }

    });

    $(document).on('mouseup', '.chat-popup button', function (event) {
        var chatInput = $(this).closest('.input-group').find('.chat-input'),
            message = chatInput.val(),
            receiver = chatInput.closest('.chat-popup').prop('id');
        sendMessage(message, receiver);
        chatInput.val(EMPTY).focus();

        event.preventDefault();
    });

    $('#leave-room').click(function () {
        leaveRoom();
    });

    $(document).on('mouseup', '.chat-popup .close', function (event) {
        var id = $(this).closest('.chat-popup').prop('id');
        closePopup(id);

        event.preventDefault();
    });

    $(document).on('mouseup', '.sidebar-name a', function (event) {
        var username = $(this).data('username'),
            name = $(this).data('name');
        registerPopup(username, name);

        event.preventDefault();
    });
});