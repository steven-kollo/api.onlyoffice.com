<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetRightBorder</span>
</h1>

<h4 class="header-gray" id="SetRightBorder">SetRightBorder(sType, nSize, nSpace, r, g, b)</h4>
<p class="dscr">Specify the border which will be displayed at the right side of the page around the specified paragraph.</p>

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
            <td><em>sType</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#BorderType">BorderType</a>
            </td>
            <td>The border style.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nSize</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#pt_8">pt_8</a>
            </td>
            <td>The width of the current right border measured in eighths of a point.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nSpace</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#pt">pt</a>
            </td>
            <td>The spacing offset to the right of the paragraph measured in points used to place this border.</td>
        </tr>
        <tr class="tablerow">
            <td><em>r</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Red color component value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>g</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Green color component value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>b</em></td>
            <td>
            <a href="<%= Url.Action("global") %>#byte">byte</a>
            </td>
            <td>Blue color component value.</td>
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
oParaPr.SetRightBorder("single", 24, 0, 0, 255, 0);
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This is the first paragraph. ");
oParagraph.AddText("The paragraph properties styled above set a border at its right side.");
builder.SaveFile("docx", "SetRightBorder.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891224&doc=dzdacnRKdWx3TXhFSmZ0WGJmZDB6ZUZxRkx6NG9EczNUZWlRd0RCT1N1Yz0_IjQ4OTEyMjQi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>