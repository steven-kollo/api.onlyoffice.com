<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStart</span>
</h1>

<h4 class="header-gray" id="SetStart">SetStart(nStart)</h4>
<p class="dscr">Specify the starting value for the numbering used by the parent numbering level within a given numbering level definition. By default this value is 1.</p>

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
                        <td><em>nStart</em></td>
                        <td>                
                        <em>number</em>
                        </td>
                        <td>The starting value for the numbering used by the parent numbering level.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oNumbering, oNumLvl, oNumLvl1;
oNumbering = oDocument.CreateNumbering("numbered");
oNumLvl = oNumbering.GetLevel(0);
oNumLvl1 = oNumbering.GetLevel(1);
oNumLvl1.SetStart(5);
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a parent numbered list which starts with '1'");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the first element of a child numbered list which starts with 'e'");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetStart.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888918&doc=TVhZY296eWhzb3FtcHpJT01YcTU5b1hOWVc1RUxiazNDaWtkTFFPb2ZuST0_IjQ4ODg5MTgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
