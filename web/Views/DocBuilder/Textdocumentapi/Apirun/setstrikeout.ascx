<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStrikeout</span>
</h1>

<h4 class="header-gray" id="SetStrikeout">SetStrikeout(isStrikeout)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/setstrikeout") %>">ApiTextPr.SetStrikeout</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Specify that the contents of this run are displayed with a single horizontal line through the center of the line.
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
            <td><em>isStrikeout</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed struck through.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oRun;
oParagraph = oDocument.GetElement(0);
oRun = Api.CreateRun();
oRun.AddText("This is just a sample text. ");
oParagraph.AddElement(oRun);
oRun = Api.CreateRun();
oRun.SetStrikeout(true);
oRun.AddText("This is a text run with the text struck out with a single line.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetStrikeout.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892224&doc=REM1MmJaeSs0UTZPSDQ1Z0w0aVp0L1c2SXhZNEo2c2xuVlAzOTZOdytwcz0_IjQ4OTIyMjQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>