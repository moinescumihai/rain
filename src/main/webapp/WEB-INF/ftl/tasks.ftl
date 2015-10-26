[#ftl]
[#import "layouts/layouts.ftl" as layout]
[#include "content.ftl"]
[@layout.basic]
    [@sidebar]
    <div>

    </div>
    [/@sidebar]
    [@content]
    <div class="row task-container"></div>
    [/@content]
[/@layout.basic]

<script src="/js/jquery-ui.min.js"></script>
<script src="/js/static/tasks.js"></script>