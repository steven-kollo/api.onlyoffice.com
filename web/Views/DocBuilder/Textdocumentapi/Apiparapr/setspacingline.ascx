<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacingLine</span>
</h1>

<h4 class="header-gray" id="SetSpacingLine">SetSpacingLine(nLine, sLineRule)</h4>
<p class="dscr">
Set the paragraph line spacing. If the value of the <em>sLineRule</em> parameter is either <em>"atLeast"</em>or <em>"exact"</em>, then the value of <em>nLine</em> will be interpreted as twentieths of a point. Ifthe value of the <em>sLineRule</em> parameter is <em>"auto"</em>, then the value of the <em>nLine</em>parameter will be interpreted as 240ths of a line.
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
            <td><em>nLine</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
                |
                <a href="<%= Url.Action("global") %>#line240">line240</a>
            </td>
            <td>The line spacing value measured either in twentieths of a point (1/1440 of an inch) or in 240ths of a line.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sLineRule</em></td>
            <td>
                <em>"auto"</em>
                |
                <em>"atLeast"</em>
                |
                <em>"exact"</em>
            </td>
            <td>The rule that determines the measuring units of the <em>nLine</em> parameter.</td>
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
var oMyStyle1 = oDocument.CreateStyle("My document style #1");
oParaPr = oMyStyle1.GetParaPr();
oParaPr.SetSpacingLine(3 * 240, "auto");
var oMyStyle2 = oDocument.CreateStyle("My document style #2");
oParaPr = oMyStyle2.GetParaPr();
oParaPr.SetSpacingLine(200, "exact");
var oMyStyle3 = oDocument.CreateStyle("My document style #3");
oParaPr = oMyStyle3.GetParaPr();
oParaPr.SetSpacingLine(400, "atLeast");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oMyStyle1);
oParagraph.AddText("Paragraph 1. Spacing: 3 times of a common paragraph line spacing.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle2);
oParagraph.AddText("Paragraph 2. Spacing: exact 10 points.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetStyle(oMyStyle3);
oParagraph.AddText("Paragraph 3. Spacing: atLeast 20 points.");
oParagraph.AddLineBreak();
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetSpacingLine.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891398&doc=M2dMV0M3WVpBWE12WUJvbDFsUWlZR3QzSVk4TzB5UFZIdmVzM2NTMjJMcz0_IjQ4OTEzOTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>