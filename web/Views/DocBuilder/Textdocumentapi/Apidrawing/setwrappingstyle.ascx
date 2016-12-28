<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetWrappingStyle</span>
</h1>

<h4 class="header-gray" id="SetWrappingStyle">SetWrappingStyle(sType)</h4>
<p class="dscr">Set the wrapping type of this object (image, shape, chart). One of the following wrapping style types can be set:</p>
                    <ul>
                        <li><b>"inline"</b> - the object is considered to be a part of the text, like a character, so when the text moves, the object moves as well. In this case the positioning options are inaccessible.</li>
                    </ul>
                    If one of the following styles is selected, the object can be moved independently of the text and positioned on the page exactly:
                    <ul>
                        <li><b>"square"</b> - the text wraps the rectangular box that bounds the object.</li>
                        <li><b>"tight"</b> - the text wraps the actual object edges.</li>
                        <li><b>"through"</b> - the text wraps around the object edges and fills in the open white space within the object.</li>
                        <li><b>"topAndBottom"</b> - the text is only above and below the object.</li>
                        <li><b>"behind"</b> - the text overlaps the object.</li>
                        <li><b>"inFront"</b> - the object overlaps the text.</li>
                    </ul>
               
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
                            <em>"inline"</em>
                            |
                            <em>"square"</em>
                            |
                            <em>"tight"</em>
                            |
                            <em>"through"</em>
                            |
                            <em>"topAndBottom"</em>
                            |
                            <em>"behind"</em>
                            |
                            <em>"inFront"</em>
                        </td>
                        <td>The wrapping style type available for the object.</td>
                    </tr>
                </tbody>
            </table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is a paragraph with a shape. ");
oParagraph.AddText("The text wraps the rectangular box that bounds the object. ");
oParagraph.AddText("The distance between the shape and the text (horizontally) is half an inch (457200 English measure units).");
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(155, 64, 1), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 1908000, 1404000, oFill, oStroke);
oDrawing.SetDistances(457200, 457200, 457200, 0);
oDrawing.SetWrappingStyle("square");
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "SetWrappingStyle.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887531&doc=Qi9pY2hsVU5WNzdBc3dXTVN1a1RQd1dKRUVDVzU1S1NIclhIbnNsV24zcz0_IjQ4ODc1MzEi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>