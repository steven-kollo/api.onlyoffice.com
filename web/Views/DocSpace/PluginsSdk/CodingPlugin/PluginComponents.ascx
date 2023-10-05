<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Plugin components</span>
</h1>

<p class="dscr">
    The following plugin UI components are available for DocSpace plugins:
</p>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/box") %>">Box</a></td>
            <td>A container that lays out its contents in one direction. Box provides general CSS capabilities like flexbox layout, paddings, background color, border, and animation.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/button") %>">Button</a></td>
            <td>A component that is used for an action on a page.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/checkbox") %>">Checkbox</a></td>
            <td>Custom checkbox input.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/combobox") %>">ComboBox</a></td>
            <td>Custom combo box input.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/component") %>">Component</a></td>
            <td>A component that is used to add components into <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/box") %>">Box</a>.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/createdialog") %>">CreateDialog</a></td>
            <td>Modal dialog for creating some item (file, folder, etc.).</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/iframe") %>">IFrame</a></td>
            <td>A component that is used to embed a third-party website into a modal window or the settings page.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/img") %>">img</a></td>
            <td>A component that is used to embed an image not from the <em>assets</em> folder into a modal window or the settings page.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/input") %>">Input</a></td>
            <td>Input field for single-line strings.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/label") %>">Label</a></td>
            <td>Field name in the form.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/modaldialog") %>">ModalDialog</a></td>
            <td>Modal dialog.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/skeleton") %>">Skeleton</a></td>
            <td>A component that is used to hide components during uploading.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/text") %>">Text</a></td>
            <td>Plain text.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/textarea") %>">TextArea</a></td>
            <td>Custom textarea.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/toast") %>">Toast</a></td>
            <td>Toast.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents/togglebutton") %>">ToggleButton</a></td>
            <td>Custom toggle button input.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
