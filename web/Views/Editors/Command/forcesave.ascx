<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">forcesave</span>
</h1>

<div class="header-gray">描述</div>

<p class="dscr">强制保存正在编辑的文档而不关闭它此命令后可能会继续编辑文档，因此这将不是最终保存的文档版本</p>

<div class="header-gray">请求示例</div>
<pre>
{
    "c": "forcesave",
    "key": "Khirz6zTPdfd7",
    "userdata": "sample userdata"
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
            <td>key</td>
            <td>定义文档标识符,用于明确标识文档文件。</td>
            <td>string</td>
            <td>必须的</td>
        </tr>
        <tr class="tablerow">
            <td>userdata</td>
            <td>定义一些自定义标识符，当存在多个请求时，这些标识符将有助于区分特定请求</td>
            <td>string</td>
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
            <td>定义文档标识符,用于明确标识文档文件。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
