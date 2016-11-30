<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreatePresetColor</span>
</h1>

<h4 class="header-gray" id="CreatePresetColor">CreatePresetColor(sPresetColor) &rarr; {<a href="<%= Url.Action("textdocumentapi/apipresetcolor") %>">ApiPresetColor</a>}</h4>
<p class="dscr">
Create a color selecting it from one of the available color presets.
</p>
    
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
            <td><em>sPresetColor</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#PresetColor">PresetColor</a>
            </td>
            <td>A preset selected from the list of the available color preset names.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("textdocumentapi/apipresetcolor") %>">ApiPresetColor</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oGs1, oGs2, oFill, oStroke, oDrawing, oParagraph;
oParagraph = oDocument.GetElement(0);
oGs1 = Api.CreateGradientStop(Api.CreatePresetColor("lightYellow"), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oStroke = Api.CreateStroke(0, Api.CreateNoFill());
oDrawing = Api.CreateShape("rect", 5930900, 395605, oFill, oStroke);
oParagraph.AddDrawing(oDrawing);
builder.SaveFile("docx", "CreatePresetColor.docx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=4887168&doc=MS9vZXd1Qm9pSDU0blYwNmNWSWgwZnhEWWRjVi81T1UrcWViSCtmRTRtWT0_IjQ4ODcxNjgi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>