[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#assign security=JspTaglibs["http://www.springframework.org/security/tags"] /]
[#include "content.ftl"]
[#include "formMacros.ftl"]
[@layout.basic]
    [@sidebar]
    <div class="pull-right">
        [@searchbox "project-search" "projects-table"/]
        <div class="list-group">
            [@listItemOpenModal "addProiect" "PROJECTS.ADDPROJECT" "modal-addProiect" "plus fa-1-5x"/]
        </div>
        <div class="list-group">
            [@listItemOpenModal "addClient" "MODAL.ADDCLIENT" "modal-addClient" "group fa-1-5x"/]
        </div>
        <div class="list-group">
            [@listItemOpenModal "addCategory" "MODAL.ADDCATEGORY" "modal-addCategory" "tag fa-1-5x"/]
        </div>
    </div>
    [/@sidebar]
    [@content]
    <div id="project-container"></div>
        [@modalForm "modal-addProiect" "MODAL.ADDPROJECT" "/app/secure/projects/addproject" "PROJECTS.ADDPROJECT" "book"]
            [#include "dialogs/addProjectForm.ftl"]
        [/@modalForm]

        [@modalForm "modal-addClient" "MODAL.ADDCLIENT" "/app/secure/projects/addclient" "MODAL.ADDCLIENT" "group"]
            [#include "dialogs/addClientForm.ftl"]
        [/@modalForm]

        [@modalForm "modal-addCategory" "MODAL.ADDCATEGORY" "/app/secure/projects/addcategory" "MODAL.ADDCATEGORY" "tag"]
            [#include "dialogs/addCategoryForm.ftl"]
        [/@modalForm]

        [#assign addPersoanaButton="<button type='button' data-toggle='modal'  data-target='#add-persoana-to-project'  class='btn btn-success'><i class='fa fa-plus'></i> Adaug&#259;</button>"/]
        [@modalDialog "modal-persoane" "PERSONNEL" "tag" addPersoanaButton]
        <div class="well">
            <i class="fa fa-info-circle"></i>
            [@spring.message "LISTA_PERSOANE.INFO"/]
        </div>
        <div id="persoane-holder"></div>
        [/@modalDialog]

        [@modalForm "add-persoana-to-project" "ADD_PERSOANA" "/app/secure/projects/add-persoana-to-project" "MODAL.ADD" "user-plus"]
            [#include "dialogs/addPersoanaToProiect.ftl"]
        [/@modalForm]

        [#assign sarciniButtons="<button type='button' data-toggle='modal'  data-target='#add-task-to-project'  class='btn btn-success'><i class='fa fa-plus'></i> Adaug&#259;</button>
                                 <a href='../tasks' class='btn btn-info'><i class='fa fa-eye'></i> Vezi toate sarcinile</a>"/]
        [@modalDialog "modal-tasks" "TASKS" "tasks" sarciniButtons]
        <div class="well">
            <i class="fa fa-info-circle"></i>
            [@spring.message "LISTA_SARCINI.INFO"/]
        </div>
        <div id="sarcini-holder"></div>
        [/@modalDialog]

        [#assign addFileButton="<button type='button' data-toggle='modal'  data-target=''  class='btn btn-success'><i class='fa fa-upload'></i> &Icirc;ncarc&#259;</button>"/]
        [@modalDialog "modal-files" "FILES" "paperclip" addFileButton]
        <div class="well">
            <i class="fa fa-info-circle"></i>
            [@spring.message "LISTA_FISIERE.INFO"/]
        </div>
        <div id="files-holder"></div>
        [/@modalDialog]

    [/@content]
[/@layout.basic]
<script src="/plugins/typeahead/bloodhound.min.js"></script>
<script src="/plugins/typeahead/typeahead.bundle.min.js"></script>
<script src="/plugins/typeahead/typeahead.jquery.min.js"></script>
<script src="/js/static/projects.js"></script>