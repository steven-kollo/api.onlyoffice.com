<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateParagraph</span>
</h1>

<h4 class="header-gray" id="CreateParagraph">CreateParagraph() &rarr; {<a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>}</h4>
<p class="dscr">
Create a new paragraph.
</p>
    

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a new paragraph");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "CreateParagraph.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4882310&doc=SmIwdDV5M3QraEovSlc0MDd6ME9oOFV2ek9KME83VmY1bVUxdUlGOWZMdz0_IjQ4ODIzMTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>