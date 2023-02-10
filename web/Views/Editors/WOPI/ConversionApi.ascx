<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">转换 API</span>
    </h1>

    <p class="dscr">在线办公中要转换不同的文件格式，就要用到POST请求。
    这些请求被发送到 <em>/cool/convert-to/&lt;format&gt;&&lt;lang=xx-XX&gt;</em> 或 <em>/lool/convert-to/&lt;format&gt;&&lt;lang=xx-XX&gt;</em> 端点。</p>

    <h2 id="request" class="copy-link">请求参数及其说明：</h2>
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
                <td id="format" class="copy-link">format</td>
                <td>输出文件格式。</td>
                <td>string</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="PDFVer" class="copy-link">PDFVer</td>
                <td>用于输出文件（PDF/A-1b、PDF/A-2b 等）的相应 PDF 类型的 pdf 版本。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="FullSheetPreview" class="copy-link">FullSheetPreview</td>
                <td>指定完整工作表预览是否可用。</td>
                <td>bollean</td>
                <td>可选的</td>
            </tr>
            <tr class="tablerow">
                <td id="file" class="copy-link">file</td>
                <td>要在负载中转换的文件。</td>
                <td>object</td>
                <td>必需的</td>
            </tr>
            <tr class="tablerow">
                <td id="lang" class="copy-link">lang</td>
                <td>默认格式语言。它用于日期类型的单元格。如果指定了语言，它决定了显示/输出格式。</td>
                <td>string</td>
                <td>可选的</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div id="sample-curl" class="copy-link header-gray">转换请求示例</div>
    <pre>
curl -F "data=sample.txt" https://documentserver/cool/convert-to/docx > result.docx
</pre>
    <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档的服务器的名称。</p>

    <div id="sample-html" class="copy-link header-gray">HTML 格式的转换请求示例</div>
    <pre>
&lt;form action="https://documentserver/cool/convert-to/docx" enctype="multipart/form-data" method="post"&gt;
    File: &lt;input type="file" name="data"&gt;&lt;br/&gt;
    &lt;input type="submit" value="Convert to DOCX"&gt;
&lt;/form&gt;
</pre>
    <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档的服务器的名称。</p>

    <div id="sample-curl-format" class="copy-link header-gray">带有 <em>格式</em> 参数的转换请求示例</div>
    <pre>
curl -F "data=sample.odt" -F "format=pdf" "PDFVer=PDF/A-2b" https://documentserver/cool/convert-to > result.pdf
</pre>
    <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档的服务器的名称。</p>

    <div id="sample-html-format" class="copy-link header-gray"><em>格式</em> 参数为 HTML 格式的转换请求示例</div>
    <pre>
&lt;form action="https://documentserver/cool/convert-to" enctype="multipart/form-data" method="post"&gt;
    File: &lt;input type="file" name="data"&gt;&lt;br/&gt;
    Format: &lt;input type="text" name="format"&gt;&lt;br/&gt;
    &lt;input type="submit" value="Convert"&gt;
&lt;/form&gt;
</pre>
    <p>其中 <b>documentserver</b> 是安装了 ONLYOFFICE 文档的服务器的名称。</p>
