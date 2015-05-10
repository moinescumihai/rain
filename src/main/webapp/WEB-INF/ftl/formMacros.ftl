[#ftl]

[#macro header text subtext="" h="3"]
<div class="page-header">
    <h${h}>${text}</h${h}>
    <h${h}>
        <small>${subtext}</small>
    </h${h}>
</div>
[/#macro]

[#macro selectBox name label placeholder="SELECT.PLACEHOLDER" noResultsText="SEARCH.NO_RESULTS" size="3"]
<div class="form-group col-md-${size}">
    <label for="${name}">[@spring.message label /]</label>
    <select data-placeholder="[@spring.message placeholder /]" data-no_results_text="[@spring.message noResultsText/]"
            class="chosen-select" id="${name}" name="${name}" title="[@spring.message label /]">
        <option></option>
        [#nested]
    </select>

    <div id="${name}-error"></div>
</div>
[/#macro]

[#macro selectBoxMulti name label placeholder="SELECT.MULTI.PLACEHOLDER" noResultsText="SEARCH.NO_RESULTS" size="3"]
<div class="form-group col-md-${size}">
    <label for="${name}">[@spring.message label /]</label>
    <select data-placeholder="[@spring.message placeholder /]" multiple data-no_results_text="[@spring.message noResultsText/]"
            class="chosen-select" id="${name}" name="${name}" title="[@spring.message label /]">
        <option></option>
        [#nested]
    </select>

    <div id="${name}-error"></div>
</div>
[/#macro]

[#macro input name label placeholder value="" size="3"]
<div class="form-group col-md-${size}">
    <label for="${name}">[@spring.message label/]</label>
    <input type="text" class="form-control input-sm" id="${name}" name="${name}" title="[@spring.message label /]" placeholder="[@spring.message placeholder /]" value="${value}">

    <div id="${name}-error"></div>
</div>
[/#macro]

[#macro textarea name label placeholder size="3"]
<div class="form-group col-md-${size}">
    <label for="${name}">[@spring.message label/]</label>
    <textarea class="form-control" id="${name}" rows="4" name="${name}" title="[@spring.message label /]" placeholder="[@spring.message placeholder /]"></textarea>

    <div id="${name}-error"></div>
</div>
[/#macro]

[#macro password name label placeholder size="3"]
<div class="form-group col-md-${size}">
    <label for="${name}">[@spring.message label/]</label>
    <input type="password" class="form-control input-sm" id="${name}" name="${name}" title="[@spring.message label /]" placeholder="[@spring.message placeholder /]">

    <div id="${name}-error"></div>
</div>
[/#macro]

[#macro checkbox name label placeholder value="" size="3"]
<div class="form-group col-md-${size}">
    <div class="checkbox">
        <label><input type="checkbox" id="${name}" name="${name}" title="[@spring.message label /]"> [@spring.message label/]</label>
    </div>
    <div id="${name}-error"></div>
</div>
[/#macro]

[#macro buttonSubmit name label type="primary" icon="cog"]
<button type="submit" id="${name}" name="${name}" title="[@spring.message label /]" class="btn btn-${type}"><i class="fa fa-${icon}">&nbsp;&nbsp;</i>[@spring.message label /]</button>
[/#macro]

[#macro button name label type="primary" icon="thumb-tack"]
<button type="button" id="${name}" name="${name}" title="[@spring.message label /]" class="btn btn-${type}"><i class="fa fa-${icon}">&nbsp;&nbsp;</i>[@spring.message label /]</button>
[/#macro]

[#macro buttonCloseModal name label type="default" icon="times"]
<button type="button" id="${name}" name="${name}" title="[@spring.message label /]" class="btn btn-${type}"><i class="fa fa-${icon}" data-dismiss="modal">&nbsp;&nbsp;</i>[@spring.message label /]
</button>
[/#macro]

[#macro form name action method="post" enctype="application/x-www-form-urlencoded" size="3"]
<div class="col-md-${size}">
    <form id="${name}" name="${name}" action="${action}" method="${method}" role="form" enctype="${enctype}" autocomplete="off">
        [#nested]
    </form>
</div>
[/#macro]

[#macro infobox name text]
<div class="well-sm infobox">
    <span class="fa fa-info-circle"></span>
    <span class="small text-justify">${text}</span>
</div>
[/#macro]