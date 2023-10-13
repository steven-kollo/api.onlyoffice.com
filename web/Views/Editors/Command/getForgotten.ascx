<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">getForgotten</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Requests a forgotten file.</p>

<div class="header-gray">Request example</div>
<pre>
{
    "c": "getForgotten",
    "key": "Khirz6zTPdfd7"
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
            <td>Presence</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>c</td>
            <td>Defines the command type.</td>
            <td>string</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td>key</td>
            <td>Defines the document identifier used to unambiguously identify the document file.</td>
            <td>string</td>
            <td>required</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Response example</div>

<pre>
{
    "error": 0,
    "key": "Khirz6zTPdfd7",
    "url": "https://documentserver/url-to-forgotten-document.docx"
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
            <td>Presence</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>error</td>
            <td>Defines an error code.</td>
            <td>integer</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td>key</td>
            <td>Defines the document identifier used to unambiguously identify the document file.</td>
            <td>string</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td>url</td>
            <td>Defines the URL to a forgotten file.</td>
            <td>string</td>
            <td>required</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
