$(document).ready(function () {
    var table;

    $('#inventory').addClass('active');

    try {
        table = $('#inventory-table').DataTable({
            "ajax": {
                "url": '${pageContext.request.contextPath}/app/secure/inventory/getinventory',
                "dataSrc": ""
            },
            "aLengthMenu": [[5, 10, 25, 50, 100, -1], [5, 10, 25, 50, 100, "All"]],
            stateSave: true,
            "columns": [
                {
                    "sWidth": "15px",
                    "bSortable": false,
                    "className": 'details-control',
                    "orderable": false,
                    "data": null,
                    "defaultContent": '',
                    "searchable": false
                },
                {"data": "idStoc"},
                {"data": "categorie"},
                {"data": "grup"},
                {"data": "denumire"},
                {"data": "codStoc"},
                {"data": "detalii"},
                {"data": "idStare"},
                {
                    "data": "idLoc",
                    "visible": false,
                    "searchable": false
                },
                {
                    "data": "dataAdaugare",
                    "visible": false,
                    "searchable": false
                },
                {
                    "data": "modificatDe",
                    "visible": false,
                    "searchable": false
                }
            ],
            "columnDefs": [
                {
                    "targets": [1],
                    "visible": true,
                    "searchable": false
                },
                {
                    "targets": [7],
                    "bUseRendered": true,
                    "visible": true,
                    "fnCreatedCell": function (nTd, sData, oData, i) {
                        switch (sData) {
                            case 1:
                                $(nTd).html('<div class="btn btn-success stare-icon"><span class="fa fa-cubes fa-fw"></span></div>');
                                break;
                            case 2:
                                $(nTd).html('<div class="btn btn-success stare-icon"><span class="fa fa-recycle fa-fw"></span></div>');
                                break;
                            case 3:
                                $(nTd).html('<div class="btn btn-primary stare-icon"><span class="fa fa-thumb-tack fa-fw"></span></div>');
                                break;
                            case 4:
                                $(nTd).html('<div class="btn btn-warning stare-icon"><span class="fa fa-truck fa-fw"></span></div>');
                                break;
                            case 5:
                                $(nTd).html('<div class="btn btn-danger stare-icon"><span class="fa fa-bug fa-fw"></span></div>');
                                break;
                            case 6:
                                $(nTd).html('<div class="btn btn-danger stare-icon"><span class="fa fa-wrench fa-fw"></span></div>');
                                break;
                            case 7:
                                $(nTd).html('<div class="btn btn-danger stare-icon"><span class="fa fa-exclamation-triangle fa-fw"></span></div>');
                                break;
                            case 8:
                                $(nTd).html('<div class="btn btn-danger stare-icon"><span class="fa fa-trash fa-fw"></span></div>');
                                break;
                        }
                    }
                }
            ],
            dom: 'T<"clear"><"break-row">lfrtip<"break-row-lg">',
            tableTools: {
                "sSwfPath": "/swf/copy_csv_xls_pdf.swf",
                "aButtons": [
                    {
                        "sExtends": "csv",
                        "sButtonClass": "btn btn-default",
                        "sButtonText": '<span class="fa fa-file-o">&nbsp;&nbsp;</span><span>CSV</span>',
                        "mColumns": [1, 2, 3, 4, 5, 6, 7],
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    },
                    {
                        "sExtends": "xls",
                        "sButtonClass": "btn btn-default",
                        "sCharSet": "utf16le",
                        "sButtonText": '<span class="fa fa-file-excel-o">&nbsp;&nbsp;</span><span>XLS</span>',
                        "mColumns": [1, 2, 3, 4, 5, 6, 7],
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    },
                    {
                        "sExtends": "pdf",
                        "sButtonClass": "btn btn-default",
                        "sButtonText": '<span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span><span>PDF</span>',
                        "mColumns": [1, 2, 3, 4, 5, 6, 7],
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    }
                ]
            }
        });

        $('#inventory-table tbody').on('click', 'td.details-control, div.stare-icon', function () {
            var tr = $(this).closest('tr');
            var row = table.row(tr);

            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child(format(row.data())).show();
                tr.addClass('shown');
            }
        });
    } catch (err) {
        console.log(err);
    }
});