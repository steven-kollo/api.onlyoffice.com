<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Web 文档生成器 API
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Web 文档生成器 API</span>
    </h1>

    <p class="dscr">
        对于与 <b>Web 文档生成器服务</b> 的交互，使用 POST 请求。
        请求参数在请求正文中以 JSON 格式输入。
        请求被发送到 <span class="fakelink">https://documentserver/docbuilder</span> 地址，其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档服务器的服务器的名称。
    </p>

    <h2>参数及其说明：</h2>
    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>参数</td>
                <td>描述</td>
                <td>类型</td>
                <td>出现</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="async" class="copy-link">async</td>
                <td>定义对 <b>文档生成器服务</b>的请求类型：异步与否。<br />
                    支持的值：
                    <ul>
                        <li><b>true</b></li>
                        <li><b>false</b></li>
                    </ul>
                    使用异步请求类型时，响应立即形成。
                    在这种情况下，要获得结果，必须在不更改参数的情况下发送请求，直到文档生成完成。
                    默认值为 <b>false</b>。
                </td>
                <td>boolean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="key" class="copy-link">key</td>
                <td>定义用于明确标识请求的请求标识符。
                    key在 <b>文档生成器服务</b> 端形成，并作为对第一个请求的响应返回。
                    当使用异步请求时（<em>async</em> 参数设置为 <b>true</b>），key不存在于第一个请求中，但必须存在于将在文档生成完成之前发送的所有后续请求中。
                    使用同步请求时（ <em>async</em> 参数设置为 <b>false</b>），不需要该参数。
                </td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="token" class="copy-link">token</td>
                <td>以 <a href="<%= Url.Action("signature/body") %>#builder">令牌</a>的形式定义添加到 <b>文档服务器</b> 配置的加密签名。</td>
                <td>string</td>
                <td>配置要求</td>
            </tr>
            <tr class="tablerow">
                <td id="url" class="copy-link">url</td>
                <td>定义 .docbuilder 文件的绝对 URL。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <p>
        <em>.docbuilder</em> 文件包含用于生成输出文档文件（文本文档、电子表格或演示文稿）的脚本，指定输出文件格式和名称。
        一旦文档生成准备就绪后，将返回带有结果文件绝对 URL 的响应（见下文）。
    </p>

    <div class="note">
        请注意， <em>.docbuilder</em> 脚本文件可以包含多个输出文件。
        文件生成完成后，它们的 URL 将在请求响应中返回。
    </div>

    <p>
        您可以在 <a href="<%= Url.Action("integrationapi/usingdocbuilderfile", "DocBuilder") %>">此处</a> 找到有关 <em>.docbuilder</em> 文件语法的更多信息。
        请阅读 <b>ONLYOFFICE Document Builder</b> <a href="<%= Url.Action("gettingstarted", "DocBuilder") %>">API 文档</a> ，了解有关使用哪些类和方法在 <em>.docbuilder</em> 文件的帮助下生成文档的详细信息。
    </p>

    <div id="sample-sync-first" class="header-gray copy-link">发送到 <b>文档生成器服务</b> 的 JSON 对象示例，用于第一个异步请求</div>
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

    <div class="header-gray">响应格式</div>
    <pre>
{
   "key": "af86C7e71Ca8",
   "end": false
}
</pre>

    <div id="sample-sync-next" class="header-gray copy-link">发送到 <b>文档生成器服务</b> 的JSON对象示例，用于接下来的异步请求</div>
    <pre>
{
    "async": true,
    "key": "Khirz6zTPdfd7"
}
</pre>


    <div class="header-gray">响应格式</div>
    <pre>
{
   "key": "Khirz6zTPdfd7",
   "urls": {
      "SampleText.docx": "https://documentserver/SampleText.docx",
      "SampleText2.docx": "https://documentserver/SampleText2.docx"
   },
   "end": true
}
</pre>

    <div id="sample-async" class="header-gray copy-link">发送到 <b>文档生成器服务</b> 的JSON对象示例，用于同步请求</div>
    <pre>
{
    "async": false,
    "url": "https://example.com/url-to-example-script.docbuilder"
}
</pre>
    <p>
        其中 <b>example.com</b> 是安装 <b>文档存储服务</b> 的服务器的名称。
        有关文档服务器服务客户机-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何运作的</a> 部分。
    </p>

    <div class="header-gray">响应示例</div>
    <pre>
{
   "key": "af86C7e71Ca8",
   "urls": {
      "SampleText.docx": "https://documentserver/SampleText.docx",
      "SampleText2.docx": "https://documentserver/SampleText2.docx"
   },
   "end": true
}
</pre>

    <div id="sample-builder-token" class="header-gray copy-link">JSON对象示例包含发送到 <b>文档生成器服务</b> 的JSON Web令牌，用于第一个异步请求</div>
    <pre>
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhc3luYyI6dHJ1ZSwidXJsIjoiaHR0cHM6Ly9leGFtcGxlLmNvbS91cmwtdG8tZXhhbXBsZS1zY3JpcHQuZG9jYnVpbGRlciJ9.dzoTbRzSMa95Fpg34CjnF3ZUPdGA2CnBedFL_qOOxAs"
}
</pre>

    <div class="header-gray">发生错误时的响应示例</div>
    <pre>
{
    "error": -8
}
</pre>

    <div class="header-gray">可能的错误代码及其描述</div>
    <table class="error-table">
        <colgroup>
            <col style="width: 105px;" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>错误代码</td>
                <td>描述</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>-1</td>
                <td>未知错误。</td>
            </tr>
            <tr class="tablerow">
                <td>-2</td>
                <td>生成超时错误。</td>
            </tr>
            <tr class="tablerow">
                <td>-3</td>
                <td>文档生成错误。</td>
            </tr>
            <tr class="tablerow">
                <td>-4</td>
                <td>下载要生成的文档文件时出错。</td>
            </tr>
            <tr class="tablerow">
                <td>-6</td>
                <td>访问文档生成结果数据库时出错。</td>
            </tr>
            <tr class="tablerow">
                <td>-8</td>
                <td>令牌无效。</td>
            </tr>
            <%--<tr class="tablerow">
                <td>-21</td>
                <td>Token signature is expired.</td>
            </tr>--%>
        </tbody>
    </table>
</asp:Content>
