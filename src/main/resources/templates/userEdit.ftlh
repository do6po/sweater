<#import "parts/common.ftlh" as c>
<@c.page>
    User editor
    <form action="/user" method="post">
        <input type="text" name="username" value="${user.username}">
        <input type="text" name="userId" value="${user.id}">
        <#list roles as role>
            <div>
                <label for="">
                    <input
                            type="checkbox"
                            name="${role}"
                            ${user.roles?seq_contains(role)?string("checked", "")}
                    >
                    ${role}
                </label>
            </div>
        </#list>

        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit">
            Save
        </button>
    </form>
</@c.page>