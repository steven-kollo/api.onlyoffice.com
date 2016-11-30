<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetFontSize</span>
</h1>

<h4 class="header-gray" id="SetFontSize">SetFontSize(nSize)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/setfontsize") %>">ApiTextPr.SetFontSize</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Set the font size for the characters of the current text run.
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
            <td><em>nSize</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#hps">hps</a>
            </td>
            <td>The text size value measured in half-points (1/144 of an inch).</td>
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
oRun.SetFontSize(30);
oRun.AddText("This is a text run with the font size set to 15 points (30 half-points).");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetFontSize.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892191&doc=ZGpqTUhMSy9OMnVuNmhTWHdOMGZabVNNZ1EzM0hvVkYxZlRIa0s5M2ZmUT0_IjQ4OTIxOTEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>