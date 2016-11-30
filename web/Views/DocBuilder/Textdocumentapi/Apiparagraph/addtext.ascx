<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddText</span>
</h1>

<h4 class="header-gray" id="AddText">AddText(sText<sub>opt</sub>) &rarr; {<a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>}</h4>
<p class="dscr">
Add some text to the element.
</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Default</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sText</em></td>
            <td>
                <em>string</em>
            </td>
            <td>&lt;optional><br>
            </td>
            <td>""
            </td>
            <td>The text that we want to insert into the current document element.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is just a sample text. Nothing special.");
builder.SaveFile("docx", "AddText.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888995&doc=WTExTGNydEtkdStsQVJMSy93bS9rT1FjSW1wMFpmL1lwa08wQWdnR1MwOD0_IjQ4ODg5OTUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>