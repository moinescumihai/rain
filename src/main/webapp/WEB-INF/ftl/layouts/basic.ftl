[#macro basic]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Raindrop">
    <meta name="author" content="Raindrop Solutions">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <title>[@spring.message "APPTITLE"/]</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chosen.css" rel="stylesheet">
    <link href="/css/raindrop.css" rel="stylesheet">
</head>
<body>
<div class="navbar navbar-default navbar-fixed-top navbar-inverse unselectable" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><img style="height:55px;width: auto; display: inline;" src="/img/raindrop-logo.png" /></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li id="overview"><a href="/overview">[@spring.message "OVERVIEW"/]</a></li>
                <li id="projects"><a href="/projects">[@spring.message "PROJECTS"/]</a></li>
                <li id="tasks"><a href="/tasks">[@spring.message "TASKS"/]</a></li>
                <li id="personnel"><a href="/personnel">[@spring.message "PERSONNEL"/]</a></li>
                <li id="time"><a href="/time">[@spring.message "TIME"/]</a></li>
                <li id="financial"><a href="/financial">[@spring.message "FINANCIAL"/]</a></li>
                <li id="inventory"><a href="/inventory">[@spring.message "INVENTORY"/]</a></li>
                <li id="files"><a href="/files">[@spring.message "FILES"/]</a></li>
                <li id="reports"><a href="/reports">[@spring.message "REPORTS"/]</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden-xs"><a class="dropdown-toggle" href="javascript:;" data-toggle="dropdown" title="Notifications"><span class="fa fa-bell fa-lg icon-animated-bell"><span class="count-circle count-circle-middle slide-up">1</span></span></a>
                    <div class="dropdown-menu" role="menu" style="min-width:250px;">
                        <div class="list-group margin-bottom-5">
                            <a href="javascript:;" class="list-group-item small"><span class="badge bg-warning pulse">5</span> Logging overages in sector C.</a>
                            <a href="javascript:;" class="list-group-item small"><span class="badge bg-danger">14</span> <span class="text-warning">Users with request timed out.</span></a>
                            <a href="javascript:;" class="list-group-item small"><span class="badge bg-success">0</span> Service errors since 12:01AM.</a>
                            <a href="javascript:;" class="list-group-item small"><span class="badge">1</span> Blade server pending backup.</a>
                        </div>
                    </div>
                </li>

                <li class="dropdown">
                    <a id="messages" class="dropdown-toggle" href="javascript:;" data-toggle="dropdown" title="Messages">
                        <span id="new-message-received" class="fa fa-envelope fa-lg">
                            <span id="message-count"></span>
                        </span>
                    </a>
                    <ul class="dropdown-menu pull-right">
                        <li class="dropdown-header">
                            <i class=" fa fa-envelope-o"></i>
                            5 Messages
                        </li>

                        <li><a id="user-message"><span id="user">Salut, am venit si eu</span></a> </li>
                        <li class="dropdown-content ace-scroll" style="position: relative;"><div class="scroll-track scroll-active" style="display: block; height: 200px;"><div class="scroll-bar" style="height: 111px; top: 0px;"></div></div><div class="scroll-content" style="max-height: 200px;">
                            <ul class="dropdown-menu dropdown-navbar">
                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="http://api.randomuser.me/portraits/men/3.jpg" class="msg-photo" alt="Alex's Avatar">
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Alex:</span>
                                                Ciao sociis natoque penatibus et auctor ...
                                            </span>

                                            <span class="msg-time">
                                                <i class=" fa fa-clock-o"></i>
                                                <span>a moment ago</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="http://api.randomuser.me/portraits/men/4.jpg" class="msg-photo" alt="Susan's Avatar">
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Susan:</span>
                                                Vestibulum id ligula porta felis euismod ...
                                            </span>

                                            <span class="msg-time">
                                                <i class=" fa fa-clock-o"></i>
                                                <span>20 minutes ago</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="http://api.randomuser.me/portraits/men/2.jpg" class="msg-photo" alt="Bob's Avatar">
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Bob:</span>
                                                Nullam quis risus eget urna mollis ornare ...
                                            </span>

                                            <span class="msg-time">
                                                <i class=" fa fa-clock-o"></i>
                                                <span>3:15 pm</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="http://api.randomuser.me/portraits/men/4.jpg" class="msg-photo" alt="Kate's Avatar">
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Kate:</span>
                                                Ciao sociis natoque eget urna mollis ornare ...
                                            </span>

                                            <span class="msg-time">
                                                <i class=" fa fa-clock-o"></i>
                                                <span>1:33 pm</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="http://api.randomuser.me/portraits/men/4.jpg" class="msg-photo" alt="Fred's Avatar">
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Fred:</span>
                                                Vestibulum id penatibus et auctor  ...
                                            </span>

                                            <span class="msg-time">
                                                <i class=" fa fa-clock-o"></i>
                                                <span>10:09 am</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        </li>

                        <li class="dropdown-footer">
                            <a href="inbox.html">
                                See all messages
                                <i class=" fa fa-arrow-right"></i>
                            </a>
                        </li>
                        <%--<li class="dropdown-header text-center"><span class="fa fa-envelope-o">&nbsp;[@spring.message "UNREAD.MESSAGES"/]</span></li>--%>
                        <%--<li><a>FW: All developers on the Trello..</a></li>--%>
                        <%--<li><a>Notice from corporate---- Your HR..</a></li>--%>
                        <%--<li><a>Hi Joe, I left the keys for the..</a></li>--%>
                        <%--<li><a>All, The SPG group will meet every..</a></li>--%>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" style="padding-top:7px;padding-bottom:6px;">
                        <img width="36px" class="img-rounded" src="http://api.randomuser.me/portraits/men/4.jpg">
                        <span>${pageContext.request.remoteUser}</span>
                    </a>
                    <ul class="dropdown-menu pull-right">
                        <li data-toggle="modal" data-target="#userprofile">
                            <a href="#userprofile" onclick="getRaindropUser();"><span class="fa fa-user fa-fw">&nbsp;</span>[@spring.message "PROFILE"/]</a>
                        </li>
                        <li><a data-toggle="modal" data-target="#settings" href="#settings">
                            <span class="fa fa-cogs fa-fw">&nbsp;</span>[@spring.message "SETTINGS"/]</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="javascript:formSubmit()">
                                <span class="fa fa-power-off fa-fw">&nbsp;</span>[@spring.message "LOGOUT"/]
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</div>
<!-- Fixed navbar -->
    [#nested]
<div class="custom-footer">
    <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"></a>

    <p><span class="copyright">Copyright &copy; &middot; <span class="green">Raindrop Solutions <span
            id="an-copyright"></span></span>&bull;&nbsp;<a>[@spring.messageText "APPTITLE" "Raindrop" /]</a></p>
</div>
<form:form action="/logout" method="post" id="logoutForm">
</form:form>
<!-- JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>



[/#macro]