<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetFontList", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the fonts list.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetFontList");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns an array of the <em>FontInfo</em> objects containing the data about the used fonts in the following form (JSON):</p>
<pre>
{
    "m_wsFontName" : "string",
    "m_wsFontPath" : "string",
    "m_lIndex" : integer,
    "m_bBold": boolean,
    "m_bItalic" : boolean,
    "m_bIsFixed" : boolean,
    "m_aPanose" : integer[],
    "m_ulUnicodeRange1" : integer,
    "m_ulUnicodeRange2" : integer,
    "m_ulUnicodeRange3" : integer,
    "m_ulUnicodeRange4": integer,
    "m_ulCodePageRange1" : integer,
    "m_ulCodePageRange2" : integer,
    "m_usWeigth" : integer,
    "m_usWidth" : integer,
    "m_sFamilyClass" : integer,
    "m_eFontFormat" : integer,
    "m_shAvgCharWidth": integer,
    "m_shAscent" : integer,
    "m_shDescent" : integer,
    "m_shLineGap" : integer,
    "m_shXHeight" : integer,
    "m_shCapHeight" : integer
}
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>m_wsFontName</td>
            <td>The font name.</td>
            <td>string</td>
            <td>"Open Sans"</td>
        </tr>
        <tr class="tablerow">
            <td>m_wsFontPath</td>
            <td>The path to the file with the current font.</td>
            <td>string</td>
            <td>"OpenSans-Bold.ttf"</td>
        </tr>
        <tr class="tablerow">
            <td>m_lIndex</td>
            <td>The font number in the file if there is more than one font in the file.</td>
            <td>integer</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>m_bBold</td>
            <td>Specifies if the font characters are bold or not.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td>m_bItalic</td>
            <td>Specifies if the font characters are italic or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>m_bIsFixed</td>
            <td>Specifies if the current font is monospaced or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>m_aPanose</td>
            <td>The PANOSE Typeface Classification Number, a compact 10-byte description of the font critical visual characteristics, such as contrast, weight, and serif style.</td>
            <td>array of integers</td>
            <td>[2, 11, 8, 6, 3, 5, 4, 2, 2, 4]</td>
        </tr>
        <tr class="tablerow">
            <td>m_ulUnicodeRange1</td>
            <td>The Unicode range encompassed by the font file (Bits 0-31).</td>
            <td>integer</td>
            <td>3758097135</td>
        </tr>

        <tr class="tablerow">
            <td>m_ulUnicodeRange2</td>
            <td>The Unicode range encompassed by the font file (Bits 32-63).</td>
            <td>integer</td>
            <td>1073750107</td>
        </tr>
        <tr class="tablerow">
            <td>m_ulUnicodeRange3</td>
            <td>The Unicode range encompassed by the font file (Bits 64-95).</td>
            <td>integer</td>
            <td>40</td>
        </tr>
        <tr class="tablerow">
            <td>m_ulUnicodeRange4</td>
            <td>The Unicode range encompassed by the font file (Bits 96-127).</td>
            <td>integer</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>m_ulCodePageRange1</td>
            <td>The code pages encompassed by the font file (Bits 0-31).</td>
            <td>integer</td>
            <td>536871327</td>
        </tr>
        <tr class="tablerow">
            <td>m_ulCodePageRange2</td>
            <td>The code pages encompassed by the font file (Bits 32-63).</td>
            <td>integer</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>m_usWeigth</td>
            <td>The visual weight (stroke blackness or thickness) of the font characters (1-1000).</td>
            <td>integer</td>
            <td>700</td>
        </tr>
        <tr class="tablerow">
            <td>m_usWidth</td>
            <td>The relative change from the normal aspect ratio (width to height ratio).</td>
            <td>integer</td>
            <td>5</td>
        </tr>
        <tr class="tablerow">
            <td>m_sFamilyClass</td>
            <td>The font family class which values are assigned by IBM to each font family.</td>
            <td>integer</td>
            <td>2050</td>
        </tr>
        <tr class="tablerow">
            <td>m_eFontFormat</td>
            <td>The specific file type(s) used to store font data: <b>0</b> - <em>*.fon</em>, <b>1</b> - <em>*.ttf</em>, <b>2</b> - <em>*.ttf</em>, <em>*.otf</em> (CFF), <b>3</b> - unknown font format.</td>
            <td>integer</td>
            <td>1</td>
        </tr>
        <tr class="tablerow">
            <td>m_shAvgCharWidth</td>
            <td>The arithmetic average of the escapement (width) of all non-zero width glyphs in the font.</td>
            <td>integer</td>
            <td>632</td>
        </tr>
        <tr class="tablerow">
            <td>m_shAscent</td>
            <td>The height above the baseline for a clipping region.</td>
            <td>integer</td>
            <td>765</td>
        </tr>
        <tr class="tablerow">
            <td>m_shDescent</td>
            <td>The vertical extent below the baseline for a clipping region.</td>
            <td>integer</td>
            <td>-240</td>
        </tr>
        <tr class="tablerow">
            <td>m_shLineGap</td>
            <td>The typographic line gap for the current font.</td>
            <td>integer</td>
            <td>64</td>
        </tr>
        <tr class="tablerow">
            <td>m_shXHeight</td>
            <td>The distance between the baseline and the approximate height of non-ascending lowercase letters measured in FUnits.</td>
            <td>integer</td>
            <td>545</td>
        </tr>
        <tr class="tablerow">
            <td>m_shCapHeight</td>
            <td>The distance between the baseline and the approximate height of uppercase letters measured in FUnits.</td>
            <td>integer</td>
            <td>713</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>

<pre>
{"m_wsFontName": "Open Sans", "m_wsFontPath": "OpenSans-Bold.ttf", "m_lIndex": 0, "m_bBold": true, "m_bItalic": false, "m_bIsFixed": false, "m_aPanose": [2, 11, 8, 6, 3, 5, 4, 2, 2, 4],
"m_ulUnicodeRange1": 3758097135, "m_ulUnicodeRange2": 1073750107, "m_ulUnicodeRange3": 40, "m_ulUnicodeRange4": 0, "m_ulCodePageRange1": 536871327, "m_ulCodePageRange2": 0,
"m_usWeigth": 700, "m_usWidth": 5, "m_sFamilyClass": 2050, "m_eFontFormat": 1, "m_shAvgCharWidth": 632, "m_shAscent": 765, "m_shDescent": -240, "m_shLineGap": 64, "m_shXHeight": 545,
"m_shCapHeight": 713}
</pre>
