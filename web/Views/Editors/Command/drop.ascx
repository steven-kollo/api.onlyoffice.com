<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">drop</span>
</h1>

<div class="header-gray">描述</div>

<p class="dscr">断开在 <em>users</em> 参数中指定标识符的用户与 <b>文档编辑服务</b>的连接。这些用户将能够查看文档，但不允许对其进行更改。</p>

<div class="header-gray">请求示例</div>
<pre>
{
    "c": "drop",
    "key": "Khirz6zTPdfd7",
    "users": [ "6d5a81d0" ]
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
            <td>参数</td>
            <td>描述</td>
            <td>类型</td>
            <td>出现</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>c</td>
            <td>定义命令类型。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td>关键字</td>
            <td>定义文档标识符,用于明确标识文档文件。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td>用户</td>
            <td>定义用户标识符列表。</td>
            <td>string数组</td>
            <td>可选的</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">响应示例</div>

<pre>
{
    "error": 0,
    "key": "Khirz6zTPdfd7"
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
            <td>参数</td>
            <td>描述</td>
            <td>类型</td>
            <td>出现</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>错误</td>
            <td>定义错误代码</td>
            <td>integer</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td>key</td>
            <td>定义用于明确标识文档文件的文档标识符。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
