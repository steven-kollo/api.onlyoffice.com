<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetKeepLines</span>
</h1>

<h4 class="header-gray" id="SetKeepLines">SetKeepLines(isKeepLines)</h4>

<dl class="details">
                    <dt>Inherited From:</dt>
                    <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apiparapr/setkeeplines") %>">ApiParaPr.SetKeepLines</a>
                    </li></ul></dd>
</dl>

<p class="dscr">Specify that when rendering this document using a page view, all lines of this paragraph are maintained on a single page whenever possible.</p>

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
                        <td><em>isKeepLines</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the option to keep lines of the paragraph on a single page.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is an example of how the paragraph tries to keep lines together. ");
oParagraph.AddText("Scroll down to the second page to see it.");
for (var x = 0; x < 5; ++x)
{
oParagraph = Api.CreateParagraph();
for (var i = 0; i < 10; ++i)
{
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oDocument.Push(oParagraph);
}
oParagraph = Api.CreateParagraph();
oParagraph.AddText("The paragraph lines are moved to the next page to keep them together. ");
for (var i = 0; i < 10; ++i)
{
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oParagraph.SetKeepLines(true);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetKeepLines.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889133&doc=NUxSbXBDbTRqYUZEMlhiQzFnUHk5UkJPSnUvempycTM2OWEzVThkUC9zZz0_IjQ4ODkxMzMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>