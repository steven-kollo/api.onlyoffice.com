<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("ConvertDocument", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows converting document content to Markdown or HTML.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("ConvertDocument", [sConvertType, bHtmlHeadings, bBase64img, bDemoteHeadings, bRenderHTMLTags]);
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>sConvertType</td>
            <td>Conversion type.</td>
            <td>string</td>
            <td>"markdown"</td>
        </tr>
        <tr class="tablerow">
            <td>bHtmlHeadings</td>
            <td>Defines if the HTML headings and IDs will be generated when the Markdown renderer of your target platform does not handle Markdown-style IDs.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>bBase64img</td>
            <td>Defines if the images will be created in the base64 format.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>bDemoteHeadings</td>
            <td>Defines if all heading levels in your document will be demoted to conform with the following standard: single H1 as title, H2 as top-level heading in the text body.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td>bRenderHTMLTags</td>
            <td>Defines if HTML tags will be preserved in your Markdown. If you just want to use an occasional HTML tag, you can avoid using the opening angle bracket in the following way:
                \&lt;tag&gt;text\&lt;/tag&gt;. By default, angle brackets (&lt;) will be replaced with the special character.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the Markdown or HTML file content in the <em>string</em> format.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("ConvertDocument", ["markdown", false, false, true, false]);
</pre>