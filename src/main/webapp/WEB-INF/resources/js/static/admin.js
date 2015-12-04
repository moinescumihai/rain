var $userTable,
    $userTableHolder = $('#user-table'),
    $addUserModal = $('#modal-addUser'),
    $addUserForm = $('#modal-addUser-form'),
    roleNames = {
        ROLE_ADMIN: 'Administrator',
        ROLE_DEV: 'Dezvoltare',
        ROLE_FILES: 'Fi&#x219;iere',
        ROLE_HR: 'Persoane',
        ROLE_INVENTAR: 'Inventar',
        ROLE_REPORTS: 'Rapoarte',
        ROLE_TIME: 'Timp',
        ROLE_USER: 'Utilizator'
    };


var activateUser = function (userId) {
    var token = $("meta[name='_csrf']").prop('content'),
        header = $("meta[name='_csrf_header']").prop('content');

    $.ajax({
        type: 'get',
        url: '/app/secure/admin/activate-user/' + userId,
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            showNotification('Utilizatorul ' + response.fullName + ' a fost activat', 'Succes');
            $userTable.ajax.reload(null, false);
        }
    });
};

var deactivateUser = function (userId) {
    var token = $("meta[name='_csrf']").prop('content'),
        header = $("meta[name='_csrf_header']").prop('content');

    $.ajax({
        type: 'get',
        url: '/app/secure/admin/deactivate-user/' + userId,
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            showNotification('Utilizatorul ' + response.fullName + ' a fost dezactivat', 'Succes');
            $userTable.ajax.reload(null, false);
        }
    });
};

var format = function (row) {
    var idUser = row.idUser.idUser,
        childRow = '<div class="well">' +
            '<table class="table table-responsive table-striped table-hover">' +
            '<tr>' +
            '<th colspan="10">' +
            'Roluri' +
            '</th></tr><tr><td>';
    $.ajax({
        type: 'get',
        url: '/app/secure/profile/get-roles/' + idUser,
        contentType: "application/json",
        async: false,
        success: function (response) {
            $.each(response, function (index, value) {
                if (index > 0) {
                    childRow += ', '
                }
                childRow += roleNames[value.role];
            });
        }
    });

    childRow += '</td></tr></table></div>';

    return childRow;
};

