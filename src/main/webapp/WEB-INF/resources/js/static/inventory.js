var stari = [];

function getStari() {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        type: 'get',
        url: '/app/secure/inventory/getstari',
        contentType: "application/json",
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            if (response) {
                $.each(response, function (index) {
                    stari[index] = response[index].numeStare;
                });
            }
        },
        error: function (e) {
            showNotification('Error. Please refresh page.', 'Error', WARNING);
        }
    });
}

function generateBarcode(barcode) {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        type: 'get',
        url: '/app/secure/inventory/generatebarcode/' + barcode,
        cache: false,
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        error: function () {
            showNotification('Error. Please refresh page!', 'Error', WARNING);
        }
    });
}

function getTranzactie(idArticol) {
    var tranzactie = ZERO;
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        type: 'get',
        async: false,
        url: '/app/secure/inventory/tranzactie/' + idArticol,
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            if (response) {
                tranzactie = response;
            }
        },
        error: function (e) {
            showNotification('Error. Please refresh page.', 'Error', WARNING);
        }
    });

    return tranzactie;
}


function generateHistoryTable(idArticol) {
    var counter;
    var data;
    var creatDe;
    var persoana;
    var stare;
    var stareAnterioara;
    var loc;
    var colet;
    var idStare;
    var idStareAnterioara;
    var detalii;
    var history = getHistory(idArticol);
    var stareIcon;
    var stareAnterioaraIcon;

    var historyTable = '<div class="wrapper">' +
        '<table class="table table-responsive table-hover"><thead><tr class="text-table-head">' +
        '<td></td><td>Package</td><td>Assigned to</td><td>Assigned at</td><td>From state</td><td>To state</td><td>Assigned by</td><td>Date</td>' +
        '</tr></thead><tbody>';
    if (history) {
        $.each(history, function (i) {
            counter = i + 1;
            data = toJSDateTime(history[i].dataTranzactie);
            creatDe = history[i].creatDe;
            persoana = history[i].nume;
            loc = history[i].numeLoc;
            stare = history[i].stare;
            idStare = history[i].idStare;
            stareAnterioara = history[i].stareAnterioara;
            idStareAnterioara = history[i].idStareAnterioara;
            detalii = history[i].detalii;
            colet = history[i].colet;
            stareIcon = getStareIcon(idStare);
            stareAnterioaraIcon = getStareIcon(idStareAnterioara);

            historyTable += '<tr>' +
                '<td>' + counter + '</td>' +
                '<td><nobr>' + colet + '</nobr></td>' +
                '<td><nobr>' + persoana + '</nobr></td>' +
                '<td><nobr>' + loc + '</nobr></td>' +
                '<td><nobr><span class="fa ' + stareAnterioaraIcon + ' fa-fw fa-bold">&nbsp;&nbsp;</span>' + stareAnterioara + '</nobr></td>' +
                '<td><nobr><span class="fa ' + stareIcon + ' fa-fw fa-bold">&nbsp;&nbsp;</span>' + stare + '</nobr></td>' +
                '<td><nobr>' + creatDe + '</nobr></td>' +
                '<td><nobr>' + data + '</nobr></td></tr>';
        });
    } else {
        showNotification("Error. Please refresh page", "Error", WARNING);
        return;
    }

    historyTable += '</tbody></table></div>';

    return historyTable;

}

function getHistory(idArticol) {
    var retVal = null;
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");

    $.ajax({
        type: 'get',
        url: '/app/secure/inventory/tranzactie/history/' + idArticol,
        async: false,
        contentType: "application/json",
        mimeType: 'application/json',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (response) {
            retVal = response
        },
        error: function () {
            showNotification('Error. Please refresh page.', 'Error', WARNING);
        }
    });

    return retVal;
}

function getStareIcon(idStare) {
    var stareIcon;
    switch (idStare) {
        case 1:
            stareIcon = 'fa-cubes';
            break;
        case 2:
            stareIcon = 'fa-recycle';
            break;
        case 3:
            stareIcon = 'fa-thumb-tack';
            break;
        case 4:
            stareIcon = 'fa-truck';
            break;
        case 5:
            stareIcon = 'fa-bug';
            break;
        case 6:
            stareIcon = 'fa-wrench';
            break;
        case 7:
            stareIcon = 'fa-exclamtion-circle';
            break;
        case 8:
            stareIcon = 'fa-trash';
            break;
    }
    return stareIcon;
}

