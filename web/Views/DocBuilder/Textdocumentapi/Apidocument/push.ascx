<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Push</span>
</h1>

<h4 class="header-gray" id="Push">Push(oElement)</h4>
<h2>Inherited From:</h2> 

<dl class="details">
                    <dt>Inherited From:</dt>
                    <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/push") %>">ApiDocumentContent.Push</a>
                    </li></ul></dd>
</dl>                              
<p class="dscr">Push a paragraph or a table to actually add it to the document.</p>
                
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
                            <td><em>oElement</em></td>
                            <td>
                            <a href="<%= Url.Action("global") %>#DocumentElement">DocumentElement</a>
                            </td>
                            <td>The type of the element which will be pushed to the document.</td>
                       </tr>
                    </tbody>
                    </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph0, oParagraph;
oParagraph0 = oDocument.GetElement(0);
oParagraph0.AddText("This is paragraph #0, you must not push it to take effect.");
var oParaNum;
for (var nParaIncrease = 0; nParaIncrease < 5; ++nParaIncrease)
{
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is paragraph #" + (nParaIncrease + 1) + ", you must push it to take effect.");
oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "Push.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887275&doc=WFVOaVFOS0Iybk9IVE1acEx0dU44NXV2ajZmc2RlRkRqUDVCZTZsalZZTT0_IjQ4ODcyNzUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
