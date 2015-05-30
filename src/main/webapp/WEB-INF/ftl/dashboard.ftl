[#ftl]
[#import "layouts/layouts.ftl" as layout/]
[#include "content.ftl" /]
[#include "formMacros.ftl" /]
[@layout.basic]
    [@dashboard]
    <div class="container wrapper">
        <div class="col-lg-6 col-md-6 col-sm-6">
            <!--timeline start-->
            <section class="panel">
                <div class="panel-body">
                    <div class="text-center mbot30">
                        <h3 class="timeline-title">Timeline</h3>

                        <p class="t-info">This is a project timeline</p>
                    </div>

                    <div class="timeline">
                        <article class="timeline-item">
                            <div class="timeline-desk">
                                <div class="panel">
                                    <div class="panel-body">
                                        <span class="arrow"></span>
                                        <span class="timeline-icon red"></span>
                                        <span class="timeline-date">08:25 am</span>

                                        <h1 class="red">12 July | Sunday</h1>

                                        <p>Lorem ipsum dolor sit amet consiquest dio</p>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="timeline-item alt">
                            <div class="timeline-desk">
                                <div class="panel">
                                    <div class="panel-body">
                                        <span class="arrow-alt"></span>
                                        <span class="timeline-icon green"></span>
                                        <span class="timeline-date">10:00 am</span>

                                        <h1 class="green">10 July | Wednesday</h1>

                                        <p><a href="#">Jonathan Smith</a> added new milestone <span><a href="#" class="green">ERP</a></span></p>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="timeline-item">
                            <div class="timeline-desk">
                                <div class="panel">
                                    <div class="panel-body">
                                        <span class="arrow"></span>
                                        <span class="timeline-icon blue"></span>
                                        <span class="timeline-date">11:35 am</span>

                                        <h1 class="blue">05 July | Monday</h1>

                                        <p><a href="#">Anjelina Joli</a> added new album <span><a href="#" class="blue">PARTY TIME</a></span></p>

                                        <div class="album">
                                            <a href="#">
                                                <img alt="" src="img/sm-img-1.jpg">
                                            </a>
                                            <a href="#">
                                                <img alt="" src="img/sm-img-2.jpg">
                                            </a>
                                            <a href="#">
                                                <img alt="" src="img/sm-img-3.jpg">
                                            </a>
                                            <a href="#">
                                                <img alt="" src="img/sm-img-1.jpg">
                                            </a>
                                            <a href="#">
                                                <img alt="" src="img/sm-img-2.jpg">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="timeline-item alt">
                            <div class="timeline-desk">
                                <div class="panel">
                                    <div class="panel-body">
                                        <span class="arrow-alt"></span>
                                        <span class="timeline-icon purple"></span>
                                        <span class="timeline-date">3:20 pm</span>

                                        <h1 class="purple">29 June | Saturday</h1>

                                        <p>Lorem ipsum dolor sit amet consiquest dio</p>

                                        <div class="notification">
                                            <i class=" fa fa-exclamation-sign"></i> New task added for <a href="#">Denial Collins</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <article class="timeline-item">
                            <div class="timeline-desk">
                                <div class="panel">
                                    <div class="panel-body">
                                        <span class="arrow"></span>
                                        <span class="timeline-icon light-green"></span>
                                        <span class="timeline-date">07:49 pm</span>

                                        <h1 class="light-green">10 June | Friday</h1>

                                        <p><a href="#">Jonatha Smith</a> added new milestone <span><a href="#" class="light-green">prank</a></span> Lorem ipsum dolor sit amet consiquest dio</p>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </div>

                    <div class="clearfix">&nbsp;</div>
                </div>
            </section>
        </div>
    </div>
    [/@dashboard]
[/@layout.basic]
<script type="text/javascript">
    $(document).ready(function () {
        $('#dashboard').addClass('active');
    });
</script>