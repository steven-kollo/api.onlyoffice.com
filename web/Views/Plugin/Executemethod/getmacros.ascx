<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetMacros", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the document macros.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetMacros");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the <em>Macros</em> object containing the data about all the macros from the document in the following form (JSON):</p>
<pre>
{
    "macrosArray" : array,
    "current" : number
}
</pre>

<div class="header-gray">Parameters</div>
<div id="mobile-content"></div>
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
            <td>macrosArray</td>
            <td>An array of macros codes (<em>[{"name": "Macros1", "value": "{macrosCode}"}]</em>).</td>
            <td>array of objects</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td>current</td>
            <td>A current macros index.</td>
            <td>number</td>
            <td>1</td>
        </tr>
    </tbody>
</table>
