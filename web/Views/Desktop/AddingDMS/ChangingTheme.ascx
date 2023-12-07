<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("addingdms/") %>"></a>
    <span class="hdr">Changing a theme</span>
</h1>

<p>Starting from version 7.5, you can change a theme of the desktop editor tab.
    To do this, use the <em>portal:uitheme</em> command of the <a href="<%= Url.Action("execcommand") %>">execCommand</a> method.</p>

<pre>
window.AscDesktopEditor.execCommand ("portal:uitheme", editorTheme);
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
            <td id="editorTheme" class="copy-link">editorTheme</td>
            <td>
                Defines the editor theme settings.
                It can be set in two ways:
                <ul>
                    <li><b>theme id</b> - the user sets the theme parameter by its id (<b>theme-light</b>, <b>theme-classic-light</b>, <b>theme-dark</b>, <b>theme-contrast-dark</b>),</li>
                    <li>
                        <b>default theme</b> - the default dark or light theme value will be set (<b>default-dark</b>, <b>default-light</b>).
                        The default light theme is <b>theme-classic-light</b>.
                    </li>
                </ul>
                The first option has higher priority.
                <p></p>
                Apart from the available editor themes, the user can also customize their own <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx" target="_blank">color themes</a> for the application interface.
            </td>
            <td>string</td>
            <td>"theme-dark"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>
window.AscDesktopEditor.execCommand("portal:uitheme", "theme-dark")
</pre>

<p>When the <em>portal:uitheme</em> command is sent, the editor theme is changed to the one specified in the method parameters.</p>
