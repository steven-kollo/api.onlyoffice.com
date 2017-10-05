<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateSlide</span>
</h1>

<h4 class="header-gray" id="CreateSlide">CreateSlide() &rarr; {<a href="<%= Url.Action("presentationapi/apislide") %>">ApiSlide</a>}</h4>
<p class="dscr">Create a new slide.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("presentationapi/apislide") %>">ApiSlide</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="button copy-code">Copy code</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = Api.CreateSlide();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
oPresentation.AddSlide(oSlide);
builder.SaveFile("pptx", "CreateSlide.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004779&doc=WjZ2NlJxM2VaOTFBOXdMWXhPNG15RGdlRGozQmFqVFFCaURWVFN2aHJUYz0_IjUwMDQ3Nzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>
