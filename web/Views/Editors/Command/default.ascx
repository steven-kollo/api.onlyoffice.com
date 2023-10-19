<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">命令服务</span>
</h1>

<p class="dscr">
    对于与 <b>文档命令服务</b> 的交互，使用POST请求。
    请求参数在请求正文中以 JSON
    格式输入请求被发送到 <span class="fakelink">https://documentserver/coauthoring/CommandService.ashx</span>, 其中 <b>documentserver</b> 是安装了ONLYOFFICE 文档服务器的服务器的名称
</p>

<div class="note">在版本4.2之前的 <b>ONLYOFFICE 文档服务器</b> 中，使用了带有 <em>QueryString</em> 中参数的GET请求。</div>

<p>请参阅下面可用的命令类型以了解更多信息。</p>

<div class="header-gray">命令类型</div>

<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>命令</td>
            <td>描述</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/deleteforgotten") %>">deleteForgotten</a></td>
            <td>This command allows to delete a forgotten file.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/drop") %>">drop</a></td>
            <td>此命令允许断开指定用户与文档编辑服务的连接。</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/forcesave") %>">forcesave</a></td>
            <td>此命令允许强制保存正在编辑的文档，而无需关闭它。</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/getforgotten") %>">getForgotten</a></td>
            <td>This command allows to request a forgotten file.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/getforgottenlist") %>">getForgottenList</a></td>
            <td>This command allows to request a list of the forgotten files.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/info") %>">info</a></td>
            <td>此命令允许请求一个文档的状态以及打开编辑过该文档的用户标识符列表。</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/license") %>">license</a></td>
            <td>此命令允许从文档服务器请求许可证，并提供有关服务器和用户配额的信息。</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/meta") %>">meta</a></td>
            <td>此命令允许为所有协作编辑器更新文档的元信息。</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("command/version") %>">vesion</a></td>
            <td>此命令允许请求文档服务器的当前版本号。</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>JSON Web令牌应以JSON对象格式发送到 <b>文档命令服务</b>它用于接收具有指定键的文档的状态。</p>

<pre>
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjIjoiaW5mbyIsImtleSI6IktoaXJ6NnpUUGRmZDcifQ.r_6sThjFABsHMNHhkVdHDSz4jwkbXRQNYdvawkBGJgg"
}
</pre>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>名称</td>
            <td>描述</td>
            <td>类型</td>
            <td>出现</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>token</td>
            <td>定义以 <a href="<%= Url.Action("signature/body") %>#command">令牌</a>形式添加到 <b>文档服务器</b> 配置的加密签名</td>
            <td>string</td>
            <td>配置所需</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p><b>文档编辑服务</b> 将命令产生的结果通知 <b>文档存储服务</b>，并通过 <a href="<%= Url.Action("callback") %>">回调处理程序</a>发送包含所有必要数据的响应。</p>

<div class="header-gray">可能的错误代码及其描述</div>
<table class="error-table">
    <colgroup>
        <col class="table-name" />
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
            <td>0</td>
            <td>没有错误。</td>
        </tr>
        <tr class="tablerow">
            <td>1</td>
            <td>文档密钥缺失或找不到具有该密钥的文档。</td>
        </tr>
        <tr class="tablerow">
            <td>2</td>
            <td>回调url不正确。</td>
        </tr>
        <tr class="tablerow">
            <td>3</td>
            <td>内部服务器错误。</td>
        </tr>
        <tr class="tablerow">
            <td>4</td>
            <td>在收到 <b>forcesave</b> 命令之前，未对文档应用任何更改。</td>
        </tr>
        <tr class="tablerow">
            <td>5</td>
            <td>命令不正确。</td>
        </tr>
        <tr class="tablerow">
            <td>6</td>
            <td>令牌无效。</td>
        </tr>
        <%--<tr class="tablerow">
            <td>7</td>
       <td>令牌签名已过期</td>
        </tr>--%>
    </tbody>
</table>
