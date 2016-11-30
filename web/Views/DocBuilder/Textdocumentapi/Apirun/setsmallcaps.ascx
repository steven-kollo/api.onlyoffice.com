<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSmallCaps</span>
</h1>

<h4 class="header-gray" id="SetSmallCaps">SetSmallCaps(isSmallCaps)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apitextpr/setsmallcaps") %>">ApiTextPr.SetSmallCaps</a>
                </li>
            </ul>
        </dd>
    </dl>

<p class="dscr">
Specify that all small letter characters in this text run are formatted for display only as their capital letter character equivalents in a font size two points smaller than the actual font size specified for this text.
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
            <td><em>isSmallCaps</em></td>
            <td>
                <em>boolean</em>
            </td>
            <td>Specifies that the contents of the current run are displayed capitalized two points smaller.</td>
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
oRun.SetSmallCaps(true);
oRun.AddText("This is a text run with the font set to small capitalized letters.");
oParagraph.AddElement(oRun);
builder.SaveFile("docx", "SetSmallCaps.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4892215&doc=NVNRNXdVQ2xNcUh0bmtEQ1VNVER3MTVwWDh3OWVtN0tteFlyWUJITjhJWT0_IjQ4OTIyMTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>