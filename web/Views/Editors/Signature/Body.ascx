<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("signature/") %>">
    </a> <span class="hdr">请求正文中的令牌</span>
</h1>

<p class="dscr">
    当从 ONLYOFFICE 文档服务器执行 HTTP 请求时， <em>令牌</em> 被添加到参数中以验证数据。
    在向 ONLYOFFICE 文档服务器执行 HTTP 请求时，必须将 <em>令牌</em> 添加到参数中以验证数据。
</p>

<p>
    从版本 5.2 开始，可以在 <b>文档服务器</b>的正文参数中使用令牌。
    要启用它，请将配置文件中的 <em>services.CoAuthoring.token.inbox.inBody</em> 和 <em>services.CoAuthoring.token.outbox.inBody</em> 设置为 <b>true</b>。
</p>
<p>
    从版本 7.1 开始，这些参数已被弃用。
    现在,传入请求使用正文中的令牌（如果存在）。
    否则，将采用标头令牌。
    要指定接下来用于验证数据的内容，必须将 <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#services-CoAuthoring-server-tokenRequiredParams" target="_blank">services.CoAuthoring.server.tokenRequiredParams</a> 添加到 <em>local.json</em> 配置文件中。
    如果为 <b>true</b>，则仅使用令牌数据。否则，打开的请求部分与令牌数据合并。
</p>
<p>
    传出请求同时使用正文中的令牌和标头中的令牌。它们可以不同。
    例如，由于标头中令牌的大小限制，可以从标头令牌中删除有关版本历史的信息。
</p>

<div class="note">
    正文中的令牌仅用于 POST 请求。
    对于 GET 请求，使用 <a href="<%= Url.Action("signature/request") %>">标头中的令牌</a>。
</div>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col style="width: 300px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 100px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>参数</td>
            <td>描述</td>
            <td>类型</td>
            <td>示例</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.inbox.inBody
            </td>
            <td>
                指定在 <b>文档命令服务</b>、 <b>文档转换服务</b> 和 <b>文档生成器服务</b>的请求正文中启用令牌验证。
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.outbox.inBody</td>
            <td>
                指定通过 <b>文档编辑服务</b> 到 <b>文档存储服务</b>为请求正文启用令牌生成。
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>JSON Web 令牌的 <em>有效负载</em> 包含请求正文参数。</p>

<h2>传入请求</h2>

<ul>
    <li>
        <p><b id="command" class="copy-link">请求接收已编辑文档的状态</b></p>
        <p>使用从 <b>文档存储服务</b> 到 <a href="<%= Url.Action("command") %>">文档命令服务</a>的命令对传入请求执行验证。</p>

        <div class="header-gray">示例参数，用于请求接收编辑文档状态</div>
        <pre>
{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}
</pre>

        <p>这些参数必须编码到令牌中，以便请求看起来像这样：</p>

        <div class="header-gray">示例，用于请求接收已编辑文档的状态</div>
        <pre>
POST coauthoring/CommandService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiaW5mbyIsImtleSI6IktoaXJ6NnpUUGRmZDcifQ.r_6sThjFABsHMNHhkVdHDSz4jwkbXRQNYdvawkBGJgg"
}
</pre>

        <p>如您所见，不需要将上述参数包含在请求正文中，因为它们都已编码到令牌中并在其中发送。</p>
    </li>
    <li>
        <p><b id="conversion" class="copy-link">请求转换文档</b></p>
        <p>使用从 <b>文档存储服务</b> 到 <a href="<%= Url.Action("conversionapi") %>">文档转换服务</a>的命令对传入请求执行验证。</p>

        <div class="header-gray">请求转换文档的示例参数</div>
        <pre>
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
        <div class="header-gray">请求转换文档示例</div>
        <pre>
POST ConvertService.ashx HTTP/1.1
Host: documentserver
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmaWxldHlwZSI6ImRvY3giLCJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwib3V0cHV0dHlwZSI6InBkZiIsInRpdGxlIjoiRXhhbXBsZSBEb2N1bWVudCBUaXRsZS5kb2N4IiwidXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3VybC10by1leGFtcGxlLWRvY3VtZW50LmRvY3gifQ.U-YAfuuy7clWjn-xOncfJ-sxVG5DlcYn0AOzJYkoR0M"
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>
    </li>
    <li>
        <p><b id="builder" class="copy-link">请求文档生成器服务</b></p>
        <p>使用从 <b>文档存储服务</b> 到 <a href="<%= Url.Action("documentbuilderapi") %>">文档生成器服务</a>的命令对传入请求执行验证。</p>

        <div class="header-gray">请求文档生成器服务的示例参数</div>
        <pre>
{
    "async": true,
    "url": "https://example.com/url-to-example-script.docbuilder"
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

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhc3luYyI6dHJ1ZSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1zY3JpcHQuZG9jYnVpbGRlciJ9.dzoTbRzSMa95Fpg34CjnF3ZUPdGA2CnBedFL_qOOxAs"
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

        <div class="header-gray">当最后一个用户关闭编辑的没有更改的文档时，文档编辑服务对"callbackUrl"地址发送的请求示例参数</div>
        <pre>
{
    "key": "Khirz6zTPdfd7",
    "status": 4
}
</pre>
        <div class="header-gray">当最后一个用户关闭编辑的没有更改的文档时，文档编辑服务对"callbackUrl"地址的请求示例</div>
        <pre>
POST url-to-callback.ashx HTTP/1.1
Host: example.com
Content-Type: application/json

{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJLaGlyejZ6VFBkZmQ3Iiwic3RhdHVzIjo0fQ.gCyNKPpg6ISAnhvFQmRiY6BRqG6WPcEGgnK79hREdkU"
}
</pre>
        <p>
            其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
            有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
        </p>

        <p>当从 ONLYOFFICE 文档服务器执行 GET 请求时，会添加带有令牌的 <a href="<%= Url.Action("signature/request") %>">授权标头</a>。</p>
    </li>
</ul>
