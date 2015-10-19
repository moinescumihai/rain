var fileTree;var fileDisplay = $('#file-display');var rMenu;var faFiles;var computeExtension = (function () {    var memory = [];    var search = function (fileName) {        var extension = /(?:\.([^.]+))?$/.exec(fileName)[1];        if (typeof extension === 'undefined') {            extension = EMPTY;        }        var icon = memory[extension.toLowerCase()];        if (typeof icon !== 'string') {            $.each(faFiles.files[0], function (index, fileType) {                $.each(fileType.extensions, function (index, fileExtension) {                    if (fileExtension === extension) {                        icon = fileType.icon;                    }                })            });            memory[extension] = icon;        }        return icon;    };    return search;}());var humanReadableSize = function (sizeInBytes) {    var readableSize;    if (sizeInBytes <= 0) {        readableSize = '�';    } else if (sizeInBytes < 1024) {        readableSize = sizeInBytes + ' B';    } else if (sizeInBytes < 1048576) {        readableSize = +(sizeInBytes / 1024).toFixed(2) + ' KB';    } else if (sizeInBytes < 1073741824) {        readableSize = +(sizeInBytes / 1048576).toFixed(2) + ' MB';    } else {        readableSize = +(sizeInBytes / 1073741824).toFixed(2) + ' GB'    }    return readableSize;};var displayFile = function (event, treeId, treeNode, clickFlag) {    var ultimaAccesare;    var ultimaModificare;    var fileName;    var icon;    if (treeNode.isParent) {        fileDisplay.html(EMPTY);        $.each(treeNode.children, function (index, child) {            fileName = child.originalFileName;            ultimaAccesare = child.accesatLa ? toJSDateTime(child.accesatLa) : '�';            ultimaModificare = child.modificatLa !== null ? toJSDateTime(child.modificatLa) : toJSDateTime(child.creatLa);            if (child.isParent) {                icon = faFiles.folder;            } else {                icon = computeExtension(fileName);            }            fileDisplay.append(                '<tr><td align="center">'                + (index + 1)                + ' </td><td align="left">'                + '<i class="fa fa-fw ' + icon + '"></i>  <a href="' + child.path + '">' + fileName + '</a>'                + '</td><td align="right">' + humanReadableSize(child.size)                + '<td align="right">' + ultimaAccesare + '</td>'                + '<td align="right">' + ultimaModificare + '</td>'                + '</td></tr>');        });    }};var contextMenu = function (event, treeId, treeNode) {    if (!treeNode && event.target.tagName.toLowerCase() !== "button" && $(event.target).parents("a").length === 0) {        fileTree.cancelSelectedNode();        showRMenu("root", event.pageX, event.pageY - 55);    } else if (treeNode) {        fileTree.selectNode(treeNode);        showRMenu("node", event.pageX, event.pageY - 55);    }};var showRMenu = function (type, x, y) {    if (type == "root") {        $("#m_del").hide();        $("#m_edit").hide();    } else {        $("#m_del").show();        $("#m_edit").show();    }    rMenu.css({"top": y + "px", "left": x + "px"});    $("#rMenu").fadeIn(80);    $(document).bind("mousedown", onBodyMouseDown);};var hideRMenu = function () {    if (rMenu) {        rMenu.fadeOut(40);    }    $(document).unbind("mousedown", onBodyMouseDown);};var onBodyMouseDown = function (event) {    if (!(event.target.id === "rMenu" || $(event.target).parents("#rMenu").length > 0)) {        rMenu.css({"display": "none"});    }};var removeTreeNode = function () {    hideRMenu();    var nodes = fileTree.getSelectedNodes();    if (nodes && nodes.length > 0) {        if (nodes[0].children && nodes[0].children.length > 0) {            var msg = "If you delete this node will be deleted along with sub-nodes. \n\nPlease confirm!";            if (confirm(msg) == true) {                fileTree.removeNode(nodes[0]);            }        } else {            fileTree.removeNode(nodes[0]);        }    }};var editTreeNode = function () {    hideRMenu();    var nodes = fileTree.getSelectedNodes();    if (nodes && nodes.length > 0) {        fileTree.editName(nodes[0]);    }};var treeSettings = {    view: {        expandSpeed: "",        selectedMulti: false    },    async: {        enable: true,        type: 'get',        url: "/app/secure/files/list-files",        autoParam: ["id"]    },    data: {        keep: {            leaf: true,            parent: true        },        key: {            name: "originalFileName",            url: "path",            id: "idAttachment",            isParent: "isDirectory"        }    },    edit: {        enable: true,        nameIsHTML: true,        editNameSelectAll: true,        showRemoveBtn: false,        showRenameBtn: false    },    callback: {        onClick: displayFile,        onRightClick: contextMenu,        dataFilter: computeExtension,        onAsyncSuccess: function () {            $('.bubblingG').hide();        }    }};$(document).ready(function () {    $('#files').addClass('active');    $('.bubblingG').show();    $.getJSON('/js/static/fa-files.json', function (data) {        faFiles = data;    });    fileTree = $.fn.zTree.init($("#file-tree"), treeSettings);    rMenu = $("#rMenu");});