function format(d) {
    var evidentaInventar;
    var dataPreluare;
    var stare;
    var dataTitle;
    var usePersoana = false;
    var stareIcon;
    var persoana;
    var useDetalii = false;
    var detalii;
    var detaliiTitle;
    var usePrimire = false;
    var dataPrimire;
    var useUserRecuperat = false;
    var userRecuperat;
    var primitPrinTranzit;
    var barcode = d.codStoc;
    var loc = d.numeLoc;
    var idStoc = d.idStoc;
    var idStare = d.idStare;
    stareIcon = getStareIcon(idStare);
    generateBarcode(barcode);
    // `d` is the original data object for the row
    switch (idStare) {
        case 1:
            stare = stari[0];
            dataPreluare = toJSDateTime(d.creatLa);
            dataTitle = 'Added on:';
            break;
        case 2:
            stare = stari[1];
            dataPreluare = toJSDateTime(d.dataRecuperare);
            dataTitle = 'Recuperat la:';
            //detalii = d.detaliiRecuperare;
            if (detalii.length > 0) {
                detaliiTitle = 'Detalii recuperare';
                useDetalii = true;
            }
            //userRecuperat = d.modificatDe;
            if (userRecuperat && userRecuperat.length > 0) {
                useUserRecuperat = true;
            }
            break;
        case 3:
            evidentaInventar = getTranzactie(d.idStoc);
            stare = '<%=StareArticol.IN_FOLOSINTA.getLabel()%>';
            //dataPreluare = toJSDate(evidentaInventar.dataPreluarii, 1);
            dataTitle = 'Atribuit la:';
            persoana = d.nume;
            if (persoana.length > 0) {
                usePersoana = true;
            }
            detalii = d.detalii;
            if (detalii.length > 0) {
                detaliiTitle = 'Detalii preluare';
                useDetalii = true;
            }
            //dataPrimire = d.dataPrimire;
            if (dataPrimire) {
                dataPrimire = toJSDate(dataPrimire);
                if (dataPrimire < dataPreluare) {
                    dataPrimire = null;

                }
            }
            if (dataPrimire) {
                usePrimire = true;
                primitPrinTranzit = 'Primit prin tranzit'

            } else {
                dataPrimire = '&#206;nc&#259; nu a ajuns la destina&#355;ie';
            }

            break;
        case 4:
            evidentaInventar = getTranzactie(d.idStoc);
            stare = stari[4];
            detalii = d.detalii;
            //dataPreluare = toJSDate(evidentaInventar.dataPreluarii, 1);
            dataTitle = 'Plecat la:';
            persoana = d.nume;
            if (persoana.length > 0) {
                usePersoana = true;
            }
            if (detalii.length > 0) {
                detaliiTitle = 'Detalii tranzit';
                useDetalii = true;
            }
            //dataPrimire = d.dataPrimire;
            if (dataPrimire) {
                dataPrimire = toJSDate(dataPrimire, 1);
                if (dataPrimire < dataPreluare) {
                    dataPrimire = null;
                    usePrimire = false;
                }
            }
            if (dataPrimire) {
                usePrimire = true;
                dataPrimire = toJSDate(dataPrimire, 1)
            } else {
                dataPrimire = '&#206;nc&#259; nu a ajuns la destina&#355;ie';
            }
            break;
        case 5:
            dataTitle = 'Atribuit la:';
            stare = '<%=StareArticol.DETERIORAT.getLabel()%>';
            break;
        case 6:
            dataTitle = 'Atribuit la:';
            stare = '<%=StareArticol.SERVICE.getLabel()%>';
            break;
        case 7:
            dataTitle = 'Atribuit la:';
            stare = '<%=StareArticol.DISPARUT.getLabel()%>';
            break;
        case 8:
            dataTitle = 'Atribuit la:';
            stare = '<%=StareArticol.CASAT.getLabel()%>';
            break;
        default:
            return;
    }
    var retString = '<div class="well"><table class="table" cellpadding="5" cellspacing="0" border="0">' +
        '<tr>' +
        '<td width="200px;"><span class="fa fa-map-marker fa-fw">&nbsp;</span><b>Location:</b></td>' +
        '<td width="550px;">' + loc + '</td>' +
        '<td rowspan="10" style="vertical-align: middle; text-align: center"><div>' +
        '<img  width="200" height="100"  src="/barcode/' + barcode + '.png" alt="Not yet generated">' +
        '<br><span class="text-center">' + barcode + '</span></div>' +
        '</td>' +
        '</tr>' +
        '<tr>' +
        '<td><span class="fa ' + stareIcon + ' fa-fw">&nbsp;</span><b>State:</b></td>' +
        '<td>' + stare + '</td>' +
        '</tr>';


    retString += '<tr>' +
        '<td><span class="fa fa-calendar fa-fw">&nbsp;</span><b>' + dataTitle + '</b></td>' +
        '<td>' + dataPreluare + '</td>' +
        '</tr>';
    if (usePrimire) {
        retString += '<tr><td><span class="fa fa-calendar fa-fw">&nbsp;</span><b>Primit la:</b></td>' +
            '<td>' + dataPrimire + '</td>' +
            '</tr>';
    }
    if (usePersoana) {
        retString += '<tr><td><span class="fa fa-user fa-fw">&nbsp;</span><b>Persoan&#259;:</b></td>' +
            '<td>' + persoana + '</td>' +
            '</tr>';
    }
    if (useUserRecuperat) {
        retString += '<tr><td><span class="fa fa-user fa-fw">&nbsp;</span><b>Recuperat de:</b></td>' +
            '<td>' + userRecuperat + '</td>' +
            '</tr>';
    }
    if (useDetalii) {
        retString += '<tr><td><span class="fa fa-comment fa-fw">&nbsp;</span><b>' + detaliiTitle + ':</b></td>' +
            '<td>' + detalii + '</td>' +
            '</tr>';
    }
    retString += '<tr>' +
        '<td><a id="history-' + idStoc + '" class="btn btn-warning" data-barcode="' + barcode + '"><span class="fa fa-history"> &nbsp;</span> Show history</a></td>' +
        '<td><a href="/app/secure/inventory/downloadbarcode/' + barcode + '.png" class="btn btn-primary  pull-right"><span class="fa fa-floppy-o"> &nbsp;</span> Save barcode</a></td>' +
        '</tr>';
    retString += '</table></div>';

    return retString;
}

