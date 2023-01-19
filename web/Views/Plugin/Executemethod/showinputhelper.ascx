<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("ShowInputHelper", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows showing the input helper.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("ShowInputHelper", [guid, w, h, isKeyboardTake]);
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
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
            <td>A string value which specifies a plugin identifier which must be of the <em>asc.{UUID}</em> type.</td>
            <td>string</td>
            <td>"asc.{UUID}"</td>
        </tr>
        <tr class="tablerow">
            <td>w</td>
            <td>A number which specifies the window width measured in millimeters.</td>
            <td>string</td>
            <td>70</td>
        </tr>
        <tr class="tablerow">
            <td>h</td>
            <td>A number which specifies the window height measured in millimeters.</td>
            <td>string</td>
            <td>70</td>
        </tr>
        <tr class="tablerow">
            <td>isKeyboardTake</td>
            <td>Defines if the keyboard is caught (<b>true</b>) or not (<b>false</b>).</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod("ShowInputHelper", ["asc.{UUID}", 70, 70, true]);
</pre>
