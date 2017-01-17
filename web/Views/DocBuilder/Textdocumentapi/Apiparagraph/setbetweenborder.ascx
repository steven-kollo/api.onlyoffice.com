<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetBetweenBorder</span>
</h1>

<h4 class="header-gray" id="SetBetweenBorder">SetBetweenBorder(sType, nSize, nSpace, r, g, b)</h4>

<dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apiparapr/setbetweenborder") %>">ApiParaPr.SetBetweenBorder</a>
                </li></ul></dd>
</dl>
                
<p class="dscr">Specify the border which will be displayed between each paragraph in a set of paragraphs which have the same set of paragraph border settings.</p>

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
            <td>The width of the current border measured in eighths of a point.</td>
        </tr>
        <tr class="tablerow">
                <td><em>nSpace</em></td>
            <td>
                
<a href="<%= Url.Action("global") %>#pt">pt</a>
            </td>
            <td>The spacing offset between the paragraphs measured in points used to place this border.</td>
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
oParagraph.AddText("This is the first paragraph. We will add a thick green border between it and the next paragraph. ");
oParagraph.AddText("No additional spacing between the border and the paragraphs is added.");
oParagraph.SetBetweenBorder("single", 24, 0, 0, 255, 0);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second paragraph. We will add a thin red border between it and the next paragraph. ");
oParagraph.AddText("We added additional spacing between the border and the paragraphs.");
oParagraph.SetBetweenBorder("single", 12, 10, 255, 0, 0);
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the third paragraph. The border can be displayed above it only, as there are no new paragraphs after it.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetBetweenBorder.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4889071&doc=NnpWODdPbEpHbmllM0VibWc5bVRzZkhqanNpT3JDOXhWb3BVR1lZakhpTT0_IjQ4ODkwNzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>