<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">RemoveElement</span>
</h1>

<h4 class="header-gray" id="RemoveElement">RemoveElement(nPos)</h4>

<dl class="details">
                    <dt>Inherited From:</dt>
                    <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/removeelement") %>">ApiDocumentContent.RemoveElement</a>
                    </li></ul></dd>
</dl>                
<p class="dscr">Remove element using the position specified.</p>

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
                            <td><em>nPos</em></td>
                            <td>
                            <em>number</em>
                            </td>
                            <td>The element number (position) in the document or inside other element.</td>
                       </tr>
                    </tbody>
                    </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph0, oParagraph;
oParagraph0 = oDocument.GetElement(0);
oParagraph0.AddText("This is paragraph #1.");
var oParaNum;
for (var nParaIncrease = 0; nParaIncrease < 4; ++nParaIncrease)
{
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is paragraph #" + (nParaIncrease + 2) + ".");
oDocument.Push(oParagraph);
}
oDocument.RemoveElement(2);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("We removed paragraph #3, check that out above.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "RemoveElement.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887299&doc=bmgzQ3N4UEtNdmNpUXh0ZXdreE1jbGd4ckZ6TUN5WHoraXJqbGEvZ2hVOD0_IjQ4ODcyOTki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>