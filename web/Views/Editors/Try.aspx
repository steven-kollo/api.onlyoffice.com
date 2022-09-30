<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    现在试试
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">现在试试</span>
    </h1>

    <p class="dscr">
        单击具有以下格式名称的按钮以尝试 ONLYOFFICE 文档服务器的主要功能。
        您可以打开各种文件类型进行编辑、查看、共同编辑、审阅或查看品牌重塑的工作原理。
        使用 <b>&lt;/&gt;</b> 按钮查看相应的示例源代码。
    </p>

    <table class="try-now-table">
        <thead>
            <tr>
                <th></th>
                <th>文档</th>
                <th>电子表格</th>
                <th>演示文稿</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>编辑</th>
                <td><a title="打开 DOCX 文件进行编辑" href="<%= Url.Action("editor") %>?method=docxEditor" class="button button-upper doc" target="blank">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="docxEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 DOCXF 文件进行编辑" href="<%= Url.Action("editor") %>?method=docxfEditor" class="button button-upper doc" target="blank">DOCXF</a><a title="查看源代码" class="button-popap-try" data-code="docxfEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 DOC 文件进行编辑" href="<%= Url.Action("editor") %>?method=docEditor" class="button button-upper doc" target="blank">DOC</a><a title="查看源代码" class="button-popap-try" data-code="docEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 ODT 文件进行编辑" href="<%= Url.Action("editor") %>?method=odtEditor" class="button button-upper doc" target="blank">ODT</a><a title="查看源代码" class="button-popap-try" data-code="odtEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 TXT 文件进行编辑" href="<%= Url.Action("editor") %>?method=txtEditor" class="button button-upper doc" target="blank">TXT</a><a title="查看源代码" class="button-popap-try" data-code="txtEditorCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 XLSX 文件进行编辑" href="<%= Url.Action("editor") %>?method=xlsxEditor" class="button button-upper spread" target="blank">XLSX</a><a title="查看源代码" class="button-popap-try" data-code="xlsxEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 XLS 文件进行编辑" href="<%= Url.Action("editor") %>?method=xlsEditor" class="button button-upper spread" target="blank">XLS</a><a title="查看源代码" class="button-popap-try" data-code="xlsEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 ODS 文件进行编辑" href="<%= Url.Action("editor") %>?method=odsEditor" class="button button-upper spread" target="blank">ODS</a><a title="查看源代码" class="button-popap-try" data-code="odsEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 CSV 文件进行编辑" href="<%= Url.Action("editor") %>?method=csvEditor" class="button button-upper spread" target="blank">CSV</a><a title="查看源代码" class="button-popap-try" data-code="csvEditorCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 PPTX 文件进行编辑" href="<%= Url.Action("editor") %>?method=pptxEditor" class="button button-upper present" target="blank">PPTX</a><a title="查看源代码" class="button-popap-try" data-code="pptxEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 PPT 文件进行编辑" href="<%= Url.Action("editor") %>?method=pptEditor" class="button button-upper present" target="blank">PPT</a><a title="查看源代码" class="button-popap-try" data-code="pptEditorCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 ODP 文件进行编辑" href="<%= Url.Action("editor") %>?method=odpEditor" class="button button-upper present" target="blank">ODP</a><a title="查看源代码" class="button-popap-try" data-code="odpEditorCode">&lt;/&gt;</a>
                </td>
            </tr>
            <tr>
                <th>共同编辑</th>
                <td><a title="打开 DOCX 文件进行共同编辑" class="button button-upper button-coediting doc" data-type="docxCoediting">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="docxCoeditorCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 XLSX 文件进行共同编辑" class="button button-upper button-coediting spread" data-type="xlsxCoediting">XLSX</a><a title="查看源代码" class="button-popap-try" data-code="xlsxCoeditorCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 PPTX 文件进行共同编辑" class="button button-upper button-coediting present" data-type="pptxCoediting">PPTX</a><a title="查看源代码" class="button-popap-try" data-code="pptxCoeditorCode">&lt;/&gt;</a>
                </td>
            </tr>
            <tr>
                <th>严格共同编辑</th>
                <td><a title="打开 DOCX 文件进行共同编辑" class="button button-upper button-coediting doc" data-type="docxStrictCoediting">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="docxStrictCoeditorCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 XLSX 文件进行共同编辑" class="button button-upper button-coediting spread" data-type="xlsxStrictCoediting">XLSX</a><a title="查看源代码" class="button-popap-try" data-code="xlsxStrictCoeditorCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 PPTX 文件进行共同编辑" class="button button-upper button-coediting present" data-type="pptxStrictCoediting">PPTX</a><a title="查看源代码" class="button-popap-try" data-code="pptxStrictCoeditorCode">&lt;/&gt;</a>
                </td>
            </tr>
            <tr>
                <th>本地过滤器</th>
                <td></td>
                <td>
                    <a title="打开 XLSX 文件而无权更改过滤器" class="button button-upper button-coediting spread" data-type="modifyFilter">XLSX</a><a title="查看源代码" class="button-popap-try" data-code="modifyFilterCode">&lt;/&gt;</a>
                </td>
                <td></td>
            </tr>
            <tr>
                <th>审阅</th>
                <td><a title="打开 DOCX 文件进行" href="<%= Url.Action("editor") %>?method=docxReview" class="button button-upper doc" target="blank">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="docxReviewCode">&lt;/&gt;</a>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>受限审阅</th>
                <td><a title="打开 DOCX 文件进行受限审阅" href="<%= Url.Action("editor") %>?method=docxReviewGroups" class="button button-upper doc" target="blank">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="docxReviewGroupsCode">&lt;/&gt;</a>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>填写表单</th>
                <td><a title="打开 OFORM 文件以填写表单" href="<%= Url.Action("editor") %>?method=fillForms" class="button button-upper doc" target="blank">OFORM</a><a title="查看源代码" class="button-popap-try" data-code="fillFormsCode">&lt;/&gt;</a>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>内容控制<br /> 设置限制</th>
                <td><a title="打开 DOCX 文件而不访问内容控件的设置" href="<%= Url.Action("editor") %>?method=modifyContentControl" class="button button-upper doc" target="blank">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="modifyContentControl">&lt;/&gt;</a>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>评论</th>
                <td><a title="打开 DOCX 文件进行评论" href="<%= Url.Action("editor") %>?method=docxComment" class="button button-upper doc" target="blank">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="docxCommentCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 XLSX 文件进行评论" href="<%= Url.Action("editor") %>?method=xlsxComment" class="button button-upper spread" target="blank">XLSX</a><a title="查看源代码" class="button-popap-try" data-code="xlsxCommentCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 PPTX 文件进行评论" href="<%= Url.Action("editor") %>?method=pptxComment" class="button button-upper present" target="blank">PPTX</a><a title="查看源代码" class="button-popap-try" data-code="pptxCommentCode">&lt;/&gt;</a>
                </td>
            </tr>
            <tr>
                <th>受限评论</th>
                <td><a title="打开 DOCX 文件进行受限评论" href="<%= Url.Action("editor") %>?method=docxCommentGroups" class="button button-upper doc" target="blank">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="docxCommentGroupsCode">&lt;/&gt;</a>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <th>查看</th>
                <td><a title="打开 DOCX 文件进行查看" href="<%= Url.Action("editor") %>?method=docxViewer" class="button button-upper doc" target="blank">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="docxViewerCode">&lt;/&gt;</a>
                    <br />
                    <a title="打开 PDF 文件进行查看" href="<%= Url.Action("editor") %>?method=pdfViewer" class="button button-upper doc" target="blank">PDF</a><a title="查看源代码" class="button-popap-try" data-code="pdfViewerCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 XLSX 文件进行查看" href="<%= Url.Action("editor") %>?method=xlsxViewer" class="button button-upper spread" target="blank">XLSX</a><a title="查看源代码" class="button-popap-try" data-code="xlsxViewerCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开 PPTX 文件进行查看" href="<%= Url.Action("editor") %>?method=pptxViewer" class="button button-upper present" target="blank">PPTX</a><a title="查看源代码" class="button-popap-try" data-code="pptxViewerCode">&lt;/&gt;</a>
                </td>
            </tr>
            <tr>
                <th>品牌重塑</th>
                <td><a title="打开包含品牌重塑的 DOCX 文件" href="<%= Url.Action("editor") %>?method=rebrandingDocxEditor" class="button button-upper doc" target="blank">DOCX</a><a title="查看源代码" class="button-popap-try" data-code="rebrandingDocxEditorCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开包含品牌重塑的 DOCX 文件" href="<%= Url.Action("editor") %>?method=rebrandingXlsxEditor" class="button button-upper spread" target="blank">XLSX</a><a title="查看源代码" class="button-popap-try" data-code="rebrandingXlsxEditorCode">&lt;/&gt;</a>
                </td>
                <td><a title="打开包含品牌重塑的 PPTX 文件" href="<%= Url.Action("editor") %>?method=rebrandingPptxEditor" class="button button-upper present" target="blank">PPTX</a><a title="查看源代码" class="button-popap-try" data-code="rebrandingPptxEditorCode">&lt;/&gt;</a>
                </td>
            </tr>
        </tbody>
    </table>


    <div id="trySourceCodeDialog" class="popap-dialog">
        <div class="popap-container">
            <div id="docxEditorCode">
                <div class="popap-header">打开 DOCX 文件进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "E7FAFC9C22A8",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxfEditorCode">
                <div class="popap-header">打开 docxf 进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docxf",
                    "key": "E7FAFC9C22A8",
                    "title": "Example Form Template Title.docxf",
                    "url": "https://example.com/url-to-example-document.docxf"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxEditorCode">
                <div class="popap-header">打开 xlsx 以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "53500B46FCA9",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxEditorCode">
                <div class="popap-header">打开 pptx 文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "9E2BDFCD1D75",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docEditorCode">
                <div class="popap-header">打开doc文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "doc",
                    "key": "D21889C484E9",
                    "title": "Example Document Title.doc",
                    "url": "https://example.com/url-to-example-document.doc"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsEditorCode">
                <div class="popap-header">打开xls文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xls",
                    "key": "D01A6B57CD96",
                    "title": "Example Spreadsheet Title.xls",
                    "url": "https://example.com/url-to-example-spreadsheet.xls"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptEditorCode">
                <div class="popap-header">打开 ppt文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "ppt",
                    "key": "EEE93333E5F3",
                    "title": "Example Presentation Title.ppt",
                    "url": "https://example.com/url-to-example-presentation.ppt"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="odtEditorCode">
                <div class="popap-header">打开odt文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "odt",
                    "key": "B95B853D3B1E",
                    "title": "Example Document Title.odt",
                    "url": "https://example.com/url-to-example-document.odt"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="odsEditorCode">
                <div class="popap-header">打开 ods文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "ods",
                    "key": "000C2F39D5A4",
                    "title": "Example Spreadsheet Title.ods",
                    "url": "https://example.com/url-to-example-spreadsheet.ods"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="odpEditorCode">
                <div class="popap-header">打开odp文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "odp",
                    "key": "47BAE2E8A54F",
                    "title": "Example Presentation Title.odp",
                    "url": "https://example.com/url-to-example-presentation.odp"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="txtEditorCode">
                <div class="popap-header">打开 txt文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "txt",
                    "key": "B2D7ACF65806",
                    "title": "Example Document Title.txt",
                    "url": "https://example.com/url-to-example-document.txt"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="csvEditorCode">
                <div class="popap-header">打开 csv文件以进行编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "csv",
                    "key": "B04E56B18519",
                    "title": "Example Spreadsheet Title.csv",
                    "url": "https://example.com/url-to-example-spreadsheet.csv"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pdfViewerCode">
                <div class="popap-header">打开pdf文件以进行查看</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pdf",
                    "key": "9B9F6EFE8937",
                    "title": "Example Document Title.pdf",
                    "url": "https://example.com/url-to-example-document.pdf"
                },
                "documentType": "word",
                "editorConfig": {
                    "mode": "view"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxViewerCode">
                <div class="popap-header">打开docx文件以进行查看</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "D24A86BDE9A2",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "mode": "view"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxViewerCode">
                <div class="popap-header">打开xlsx文件以进行查看</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "138E9734B413",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "mode": "view"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxViewerCode">
                <div class="popap-header">打开pptx文件以进行查看</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "37195B2B9BF4",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "mode": "view"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxCoeditorCode">
                <div class="popap-header">打开 DOCX 文件进行共同编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "B143195F47A0",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "B143195F47A0",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxCoeditorCode">
                <div class="popap-header">打开 xlsx文件以进行共同编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "6FB60FE9E548",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "6FB60FE9E548",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxCoeditorCode">
                <div class="popap-header">打开pptx文件以进行共同编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "B6C57F1FC447",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "B6C57F1FC447",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxStrictCoeditorCode">
                <div class="popap-header">打开 DOCX 文件进行严格模式的共同编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "491BD667CABA",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "491BD667CABA",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxStrictCoeditorCode">
                <div class="popap-header">打开 xlsx 文件进行严格模式的共同编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "DB1788E4AF4A",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "DB1788E4AF4A",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxStrictCoeditorCode">
                <div class="popap-header">打开 pptx 文件进行严格模式的共同编辑</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "5664FFF42E4E",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "5664FFF42E4E",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "autosave": false
                    },
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="rebrandingDocxEditorCode">
                <div class="popap-header">打开包含品牌重塑的 DOCX 文件</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "D97815D69205",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx"
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "https://example.com/logo-big.png",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com"
                        },
                        "logo": {
                            "image": "https://example.com/logo.png",
                            "url": "https://example.com"
                        }
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="rebrandingXlsxEditorCode">
                <div class="popap-header">打开包含品牌重塑的 xlsx 文件</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "6CDE57CAF31F",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx"
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "https://example.com/logo-big.png",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com"
                        },
                        "logo": {
                            "image": "https://example.com/logo.png",
                            "url": "https://example.com"
                        }
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="rebrandingPptxEditorCode">
                <div class="popap-header">打开包含品牌重塑的pptx文件</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "E9B24523F469",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx"
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "customization": {
                        "customer": {
                            "address": "My City, 123a-45",
                            "info": "Some additional information",
                            "logo": "https://example.com/logo-big.png",
                            "mail": "john@example.com",
                            "name": "John Smith and Co.",
                            "www": "example.com"
                        },
                        "logo": {
                            "image": "https://example.com/logo.png",
                            "url": "https://example.com"
                        }
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxReviewCode">
                <div class="popap-header">打开docx文件以进行审阅</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "9B5D4A67A9A9",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "edit": false,
                        "review": true
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxReviewGroupsCode">
                <div class="popap-header">打开docx文件进行受限审阅</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "9B5D4A67A9A9",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "edit": true,
                        "review": true,
                        "reviewGroups": [ "Group2", "" ]
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="fillFormsCode">
                <div class="popap-header">打开 oform 文件以填写表单</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "oform",
                    "key": "9B5D4A67A9A9",
                    "title": "Example Form Title.oform",
                    "url": "https://example.com/url-to-example-document.oform",
                    "permissions": {
                        "edit": false,
                        "fillForms": true
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxCommentCode">
                <div class="popap-header">打开docx文件以进行评论</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "5C5D4CCA7674",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "comment": true,
                        "edit": false
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="xlsxCommentCode">
                <div class="popap-header">打开xlsx文件以进行评论</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "B62D0C4B9C09",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx",
                    "permissions": {
                        "comment": true,
                        "edit": false
                    }
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="pptxCommentCode">
                <div class="popap-header">打开pptx文件以进行评论</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "pptx",
                    "key": "B62D0C4B9C09",
                    "title": "Example Presentation Title.pptx",
                    "url": "https://example.com/url-to-example-presentation.pptx",
                    "permissions": {
                        "comment": true,
                        "edit": false
                    }
                },
                "documentType": "slide",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="docxCommentGroupsCode">
                <div class="popap-header">打开 docx 文件进行受限评论</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "5C5D4CCA7674",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "comment": true,
                        "commentGroups": [
                            "edit": ["Group2", ""],
                            "remove": ["Group2"],
                            "view": ""
                        ],
                        "edit": false
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="modifyFilterCode">
                <div class="popap-header">打开 xlsx 文件而无权更改过滤器</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "B0823482653D",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx",
                    "permissions": {
                        "edit": true,
                        "modifyFilter": false
                    }
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "78e1e841",
                        "name": "John Smith"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "xlsx",
                    "key": "B0823482653D",
                    "title": "Example Spreadsheet Title.xlsx",
                    "url": "https://example.com/url-to-example-spreadsheet.xlsx",
                    "permissions": {
                        "edit": true,
                        "modifyFilter": false
                    }
                },
                "documentType": "cell",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "user": {
                        "id": "F89d8069ba2b",
                        "name": "Kate Cage"
                    }
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>

            <div id="modifyContentControl">
                <div class="popap-header">打开 docx 文件而不访问内容控件的设置</div>
                <pre>