$(document).ready(function () {
    var inventoryTable;

    $('#inventory').addClass('active');
    getStari();

    try {
        inventoryTable = $('#inventory-table').DataTable({
            "ajax": {
                "url": '/app/secure/inventory/getinventory',
                "dataSrc": ""
            },
            "columns": [
                {
                    "sWidth": "35px",
                    "bSortable": false,
                    "className": 'details-control',
                    "orderable": false,
                    "data": null,
                    "defaultContent": '',
                    "searchable": false
                },
                {
                    "data": "numeStoc",
                    "className": 'text-bold'
                },
                {"data": "numeCategorie"},
                {"data": "numeGrup"},
                {"data": "codStoc"},
                {"data": "detalii"},
                {
                    "sWidth": "45px",
                    "className": 'text-center',
                    "data": "idStare"
                },
                {
                    "data": "numeLoc",
                    "visible": false,
                    "searchable": false
                },
                {
                    "data": "creatLa",
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
                    "targets": [6],
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
            dom: 'T<"clear"><"break-row">ltipr<"break-row-lg">',
            tableTools: {
                "sSwfPath": "/swf/copy_csv_xls_pdf.swf",
                "aButtons": [
                    {
                        "sExtends": "csv",
                        "sButtonClass": "btn btn-default",
                        "sButtonText": '<span class="fa fa-file-o">&nbsp;&nbsp;</span><span>CSV</span>',
                        "mColumns": [1, 2, 3, 4, 5, 6],
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    },
                    {
                        "sExtends": "xls",
                        "sButtonClass": "btn btn-default",
                        "sCharSet": "utf16le",
                        "sButtonText": '<span class="fa fa-file-excel-o">&nbsp;&nbsp;</span><span>XLS</span>',
                        "mColumns": [1, 2, 3, 4, 5, 6],
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    },
                    {
                        "sExtends": "pdf",
                        "sButtonClass": "btn btn-default",
                        "sButtonText": '<span class="fa fa-file-pdf-o">&nbsp;&nbsp;</span><span>PDF</span>',
                        "mColumns": [1, 2, 3, 4, 5, 6],
                        "oSelectorOpts": {
                            page: 'current'
                        }
                    }
                ]
            }
        });

        $('#inventory-table tbody').on('click', 'td.details-control, div.stare-icon', function () {
            var tr = $(this).closest('tr');
            var row = inventoryTable.row(tr);

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

    $("#inventory-search").on('keyup', function () {
        inventoryTable.search(this.value).draw();
    });

    $('body').on('click', 'a[id^="history-"]', function () {
        var id = $(this).attr('id');
        var idArticol = id.replace('history-', '');
        var barcode = $(this).data('barcode');

        id = id + '-modal';
        var titlu = '<i class="fa fa-history">&nbsp;&nbsp;</i>History for&nbsp;&nbsp;<i class="fa fa-barcode">&nbsp;</i>' + barcode;
        var tabel = generateHistoryTable(idArticol);

        showModal(id, titlu, tabel);
    });
});