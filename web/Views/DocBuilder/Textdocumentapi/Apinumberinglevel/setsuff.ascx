<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetSuff</span>
</h1>

<h4 class="header-gray" id="SetSuff">SetSuff(sType)</h4>
 <p class="dscr">Specify the content which will be added between a given numbering level text and the text of every numbered paragraph which references that numbering level. By default this value is <em>"tab"</em>.</p>
                
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
                
<em>"space"</em>
|
<em>"tab"</em>
|
<em>"none"</em>
            </td>
                        <td>The content added between the numbering level text and the text in the numbered paragraph.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumLvl, oNumbering;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oNumLvl.SetCustomType("decimalZero", "repeating text %1", "left");
oNumLvl.SetSuff("space");
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a numbered list using custom text with numbering");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the second element of a numbered list using custom text with numbering");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetSuff.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888920&doc=M2xia0hkY01IUG9KTHZiUEc0dzFEZDZrbzdET1JjbTZ2dUw5NCtLSXJCND0_IjQ4ODg5MjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>