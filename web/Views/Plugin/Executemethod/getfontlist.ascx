<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("GetFontList", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the fonts list.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("GetFontList");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns an array of <em>FontInfo</em> objects containing the data about the used fonts in the following form (JSON):</p>
<pre>
{
    "m_wsFontName" : "string",
    "m_wsFontPath" : "string",
    "m_lIndex" : number,
    "m_bBold": boolean,
    "m_bItalic" : boolean,
    "m_bIsFixed" : boolean,
    "m_aPanose" : number[],
    "m_ulUnicodeRange1" : number,
    "m_ulUnicodeRange2" : number,
    "m_ulUnicodeRange3" : number,
    "m_ulUnicodeRange4": number,
    "m_ulCodePageRange1" : number,
    "m_ulCodePageRange2" : number,
    "m_usWeigth" : number,
    "m_usWidth" : number,
    "m_sFamilyClass" : "string",
    "m_eFontFormat" : "string",
    "m_shAvgCharWidth": number,
    "m_shAscent" : number,
    "m_shDescent" : number,
    "m_shLineGap" : number,
    "m_shXHeight" : number,
    "m_shCapHeight" : number
}
</pre>
