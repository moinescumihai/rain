[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#assign security=JspTaglibs["http://www.springframework.org/security/tags"] /]
[#include "content.ftl"]
[#include "formMacros.ftl"]
[@layout.basic]
    [@sidebar]
    <ul class="nav nav-tabs nav-stacked admin-navs" role="tablist">
        <li class="active"><a href="#utilizatori" role="tab" data-toggle="tab"><i class="fa fa-group fa-1-5x"></i> [@spring.message "UTILIZATORI"/]</a></li>
    </ul>
    [/@sidebar]
    [@content]
    <div class="tab-content">
        <div class="tab-pane fade in active" id="utilizatori" role="tabpanel">
            [@container]
                [@row]
                    [@buttonOpenModal "addUser" "ADD_PERSOANA" "modal-addUser" 2 "primary" "user-plus" /]
                [/@row]
                [@ajaxDataTable "user-table"]
                    <th> [@spring.message "USER.USERNAME"/] </th>
                    <th> [@spring.message "USER.NAME"/] </th>
                    <th> [@spring.message "USER.MOBILEPHONE"/] </th>
                    <th> [@spring.message "USER.WORKPHONE"/] </th>
                    <th> [@spring.message "USER.EMAIL"/] </th>
                    <th> [@spring.message "USER.FAX"/] </th>
                    <th> [@spring.message "USER.LAST_LOGIN"/] </th>
                    <th> [@spring.message "USER.LAST_PASS_CHANGE"/] </th>
                    <th> [@spring.message "USER.ACTIV"/] </th>
                [/@ajaxDataTable]
            [/@container]
        </div>
    </div>
    [/@content]

    [@security.authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SUPERUSER')"]
        [@modalForm "modal-addUser" "ADD_USER_TITLE" "/app/secure/admin/add-user" "SAVE.CHANGES" "user-plus"]
            [#include "dialogs/userForm.ftl"]
        [/@modalForm]
        [@security.authorize access="hasAnyRole('ROLE_ADMIN')"]
            [@modalForm "modal-editUser" "EDIT_USER_TITLE" "/app/secure/admin/edit-user" "SAVE.CHANGES" "user"]
                [#include "dialogs/userForm.ftl"]
            [/@modalForm]
        [/@security.authorize]
    [/@security.authorize]
[/@layout.basic]
<script src="/js/static/admin.js"></script>