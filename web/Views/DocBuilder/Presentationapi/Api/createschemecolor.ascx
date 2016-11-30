<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSchemeColor</span>
</h1>
<h4 class="header-gray" id="CreateSchemeColor">CreateSchemeColor(sSchemeColorId) &rarr; {<a href="<%= Url.Action("presentationapi/apischemecolor") %>">ApiSchemeColor</a>}</h4>
    <p class="dscr">
        Create a complex color scheme selecting from one of the available schemes.
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
            <td><em>sSchemeColorId</em></td>
            <td>
                <a href="<%= Url.Action("global") %>#SchemeColorId">SchemeColorId</a>
            </td>
            <td>The solor scheme identifier.</td>
        </tr>
    </tbody>
</table>

<h2>Returns:</h2>
<dl class="param-type">
    <dt>Type</dt>
    <dd>
        <a href="<%= Url.Action("presentationapi/apischemecolor") %>">ApiSchemeColor</a>
    </dd>
</dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
oSchemeColor = Api.CreateSchemeColor("accent6");
oGs1 = Api.CreateGradientStop(oSchemeColor, 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "CreateSchemeColor.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004812&doc=bDlLNm1mVG9oVXp3emxWeDFGOFhCNk9QcDRXejg3TjlzY0tkMjZhcU9qbz0_IjUwMDQ4MTIi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>