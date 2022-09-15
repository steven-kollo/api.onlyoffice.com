<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("RemovePlugin", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows removing a plugin with the specified GUID.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("RemovePlugin", [guid]);
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
            <td>guid</td>
            <td>The plugin identifier. It must be of the <em>asc.{UUID}</em> type.</td>
            <td>string</td>
            <td>"asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns an <em>object</em> with the result information.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("RemovePlugin", ["asc.{FFE1F462-1EA2-4391-990D-4CC84940B754}"]);
</pre>
