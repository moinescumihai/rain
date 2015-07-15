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

function drawBarcode(id) {
    var canvas = document.getElementById('barcode' + id);
    if (canvas.getContext) {
        var ctx = canvas.getContext('2d');
    }
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

function generateHistoryTable(articol) {
    var counter;
    var dataIesire;
    var persoana;
    var loc;
    var locRecuperare;
    var dataIntrare;
    var detalii;
    var detaliiRecuperare;
    var historyTable = '<div class="wrapper">' +
        '<table class="table table-responsive table-hover"><thead><tr>' +
        '<td>#</td><td>Data iesire</td><td>Person</td><td>Place</td><td>Details</td>' +
        '</tr></thead><tbody>';
    if (articol && articol.length > 0) {
        for (var i = 0; i < articol.length; i++) {
            counter = i + 1;
            dataIesire = toJSDateTime(articol[i].creatLa);
            persoana = articol[i].nume;
            loc = articol[i].denumireLoc;
            locRecuperare = articol[i].denumireLocRecuperare;
            if (!locRecuperare) {
                locRecuperare = EMPTY;
            }
            dataIntrare = articol[i].dataRecuperarii;
            if (dataIntrare) {
                dataIntrare = toJSDate(dataIntrare, 1);
            } else {
                dataIntrare = '<span style="color:red;">Articolul este înc? alocat</span>'
            }
            detalii = articol[i].detalii;
            detaliiRecuperare = articol[i].detaliiRecuperare;
            if (!detaliiRecuperare) {
                detaliiRecuperare = EMPTY;
            }
            historyTable += '<tr><td>' + counter + '</td><td>' + dataIesire + '</td><td>' + persoana + '</td>' +
                '<td>' + loc + '</td><td>' + detalii + '</td><td>' + locRecuperare + '</td><td>' + dataIntrare + '</td><td>' + detaliiRecuperare + '</td></tr>';

        }
    } else {
        historyTable += '<tr><td colspan="8" style="color:red; text-align: center; font-weight: bold; font-size: 14pt;">Nu sunt intr?ri în eviden?? pentru acest articol</td></tr>';
    }

    historyTable += '</tbody></table></div>';

    return historyTable;

}

function getHistory(idArticol) {
    var retVal;
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
    generateBarcode(barcode);
    // `d` is the original data object for the row
    switch (d.idStare) {
        case 1:
            stare = stari[0];
            stareIcon = 'fa-cubes';
            dataPreluare = toJSDateTime(d.creatLa);
            dataTitle = 'Added on:';
            break;
        case 2:
            stare = stari[1];
            stareIcon = 'fa-recycle';
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
            stareIcon = 'fa-thumb-tack';
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
            stareIcon = 'fa-truck';
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
            stareIcon = 'fa-bug';
            break;
        case 6:
            dataTitle = 'Atribuit la:';
            stare = '<%=StareArticol.SERVICE.getLabel()%>';
            stareIcon = 'fa-wrench';
            break;
        case 7:
            dataTitle = 'Atribuit la:';
            stare = '<%=StareArticol.DISPARUT.getLabel()%>';
            stareIcon = 'fa-exclamation-triangle';
            break;
        case 8:
            dataTitle = 'Atribuit la:';
            stare = '<%=StareArticol.CASAT.getLabel()%>';
            stareIcon = 'fa-trash';
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
        '<td><a id="history-' + barcode + '" class="btn btn-warning"><span class="fa fa-history"> &nbsp;</span> Show history</a></td>' +
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
                    "sWidth": "35px",
                    "data": "idStoc"
                },
                {"data": "numeCategorie"},
                {"data": "numeGrup"},
                {"data": "numeStoc"},
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
            dom: 'T<"clear"><"break-row">ltipr<"break-row-lg">',
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
});