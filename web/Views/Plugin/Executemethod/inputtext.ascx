<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("InputText", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows inserting text into the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("InputText", [text, textReplace]);
</pre>
<p>Where:</p>
<ul>
    <li><em>text</em> is a string value that specifies the text to be inserted into the document;</li>
    <li><em>textReplace</em> is a string value that specifies the text to be replaced with a new text.</li>
</ul>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("InputText", ["ONLYOFFICE Plugins", "ONLYOFFICE for developers"]);
</pre>
