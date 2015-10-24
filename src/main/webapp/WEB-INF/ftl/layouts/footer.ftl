[#ftl]
<div class="custom-footer">
    <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147; display: none;"></a>

    <p><span class="copyright">Copyright &copy; &bull;
        <span class="green">Raindrop Software&nbsp;
            <span id="an-copyright"></span>
        </span>
        <span class="version pull-right">[@spring.message "PROJECT.VERSION" /]</span>
    </p>
</div>
<form action="/logout?${_csrf.parameterName}=${_csrf.token}" method="post" id="logoutForm"></form>