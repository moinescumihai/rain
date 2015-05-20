[#ftl]
[#assign security=JspTaglibs["http://www.springframework.org/security/tags"] /]
[#macro basic]
    [#include "header.ftl"/]

    [#nested]

    [#include "footer.ftl"/]
</body>
</html>

<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/bootstrap-modalmanager.js"></script>
<script src="/js/bootstrap-modal.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/bootstrap-datepicker.min.js"></script>
<script src="/js/dataTables.min.js"></script>
<script src="/js/dataTables-bootstrap.js"></script>
<script src="/js/notify.js"></script>
<script src="/js/raindrop.js"></script>
[/#macro]
