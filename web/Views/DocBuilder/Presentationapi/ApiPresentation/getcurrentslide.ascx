<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetCurrentSlide</span>
</h1>

<h4 class="header-gray" id="GetCurrentSlide">GetCurrentSlide() &rarr; {<a href="<%= Url.Action("presentationapi/apislide") %>">ApiSlide</a>}</h4>
<p class="dscr">Get the current slide.</p>

            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("presentationapi/apislide") %>">ApiSlide</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetCurrentSlide();
oSlide.RemoveAllObjects();
oGs1 = Api.CreateGradientStop(Api.CreateRGBColor(255, 224, 204), 0);
oGs2 = Api.CreateGradientStop(Api.CreateRGBColor(255, 164, 101), 100000);
oFill = Api.CreateRadialGradientFill([oGs1, oGs2]);
oSlide.SetBackground(oFill);
builder.SaveFile("pptx", "GetCurrentSlide.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5011289&doc=N04zTTIvd3hMbW1ub1drNTB0eDI5QTd3MFBJbE11SUtVYklSN2JWd2RGUT0_IjUwMTEyODki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>