$(document).ready(function () {
    $('#admin').addClass('active');

    try {
        $userTable = $userTableHolder.DataTable({
            "ajax": {
                "deferRender": true,
                "url": '/app/secure/profile/get-all-users',
                "dataSrc": ""
            },
            "buttons": [
                {
                    extend: 'excel',
                    text: '<span class="fa fa-file-excel-o" title="Apasa ALT+X pentru a salva tabelul in format Excel">&nbsp;&nbsp;</span><span>XLS</span>',
                    className: 'btn btn-default',
                    key: {
                        key: 'x',
                        altKey: true
                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'pdf',
                    text: '<span class="fa fa-file-pdf-o" title="Apasa ALT+F pentru a salva tabelul in format PDF">&nbsp;&nbsp;</span><span>PDF</span>',
                    className: 'btn btn-default',
                    key: {
                        key: 'f',
                        altKey: true
                    },
                    orientation: 'landscape',
                    title: 'Utilizatori',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: '<span class="fa fa-print" title="Apasa ALT+P pentru a trimite la print">&nbsp;&nbsp;</span><span>Print</span>',
                    className: 'btn btn-default',
                    key: {
                        key: 'p',
                        altKey: true
                    },
                    title: 'Utilizatori',
                    exportOptions: {
                        columns: ':visible'
                    }
                },
                {
                    extend: 'colvis',
                    text: '<span class="fa fa-adjust">&nbsp;&nbsp;</span><span>Alege coloane vizibile</span>',
                    className: 'btn btn-default'
                }
            ],
            sRowSelect: 'single',
            columns: [
                {
                    sWidth: "35px",
                    bSortable: false,
                    orderable: false,
                    className: 'details-control',
                    data: null,
                    defaultContent: EMPTY,
                    searchable: false
                },
                {
                    data: 'idUser.username',
                    className: 'text-bold'
                },
                {data: 'fullName'},
                {data: 'mobilTel'},
                {data: 'workTel'},
                {data: 'email'},
                {data: 'fax'},
                {data: 'idUser.lastLogin'},
                {data: 'idUser.lastPassChange'},
                {data: 'idUser.enabled'}
            ],
            "columnDefs": [
                {
                    "targets": [0],
                    "bUseRendered": true,
                    "visible": true,
                    "fnCreatedCell": function (nTd, sData, oData, i) {
                        if (oData.idUser.enabled == 0) {
                            $(nTd).closest('tr').css('text-decoration', 'line-through');
                            $(nTd).closest('tr').css('color', 'gray');
                        }
                    }
                },
                {
                    "targets": [5],
                    "bUseRendered": true,
                    "visible": true,
                    "render": function (data, type, row) {
                        if (data) {
                            return '<a href="mailto:' + data + '">' + data + '</a>';
                        } else {
                            return EMPTY;
                        }
                    }
                },
                {
                    "targets": [7, 8],
                    "bUseRendered": true,
                    "visible": true,
                    "render": function (data, type, row) {
                        if (data) {
                            return toJSDateTime(new Date(data));
                        } else {
                            return EMPTY;
                        }
                    }
                },
                {
                    "targets": [9],
                    "bUseRendered": true,
                    "visible": true,
                    "fnCreatedCell": function (nTd, sData, oData, i) {
                        $(nTd).addClass('text-center').html('<div class="checkbox"><label><input id="user-' + oData.idUser.idUser + '" type="checkbox" ' + (sData == 0 ? 'title="Utilizatorul este inactiv"' : ' checked="" title="Utilizatorul este activ"') + '></label></div>');
                    }
                }
            ],
            dom: '<"clear"><"break-row"><"pull-right"B>lrtip<"break-row-lg">'
        });

        $userTableHolder.find('tbody').on('mouseup', 'td.details-control', function (event) {
            var tr = $(this).closest('tr');
            var row = $userTable.row(tr);

            if (row.child.isShown()) {
                pleaseWaitOn();
                row.child.hide();
                tr.removeClass('shown');
                pleaseWaitOff();
            }
            else {
                // Open this row
                pleaseWaitOn();
                row.child(format(row.data())).show();
                tr.addClass('shown');
                pleaseWaitOff()
            }
        });

    } catch (err) {
        console.log(err);
    }

    $(document).on('change', 'input[type="checkbox"]', function (e) {
        var status = $(this).prop('checked');
        var userId = $(this).prop('id').replace('user-', EMPTY);
        if (status && userId) {
            activateUser(userId);
        } else {
            deactivateUser(userId);
        }
    });

    $(document).on('click', '#editUser-open', function () {
        var username = userTable.row('.selected').data().username;
        if (username) {
            //getProfileForUser(username);
            $('#editUser-form-username').prop('disabled', 'disabled');
            $('#modal-editUser').modal('show');
        }
    });

    $addUserForm.validate({
        rules: {
            nume: {
                minlength: 3
            },
            prenume: {
                minlength: 3
            },
            email: {
                email: true,
                required: false
            },
            workTel: {
                number: true,
                minlength: 10,
                required: false
            },
            tel: {
                number: true,
                minlength: 10,
                required: false
            },
            fax: {
                minlength: 10,
                number: true,
                required: false
            },
            username: {
                nospace: true,
                minlength: 4
            }
        }
    });

    $addUserForm.on('submit', function (e) {
        e.preventDefault();
        if (!$(this).valid()) {
            return;
        }
        var token = $("meta[name='_csrf']").prop("content");
        var header = $("meta[name='_csrf_header']").prop("content");

        var nume = $('#addUser-form-nume').val();
        var prenume = $('#addUser-form-prenume').val();
        var username = $('#addUser-form-username').val();
        var email = $('#addUser-form-email').val();
        var workTel = $('#addUser-form-workTel').val();
        var tel = $('#addUser-form-tel').val();
        var fax = $('#addUser-form-fax').val();
        var idProfil = $('#addUser-form-id-profil').val();
        var roleArray = $('#addUser-form-roles').find('option:selected');
        var roles = EMPTY;
        $.each(roleArray, function (i) {
            roles += ($(roleArray[i]).val()).concat(',');
        });

        var data = {
            'nume': nume,
            'prenume': prenume,
            'username': username,
            'email': email,
            'workTel': workTel,
            'tel': tel,
            'fax': fax,
            'idProfil': idProfil,
            'roles': roles
        };

        $.ajax({
            type: 'post',
            url: $(this).prop('action'),
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            data: JSON.stringify(data),
            contentType: 'application/json',
            success: function (response) {

                $('#modal-addUser').modal('hide');
                addUserForm.trigger('reset');
                showNotification(response.message, 'Success', SUCCESS);
                userTable.ajax.reload(null, false);
            },
            error: function () {
                showNotification("Error. Mai &#238;ncerca&#539;i o dat&#259;.", "Eroare", ERROR);
            }
        });
    });


});