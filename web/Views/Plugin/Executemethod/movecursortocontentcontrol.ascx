<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("MoveCursorToContentControl", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows moving the cursor to the specified content control.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("MoveCursorToContentControl", [InternalId, isBegin]);
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
            <td>InternalId</td>
            <td>A unique internal identifier of the content control.</td>
            <td>string</td>
            <td>"2_839"</td>
        </tr>
        <tr class="tablerow">
            <td>isBegin</td>
            <td>Defines if the cursor position changes in the content control. By default, the cursor will be placed to the content control begin (<b>false</b>).</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("MoveCursorToContentControl", ["2_839", false]);
</pre>
