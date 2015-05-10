[#ftl]
<div class="custom-footer">
    <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"></a>

    <p><span class="copyright">Copyright &copy; &bull;
        <span class="green">Raindrop Solutions&nbsp;
            <span style="color:rgb(70, 70, 70);">&bull;</span>
            <span id="an-copyright"></span>
        </span>
    </p>
</div>
<form action="/logout?${_csrf.parameterName}=${_csrf.token}" method="post" id="logoutForm"></form>