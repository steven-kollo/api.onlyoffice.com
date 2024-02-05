<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">配置</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">config base 部分允许更改使用的平台类型、文档显示大小（宽度和高度）和打开文档的类型。</p>

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
            <td>示例</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td id="documentType" class="copy-link">documentType</td>
            <td>定义要打开的文档类型：
                <ul>
                    <li><b>word</b> - 文本文档 （<em>.doc、.docm、.docx、.docxf、.dot、.dotm、.dotx、.epub、.fb2、.fodt、.htm、.html、.mht、.mhtml、.odt、.oform、.ott、.rtf、.stw、.sxw、.txt、.wps、.wpt、.xml</em>），</li>
                    <li><b>cell</b> - 电子表格 (<em>.csv、.et、.ett、.fods、.ods、.ots、.sxc、.xls、.xlsb、.xlsm、.xlsx、.xlt、.xltm、.xltx、.xml</em>），</li>
                    <li><b>slide</b> - 演示文稿 （<em>.dps、.dpt、.fodp、.odp、.otp、.pot、.potm、.potx、.pps、.ppsm、.ppsx、.ppt、.pptm、.pptx、.sxi</em>），</li>
                    <li><b>pdf</b> - portable document format (<em>djvu, oxps, pdf, xps</em>).</li>
                </ul>
            </td>
            <td>string</td>
            <td>"cell"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    自 6.1 版起，<b>text</b>, <b>spreadsheet</b>, <b>presentation</b> 这几个值已被弃用。
                    请改用新值。
                </div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="height" class="copy-link">height</td>
            <td>定义浏览器窗口中的文档高度（默认为<b>100%</b> ）。</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
        <tr class="tablerow">
            <td id="token" class="copy-link">token</td>
            <td>以 <a href="<%= Url.Action("signature/browser") %>#config">令牌</a>的形式定义添加到 <b>文档服务器</b> 配置的加密签名。</td>
            <td>string</td>
            <td>"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU"</td>
        </tr>
        <tr class="tablerow">
            <td id="type" class="copy-link">type</td>
            <td>
                定义用于访问文档的平台类型。
                可以是：
                <em>为从台式机或笔记本电脑访问文档而优化</em> - <b>Desktop</b>，
                <em>为从平板电脑或智能手机访问文档而优化</em> - <b>mobile</b>，
                <em>为易于嵌入网页而特别设计</em> - <b>embedded</b>。
                默认值为 <b>"desktop"</b>。
            </td>
            <td>string</td>
            <td>"desktop"</td>
        </tr>
        <tr class="tablerow">
            <td id="width" class="copy-link">width</td>
            <td>定义浏览器窗口中的文档宽度（默认为<b>100%</b>）。</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">示例</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "documentType": "word",
    "height": "100%",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.LwimMJA3puF3ioGeS-tfczR3370GXBZMIL-bdpu4hOU",
    "type": "desktop",
    "width": "100%",
    ...
});
</pre>
