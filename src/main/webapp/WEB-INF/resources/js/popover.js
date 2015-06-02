/*
 *  webui popover plugin  - v1.1.3
 *  A lightWeight popover plugin with jquery ,enchance the  popover plugin of bootstrap with some awesome new features. It works well with bootstrap ,but bootstrap is not necessary!
 *  https://github.com/sandywalker/webui-popover
 *
 *  Made by Sandy Duan
 *  Under MIT License
 */
!function(a,b,c){function d(b,c){this.$element=a(b),c&&("string"===a.type(c.delay)||"number"===a.type(c.delay))&&(c.delay={show:c.delay,hide:c.delay}),this.options=a.extend({},h,c),this._defaults=h,this._name=e,this._targetclick=!1,this.init()}var e="webuiPopover",f="webui-popover",g="webui.popover",h={placement:"auto",width:"auto",height:"auto",trigger:"click",style:"",delay:{show:null,hide:null},async:{before:null,success:null},cache:!0,multi:!1,arrow:!0,title:"",content:"",closeable:!1,padding:!0,url:"",type:"html",constrains:null,animation:null,template:'<div class="webui-popover"><div class="arrow"></div><div class="webui-popover-inner"><a href="#" class="close">x</a><h3 class="webui-popover-title"></h3><div class="webui-popover-content"><i class="icon-refresh"></i> <p>&nbsp;</p></div></div></div>'},i=0;d.prototype={init:function(){"click"===this.getTrigger()?this.$element.off("click").on("click",a.proxy(this.toggle,this)):"hover"===this.getTrigger()&&this.$element.off("mouseenter mouseleave click").on("mouseenter",a.proxy(this.mouseenterHandler,this)).on("mouseleave",a.proxy(this.mouseleaveHandler,this)).on("click",function(a){a.stopPropagation()}),this._poped=!1,this._inited=!0,this._idSeed=i,i++},destroy:function(){this.hide(),this.$element.data("plugin_"+e,null),"click"===this.getTrigger()?this.$element.off("click"):"hover"===this.getTrigger()&&this.$element.off("mouseenter mouseleave"),this.$target&&this.$target.remove()},hide:function(b){b&&(b.preventDefault(),b.stopPropagation()),this.xhr&&(this.xhr.abort(),this.xhr=null);var c=a.Event("hide."+g);this.$element.trigger(c),this.$target&&this.$target.removeClass("in").hide(),this.$element.trigger("hidden."+g)},toggle:function(a){a&&(a.preventDefault(),a.stopPropagation()),this[this.getTarget().hasClass("in")?"hide":"show"]()},hideAll:function(){a("div.webui-popover").not(".webui-popover-fixed").removeClass("in").hide()},show:function(){var a=this.getTarget().removeClass().addClass(f);if(this.options.multi||this.hideAll(),!this.getCache()||!this._poped||""===this.content){if(this.content="",this.setTitle(this.getTitle()),this.options.closeable||a.find(".close").off("click").remove(),this.isAsync())return this.setContentASync(this.options.content),void this.displayContent();this.setContent(this.getContent()),a.show()}this.displayContent(),this.bindBodyEvents()},displayContent:function(){var b=this.getElementPosition(),d=this.getTarget().removeClass().addClass(f),e=this.getContentElement(),h=d[0].offsetWidth,i=d[0].offsetHeight,j="bottom",k=a.Event("show."+g);this.$element.trigger(k),"auto"!==this.options.width&&d.width(this.options.width),"auto"!==this.options.height&&e.height(this.options.height),this.options.arrow||d.find(".arrow").remove(),d.remove().css({top:-2e3,left:-2e3,display:"block"}),this.getAnimation()&&d.addClass(this.getAnimation()),d.appendTo(c.body),h=d[0].offsetWidth,i=d[0].offsetHeight,j=this.getPlacement(b),this.initTargetEvents();var l=this.getTargetPositin(b,j,h,i);if(this.$target.css(l.position).addClass(j).addClass("in"),"iframe"===this.options.type){var m=d.find("iframe");m.width(d.width()).height(m.parent().height())}if(this.options.style&&this.$target.addClass(f+"-"+this.options.style),this.options.padding||(e.css("height",e.outerHeight()),this.$target.addClass("webui-no-padding")),this.options.arrow||this.$target.css({margin:0}),this.options.arrow){var n=this.$target.find(".arrow");n.removeAttr("style"),l.arrowOffset&&n.css(l.arrowOffset)}this._poped=!0,this.$element.trigger("shown."+g)},isTargetLoaded:function(){return 0===this.getTarget().find("i.glyphicon-refresh").length},getTriggerElement:function(){return this.$element},getTarget:function(){if(!this.$target){var b=e+this._idSeed;this.$target=a(this.options.template).attr("id",b).data("trigger-element",this.getTriggerElement()),this.getTriggerElement().attr("data-target",b)}return this.$target},getTitleElement:function(){return this.getTarget().find("."+f+"-title")},getContentElement:function(){return this.getTarget().find("."+f+"-content")},getTitle:function(){return this.$element.attr("data-title")||this.options.title||this.$element.attr("title")},getUrl:function(){return this.$element.attr("data-url")||this.options.url},getCache:function(){var a=this.$element.attr("data-cache");if("undefined"!=typeof a)switch(a.toLowerCase()){case"true":case"yes":case"1":return!0;case"false":case"no":case"0":return!1}return this.options.cache},getTrigger:function(){return this.$element.attr("data-trigger")||this.options.trigger},getDelayShow:function(){var a=this.$element.attr("data-delay-show");return"undefined"!=typeof a?a:0===this.options.delay.show?0:this.options.delay.show||100},getHideDelay:function(){var a=this.$element.attr("data-delay-hide");return"undefined"!=typeof a?a:0===this.options.delay.hide?0:this.options.delay.hide||100},getConstrains:function(){var a=this.$element.attr("data-contrains");return"undefined"!=typeof a?a:this.options.constrains},getAnimation:function(){var a=this.$element.attr("data-animation");return a||this.options.animation},setTitle:function(a){var b=this.getTitleElement();a?b.html(a):b.remove()},hasContent:function(){return this.getContent()},getContent:function(){if(this.getUrl())"iframe"===this.options.type&&(this.content=a('<iframe frameborder="0"></iframe>').attr("src",this.getUrl()));else if(!this.content){var b="";b=a.isFunction(this.options.content)?this.options.content.apply(this.$element[0],arguments):this.options.content,this.content=this.$element.attr("data-content")||b}return this.content},setContent:function(a){var b=this.getTarget();this.getContentElement().html(a),this.$target=b},isAsync:function(){return"async"===this.options.type},setContentASync:function(b){var c=this;this.xhr=a.ajax({url:this.getUrl(),type:"GET",cache:this.getCache(),beforeSend:function(a){c.options.async.before&&c.options.async.before(c,a)},success:function(d){c.bindBodyEvents(),c.content=b&&a.isFunction(b)?b.apply(c.$element[0],[d]):d,c.setContent(c.content);var e=c.getContentElement();e.removeAttr("style"),c.displayContent(),c.options.async.success&&c.options.async.success(c,d),this.xhr=null}})},bindBodyEvents:function(){a("body").off("keyup.webui-popover").on("keyup.webui-popover",a.proxy(this.escapeHandler,this)),a("body").off("click.webui-popover").on("click.webui-popover",a.proxy(this.bodyClickHandler,this))},mouseenterHandler:function(){var a=this;a._timeout&&clearTimeout(a._timeout),a._enterTimeout=setTimeout(function(){a.getTarget().is(":visible")||a.show()},this.getDelayShow())},mouseleaveHandler:function(){var a=this;clearTimeout(a._enterTimeout),a._timeout=setTimeout(function(){a.hide()},this.getHideDelay())},escapeHandler:function(a){27===a.keyCode&&this.hideAll()},bodyClickHandler:function(){"click"===this.getTrigger()&&(this._targetclick?this._targetclick=!1:this.hideAll())},targetClickHandler:function(){this._targetclick=!0},initTargetEvents:function(){"hover"===this.getTrigger()&&this.$target.off("mouseenter mouseleave").on("mouseenter",a.proxy(this.mouseenterHandler,this)).on("mouseleave",a.proxy(this.mouseleaveHandler,this)),this.$target.find(".close").off("click").on("click",a.proxy(this.hide,this)),this.$target.off("click.webui-popover").on("click.webui-popover",a.proxy(this.targetClickHandler,this))},getPlacement:function(a){var b,d=c.documentElement,e=c.body,f=d.clientWidth,g=d.clientHeight,h=Math.max(e.scrollTop,d.scrollTop),i=Math.max(e.scrollLeft,d.scrollLeft),j=Math.max(0,a.left-i),k=Math.max(0,a.top-h);if(b="function"==typeof this.options.placement?this.options.placement.call(this,this.getTarget()[0],this.$element[0]):this.$element.data("placement")||this.options.placement,"auto"===b){var l="horizontal"===this.getConstrains(),m="vertical"===this.getConstrains();b=f/3>j?g/3>k?l?"right-bottom":"bottom-right":2*g/3>k?m?g/2>=k?"bottom-right":"top-right":"right":l?"right-top":"top-right":2*f/3>j?g/3>k?l?f/2>=j?"right-bottom":"left-bottom":"bottom":2*g/3>k?l?f/2>=j?"right":"left":g/2>=k?"bottom":"top":l?f/2>=j?"right-top":"left-top":"top":g/3>k?l?"left-bottom":"bottom-left":2*g/3>k?m?g/2>=k?"bottom-left":"top-left":"left":l?"left-top":"top-left"}else"auto-top"===b?b=f/3>j?"top-right":2*g/3>j?"top":"top-left":"auto-bottom"===b?b=f/3>j?"bottom-right":2*g/3>j?"bottom":"bottom-left":"auto-left"===b?b=g/3>k?"left-top":2*g/3>k?"left":"left-bottom":"auto-right"===b&&(b=g/3>k?"right-top":2*g/3>k?"right":"right-bottom");return b},getElementPosition:function(){return a.extend({},this.$element.offset(),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight})},getTargetPositin:function(a,b,c,d){var e=a,f=this.$element.outerWidth(),g=this.$element.outerHeight(),h={},i=null,j=this.options.arrow?20:0,k=j+10>f?j:0,l=j+10>g?j:0;switch(b){case"bottom":h={top:e.top+e.height,left:e.left+e.width/2-c/2};break;case"top":h={top:e.top-d,left:e.left+e.width/2-c/2};break;case"left":h={top:e.top+e.height/2-d/2,left:e.left-c};break;case"right":h={top:e.top+e.height/2-d/2,left:e.left+e.width};break;case"top-right":h={top:e.top-d,left:e.left-k},i={left:Math.min(f,c)/2+k};break;case"top-left":h={top:e.top-d,left:e.left-c+e.width+k},i={left:c-Math.min(f,c)/2-k};break;case"bottom-right":h={top:e.top+e.height,left:e.left-k},i={left:Math.min(f,c)/2+k};break;case"bottom-left":h={top:e.top+e.height,left:e.left-c+e.width+k},i={left:c-Math.min(f,c)/2-k};break;case"right-top":h={top:e.top-d+e.height+l,left:e.left+e.width},i={top:d-Math.min(g,d)/2-l};break;case"right-bottom":h={top:e.top-l,left:e.left+e.width},i={top:Math.min(g,d)/2+l};break;case"left-top":h={top:e.top-d+e.height+l,left:e.left-c},i={top:d-Math.min(g,d)/2-l};break;case"left-bottom":h={top:e.top-l,left:e.left-c},i={top:Math.min(g,d)/2+l}}return{position:h,arrowOffset:i}}},a.fn[e]=function(b){return this.each(function(){var c=a.data(this,"plugin_"+e);c?"destroy"===b?c.destroy():"string"==typeof b&&c[b]():(b?"string"==typeof b?"destroy"!==b&&(c=new d(this,null),c[b]()):"object"==typeof b&&(c=new d(this,b)):c=new d(this,null),a.data(this,"plugin_"+e,c))})}}(jQuery,window,document);