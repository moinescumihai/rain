[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#assign security=JspTaglibs["http://www.springframework.org/security/tags"] /]
[#include "formMacros.ftl"]
[#include "content.ftl"]
[@layout.basic]
    [@sidebar]
    <div>
        <div class="list-group">
            [@listItemOpenModal "addTask" "TASKS.ADD_TASK" "modal-addTask" "tasks fa-1-5x"/]
        </div>
    </div>
    [/@sidebar]
    [@content]
    <div class="row task-container"></div>

        [@modalForm "modal-addTask" "TASKS.ADD_TASK" "/app/secure/tasks/add-task" "OK" "tasks" "check"]
            [#include "dialogs/addTaskForm.ftl"]
        [/@modalForm]
    [/@content]
[/@layout.basic]

<script src="/js/jquery-ui.min.js"></script>
<script src="/js/static/tasks.js"></script>