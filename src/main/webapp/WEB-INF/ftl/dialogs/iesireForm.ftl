[#ftl]
[#include "../formMacros.ftl"]

<div role="tabpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#iesire-detalii" role="tab" data-toggle="tab">[@spring.message "DETAILS"/]  <span class="badge">1</span></a></li>
        <li><a href="#iesire-scaneaza" role="tab" data-toggle="tab">[@spring.message "SCANEAZA"/]  <span class="badge">2</span></a></li>
    </ul>
    <!-- Tab content -->
    <div class="tab-content">
        <div class="tab-pane fade in active" id="iesire-detalii" role="tabpanel">
        [@container]
            [@hiddenInput "iesire-form-idStoc" "idStoc" /]
            [@elementWithModalLink "modal-addPlace" "INVENTAR.ADDPLACE" "6"]
                [@embedableSelectBox "iesire-form-idLoc" "idLoc" "INVENTAR.LOC" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
                [/@embedableSelectBox]
            [/@elementWithModalLink]
            [@rowBreak/]
            [@elementWithModalLink "modal-addUser" "MODAL.ADD_USER" "6"]
                [@embedableSelectBox "iesire-form-idPersoana" "idPersoana" "INVENTAR.PERSOANA" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
                [/@embedableSelectBox]
            [/@elementWithModalLink]
            [@rowBreak/]
            [@selectBox "iesire-form-tip-iesire" "tipIesire" "INVENTAR.TIP_IESIRE" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS" "6"]
                <option value="3">Predare personal&abreve;</option>
                <option value="4">Curier</option>
            [/@selectBox]
            [@rowBreak/]
            [@textarea "iesire-form-detalii" "detalii" "MODAL.DETAILS" "MODAL.DETAILS.PLACEHOLDER" "12"/]
            [@topInfobox "iesire-infobox" "INFOBOX.IESIRE_1"/]
        [/@container]
        </div>

        <div class="tab-pane fade" id="iesire-scaneaza" role="tabpanel">
        [@scanInput "iesire-form-scan" "scan" /]
        [@container ]
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

                    <div class="input-group">
                        <input type="text" class="input-sm form-control" id="iesire-form-scan-manual" title="[@spring.message "SCANEAZA_MANUAL"/]">
                    <span class="input-group-btn">
                        <button id="button-scanare-iesire-refresh" type="button" class="btn btn-default" title="[@spring.message "SCANEAZA_CAUTA"/]"><i class="fa fa-search"></i></button>
                    </span>
                    </div>
                </div>
            </div>
            <div id="iesire-form-list-articole" class="hidden">

            </div>
        [/@container]
        </div>
    </div>
</div>
