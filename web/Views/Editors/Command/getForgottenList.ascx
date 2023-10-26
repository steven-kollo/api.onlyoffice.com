<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">getForgottenList</span>
</h1>

<div class="header-gray">描述</div>

<p class="dscr">请求被遗忘文件的列表。</p>

<div class="header-gray">请求示例</div>
<pre>
{
    "c": "getForgottenList"
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
           <td>存在</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>c</td>
            <td>定义命令类型。</td>
            <td>string</td>
            <td>必填</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">响应示例</div>

<pre>
{
    "error": 0,
    "keys": ["Khirz6zTPdfd7"]
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
           <td>存在</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>error</td>
            <td>定义错误代码。</td>
            <td>integer</td>
            <td>必填</td>
        </tr>
        <tr class="tablerow">
            <td>keys</td>
            <td>定义用于明确标识文档文件的文档标识符列表。</td>
            <td>string</td>
            <td>必填</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
