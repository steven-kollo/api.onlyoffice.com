<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingdms/") %>"></a>
    <span class="hdr">execCommand</span>
</h1>


<p>Use the <b>execCommand</b> method of the <em>window.AscDesktopEditor</em> object to execute a command specified in the request.</p>
<pre>
window.AscDesktopEditor.execCommand (command, parameters)
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
                Defines a command that must be executed.
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

<p>The following commands are available:</p>
<div class="header-gray">Commands</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Command</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="open:document" class="copy-link"><a href="<%= Url.Action("addingdms/opening") %>">open:document</a></td>
            <td>Opens a document.</td>
        </tr>
        <tr class="tablerow">
            <td id="portal:checkpwd" class="copy-link"><a href="<%= Url.Action("addingdms/encryption/keygeneration") %>">portal:checkpwd</a></td>
            <td>Transfers the information about a password from the login page to the desktop app.</td>
        </tr>
        <tr class="tablerow">
            <td id="portal:login" class="copy-link"><a href="<%= Url.Action("addingdms/loginlogout") %>#login">portal:login</a></td>
            <td>Registers a cloud and adds it to the <b>Connected clouds</b> page.</td>
        </tr>
        <tr class="tablerow">
            <td id="portal:logout" class="copy-link"><a href="<%= Url.Action("addingdms/loginlogout") %>#logout">portal:logout</a></td>
            <td>Removes a cloud from the list on the <b>Connected clouds</b> page.</td>
        </tr>
        <tr class="tablerow">
            <td id="portal:uitheme" class="copy-link"><a href="<%= Url.Action("addingdms/changingtheme") %>">portal:uitheme</a></td>
            <td>Changes a theme of the desktop editor tab.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
