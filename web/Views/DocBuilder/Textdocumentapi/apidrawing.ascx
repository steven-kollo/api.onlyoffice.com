<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ApiDrawing</span>
</h1>

<h4 class="header-gray" id="ApiDrawing">new ApiDrawing()</h4>
<p class="dscr">Class representing a graphical object.</p>

<h2>Methods</h2>
<table class="table table-classlist">
    <thead>
        <tr class="tablerow">
            <td class="table-classlist-name">Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/getclasstype") %>">GetClassType</a></td>
            <td>Get the type of the class based on this base class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setdistances") %>">SetDistances</a></td>
            <td>Specify the minimum distance which will be maintained between the edges of this drawing object and any subsequent text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/sethoralign") %>">SetHorAlign</a></td>
            <td>Specify how the floating object will be horizontally aligned.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/sethorposition") %>">SetHorPosition</a></td>
            <td>Set an absolute measurement for the horizontal positioning of the floating object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setsize") %>">SetSize</a></td>
            <td>Set the size of the object (image, shape, chart) bounding box.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setveralign") %>">SetVerAlign</a></td>
            <td>Specify how the floating object will be vertically aligned.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setverposition") %>">SetVerPosition</a></td>
            <td>Set an absolute measurement for the vertical positioning of the floating object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("textdocumentapi/apidrawing/setwrappingstyle") %>">SetWrappingStyle</a></td>
            <td>Set the wrapping type of this object (image, shape, chart).</td>
        </tr>
    </tbody>
</table>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(155, 64, 1), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
oDrawing.SetSize(2000 * 635, 2000 * 635);
oDrawing.SetWrappingStyle("inFront");
oDrawing.SetHorAlign("margin", "right");
oDrawing.SetVerAlign("page", "top");
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "ApiDrawing.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887378&doc=RzRaQVV2WFJndXRSc05FNHlORmsxUDlZWEFjTHk3eFJOZ1pMSCtuUzBKRT0_IjQ4ODczNzgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>