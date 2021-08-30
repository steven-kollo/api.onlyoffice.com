<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("StartAction", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows specifying the start action for long operations.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("StartAction", [type, description]);
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
            <td>type</td>
            <td>A value which defines an action type which can take 0 if this is an <em>Information</em> action or 1 if this is a <em>BlockInteraction</em> action.</td>
            <td>number</td>
            <td>1</td>
        </tr>
        <tr class="tablerow">
            <td>description</td>
            <td>A string value that specifies the description text for the start action of the operation.</td>
            <td>string</td>
            <td>"Save to localstorage..."</td>
        </tr>
    </tbody>
</table>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("StartAction", [1, "Save to localstorage..."]);
</pre>
