<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod("PasteHtml", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows pasting text in <em>html</em> format into the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod("PasteHtml", [htmlText]);
</pre>
<p>Where <em>htmlTtext</em> is a string value that specifies the text in <em>html</em> format to be pasted into the document.</p>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("PasteHtml", ["<p><b>Plugin methods for OLE objects</b></p><ul><li>AddOleObject</li><li>EditOleObject</li></ul>"]);
</pre>
