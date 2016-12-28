<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetKeepNext</span>
</h1>

<h4 class="header-gray" id="SetKeepNext">SetKeepNext(isKeepNext)</h4>
<p class="dscr">Specify that when rendering this document using a paginated view, the contents of this paragraph are at least partly rendered on the same page as the following paragraph whenever possible.</p>

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
                        <td><em>isKeepNext</em></td>
                        <td>
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the option to keep lines of the paragraph on the same page as the following paragraph.</td>
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
oParaPr.SetKeepNext(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is an example of how the paragraph tries to keep together with the next paragraph. ");
oParagraph.AddText("Scroll down to the second page to see it. ");
for (var x = 0; x < 5; ++x)
{
oParagraph = Api.CreateParagraph();
for (var i = 0; i < 10; ++i)
{
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oParagraph.SetStyle(oMyStyle);
oDocument.Push(oParagraph);
}
oParagraph = Api.CreateParagraph();
oParagraph.AddText("The paragraph lines stay on the same page as the previous paragraph. ");
for (var i = 0; i < 10; ++i)
{
oParagraph.AddText("These sentences are used to add lines for demonstrative purposes. ");
}
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetKeepNext.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891365&doc=NmZySmd2SnYySG9DMWdrNmpud1QyenBialh2aXgybkpuMG5Lcy9zLzNLVT0_IjQ4OTEzNjUi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>