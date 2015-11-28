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

var buildMessage = function (message) {
    var messageBaseTemplate = '<div class="row msg_container $baseClass$">',
        messageTemplate = '<div class="col-xs-10 col-md-10"><div class="messages $messageClass$">'
            + '<p class="selectable">$message$</p>'
            + '<time datetime="$time$">$time$</time>'
            + '</div></div>',
        avatarTemplate = '<div class="col-md-2 col-xs-2 avatar"><img src="/img/user-50x50.png" class="img-responsive"></div>',
        closingTemplate = '</div>',
        isForCurrentUser = message.sender === $nickName,
        usernameReplacement = isForCurrentUser ? $nickName : message.sender,
        userReplacement = getUserByUsername(usernameReplacement).fullName,
        messageReplacement = message.message,
        timeReplacement = toChatTime(new Date(message.received)),
        baseClassReplacement = isForCurrentUser ? 'base_receive' : 'base_sent',
        messageClassReplacement = isForCurrentUser ? 'msg_receive' : 'msg_sent',
        chatMessageTemplate = messageBaseTemplate + (isForCurrentUser ? messageTemplate : (avatarTemplate + messageTemplate)) + closingTemplate;

    return chain(chatMessageTemplate)
        .replace(/\$baseClass\$/g, baseClassReplacement)
        .replace(/\$messageClass\$/g, messageClassReplacement)
        .replace(/\$user\$/g, userReplacement)
        .replace(/\$message\$/g, messageReplacement)
        .replace(/\$time\$/g, timeReplacement);
};

var newMessageAllert = (function () {
    var memory = [];

    return function (sender, seen) {
        var count = memory[sender];
        if (typeof count === 'undefined') {
            count = 0;
        }

        if (seen) {
            count = -count;
            memory[sender] = 0;
        } else {
            count += 1;
            memory[sender] = count;

        }
        return count;
    }
})();

var displayMessage = function (chatWindow, message) {
    var chatMessage = buildMessage(message),
        $messageCount = $('#message-count'),
        $messageAnnimation = $('#new-message-received'),
        sender = message.sender;

    chatWindow.append(chatMessage);
    if (sender !== $nickName && !chatWindow.closest('.panel').find('input').is(':focus')) {
        $messageAnnimation.addClass('icon-animated-vertical');
        $messageCount.addClass('count-circle count-circle-middle count-circle-red');
        newMessageAllert(sender, false);
        $messageCount.text(messageCount += 1);

        setTimeout(function () {
            $messageAnnimation.removeClass('icon-animated-vertical');
        }, 20000);
    }

    chatWindow.animate({scrollTop: chatWindow.prop('scrollHeight') - chatWindow.height()}, 100);
};

var getUserByUsername = (function () {
    var memory = [];
    return function (username) {
        var user = memory[username];

        if (typeof user !== 'object') {
            $.ajax({
                type: 'get',
                url: '/app/secure/profile/' + username,
                contentType: "application/json",
                async: false,
                success: function (response) {
                    memory = user = response;
                }
            })
        }
        return user;
    };
})();

var onMessageReceived = function (evt) {
    var msg = JSON.parse(JSON.parse(evt).result),
        chatWindowQuery = '#' + msg.sender,
        chatWindow = $(chatWindowQuery).find('.popup-messages'),
        username = msg.sender,
        name = getUserByUsername(username).fullName;

    if (chatWindow.length === 0 && $nickName !== username) {
        registerPopup(username, name);
        chatWindow = $(chatWindowQuery).find('.popup-messages');
    }
    displayMessage(chatWindow, msg);
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

    $(document).find('body').prepend(element);
    //document.getElementsByTagName('body')[0].innerHTML = document.getElementsByTagName('body')[0].innerHTML + element;

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