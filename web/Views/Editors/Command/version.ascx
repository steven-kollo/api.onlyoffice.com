<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">version</span>
</h1>

<div class="header-gray">描述</div>

<p class="dscr">请求文档服务器的当前版本号。</p>

<div class="header-gray">请求示例</div>
<pre>
{
"c": "version"
}
</pre>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 150px;" />
        <col style="width: 100px;" />
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
            <td>c</td>
            <td>定义命令类型。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
    </tbody>
</table>

<div class="header-gray">响应示例</div>

<pre>
{
    "error": 0,
    "version": "4.3.1.4"
}
</pre>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
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
            <td>error</td>
            <td>定义错误代码</td>
            <td>integer</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td>version</td>
            <td>定义文档版本。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>