<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("GetMacros", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the document macros.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("GetMacros");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns a <em>Macros</em> object containing the data about all the macros from the document in the following form (JSON):</p>
<pre>
{
    "macrosArray" : "string[]",
    "current" : number
}
</pre>

<p>The <em>Macros</em> object can have the following values:</p>
<ul>
    <li>"macrosArray" (e.g. <em>{"macrosArray": [{"name": "Macros1", "value": "{macrosCode}"}]}</em> ) is an array of macroc codes;</li>
    <li>"current" (e.g. <em>{"current": 1}</em> ) is a current macros index.</li>
</ul>
