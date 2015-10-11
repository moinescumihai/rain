[#ftl]
[#include "../formMacros.ftl"]

<div role="tabpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#iesire-detalii" role="tab" data-toggle="tab">[@spring.message "DETAILS"/]</a></li>
        <li><a href="#iesire-scaneaza" role="tab" data-toggle="tab">[@spring.message "SCANEAZA"/]</a></li>
    </ul>
    <!-- Tab content -->
    <div class="tab-content">
        <div class="tab-pane fade in active" id="iesire-detalii" role="tabpanel">
        [@modalContainer]
            [@hiddenInput "iesire-form-idStoc" "idStoc" /]
            [@elementWithLink "modal-addPlace" "INVENTAR.ADDPLACE" "6"]
                [@embedableSelectBox "iesire-form-idLoc" "idLoc" "INVENTAR.LOC" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
                [/@embedableSelectBox]
            [/@elementWithLink]
            [@rowBreak/]
            [@elementWithLink "modal-addUser" "MODAL.ADD_USER" "6"]
                [@embedableSelectBox "iesire-form-idResurseUmane" "idResurseUmane" "INVENTAR.PERSOANA" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
                [/@embedableSelectBox]
            [/@elementWithLink]
            [@rowBreak/]
            [@selectBox "iesire-form-tip-iesire" "tipIesire" "INVENTAR.TIP_IESIRE" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS" "6"]
                <option value="1">Predare personal&abreve;</option>
                <option value="2">Curier</option>
            [/@selectBox]
            [@rowBreak/]
            [@textarea "iesire-form-detalii" "detalii" "MODAL.DETAILS" "MODAL.DETAILS.PLACEHOLDER" "12"/]
            [@topInfobox "iesire-infobox" "INFOBOX.IESIRE_1"/]
        [/@modalContainer]
        </div>

        <div class="tab-pane fade" id="iesire-scaneaza" role="tabpanel">
        [@scanInput "iesire-form-scan" "scan" /]
        [@modalContainer ]
            <div id="iesire-schimba-scanare" class="hidden col-md-1 schimba-scanare">
                <button id="button-iesire-schimba-scanare" type="button" class="btn btn-warning" title="[@spring.message "SCANEAZA_SCHIMBA"/]"><i class="fa fa-barcode"></i></button>
            </div>
            <div id="iesire-form-choose-scan" class="btn-group col-md-offset-2 col-md-8">
                <button id="iesire-button-scanare" type="button" class="btn btn-info col-md-6">[@spring.message "SCANEAZA"/]</button>
                <button id="iesire-button-scanare-manuala" type="button" class="btn btn-warning col-md-6">[@spring.message "SCANEAZA_MANUAL"/]</button>
            </div>
            <div id="iesire-form-scan-manual-wrapper" class="hidden row">
                <div class="col-md-offset-3 col-md-6 form-group">
                    <label for="iesire-form-scan-manual">[@spring.message "SCANEAZA_MANUAL"/]</label>
                    <input type="text" class="form-control" id="iesire-form-scan-manual" title="[@spring.message "SCANEAZA_MANUAL"/]">
                </div>
                <div class="col-md-1 form-group">
                    <button id="button-scanare-refresh" type="button" class="btn btn-info" title="[@spring.message "SCANEAZA_CAUTA"/]"><i class="fa fa-search"></i></button>
                </div>
            </div>
            <div id="iesire-form-list-articole" class="hidden">

            </div>
        [/@modalContainer]
        </div>
    </div>
</div>
