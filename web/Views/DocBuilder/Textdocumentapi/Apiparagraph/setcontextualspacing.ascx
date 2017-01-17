<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetContextualSpacing</span>
</h1>

<h4 class="header-gray" id="SetContextualSpacing">SetContextualSpacing(isContextualSpacing)</h4>
                
<dl class="details">
                    <dt>Inherited From:</dt>
                    <dd><ul><li>
                    <a href="<%= Url.Action("textdocumentapi/apiparapr/setcontextualspacing") %>">ApiParaPr.SetContextualSpacing</a>
                    </li></ul></dd>
</dl>

<p class="dscr">Specify that any space before or after this paragraph set using the spacing element <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">ApiParaPr.SetSpacingBefore</a> or <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">ApiParaPr.SetSpacingAfter</a>, should not be applied when the preceding and following paragraphs are of the same paragraph style, affecting the top and bottom spacing respectively.</p>
                
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
                        <td><em>isContextualSpacing</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the paragraph contextual spacing.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with contextual spacing set to 'false'.");
oParagraph.SetContextualSpacing(false);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with contextual spacing set to 'false'.");
oParagraph.SetContextualSpacing(false);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with contextual spacing set to 'false'.");
oParagraph.SetContextualSpacing(false);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with contextual spacing set to 'true'.");
oParagraph.SetContextualSpacing(true);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with contextual spacing set to 'true'.");
oParagraph.SetContextualSpacing(true);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetContextualSpacing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889079&doc=d1NSZmdoK3dZb3QxejF1ZkZEdWVGcWV4eDdJS01rVHJQTHFESDl6NHN2QT0_IjQ4ODkwNzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>