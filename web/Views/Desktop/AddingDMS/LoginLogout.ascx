<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingdms/") %>"></a>
    <span class="hdr">Login/logout</span>
</h1>

<p>Before you start working on documents stored within your cloud, you need to log in to it.</p>
<p>Use the <b>execCommand</b> method of the <em>window.AscDesktopEditor</em> object to display the cloud in the <b>Connected clouds</b> list or remove it.</p>
<pre>
AscDesktopEditor.execCommand (command, parameters)
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="provider" class="copy-link">command</td>
            <td>
                Defines the command that must be executed.
            </td>
            <td>string</td>
        </tr>
        <tr class="tablerow">
            <td id="name" class="copy-link">parameters</td>
            <td>
                Defines the parameters that are passed to the method.
            </td>
            <td>string</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2 id="login" class="copy-link">portal:login</h2>
<p>When the <em>portal:login</em> command is sent, the cloud is registered and listed on the <b>Connected clouds</b> page.
    Call the command on all the pages you can access after logging in to your cloud.
    Parameters are specified in the format of a string with the serialized <em>json</em> as follows:</p>
<pre>
{
"displayName": "user name", 
"email": "user@email.addr",
"domain": "domain name",
"provider": "provider",
"userId": "user id"
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
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="displayName" class="copy-link">displayName<span class="required">*</span></td>
            <td>
                Defines the user name displayed on the <b>Connected clouds</b> page.
            </td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr class="tablerow">
            <td id="email" class="copy-link">email</td>
            <td>
                Defines the user email displayed on the <b>Connected clouds</b> page.
            </td>
            <td>string</td>
            <td>"john@example.com"</td>
        </tr>
        <tr class="tablerow">
            <td id="domain" class="copy-link">domain<span class="required">*</span></td>
            <td>
                Defines the cloud name and the cloud entry point.
            </td>
            <td>string</td>
            <td>"https://exampledomain.com"</td>
        </tr>
        <tr class="tablerow">
            <td id="provider" class="copy-link">provider<span class="required">*</span></td>
            <td>
                Defines the provider id used to refer to the desktop app in the JavaScript commands (the same as in the <a href="<%= Url.Action("addingdms/") %>">config</a>).
            </td>
            <td>string</td>
            <td>"onlyoffice"</td>
        </tr>
        <tr class="tablerow">
            <td id="userId" class="copy-link">userId<span class="required">*</span></td>
            <td>
                Defines the user id.
            </td>
            <td>string</td>
            <td>"78e1e841"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<span class="required-descr"><span class="required">*</span><em> - required field</em></span>

<div class="header-gray">Example</div>
<pre>
const params = {
    "displayName": "John Smith", 
    "email": "john@example.com",
    "domain": "https://exampledomain.com",
    "provider": "onlyoffice",
    "userId": "78e1e841"
}
AscDesktopEditor.execCommand ("portal:login", JSON.stringify(params))
</pre>

<h2 id="logout" class="copy-link">portal:logout</b></h2>
<p>When the <em>portal:logout</em> command is sent, the cloud will be removed from the list on the <b>Connected clouds</b> page.
    Cookies for this domain will be cleared. Parameters are specified in the format of a string with the serialized <em>json</em> as follows:</p>
<pre>
{
    "domain": "domain name"
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
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="domain" class="copy-link">domain</td>
            <td>
                Defines the cloud name and the cloud entry point.
            </td>
            <td>string</td>
            <td>"https://exampledomain.com"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
window.AscDesktopEditor.execCommand ("portal:logout", JSON.stringify (({
    "domain": "https://exampledomain.com"
}));
</pre>
