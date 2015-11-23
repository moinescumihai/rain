[#ftl]
[#include "../formMacros.ftl"]

<div role="tabpanel">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#intrare-detalii" role="tab" data-toggle="tab">[@spring.message "DETAILS"/]  <span class="badge">1</span></a></li>
        <li><a href="#intrare-scaneaza" role="tab" data-toggle="tab">[@spring.message "SCANEAZA"/]  <span class="badge">2</span></a></li>
    </ul>
    <!-- Tab content -->
    <div class="tab-content">
        <div class="tab-pane fade in active" id="intrare-detalii" role="tabpanel">
        [@modalContainer]
            [@hiddenInput "intrare-form-idStoc" "idStoc" /]
            [@elementWithModalLink "modal-addPlace" "INVENTAR.ADDPLACE" "6"]
            [@embedableSelectBox "intrare-form-idLoc" "idLoc" "INVENTAR.LOC" "SELECT.PLACEHOLDER" "SEARCH.NO_RESULTS"]
            [/@embedableSelectBox]
        [/@elementWithModalLink]
            [@rowBreak/]
            [@textarea "intrare-form-detalii" "detalii" "MODAL.DETAILS" "MODAL.DETAILS.PLACEHOLDER" "12"/]
            [@topInfobox "intrare-infobox" "INFOBOX.INTRARE"/]
        [/@modalContainer]
        </div>

        <div class="tab-pane fade" id="intrare-scaneaza" role="tabpanel">
        [@scanInput "intrare-form-scan" "scan" /]
        [@modalContainer ]
            <div id="intrare-schimba-scanare" class="hidden col-md-1 schimba-scanare">
                <button id="button-intrare-schimba-scanare" type="button" class="btn btn-warning" title="[@spring.message "SCANEAZA_SCHIMBA"/]"><i class="fa fa-barcode"></i></button>
            </div>
            <div id="intrare-form-choose-scan" class="btn-group col-md-offset-2 col-md-8">
                <button id="intrare-button-scanare" type="button" class="btn btn-info col-md-6">[@spring.message "SCANEAZA"/]</button>
                <button id="intrare-button-scanare-manuala" type="button" class="btn btn-warning col-md-6">[@spring.message "SCANEAZA_MANUAL"/]</button>
            </div>
            <div id="intrare-form-scan-manual-wrapper" class="hidden row">
                <div class="col-md-offset-3 col-md-6 form-group">
                    <label for="intrare-form-scan-manual">[@spring.message "SCANEAZA_MANUAL"/]</label>

                    <div class="input-group">
                        <input type="text" class="input-sm form-control" id="intrare-form-scan-manual" title="[@spring.message "SCANEAZA_MANUAL"/]">
                    <span class="input-group-btn">
                        <button id="button-scanare-intrare-refresh" type="button" class="btn btn-default" title="[@spring.message "SCANEAZA_CAUTA"/]"><i class="fa fa-search"></i></button>
                    </span>
                    </div>
                </div>
            </div>
            <div id="intrare-form-list-articole" class="hidden">

            </div>
        [/@modalContainer]
        </div>
    </div>
</div>
