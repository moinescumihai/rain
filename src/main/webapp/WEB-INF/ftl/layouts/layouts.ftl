[#ftl]
[#assign security=JspTaglibs["http://www.springframework.org/security/tags"] /]
[#include "../formMacros.ftl"]
[#macro basic]
    [#include "header.ftl"/]
    <div id="sb-site">
    [#nested]
    </div>
    [#include "footer.ftl"/]
    [@modalForm "modal-userProfile" "MODAL.USERPROFILE" "/app/secure/profile/" "SAVE.CHANGES" "user"]
        [#include "../dialogs/profileForm.ftl"]
    [/@modalForm]
</body>

<script src="/plugins/DataTables/datatables.js"></script>
[#--<script src="/js/bootstrap.min.js"></script>--]
<script src="/js/bootstrap.file-input.js"></script>
<script src="/js/bootstrap-modalmanager.js"></script>
<script src="/js/bootstrap-modal.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/toastr.js"></script>
<script src="/js/dropzone.js"></script>
<script src="/js/tasks.js"></script>
<script src="/js/tree.js"></script>
<script src="/js/tree.min.js"></script>
<script src="/js/jquery.validate.js"></script>
<script src="/js/additional-methods.min.js"></script>
<script src="/js/popover.js"></script>
<script src="/js/chart.min.js"></script>
<script src="/js/raindrop.js"></script>

</html>
[/#macro]
