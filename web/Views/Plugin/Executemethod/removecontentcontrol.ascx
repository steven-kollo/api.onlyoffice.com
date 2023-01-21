<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("RemoveContentControl", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows removing the currently selected content control retaining all its contents. 
The content control where the mouse cursor is currently positioned will be removed.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("RemoveContentControl", [InternalId]);
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
            <td>InternalId</td>
            <td>A unique internal identifier of the content control.</td>
            <td>string</td>
            <td>"5_665"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns an object which contains the following values:</p>
<pre>
{
    "Parent" : object,
    "Pos" : integer,
    "Count" : integer
}
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
            <td>Parent</td>
            <td>The content control parent.</td>
            <td>object</td>
            <td>oParagraph</td>
        </tr>
        <tr class="tablerow">
            <td>Pos</td>
            <td>The content control position within the parent object.</td>
            <td>integer</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>Count</td>
            <td>A number of elements in the parent object.</td>
            <td>integer</td>
            <td>1</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>

<pre>
window.buttonIDChangeState_click = undefined;
    if (null == returnValue) {
        window.Asc.plugin.executeMethod("AddContentControl", [1, {"Id" : 7, "Lock" : 0, "Tag" : "{some text}"}]);
    }
    else {
        window.Asc.plugin.executeMethod("RemoveContentControl", [returnValue]);
    }
</pre>
