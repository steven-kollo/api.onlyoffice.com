<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetStyle</span>
</h1>

<h4 class="header-gray" id="GetStyle">GetStyle(sStyleName) &rarr; (nullable) {<a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>}</h4>
<p class="dscr">Get a style by the style name.</p>
 
            <h2>Parameters:</h2>
                <table class="table">
                    <thead>
                        <tr class="tablerow">
                            <td>Name</td>
                            <td>Type</td>
                            <td>Description</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="tablerow">
                            <td><code>sStyleName</code></td>
                            <td>
                            <em>string</em>
                            </td>
                            <td>The name using which it is possible to address the style.</td>
                       </tr>
                    </tbody>
                    </table>
<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oNoSpacingStyle = oDocument.GetStyle("Heading 6");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oNoSpacingStyle);
oParagraph.AddText("This is a text in a paragraph styled with the 'Heading 6' style.");
builder.SaveFile("docx", "ApiDocument.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887257&doc=WTRZYWZtSmJUSmNvQnA4RlhuQ1FQTVUzYUczVjNzbml0bGRjZFRxUEE0dz0_IjQ4ODcyNTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
