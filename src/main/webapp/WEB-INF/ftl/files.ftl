[#ftl]
[#import "layouts/layouts.ftl" as layout/]
[#include "content.ftl"/]
[@layout.basic]
    [@sidebar]
    <div>

    </div>
    [/@sidebar]
    [@content]
    <div></div>
    <form action="/file-upload"
          class="dropzone"
          id="file-dropzone"></form>
    [/@content]
[/@layout.basic]
<script type="text/javascript">
    $(document).ready(function(){
        $('#files').addClass('active');
    });
</script>