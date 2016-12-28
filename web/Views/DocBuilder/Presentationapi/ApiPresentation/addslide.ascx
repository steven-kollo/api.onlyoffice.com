<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddSlide</span>
</h1>

<h4 class="header-gray" id="AddSlide">AddSlide(oSlide)</h4>
<p class="dscr">Append a new slide to the end of the presentation.</p>

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
                        <td><em>oSlide</em></td>
                        <td>
                            <a href="<%= Url.Action("presentationapi/apislide") %>">ApiSlide</a>
                        </td>
                        <td>The slide created using the <a href="<%= Url.Action("presentationapi/api/createslide") %>">Api.CreateSlide</a> method.</td>
                    </tr>
                </tbody>
            </table>

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
builder.SaveFile("pptx", "AddSlide.pptx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5004779&doc=MkJlUlV2SkhYeE80YTZ4Q2VsV0FNSHQwenp0YTZEVStyUmE0SG04cEhZMD0_IjUwMDQ3Nzki0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>