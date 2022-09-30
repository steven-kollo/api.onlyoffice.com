<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">meta</span>
</h1>

<div class="header-gray">描述</div>

<p class="dscr">为所有协作编辑器更新文档的元信息。</p>

<div class="header-gray">请求示例</div>
<pre>
{
    "c": "meta",
    "key": "Khirz6zTPdfd7",
    "meta": {
        "title": "Example Document Title.docx"
    }
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
            <td>c</td>
            <td>定义命令类型。</td>
            <td>字符串</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td>key</td>
            <td>定义文档标识符，用于明确标识文档文件。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
        <tr class="tablerow">
            <td>meta</td>
            <td>定义文档的新元信息：
                <ul>
                    <li>
                        <b>title</b> - 新文档名称。
                        <br />
                        <b>type</b>：string
                        <br />
                        <b>出现</b>：必需的
                    </li>
                </ul>
            </td>
            <td>对象</td>
            <td>必需的</td>
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
            <td>key</td>
            <td>定义文档标识符，用于明确标识文档文件。</td>
            <td>string</td>
            <td>必需的</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
