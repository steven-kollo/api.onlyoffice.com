<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("RemoveOleObject", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows removing OLE object from the document by its internal ID.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("RemoveOleObject", [sInternalId]);
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
            <td>sInternalId</td>
            <td>The OLE object identifier which is used to work with OLE object added to the document.</td>
            <td>string</td>
            <td>"5_556"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("RemoveOleObject", ["5_556"]);
</pre>
