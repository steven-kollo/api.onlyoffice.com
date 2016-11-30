<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">AddImage</span>
</h1>

<h4 class="header-gray" id="SetName">AddImage(sImageSrc, nWidth, nHeight, nFromCol, nColOffset, nFromRow, nRowOffset) &rarr; {<a href="<%= Url.Action("spreadsheetapi/apiimage") %>">ApiImage</a>}</h4>
<p class="dscr">Adds the image to the current sheet with the parameters specified.</p>

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
                        <td><em>sImageSrc</em></td>
                        <td>
                            <em>string</em>
                        </td>
                        <td>The image source where the image to be inserted should be taken from (currently only internet URL or Base64 encoded images are supported).</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nWidth</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The image width in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nHeight</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The image height in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nFromCol</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The number of the column where the beginning of the image will be placed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nColOffset</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The offset from the <em>nFromCol</em> column to the left part of the image measured in English measure units.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nFromRow</em></td>
                        <td>
                            <em>number</em>
                        </td>
                        <td>The number of the row where the beginning of the image will be placed.</td>
                    </tr>
                    <tr class="tablerow">
                        <td><em>nRowOffset</em></td>
                        <td>
                            <a href="<%= Url.Action("global") %>#EMU">EMU</a>
                        </td>
                        <td>The offset from the <em>nFromRow</em> row to the upper part of the image measured in English measure units.</td>
                    </tr>
                </tbody>
            </table>
            <div class="note">Please note, that the horizontal <em>nColOffset</em> and vertical <em>nRowOffset</em> offsets are calculated within the limits of the specified <em>nFromCol</em> column and <em>nFromRow</em> row cell only. If this value exceeds the cell width or height, another vertical/horizontal position will be set.</div>
            
            <h2>Returns:</h2>
            <dl class="param-type">
                <dt>Type</dt>
                <dd>
                    <a href="<%= Url.Action("spreadsheetapi/apiimage") %>">ApiImage</a>
                </dd>
            </dl>

<h2>Example</h2>
<div class="copy_code">
<span class="button">Copy code</span>
</div>
<pre>builder.CreateFile("xlsx");
var oWorksheet = Api.GetActiveSheet();
oWorksheet.AddImage("https://api.onlyoffice.com/content/img/docbuilder/examples/coordinate_aspects.png", 60 * 36000, 35 * 36000, 0, 2 * 36000, 0, 3 * 36000);
builder.SaveFile("xlsx", "AddImage.xlsx");
builder.CloseFile();</pre>

<h2>Resulting document</h2>
<iframe class="docbuilder_resulting_docs" src="https://help.onlyoffice.com/products/files/doceditor.aspx?fileid=5003260&doc=M1hVRjVYUVdneVdKY0Q5dkU0emxWZ3FjVStFN3kyQ0dpaERKeUpyRzhncz0_IjUwMDMyNjAi0&action=embedded" frameborder="0" scrolling="no" allowtransparency></iframe>