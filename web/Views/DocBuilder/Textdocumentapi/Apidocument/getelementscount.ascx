<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetElementsCount</span>
</h1>


<h4 class="header-gray" id="GetElementsCount">GetElementsCount() &rarr; {number}</h4>

<dl class="details">
                    <dt>Inherited From:</dt>
                    <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelementscount") %>">ApiDocumentContent.GetElementsCount</a>
                    </li></ul></dd>
</dl>

<p class="dscr">Get the number of elements in the current document.</p>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <em>number</em>
    </dd>
</dl>
            
<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Number of document elements at this point: ");
oParagraph.AddTabStop();
oParagraph.AddText("" + oDocument.GetElementsCount());
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Now we add one more paragraph and push it.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Number of document elements after we added the second paragraph ");
oParagraph.AddText("but before we push the third one: ");
oParagraph.AddTabStop();
oParagraph.AddText("" + oDocument.GetElementsCount());
oDocument.Push(oParagraph);
builder.SaveFile("docx", "GetElementsCount.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887229&doc=dmphQ2pNdzJiY3RRd0FRQ1lEUDhEYXEyVkcyOUhmYXduOFEyVkkybyszdz0_IjQ4ODcyMjki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>