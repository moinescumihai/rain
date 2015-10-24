[#ftl]
[#import "layouts/layouts.ftl" as layout/]
[#include "content.ftl"/]
[@layout.basic]
    [@sidebar]
    <div class="panel tree-wrapper">
        <div class="panel-heading">
        </div>
        <div class="panel-body">
            <div class="bubblingG">
                <span id="bubblingG_1"></span>
                <span id="bubblingG_2"></span>
                <span id="bubblingG_3"></span>
            </div>
            <div id="file-tree" class="ztree"></div>
        </div>
    </div>
    [/@sidebar]
    [@content]
    <div>
        <ol id="file-breadcrumb" class="breadcrumb"></ol>
        <table class="table table-hover table-condensed table-striped">
            <thead>
            <tr class="text-table-head">
                <th class="align-center">#</th>
                <th class="align-left">Nume</th>
                <th class="align-right">M&abreve;rime</th>
                <th class="align-right">Ultima accesare</th>
                <th class="align-right">Ultima modificare</th>
            </tr>
            </thead>
            <tbody id="file-display" class="text-center">

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