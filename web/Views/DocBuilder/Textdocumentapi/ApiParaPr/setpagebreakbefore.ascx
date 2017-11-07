<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetPageBreakBefore</span>
</h1>

<h4 class="header-gray" id="SetPageBreakBefore">SetPageBreakBefore(isPageBreakBefore)</h4>
<p class="dscr">Specify that when rendering this document using a paginated view, the contents of this paragraph are rendered at the beginning of a new page in the document.</p>

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
                        <td><em>isPageBreakBefore</em></td>
                        <td>                
                        <em>boolean</em>
                        </td>
                        <td>The <em>true</em> value will enable the option to render the contents of the paragraph at the beginning of the a new page in the document.</td>
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
oParaPr.SetPageBreakBefore(true);
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is an example of setting a page break before a paragraph. ");
oParagraph.AddText("The second paragraph will start from a new page, as it has a page break before it. ");
oParagraph.AddText("Scroll down to the second page to see it. ");
oParagraph = Api.CreateParagraph();
oParagraph.AddText("This is the second paragraph and it has page break before it enabled.");
oParagraph.SetStyle(oMyStyle);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "SetPageBreakBefore.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891386&doc=Z1E1d3JkTGFXKzR6azJ5Q0paMlpXRVhMS01jbUJmT2FPd0g0Z001VFFvMD0_IjQ4OTEzODYi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
