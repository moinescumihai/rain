var statusHtml = '<div class="col-md-$columnSize$">' +    '<section class="panel panel-default tasks-widget">' +    '<div class="panel-heading"><h3 class="panel-title">$statusTitle$</h3></div>' +    '<div id="$idStatusTask$-container" class="task-list task-container panel-body" style="min-height: $windowHeight$px">' +    '</div></section></div>';var taskHtml = '<div id="$idTask$-task" data-ordine="$ordine$" data-container="$container$" class="$taskType$ todo-task">' +    '<div class="task-title"><span class="task-title-sp"><a>$taskKey$</a>&nbsp;&nbsp;$numeTask$</span>' +    '<span class="badge badge-sm label-success estimare">$timpRamas$</span>' +    '<img src="$userPhoto$" class="task-user-photo" />' +    '<div class="pull-right hidden-phone">' +    '<button class="btn btn-default btn-xs fa fa-ellipsis-h"></button>' +    '</div></div></div>';var $taskContainer = $(".task-container"),    tasktype = ['list-primary', 'list-success', 'list-warning', 'list-info', 'list-inverse'],    $addTaskForm = $('#modal-addTask-form');var getTaskStatus = function () {    var statusList = [];    $.ajax({        type: 'get',        url: '/app/secure/tasks/get-all-status',        contentType: "application/json",        async: false,        success: function (taskStatusList) {            statusList = taskStatusList;        },        error: function () {            showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina.", "Eroare", ERROR);        }    });    return statusList;};var getProjects = function (container) {    var projectSelect = $('#' + container);    projectSelect.html(EMPTY);    projectSelect.append("<option></option>");    $.ajax({        type: 'get',        url: '/app/secure/projects/getprojects',        contentType: "application/json",        success: function (response) {            if (response.length === 0) {                projectSelect.append($("<option>").prop('disabled', true).text('Nu ai definit niciun proiect'));            }            $.each(response, function (index, project) {                projectSelect.append($("<option>").val(project.idProiect).text(project.numeProiect));            });            projectSelect.trigger(chosenUpdated);        },        error: function (e) {            showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina." + e.message, "Eroare", DANGER);        }    });};var getTaskById = function (id) {    var retTask = {};    $.ajax({        type: 'get',        url: '/app/secure/tasks/get-task/' + id,        contentType: "application/json",        async: false,        success: function (task) {            retTask = task;        },        error: function () {            showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina.", "Eroare", ERROR);        }    });    return retTask;};var removeElement = function (id) {    $("#" + id).remove();};var generateTask = function (task) {    var randomTaskType = tasktype[Math.floor(Math.random() * tasktype.length)],        statusContainer = '#' + task.idStatusTask.idStatusTask + '-container',        idTask = task.idTask,        numeTask = task.nume,        ordine = task.ordine,        taskKey = task.cod,        timpRamas = task.estimare,        userPhoto = task.assignee.idAttachment;    $(statusContainer).append(chain(taskHtml)        .replace(/\$idTask\$/, idTask)        .replace(/\$taskType\$/, randomTaskType)        .replace(/\$numeTask\$/, numeTask)        .replace(/\$timpRamas\$/, timpRamas)        .replace(/\$ordine\$/, ordine)        .replace(/\$taskKey\$/, taskKey)        .replace(/\$userPhoto\$/, userPhoto)        .replace(/\$container\$/, statusContainer));    $(statusContainer).disableSelection();};var updateTask = function (task) {    var token = $("meta[name='_csrf']").prop("content");    var header = $("meta[name='_csrf_header']").prop("content");    $.ajax({        type: 'post',        url: '/app/secure/tasks/update-task',        beforeSend: function (xhr) {            xhr.setRequestHeader(header, token);        },        dataType: 'json',        contentType: 'application/json',        mimeType: 'application/json',        data: JSON.stringify(task),        success: function (response) {            showNotification(response.message, 'Success', SUCCESS);        },        error: function () {            showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina.", "Eroare", ERROR);        }    });};var getTasks = function () {    var taskStatusList = getTaskStatus();    var statusColumWidth = 12 / taskStatusList.length;    $taskContainer.html(EMPTY);    $.ajax({        type: 'get',        url: '/app/secure/tasks/get-current',        contentType: "application/json",        success: function (tasks) {            var idStatusTask,                statusContainer,                windowHeight = $(document).height() - 150;            $.each(taskStatusList, function (index, status) {                idStatusTask = status.idStatusTask;                statusContainer = '#' + idStatusTask + '-container';                $taskContainer.append(chain(statusHtml)                    .replace(/\$columnSize\$/, statusColumWidth)                    .replace(/\$idStatusTask\$/, idStatusTask)                    .replace(/\$statusTitle\$/, status.nume)                    .replace(/\$windowHeight\$/, windowHeight));                $(statusContainer).sortable({                    update: function (event, ui) {                        //console.log(ui);                    }                });                $(statusContainer).droppable({                    hoverClass: "drop-hover",                    accept: ".todo-task",                    greedy: true,                    drop: function (event, ui) {                        var element = ui.helper,                            css_id = element.prop("id"),                            destinationContainer = $(event.target),                            task = getTaskById(parseInt(css_id)),                            destinationContainerId = parseInt(destinationContainer.prop('id'));                        if (destinationContainerId !== task.idStatusTask.idStatusTask) {                            removeElement(css_id);                            task.idStatusTask.idStatusTask = destinationContainerId;                            generateTask(task);                            updateTask(task);                        }                    }                });            });            $.each(tasks, function (index, task) {                generateTask(task);            });        },        error: function (e) {            showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina.", "Eroare", ERROR);        }    });};var resetAddTask = function () {    $('#modal-addTask').modal('hide');    $addTaskForm.trigger('reset');    $('.chosen-select').val(EMPTY).trigger(chosenUpdated);    getTasks();};$(document).ready(function () {    $('#tasks').addClass('active');    TaskList.initTaskWidget();    getTasks();    $('.todo-task').draggable({revert: 'valid', revertDuration: 200});    getProjects('task-form-idProiect');    getPersoane('task-form-reporter');    getPersoane('task-form-assignee');    $addTaskForm.validate({        rules: {            required: true,            estimare: {                number: true,                maxlength: 3            },            assignee: {                required: false            }        }    });    $addTaskForm.on('submit', function (event) {        if (!$(this).valid()) {            return false;        }        var token = $("meta[name='_csrf']").prop('content'),            header = $("meta[name='_csrf_header']").prop('content'),            nume = $('#task-form-nume').val(),            estimare = $('#task-form-estimare').val(),            idProiect = $('#task-form-idProiect').val(),            reporter = $('#task-form-reporter').val(),            assignee = $('#task-form-assignee').val(),            descriere = $('#task-form-descriere').val(),            data = {                nume: nume, estimare: estimare, idProiect: idProiect,                assignee: assignee, reporter: reporter, descriere: descriere            };        $.ajax({            type: 'post',            url: '/app/secure/tasks/add-task',            beforeSend: function (xhr) {                xhr.setRequestHeader(header, token);            },            dataType: 'json',            contentType: 'application/json',            mimeType: 'application/json',            data: JSON.stringify(data),            success: function (response) {                resetAddTask();                showNotification(response.message, 'Success', SUCCESS);            },            error: function () {                showNotification("Eroare. Re&icirc;nc&abreve;rca&#539;i pagina.", "Eroare", ERROR);            }        });        event.preventDefault();    });    $(document).on('shown.bs.modal', '#modal-addTask', function () {        $('#task-form-reporter').val(getProfile().idResurseUmane).trigger(chosenUpdated);    });    $(document).on('hidden.bs.modal', '#modal-addTask', function () {        resetAddTask();    });    $(document).on('click', '.todo-task', function () {        $('.todo-task').removeClass('selected');        $(this).addClass('selected');    });});