<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("RemoveOleObjects", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows removing several OLE objects from the document by their internal IDs.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("RemoveOleObjects", [arrObjects]);
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
            <td>arrObjects</td>
            <td>An array of the identifiers which are used to work with OLE objects added to the document.</td>
            <td>array of objects</td>
            <td>[{"InternalId": "5_556"}]</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("RemoveOleObjects", [[{"InternalId": "5_556"}]]);
</pre>
