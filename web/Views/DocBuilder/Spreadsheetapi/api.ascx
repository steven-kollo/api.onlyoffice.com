<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Api</span>
</h1>

<h4 class="header-gray" id="Api">new Api()</h4>
<p class="dscr">Base class.</p>

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
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createblipfill") %>">CreateBlipFill</a></td>
                        <td>Create a blip fill which allows to fill the object using a selected image as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createbullet") %>">CreateBullet</a></td>
                        <td>Create a bullet for a paragraph with the character or symbol specified with the <em>sBullet</em> parameter.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createcolorbyname") %>">CreateColorByName</a></td>
                        <td>Create a color selecting it from one of the available color presets.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createcolorfromrgb") %>">CreateColorFromRGB</a></td>
                        <td>Create an RGB color setting the appropriate values for the red, green and blue color components.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/creategradientstop") %>">CreateGradientStop</a></td>
                        <td>Create a gradient stop used for different types of gradients.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createlineargradientfill") %>">CreateLinearGradientFill</a></td>
                        <td>Create a linear gradient fill which allows to fill the object using a selected linear gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createnofill") %>">CreateNoFill</a></td>
                        <td>Create no fill and remove the fill from the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createnumbering") %>">CreateNumbering</a></td>
                        <td>Create a bullet for a paragraph with the character or symbol specified with the <em>sType</em> parameter.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createparagraph") %>">CreateParagraph</a></td>
                        <td>Create a new paragraph.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createpatternfill") %>">CreatePatternFill</a></td>
                        <td>Create a pattern fill which allows to fill the object using a selected pattern as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createpresetcolor") %>">CreatePresetColor</a></td>
                        <td>Create a color selecting it from one of the available color presets.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createradialgradientfill") %>">CreateRadialGradientFill</a></td>
                        <td>Create a radial gradient fill which allows to fill the object using a selected radial gradient as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/creatergbcolor") %>">CreateRGBColor</a></td>
                        <td>Create an RGB color setting the appropriate values for the red, green and blue color components.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createrun") %>">CreateRun</a></td>
                        <td>Create a new smaller text block to be inserted to the current paragraph or table.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createschemecolor") %>">CreateSchemeColor</a></td>
                        <td>Create a complex color scheme selecting from one of the available schemes.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createsolidfill") %>">CreateSolidFill</a></td>
                        <td>Create a solid fill which allows to fill the object using a selected solid color as the object background.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/createstroke") %>">CreateStroke</a></td>
                        <td>Create a stroke adding shadows to the element.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/api/getactivesheet") %>">GetActiveSheet</a></td>
                        <td>Get the object that represents the active sheet.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirange/getthemescolors") %>">GetThemesColors</a></td>
                        <td>Get the list of all available theme colors for the spreadsheet.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><a href="<%= Url.Action("spreadsheetapi/apirange/setthemecolors") %>">SetThemeColors</a></td>
                        <td>Set the theme colors to the current spreadsheet.</td>
                    </tr>
                </tbody>
            </table>

<%--<h2>Example</h2><pre>var oWorksheet = Api.GetActiveSheet();
oWorksheet.GetRange("D2").SetValue("2");</pre>

<h2>Resulting document</h2>--%>