<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetWidowControl</span>
</h1>

<h4 class="header-gray" id="SetWidowControl">SetWidowControl(isWidowControl)</h4>
                    
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
var oParagraph, oParaPr;
var oMyStyle = oDocument.CreateStyle("My document style");
oParaPr = oMyStyle.GetParaPr();
oParaPr.SetWidowControl(true);
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
for (var i = 0; i < 3; ++i)
{
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oParagraph.SetStyle(oMyStyle);
oParagraph.AddText("This last line would be displayed on the next page, if we had not used the set widow control method.");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetWidowControl.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891409&doc=RDhqQ3lGc1lVSkV6cFFlYWNuT1JIK0ZRZTgyWEZpTDZZTUYyOG9mY0Nuaz0_IjQ4OTE0MDki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
