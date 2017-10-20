<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetRestart</span>
</h1>

<h4 class="header-gray" id="SetRestart">SetRestart(isRestart)</h4>
<p class="dscr">Specify a one-based index which determines when a numbering level should restart to its starting value. A numbering level restarts when an instance of the specified numbering level, which will be higher (earlier than the this level) is used in the given document contents. By default this value is true.</p>

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
                        <td><em>isRestart</em></td>
                        <td>                
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the <em>SetRestart</em> method use.</td>
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
oNumLvl1.SetRestart(false);
oParagraph = oDocument.GetElement(0);
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the first element of a parent numbered list which starts with '1'");
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the first element of a child numbered list which starts with 'a'");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the second element of a child numbered list which starts with 'b'");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl);
oParagraph.AddText("This is the second element of a parent numbered list which starts with '2'");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the third element of a child numbered list which starts with 'c'");
oDocument.Push(oParagraph);
oParagraph = Api.CreateParagraph();
oParagraph.SetNumbering(oNumLvl1);
oParagraph.AddText("This is the fourth element of a child numbered list which starts with 'd'");
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetRestart.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4888913&doc=VE9wL3pnSnlXUEM4WE82RUxZdkpvZjlQVnBzdUoyMnhPbGdFS3Z5OEFJVT0_IjQ4ODg5MTMi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
