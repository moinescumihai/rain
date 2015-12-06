[#ftl]
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="Raindrop">
    <meta name="author" content="Raindrop Software">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <link rel="icon" href="/img/raindrop-logo.png">

    <title>[@spring.message "APPTITLE" /]</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-modal.css" rel="stylesheet">
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/chosen.css" rel="stylesheet">
    <link href="css/datepicker.css" rel="stylesheet">
    <link href="css/inbox.css" rel="stylesheet">
    <link href="plugins/zTree/metroStyle/metroStyle.css" rel="stylesheet">
    <link href="css/dataTables-bootstrap.css" rel="stylesheet">
    <link href="plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet">
    <link href="plugins/jasny/css/jasny-bootstrap.min.css" rel="stylesheet">
    <link href="css/raindrop.css" rel="stylesheet">
</head>
<body class="unselectable" oncontextmenu="return false;">
<nav class="navbar navbar-rain navbar-fixed-top" role="navigation">
    <div class="container-raindrop">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><img src="/img/raindrop-logo.png" class="logo"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li id="tasks"><a href="/tasks?proiect=${loggedInUser.getFavorit().getCodProiect()}">[@spring.message "TASKS"/]</a></li>
                <li id="projects">
                    <a href="/projects">[@spring.message "PROJECTS"/]</a>
                </li>
            [@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER','ROLE_HR')"]
                <li id="personnel"><a href="/personnel">[@spring.message "PERSONNEL"/]</a></li>
            [/@security.authorize]
            [@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER','ROLE_TIME')"]
                <li id="time"><a href="/time">[@spring.message "TIME"/]</a></li>
            [/@security.authorize]
            [@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER','ROLE_INVENTAR')"]
                <li id="inventory"><a href="/inventory">[@spring.message "INVENTORY"/]</a></li>
            [/@security.authorize]
            [@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERUSER','ROLE_FILES')"]
                <li id="files"><a href="/files">[@spring.message "FILES"/]</a></li>
            [/@security.authorize]
            [@security.authorize access="hasAnyRole('ROLE_ADMIN','ROLE_REPORTS','ROLE_SUPERUSER')"]
                <li id="reports"><a href="/reports">[@spring.message "REPORTS"/]</a></li>
            [/@security.authorize]
            </ul>
            <ul class="nav navbar-nav navbar-right">
            [@security.authorize ifAnyGranted="ROLE_ADMIN"]
                <li id="admin"><a href="/administration"><i class="fa fa-cog fa-1-5x"></i> [@spring.message "ADMIN"/]</a></li>
            [/@security.authorize]
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" role="button" title="Notific&acirc;ri">
                        <span class="fa fa-bell fa-lg icon-animated-bell">
                            <span class="count-circle count-circle-middle slide-up">1</span>
                        </span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header">
                            <i class=" fa fa-bell-o"></i> [@spring.message "NOTIFICATIONS"/]
                        </li>
                        <li class="divider"></li>
                        <li class="bg-warning text-warninge -pulse"><a>Logging overages in sector C.</a></li>
                        <li class="bg-danger text-danger"><a>Users with request timed out.</span></a></li>
                        <li><a>Service errors since 12:01AM.</a></li>
                        <li><a>Blade server pending backup.</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-footer">
                            <a href="/notifications"> [@spring.message "ALL_NOTIFICATIONS"/] <i
                                    class="fa fa-arrow-right"></i> </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a id="messages" data-toggle="offcanvas" data-target=".chat-sidebar" title="Mesaje">
                        <span id="new-message-received" class="fa fa-envelope fa-lg">
                            <span id="message-count"></span>
                        </span>
                    </a>
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" style="padding-top:7px;padding-bottom:6px;">
                        <img width="36px" class="img-rounded" src="/img/default-avatar.png">
                    </a>
                    <ul class="dropdown-menu pull-right">
                        <li>
                            <a data-toggle="modal" data-target="#modal-userProfile">
                                <span class="fa fa-user fa-fw">&nbsp;</span>[@spring.message "PROFILE"/]
                            </a>
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
    </div>
</nav>
<!--[if IE 5]>
<p>HI, WHAT IS THE PAST LIKE?</p>
<![endif]-->