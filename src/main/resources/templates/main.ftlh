<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form action="/filter" method="get" class="form-inline">
                <label>
                    <input type="text" name="query" class="form-control" value="${filter?if_exists}">
                </label>
                <button type="submit" class="btn btn-primary ml-2">
                    Найти
                </button>
            </form>
        </div>
    </div>

    <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMessageForm"
            aria-expanded="false" aria-controls="collapseMessageForm">
        Add new message
    </button>

    <div class="collapse" id="collapseMessageForm">
        <div class="form-group mt-5">
            <form action="/main" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" placeholder="Введите сообщение" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" name="tag" placeholder="Введите тэг" class="form-control">
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile" class="form-control">
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">Добавить сообщение</button>
            </form>
        </div>
    </div>

    <div class="card-group">
        <#list messages as message>
            <div class="card my-3" style="width: 18rem">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            Список пуст
        </#list>
    </div>

</@c.page>