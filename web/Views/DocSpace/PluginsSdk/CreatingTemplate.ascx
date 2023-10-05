<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Creating plugin template</span>
</h1>

<p>Before starting plugin development, create a plugin template and configure its settings which will be displayed on the pages of the DocSpace plugin settings.</p>
<ol>
    <li>
        <p>Install the <em>@onlyoffice/docspace-plugin-sdk</em> npm package globally:</p>
        <pre>
npm i - g @onlyoffice/docspace-plugin-sdk
</pre>
        <p>Now the <b>npx</b> command is available which will be used to create a plugin.</p>
    </li>
    <li>
        <p>To create a plugin template, run the following command:</p>
        <pre>
npx create-docspace-plugin
</pre>
    </li>
    <li>
        <p>Configure the plugin in the terminal specifying the following settings in the dialog:</p>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td id="name" class="copy-link">Name</td>
                    <td>The folder with this name will be created where the plugin will be deployed. This field is required.</td>
                </tr>
                <tr class="tablerow">
                    <td id="version" class="copy-link">Version</td>
                    <td>The current plugin version which will be displayed on the pages of the DocSpace plugin settings.
                    The plugin will be updated according to this version when reloading.
                    If the plugin of the current version is already uploaded to the portal, then nothing will happen.</td>
                </tr>
                <tr class="tablerow">
                    <td id="author" class="copy-link">Author</td>
                    <td>The plugin author that will be displayed on the pages of the DocSpace plugin settings.</td>
                </tr>
                <tr class="tablerow">
                    <td id="logo" class="copy-link">Name of the logo image</td>
                    <td>The name of the plugin logo image that must be uploaded to the <em>assets</em> folder. You do not need to specify the path to this file.
                    The logo will be displayed on the pages of the DocSpace plugin settings.</td>
                </tr>
                <tr class="tablerow">
                    <td id="description" class="copy-link">Description</td>
                    <td>The plugin description that will be displayed on the pages of the DocSpace plugin settings.</td>
                </tr>
                <tr class="tablerow">
                    <td id="license" class="copy-link">License</td>
                    <td>The plugin license.</td>
                </tr>
                <tr class="tablerow">
                    <td id="homepage" class="copy-link">Homepage</td>
                    <td>The plugin homepage. For example, it can be the plugin GitHub repository. This information will be displayed on the pages of the DocSpace plugin settings.</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>Select the plugin scopes from the list by pressing <em>Space</em> on the necessary scopes:</p>
        <ul>
            <li><b>API</b> - the plugin will be provided with the origin, proxy and prefix to make requests to the portal server.</li>
            <li><b>Settings</b> - the plugin will be able to manage settings for the administrator.</li>
            <li><b>Context menu</b> - the plugin can be embedded in the context menu of files, folders, rooms, images, video (audio).</li>
            <li><b>Info panel</b> - the plugin can be embedded as a separate tab in the file info panel.</li>
            <li><b>Main button</b> - the plugin can be embedded in the main button.</li>
            <li><b>Profile menu</b> - the plugin can be embedded in the profile menu.</li>
            <li><b>Event listener</b> - the plugin will be given the access to the portal events.</li>
            <li><b>File</b> - the plugin will be able to interact with the file list, change the file type and image.</li>
        </ul>
    </li>
</ol>
<img alt="Creating template" class="screenshot" src="<%= Url.Content("~/content/img/docspace/creating-template.png") %>" />

<p>All the specified parameters you can change later in the <em>package.json</em> file.</p>
<p>You can also create a plugin in any project by adding the <em>@onlyoffice/docspace-plugin-sdk</em> npm package
as the dependency and specifying all the necessary fields in the <em>package.json</em> file.</p>

<div class="header-gray">Example</div>
<pre>{
    "name": "PDF-converter",
    "version": "1.0.0",
    "author": "ONLYOFFICE",
    "scopes": [
      "API",
      "Settings",
      "ContextMenu"
    ],
    "description": "Sample description",
    "pluginName": "PDFConverter",
    "license": "MIT",
    "logo": "logo.png",
    "homepage": "https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/tree/develop/samples/PDF-Converter"
}</pre>
