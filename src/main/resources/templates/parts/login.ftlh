<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row pb-2">
            <label class="col-sm-2 col-form-label">
                Username:
            </label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Username">
            </div>
        </div>
        <div class="form-group row pb-2">
            <label class="col-sm-2 col-form-label">
                Password:
            </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if !isRegisterForm>
            <a href="/registration">
                <#if isRegisterForm>
                    Create
                <#else>
                    Sign in
                </#if>
            </a>
        </#if>
        <button type="submit" class="btn btn-primary">
            Войти
        </button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">
            Выйти
        </button>
    </form>
</#macro>