<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("ReplaceTextSmart", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows replacing each paragraph (or text in cell) in the select with the corresponding text from an array of strings.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("ReplaceTextSmart", [arrString, sParaTab, sParaNewLine]);
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
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
            <td>arrString</td>
            <td>An array of replacement strings.</td>
            <td>array of strings</td>
            <td>["test_1", "test_2"]</td>
        </tr>
        <tr class="tablerow">
            <td>sParaTab</td>
            <td>A character which is used to specify the tab in the source text.</td>
            <td>string</td>
            <td>" "</td>
        </tr>
        <tr class="tablerow">
            <td>sParaNewLine</td>
            <td>A character which is used to specify the line break character in the source text.</td>
            <td>string</td>
            <td>" "</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("ReplaceTextSmart", [["test_1", "test_2"], " ", " "]);
</pre>