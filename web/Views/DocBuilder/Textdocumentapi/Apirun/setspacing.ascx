<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSpacing</span>
</h1>

<h4 class="header-gray" id="SetSpacing">SetSpacing(nSpacing)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/setspacing") %>">ApiTextPr.SetSpacing</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Set text spacing measured in twentieths of a point.
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
            <td><em>nSpacing</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#twips">twips</a>
            </td>
            <td>The value of the text spacing measured in twentieths of a point (1/1440 of an inch).</td>
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
oRun.SetSpacing(80);
oRun.AddText("This is a text run with the text spacing set to 4 points (20 twentieths of a point).");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetSpacing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892218&doc=UTVOMjNSWjRBU3g1MXZOMTdBMEZSTlBDVVhod3N0OVN1TWVCeTFDbEhRND0_IjQ4OTIyMTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>