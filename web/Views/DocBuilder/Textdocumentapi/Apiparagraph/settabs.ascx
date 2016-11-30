<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTabs</span>
</h1>

<h4 class="header-gray" id="SetTabs">SetTabs(aPos, aVal)</h4>
    <dl class="details">
        <dt>Inherited From:</dt>
        <dd>
            <ul>
                <li>
                    <a href="<%= Url.Action("textdocumentapi/apiparapr/settabs") %>">ApiParaPr.SetTabs</a>
                </li>
            </ul>
        </dd>
    </dl>
<p class="dscr">
Specify a sequence of custom tab stops which will be used for any tab characters in the current paragraph.<br />
<b>Warning</b>: the lengths of <em>aPos</em> array and <em>aVal</em> array <b>MUST BE</b> equal to each other.</p>

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
            <td><em>aPos</em></td>
            <td>
                <em>Array.&lt;<a href="<%= Url.Action("global") %>#twips">twips</a>></em>
            </td>
            <td>An array of the positions of custom tab stops with respect to the current page margins measured in twentieths of a point (1/1440 of an inch).</td>
        </tr>
        <tr class="tablerow">
            <td><em>aVal</em></td>
            <td>
                <em>Array.&lt;<a href="<%= Url.Action("global") %>#TabJc">TabJc</a>></em>
            </td>
            <td>An array of the styles of custom tab stops, which determines the behavior of the tab stop and the alignment which will be applied to text entered at the current custom tab stop.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.SetTabs([1440, 4320, 7200], ["left", "center", "right"]);
oParagraph.AddTabStop();
oParagraph.AddText("Custom tab - 1 inch left");
oParagraph.AddLineBreak();
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddText("Custom tab - 3 inches center");
oParagraph.AddLineBreak();
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddTabStop();
oParagraph.AddText("Custom tab - 5 inches right");
builder.SaveFile("docx", "ApiParagraph.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891122&doc=Vk5pdGE3TFRmdC9kYlB5MCt5anBMTm5GSjdzcDJDekhFSlFHNXZiZ2JpND0_IjQ4OTExMjIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>