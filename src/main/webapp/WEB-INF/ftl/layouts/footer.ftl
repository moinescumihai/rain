[#ftl]
<div class="custom-footer">
    <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"></a>

    <p><span class="copyright">Copyright &copy; &middot; <span class="green">Raindrop Solutions <span
            id="an-copyright"></span></span>&bull;&nbsp;<a>[@spring.messageText "APPTITLE" "Raindrop" /]</a></p>
</div>
<form action="/logout?${_csrf.parameterName}=${_csrf.token}" method="post" id="logoutForm"> </form>