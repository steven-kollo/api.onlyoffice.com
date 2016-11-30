<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetCaps</span>
</h1>

<h4 class="header-gray" id="SetCaps">SetCaps(isCaps)</h4>
<p class="dscr">
Specify that any lowercase characters in this text run are formatted for display only as their capital letter character equivalents.
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
            <td><em>isCaps</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed capitalized.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oTextPr;
oTextPr = oDocument.GetDefaultTextPr();
oTextPr.SetCaps(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("A sample text set to capital letters using the text properties.");
builder.SaveFile("docx", "SetCaps.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4898102&doc=Q1VrQ1ZKaWtSTk5PU3VIWElIMkFkZVRSak1saWhlaXEvemZhWGUrdkhkOD0_IjQ4OTgxMDIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>