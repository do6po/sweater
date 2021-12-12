<#macro login path>
    <form action="${path}" method="post">
        <label>
            Username:
            <input type="text" name="username">
        </label>
        <label>
            Password:
            <input type="password" name="password">
        </label>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">
            Войти
        </button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">
            Выйти
        </button>
    </form>
</#macro>