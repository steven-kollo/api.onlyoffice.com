<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("SetDisplayModeInReview", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows setting the display mode for track changes.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("SetDisplayModeInReview", [sMode]);
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
            <td>sMode</td>
            <td>The display mode: <em>"edit"</em> - all changes are displayed, <em>"simple"</em> - all changes are displayed but the balloons are turned off,
            <em>"final"</em> - all accepted changes are displayed, <em>"original"</em> - all rejected changes are displayed.
            The default value is <em>"edit"</em>.</td>
            <td>string</td>
            <td>"edit"</td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>
<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("SetDisplayModeInReview", ["edit"]);
</pre>
