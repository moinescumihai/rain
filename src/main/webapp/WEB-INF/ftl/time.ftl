[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#include "content.ftl"]
[@layout.basic]
    [@sidebar]
    <div>

    </div>
    [/@sidebar]
    [@content]
    <div class="content-time">
        <div id='calendar'></div>
    </div>
    [/@content]
[/@layout.basic]
<script src="/plugins/fullcalendar/lib/moment.min.js"></script>
<script src="/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="/plugins/fullcalendar/lang-all.js"></script>
<script src="/js/static/time.js"></script>