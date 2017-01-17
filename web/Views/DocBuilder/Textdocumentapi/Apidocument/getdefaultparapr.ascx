<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetDefaultParaPr</span>
</h1>

<h4 class="header-gray" id="GetDefaultParaPr">GetDefaultParaPr() &rarr; {<a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>}</h4>
<p class="dscr">Get a set of default paragraph properties in the current document.</p>   
                
<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
oParagraph = oDocument.GetElement(0);
oParaPr = oDocument.GetDefaultParaPr();
oParaPr.SetSpacingLine(276, "auto");
oParaPr.SetSpacingAfter(200);
var oNormalStyle = oDocument.GetDefaultStyle("paragraph");
oParaPr = oNormalStyle.GetParaPr();
oParaPr.SetSpacingLine(240, "auto");
oParaPr.SetJc("both");
oParagraph.AddText("This is just a text.");
builder.SaveFile("docx", "ApiDocument.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887222&doc=ekRQa3llZm0vSzZZVklSejNVNlkrSFN5UEs5emRDMnNHYldDNys2T01BVT0_IjQ4ODcyMjIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>