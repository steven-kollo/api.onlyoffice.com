<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetWidowControl</span>
</h1>

<h4 class="header-gray" id="SetWidowControl">SetWidowControl(isWidowControl)</h4>
                <dl class="details">
                <dt>Inherited From:</dt>
                <dd><ul><li>
                <a href="<%= Url.Action("textdocumentapi/apiparapr/setwidowcontrol") %>">ApiParaPr.SetWidowControl</a>
                </li></ul></dd>
                </dl>

<p class="dscr">Specify whether a single line of this paragraph will be prevented from being displayed on a separate page from the remaining content at display time by moving the line onto the following page.</p>

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
            <td><em>isWidowControl</em></td>
            <td>
            <em>boolean</em>
            </td>
            <td>The <em>true</em> value will enable the <em>SetWidowControl</em> method use.</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("The single line of the last paragraph on this page will be prevented from being displayed on a separate page. ");
for (var x = 0; x < 5; ++x)
{
oParagraph = Api.CreateParagraph();
for (var i = 0; i < 10; ++i)
{
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oDocument.Push(oParagraph);
}
oParagraph = Api.CreateParagraph();
for (var i = 0; i < 4; ++i)
{
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oParagraph.SetWidowControl(true);
oParagraph.AddText("This last line is displayed on the next page, because we used the set widow control method set to 'true'.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetWidowControl.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891173&doc=K1lNbXdaU05TQjlrS0xhNFdEQndtb0YrUVIvRVh6WkNrNEE1QnJlVHZDRT0_IjQ4OTExNzMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
