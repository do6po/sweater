<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="mb-1">
        Add new user
    </div>
    ${message?exists}
    <@l.login path="/registration" isRegisterForm=true />
</@c.page>