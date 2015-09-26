[#ftl]
[#import "layouts/layouts.ftl" as layout/]
[#include "content.ftl" /]
[#include "formMacros.ftl" /]
[@layout.basic]
    [@dashboard]
    <div class="rain-container">
        <div class="page-header">
            <span class="lead">Bine ai venit.</span>
        </div>
    </div>
    [/@dashboard]
[/@layout.basic]

<script type="text/javascript" src="/js/static/dashboard.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#dashboard').addClass('active');
    });
</script>