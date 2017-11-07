<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPageBreakBefore</span>
</h1>

<h4 class="header-gray" id="SetPageBreakBefore">SetPageBreakBefore(isPageBreakBefore)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apiparapr/setpagebreakbefore") %>">ApiParaPr.SetPageBreakBefore</a>
                </li></ul></dd>
                </dl>
<p class="dscr">Specify that when rendering this document using a paginated view, the contents of this paragraph are rendered at the beginning of a new page in the document.</p>
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
                        <td><em>isPageBreakBefore</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the option to render the contents of the paragraph at the beginning of the a new page in the document.</td>
                    </tr>
                </tbody>
                </table>
<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is an example of setting a page break before a paragraph. ");
oParagraph.AddText("The second paragraph will start from a new page, as it has a page break before it. ");
oParagraph.AddText("Scroll down to the second page to see it. ");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second paragraph and it has page break before it enabled.");
oParagraph.SetPageBreakBefore(true);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetPageBreakBefore.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891090&doc=TEM1eEVkTjYwK0tOb2FiaFdxaVNEeGJlT1RNYjh0QnFhWU85Ukx3Z1Eycz0_IjQ4OTEwOTAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
