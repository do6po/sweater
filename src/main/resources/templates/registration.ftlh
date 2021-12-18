<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    Add new user
    ${message?exists}
    <@l.login path="/registration"/>
</@c.page>