<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetDefaultTextPr</span>
</h1>

<h4 class="header-gray" id="GetDefaultTextPr">GetDefaultTextPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>}</h4>
<p class="dscr">Get a set of default properties for the text run in the current document.</p>                   
                
<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
oParagraph = oDocument.GetElement(0);
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetFontSize(30);
oTextPr.SetLanguage("en-US");
oTextPr.SetFontFamily("Comic Sans MS");
oParagraph.AddText("This is just a text.");
builder.SaveFile("docx", "GetDefaultTextPr.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887223&doc=dnJvd0pad2JLQVRWVklFdTlKeEFMRFdkS0cwZWh5OW5VcE9yWmZSazI4Yz0_IjQ4ODcyMjMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>