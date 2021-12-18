<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>

    <div>
        <@l.logout/>
        <span>
            <a href="/user">
                User list
            </a>
        </span>
    </div>
    <div>
        <form action="/main" method="post">
            <label>
                <input type="text" name="text" placeholder="Введите сообщение">
            </label>
            <label>
                <input type="text" name="tag" placeholder="Введите тэг">
            </label>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Добавить сообщение</button>
        </form>
    </div>
    <div> Список сообщений</div>
    <div>
        <form action="/filter" method="get">
            <label>
                <input type="text" name="query">
            </label>
            <button type="submit">Найти</button>
        </form>
    </div>
    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
        </div>
    <#else>
        Список пуст
    </#list>
</@c.page>