&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder",
            {
                "document": {
                    "fileType": "docx",
                    "key": "779591724609",
                    "title": "Example Document Title.docx",
                    "url": "https://example.com/url-to-example-document.docx",
                    "permissions": {
                        "edit": true,
                        "modifyContentControl": false
                    }
                },
                "documentType": "word",
                "editorConfig": {
                    "callbackUrl": "https://example.com/url-to-callback.ashx",
                    "mode": "edit"
                },
                "height": "100%",
                "width": "100%"
            });

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;
</pre>
            </div>


            <a class="button copy-code">复制代码</a>
            <a class="button-close button">关闭oform</a>
        </div>
        <div class="button-close popap-close" title="关闭">&times;</div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceholder" runat="server">
    <script type="text/javascript">
        $(".button-coediting").click(function () {
            var documentType = $(this).attr("data-type");
            <% var key = Guid.NewGuid().ToString(); %>
            var addr1 = "<%= Url.Action("editor") %>?method=" + documentType + "&key=" + documentType + "<%= key %>&name=John%20Smith";
            var documentCoediting1 = window.open(addr1, "_blank");
            var addr2 = "<%= Url.Action("editor") %>?method=" + documentType + "&key=" + documentType + "<%= key %>&name=Kate%20Cage";
            var documentCoediting2 = window.open(addr2, "_blank");
            if (!documentCoediting2) {
                location.href = addr2;
            }
        });
    </script>
</asp:Content>
