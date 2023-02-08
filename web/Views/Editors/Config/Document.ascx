<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/") %>"></a>
    <span class="hdr">文档</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">文档部分允许更改与文档有关的所有参数（标题、url、文件类型等）。</p>

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
        <tr class="tablerow">
            <td id="fileType" class="copy-link">fileType<span class="required">*</span></td>
            <td>
                定义查看或编辑的源文档的文件类型。
                必须是小写。
                以下文件类型可用：<em>.csv、.djvu、.doc、.docm、.docx、.docxf、.dot、.dotm、.dotx、.epub、.fb2、.fodp、.fods、.fodt、. htm、.html、.mht、.odp、.ods、.odt、.oform、.otp、.ots、.ott、.oxps、.pdf、.pot、.potm、.potx、.pps、.ppsm、 .ppsx、.ppt、.pptm、.pptx、.rtf、.txt、.xls、.xlsb、.xlsm、.xlsx、.xlt、.xltm、.xltx、.xml、.xps</em>。
            </td>
            <td>string</td>
            <td>"docx"</td>
        </tr>
        <tr>
            <td id="key" class="copy-link">key<span class="required">*</span></td>
            <td>
                定义服务用来识别文档的唯一文档标识符。
                如果发送了已知key，则将从缓存中获取文档。
                每次编辑和保存文档时，都必须重新生成key。
                文档 url 可以用作 <b>key</b>，但不能使用特殊字符，长度限制为 128 个符号。
            </td>
            <td>string</td>
            <td>"Khirz6zTPdfd7"</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">可以使用的关键字符：<b>0-9</b>、 <b>az</b>、 <b>AZ</b>、 <b>-._=</b>。
                最大密钥长度为 <b>20</b> 个字符。</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="referenceData" class="copy-link">referenceData</td>
            <td>
               定义一个由集成商生成的对象，用于唯一标识其系统中的文件：
                <ul>
                    <li>
                        <b>fileKey</b> - 服务用来获取文件链接的唯一文档标识符。
                        在编辑和保存文档时不得更改（即它不等于 <a href="#key">document.key</a> 参数），
                        <br />
                        <b>类型</b>: string,
                        <br />
                        <b>示例</b>:  "BCFA2CED";
                    </li>
                    <li>
                        <b>instanceId</b> - 唯一的系统标识符。如果数据从一个系统上的文件复制并插入到另一个系统的文件中，则通过链接粘贴将不可用，
                        并且上下文菜单中没有相应的按钮，
                        <br />
                        <b>类型</b>: string,
                        <br />
                        <b>示例</b>:  "https://example.com".
                    </li>
                </ul>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="title" class="copy-link">title<span class="required">*</span></td>
            <td>
                为查看或编辑的文档定义所需的文件名，该文件名也将在下载文档时用作文件名。
                长度限制为 128 个符号。
            </td>
            <td>string</td>
            <td>"Example Document Title.docx"</td>
        </tr>
        <tr class="tablerow">
            <td id="url" class="copy-link">url<span class="required">*</span></td>
            <td>定义存储查看或编辑的源文档的绝对 URL。
                使用本地链接时请务必添加 <a href="<%= Url.Action("security") %>">令牌</a>。
                否则会出现错误。
            </td>
            <td>string</td>
            <td>"https://example.com/url-to-example-document.docx"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<span class="required-descr"><span class="required">*</span><em> - 必填字段</em></span>

<div class="header-gray">示例</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "fileType": "docx",
        "key": "Khirz6zTPdfd7",
        "referenceData": {
            "fileKey": "BCFA2CED",
            "instanceId": "https://example.com"
        },
        "title": "Example Document Title.docx",
        "url": "https://example.com/url-to-example-document.docx",
    },
    ...
});
</pre>
<p>
    其中 <b>example.com</b> 是安装了 <b>文档管理器</b> 和 <b>文档存储服务</b> 的服务器的名称。
    有关文档服务器服务客户端-服务器交互的更多信息，请参阅 <a href="<%= Url.Action("howitworks") %>">它是如何工作的</a> 部分。
</p>
