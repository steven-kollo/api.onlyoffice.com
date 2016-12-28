<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStyle</span>
</h1>

<h4 class="header-gray" id="SetStyle">SetStyle(oStyle)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apiparapr/setstyle") %>">ApiParaPr.SetStyle</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Set paragraph style.</p>

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
                        <td><em>oStyle</em></td>
                        <td>
                        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>
                        </td>
                        <td>The style of the paragraph to be set.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
var oNewDocumentStyle = oDocument.GetStyle("Heading 6");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oNewDocumentStyle);
oParagraph.AddText("This is a text in a paragraph styled with the 'Heading 6' style.");
builder.SaveFile("docx", "SetStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887257&doc=clo3ZVRlcVNWRDAyMUl3L2ZaQXUrYTQ2RVU3bnF2NC95ODRMZE4zYUdxND0_IjQ4ODcyNTci0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>