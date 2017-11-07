<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetLeftBorder</span>
</h1>

<h4 class="header-gray" id="SetLeftBorder">SetLeftBorder(sType, nSize, nSpace, r, g, b)</h4>
                
<dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apiparapr/setleftborder") %>">ApiParaPr.SetLeftBorder</a>
                </li></ul></dd>
</dl>

<p class="dscr">Specify the border which will be displayed at the left side of the page around the specified paragraph.</p>

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
            <td>The width of the current left border measured in eighths of a point.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nSpace</em></td>
            <td>
                
<a href="<%= Url.Action("global") %>#pt">pt</a>
            </td>
            <td>The spacing offset to the left of the paragraph measured in points used to place this border.</td>
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
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is the first paragraph. We will add a two point green border at its left side. ");
oParagraph.AddText("The space between the left side of the paragraph and the border is 8 points. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes.");
oParagraph.SetLeftBorder("single", 16, 8, 0, 255, 0);
builder.SaveFile("docx", "SetLeftBorder.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891070&doc=b0pEY1JUQnBraEtKTTlrYTgvMmNIVFY2S2RCVkhRdkJXditYcEh2dENyTT0_IjQ4OTEwNzAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
