<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetContextualSpacing</span>
</h1>

<h4 class="header-gray" id="SetContextualSpacing">SetContextualSpacing(isContextualSpacing)</h4>
<p class="dscr">Specify that any space before or after this paragraph set using the spacing element <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">ApiParaPr.SetSpacingBefore</a> or <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">ApiParaPr.SetSpacingAfter</a>, should not be applied when the preceding and following paragraphs are of the same paragraph style, affecting the top and bottom spacing respectively.
</p>

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
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetContextualSpacing(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with contextual spacing set to 'false' (no paragraph style is applied).");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is a paragraph with contextual spacing set to 'false' (no paragraph style is applied).");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is a paragraph with contextual spacing set to 'true' (paragraph style is applied).");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is a paragraph with contextual spacing set to 'true' (paragraph style is applied).");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetContextualSpacing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891228&doc=d3RHSjM2WDMwbGZiL1N2TGg1Zk5IRGVublZ5ZTMwdTVkMy85c1pIMVFmVT0_IjQ4OTEyMjgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>