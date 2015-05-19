[#ftl]
[#assign security=JspTaglibs["http://www.springframework.org/security/tags"] /]
[#macro basic]
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Raindrop">
    <meta name="author" content="Raindrop Solutions">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <link rel="icon" href="/img/raindrop-logo.png">

    <title>[@spring.message "APPTITLE" /]</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chosen.css" rel="stylesheet">
    <link href="/css/bootstrap-datepicker.css" rel="stylesheet">
    <link href="/css/raindrop.css" rel="stylesheet">
</head>
<body class="unselectable" oncontextmenu="return false;">
    [#include "header.ftl"/]

    [#nested]

    [#include "footer.ftl"/]
</body>
</html>

<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/bootstrap-datepicker.min.js"></script>
<script src="/js/dataTables.min.js"></script>
<script src="/js/dataTables-bootstrap.js"></script>
<script src="/js/notify.js"></script>
<script src="/js/raindrop.js"></script>
[/#macro]
