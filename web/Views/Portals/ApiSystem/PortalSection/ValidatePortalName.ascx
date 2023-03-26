<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("apisystem/portalsection") %>"></a>
    <span class="hdr">POST /api/portal/validateportalname</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Checks if the name is available to create a portal.</p>

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
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>portalName<span class="required">*</span>
                <div class="infotext">sent in Query</div>
            </td>
            <td>the name of a portal</td>
            <td>string</td>
            <td>example</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<span class="required-descr"><span class="required">*</span><em> - required field</em></span>

<div class="header-gray">Returns</div>
<p>The response will contain the following information:</p>

<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>error</td>
            <td>
                if the portal name is already taken or some other error occurred during the request, the response object will have the <em>error</em> key with one of the following values:
                <ul>
                    <li><b>error</b> - a general error, the description will be given in the <em>message</em></li>
                    <li><b>portalNameEmpty</b> - the portal name is empty, you need to send some value as <b>portalName</b></li>
                    <li><b>portalNameExist</b> - the portal name is already taken, you need to choose another name</li>
                    <li><b>portalNameIncorrect</b> - the portal name contains some characters which are not allowed (characters other than base latin letters and digits)</li>
                    <li><b>tooShortError</b> - the portal name is too short, it cannot be less than 6 characters</li>
                </ul>
            </td>
            <td>string</td>
            <td>portalNameEmpty</td>
        </tr>
        <tr class="tablerow">
            <td>message</td>
            <td>if the portal name is available, the response object <em>message</em> key will have the "portalNameReadyToRegister" value, otherwise the error description will be included into the <em>message</em> value</td>
            <td>string</td>
            <td>portalNameReadyToRegister</td>
        </tr>
        <tr class="tablerow">
            <td>variants</td>
            <td>in case <em>error</em> is equal to <b>portalNameExist</b>, the response will also have the list of all the existing potal names starting with the name in request</td>
            <td>array of string</td>
            <td>["example","example2014"]</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<div class="header-gray">Example successful response</div>
<pre>
{
    message = "portalNameReadyToRegister"
}
</pre>
<div class="header-gray">Example error response</div>
<pre>
{
    "error": "portalNameExist",
    "message": "Portal already exists",
    "variants": [ "example", "example2014" ]
}
</pre>
