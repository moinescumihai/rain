[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#include "content.ftl"]
[@layout.basic]
    [@sidebar]
    <div>

    </div>
    [/@sidebar]
    [@content]
    <div class="content-hr"><!--main content start-->
        <section id="main-content">
            <section class="wrapper site-min-height">
                <!-- page start-->
                <div class="hr-header">
                    <ul class="directory-list" role="tablist">
                        <li role="presentation"><a href="#toti" aria-controls="toti" role="tab" data-toggle="tab">[@spring.message "TOTI"/]</a></li>
                        [#list 1..26 as n]
                            [@userTabs "${n?lower_abc}" /]
                        [/#list]
                    </ul>
                </div>
                <div class="directory-info-row tab-content">
                    <div role="tabpanel" class="tab-pane fade in active" id="toti"></div>
                    [#list 1..26 as n]
                        [@userTabContent "${n?lower_abc}" /]
                    [/#list]
                </div>
                <!-- page end-->
            </section>
        </section>
        <!--main content end--></div>
    [/@content]
[/@layout.basic]
<script src="/js/static/hr.js"></script>

[#macro userTabs letter]
<li role="presentation"><a href="#${letter}" aria-controls="${letter}" role="tab" data-toggle="tab">${letter}</a></li>
[/#macro]

[#macro userTabContent letter]
<div role="tabpanel" class="tab-pane fade" id="${letter}">
    <div class="well">
        <span class="lead">[@spring.message "NO_USERS_STARTING_WITH"/] <kbd>${letter}</kbd></span>
    </div>
</div>
[/#macro]
