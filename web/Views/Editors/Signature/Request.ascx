<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>"></a>
    <span class="hdr">标头中带有令牌的请求</span>
</h1>

<p class="dscr">
    当从 ONLYOFFICE 文档服务器执行 HTTP 请求时，会添加带有 <em>令牌</em> 的授权标头以验证请求。
    在向 ONLYOFFICE 文档服务器执行 HTTP 请求时，必须添加带有 <em>令牌</em> 的授权标头以验证请求。
</p>

<p>JSON Web 令牌的 <em>有效负载</em> 包含以下字段：</p>
<ul>
    <li><b>payload</b> - 如果不为空，则包含 JSON 格式的请求正文参数的对象。</li>
</ul>


<h2>传入请求</h2>

<ul>
    <li>
        <p><b id="command" class="copy-link">请求接收已编辑文档的状态</b></p>
        <p>使用从 <b>文档存储服务</b> 到 <a href="<%= Url.Action("command") %>">文档命令服务</a>的命令对传入请求执行验证。</p>

        <div class="header-gray">有效负载示例，用于请求接收已编辑文档状态</div>
        <pre>
{
    "payload": {
        "c": "info",
        "key": "Khirz6zTPdfd7"
    }
}
</pre>
        <div class="header-gray">请求接收已编辑文档的状态的示例</div>
        <pre>
POST coauthoring/CommandService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImMiOiJpbmZvIiwia2V5IjoiS2hpcno2elRQZGZkNyJ9fQ.hGQ8kquQWpg4MQYiSYaIzik0wotP1coAop6QfLruenA

{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}
</pre>
    </li>
    <li>
        <p><b id="conversion" class="copy-link">请求转换文档</b></p>
        <p>对从 <b>文档存储服务</b> 到 <a href="<%= Url.Action("conversionapi") %>">文档转换服务</a>的传入请求执行验证。</p>

        <div class="header-gray">有效负载示例，用于请求接收已编辑的文档状态</div>
        <pre>
{
    "payload": {
        "filetype": "docx",
        "key": "Khirz6zTPdfd7",
        "outputtype": "pdf",
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx"
    }
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>
        <div class="header-gray">请求转换文档示例</div>
        <pre>
POST ConvertService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImZpbGV0eXBlIjoiZG9jeCIsImtleSI6IktoaXJ6NnpUUGRmZDciLCJvdXRwdXR0eXBlIjoicGRmIiwidGl0bGUiOiJFeGFtcGxlIERvY3VtZW50IFRpdGxlLmRvY3giLCJ1cmwiOiJodHRwOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQuZG9jeCJ9fQ.Ec50Gvafu4niR2I1LPgETn1jkvvs1wKm0YeeI1RbRQs

{
    "filetype": "docx",
    "key": "Khirz6zTPdfd7",
    "outputtype": "pdf",
    "title": "Example Document Title.docx",
    "url": "https://example.com/url-to-example-document.docx"
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>
    </li>
    <li>
        <p><b id="builder" class="copy-link">请求文档生成器服务</b></p>
        <p>对从 <b>文档存储服务</b> 到 <a href="<%= Url.Action("documentbuilderapi") %>">文档生成服务</a>的传入请求执行验证。</p>

        <div class="header-gray">请求转换文档的有效负载示例</div>
        <pre>
{
    "payload": {
        "async": true,
        "url": "https://example.com/url-to-example-script.docbuilder"
    }
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
        </p>
        <div class="header-gray">文档生成器服务请求示例</div>
        <pre>
POST docbuilder HTTP/1.1
Host: documentserver
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImFzeW5jIjp0cnVlLCJ1cmwiOiJodHRwczovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLXNjcmlwdC5kb2NidWlsZGVyIn19.JpHp_TB3XDacAhTTB4I0CE7SIESSE9aQUGDulbpYKTE

{
    "async": true,
    "url": "https://example.com/url-to-example-script.docbuilder"
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
        </p>
    </li>
</ul>

<h2>传出请求</h2>

<ul>
    <li>
        <p><b id="callbackUrl" class="copy-link">当最后一个用户关闭编辑的没有更改的文档时，文档编辑服务向"callbackUrl"地址发送请求</b></p>
        <p><b>文档编辑服务</b>对发往"<a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>"地址的传出请求进行验证。</p>

        <div class="header-gray">当最后一个用户关闭编辑的没有更改的文档时，文档编辑服务对"callbackUrl"地址的请求的有效负载示例</div>
        <pre>
{
    "payload": {
        "key": "Khirz6zTPdfd7",
        "status": 4
    }
}
</pre>
        <div class="header-gray">当最后一个用户关闭编辑的没有更改的文档时，文档编辑服务对"callbackUrl"地址的请求示例</div>
        <pre>
POST url-to-callback.ashx HTTP/1.1
Host: example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImtleSI6IktoaXJ6NnpUUGRmZDciLCJzdGF0dXMiOjR9fQ.MfVoGT-aYuPJfjQAaxwBv7-CqBylDae2AF9K5TpLf-E

{
    "key": "Khirz6zTPdfd7",
    "status": 4
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>
    </li>
    <li>
        <p><b id="download" class="copy-link">请求文件存储服务以进行文件下载</b></p>
        <p>为 <b>文件存储服务</b> 的传出请求执行验证，用于进行文件下载。</p>

        <div class="header-gray">请求文件存储服务以进行文件下载的有效负载示例</div>
        <pre>
{
    "payload": {
        "url": "https://example.com/url-to-example-document.docx"
    }
}
</pre>
        <div class="header-gray">文件下载请求文件存储服务示例</div>
        <pre>
GET url-to-example-document.docx HTTP/1.1
Host: example.com
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWV4YW1wbGUtZG9jdW1lbnQuZG9jeCJ9fQ.DnhdBVtn8sFo9Adfl6GuT_v53NVV5cQ0Vi9c8xRzrjs
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>
        <p>令牌包括有效负载（文档的完整 URL，在上面的示例中是 <em>{"url: "http://example.com/url-to-example-document.docx"}</em>），它也在标头作为 <b>主机</b> (<em>example.com</em>) 和 GET 请求发送到的文档地址 (<em>url-to-example-document.docx</em>)。</p>
    </li>
    <li>
        <p><b id="file-changes" class="copy-link">请求文件存储服务以进行文件更改数据下载</b></p>
        <p>对 <b>文档存储服务</b> 的传出请求执行验证，用于文档更改数据下载。</p>

        <div class="header-gray">对文档存储服务的请求的有效负载示例，用于文档更改数据下载</div>
        <pre>
{
    "payload": {
        "url": "https://example.com/url-to-document-changes.zip"
    }
}
</pre>
        <div class="header-gray">对文档存储服务的请求的示例负载，用于文档更改数据下载</div>
        <pre>
GET url-to-changes.zip HTTP/1.1
Host: example.com
Content-Type: application/json
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InVybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20vdXJsLXRvLWRvY3VtZW50LWNoYW5nZXMuemlwIn19.4CJ4F8x7VDMW72ss9VnIYGIwjRpBMYBBRXZ5aX2r2Y4
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。</p>
        <p>
            令牌包括有效负载（文档的完整 URL，在上面的示例中为 <em>{"url: "http://example.com/url-to-document-changes.zip"</em>），它也在标头作为 <b>主机</b> (<em>example.com</em>) 和 GET 请求发送到的文档地址 (<em>url-to-document-changes.zip</em>)。</p>
    </li>
</ul>
