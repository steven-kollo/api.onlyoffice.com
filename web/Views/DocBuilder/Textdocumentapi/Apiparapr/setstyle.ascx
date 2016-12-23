<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetStyle</span>
</h1>

<h4 class="header-gray" id="SetStyle">SetStyle(oStyle)</h4>
<p class="dscr">The paragraph style base method.</p>               
<div class="note">This method is not used by itself, as it only forms the basis for the <a href="<%= Url.Action("textdocumentapi/apiparagraph/setstyle") %>">ApiParagraph.SetStyle</a> method which sets the selected or created style for the paragraph.</div>

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
                        <td><em>oStyle</em></td>
                        <td>
                        <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>
                        </td>
                        <td>The style of the paragraph to be set.</td>
                    </tr>
                </tbody>
                </table>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph, oParaPr;
var oHeading6Style = oDocument.GetStyle("Heading 6");
oParaPr = oHeading6Style.GetParaPr();
oParaPr.SetJc("center");
oParagraph = oDocument.GetElement(0);
oParagraph.SetStyle(oHeading6Style);
oParagraph.AddText("This is a text in a paragraph styled with the 'Heading 6' style.");
builder.SaveFile("docx", "SetStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4891401&doc=Zy9sZVlybEdRVDhwSjY0RFhqVzlSY3dPSVVTdlBDWHc3Nm1DYTJTd1ArTT0_IjQ4OTE0MDEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>