[#ftl]
[#import "layouts/layouts.ftl" as layout/]
[#include "content.ftl"/]
[@layout.basic]
    [@sidebar]
    <div class="panel tree-wrapper">
        <div class="panel-heading">
        </div>
        <div class="panel-body">
            <div id="file-tree" class="ztree"></div>
        </div>
    </div>
    [/@sidebar]
    [@content]
    <div>
        <table class="table table-hover table-striped table-condensed">
            <thead>
            <tr class="text-table-head">
                <th>#</th>
                <th>Nume</th>
                <th>M&abreve;rime</th>
            </tr>
            </thead>
            <tbody id="file-display">

            </tbody>

        </table>
    </div>
    [#--<form action="/file-upload"--]
    [#--class="dropzone"--]
    [#--id="file-dropzone"></form>--]
    [/@content]
<div id="rMenu" class="unselectable">
    <ul class="list-unstyled">
        <li class="menuItem" id="m_del" onclick="removeTreeNode();">&#350;terge</li>
        <li class="menuItem" id="m_edit" onclick="editTreeNode();">Editeaz&#259;</li>
    </ul>
</div>
[/@layout.basic]
<script src="/js/static/files.js"></script>
