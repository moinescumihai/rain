[#ftl]
<nav class="navbar navbar-inverse navbar-fixed-top unselectable" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/"><img style="height:55px;width: auto; display: inline;" src="/img/raindrop-logo.png"/></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li id="dashboard"><a href="/">[@spring.message "DASHBOARD"/]</a></li>
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
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria=expanded="false" title="Notifications">
                    <span class="fa fa-bell fa-lg icon-animated-bell">
                    <span class="count-circle count-circle-middle slide-up">1</span>
                    </span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="dropdown-header"><i class=" fa fa-bell-o"></i> [@spring.message "NOTIFICATIONS"/] </li>
                        <li class="divider"></li>
                        <li class="bg-warning text-warninge -pulse"><a>Logging overages in sector C.</a></li>
                        <li class="bg-danger text-danger"><a>Users with request timed out.</span></a></li>
                        <li><a>Service errors since 12:01AM.</a></li>
                        <li><a>Blade server pending backup.</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-footer">
                            <a href="/notifications"> [@spring.message "ALL_NOTIFICATIONS"/] <i class="fa fa-arrow-right"></i> </a>
                        </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a id="messages" class="dropdown-toggle" data-toggle="dropdown" title="Messages">
                        <span id="new-message-received" class="fa fa-envelope fa-lg">
                            <span id="message-count"></span>
                        </span>
                    </a>
                    <ul class="dropdown-menu pull-right">
                        <li class="dropdown-header"><i class=" fa fa-envelope-o"></i> [@spring.message "MESSAGES"/] </li>
                        <li class="divider"></li>
                        <li><a id="user-message"><span id="user">Salut, am venit si eu</span></a></li>
                        <li><a>FW: All developers on the Trello..</a></li>
                        <li><a>Notice from corporate---- Your HR..</a></li>
                        <li><a>Hi Joe, I left the keys for the..</a></li>
                        <li><a>All, The SPG group will meet every..</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-footer">
                            <a href="/inbox"> [@spring.message "ALL_MESSAGES"/] <i class="fa fa-arrow-right"></i> </a>
                        </li>

                    </ul>
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" style="padding-top:7px;padding-bottom:6px;">
                        <img width="36px" class="img-rounded" src="http://api.randomuser.me/portraits/men/4.jpg">
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
    </div>
</nav>