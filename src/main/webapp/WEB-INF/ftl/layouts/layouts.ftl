[#ftl]
[#macro basic]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Raindrop">
    <meta name="author" content="Raindrop Solutions">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>

    <link rel="icon" href="/img/raindrop-logo.png">

    <title>[@spring.message "APPTITLE"/]</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/chosen.css" rel="stylesheet">
    <link href="/css/raindrop.css" rel="stylesheet">
</head>
<body class="unselectable" oncontextmenu="return false;">
    [#include "header.ftl"/]
    [#nested]
    [#include "footer.ftl"/]
<!-- JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/dataTables.min.js"></script>
<script src="/js/dataTables-bootstrap.js"></script>
<script src="/js/notify.js"></script>
</body>
</html>
<script type="text/javascript">

    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }

</script>
[/#macro]
