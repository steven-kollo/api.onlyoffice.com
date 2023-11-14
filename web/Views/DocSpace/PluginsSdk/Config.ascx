<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Config</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The <em>config.json</em> file is generated based on the data from the <em>package.json</em> file.</p>

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
            <td id="author" class="copy-link">author</td>
            <td>The plugin author.</td>
            <td>string</td>
            <td>"ONLYOFFICE"</td>
        </tr>
        <tr class="tablerow">
            <td id="cspDomains" class="copy-link">cspDomains</td>
            <td>The list of all third-party resources that are used in the plugin.</td>
            <td>array of strings</td>
            <td>["https://embed.diagrams.net/", "https://*.diagrams.net/"]</td>
        </tr>
        <tr class="tablerow">
            <td id="description" class="copy-link">description</td>
            <td>The description, i.e. what describes your plugin in the best way.</td>
            <td>string</td>
            <td>"plugin description"</td>
        </tr>
        <tr class="tablerow">
            <td id="homePage" class="copy-link">homePage</td>
            <td>The plugin homepage. For example, it can be the plugin GitHub repository.</td>
            <td>string</td>
            <td>"https://example.com/url-to-plugin-repository"</td>
        </tr>
        <tr class="tablerow">
            <td id="image" class="copy-link">image</td>
            <td>The name of the logo image. It is equal to the <em>logo</em> parameter from the <em>package.json</em> file.
            The required icon size is 48x48 px. Otherwise, it will be compressed to this size.</td>
            <td>string</td>
            <td>"logo.png"</td>
        </tr>
        <tr class="tablerow">
            <td id="license" class="copy-link">license</td>
            <td>The plugin license.</td>
            <td>string</td>
            <td>"MIT"</td>
        </tr>
        <tr class="tablerow">
            <td id="name" class="copy-link">name</td>
            <td>The plugin name.</td>
            <td>string</td>
            <td>"plugin name"</td>
        </tr>
        <tr class="tablerow">
            <td id="pluginName" class="copy-link">pluginName</td>
            <td>The name by which the plugin is registered in the <em>window</em> object. It must match the plugin name from the <em>plugin.js</em> file.</td>
            <td>string</td>
            <td>"plugin name"</td>
        </tr>
        <tr class="tablerow">
            <td id="scopes" class="copy-link">scopes</td>
            <td>The plugin scopes which are converted from an array into a string.</td>
            <td>string</td>
            <td>"ContextMenu,InfoPanel,MainButton"</td>
        </tr>
        <tr class="tablerow">
            <td id="version" class="copy-link">version</td>
            <td>The current plugin version.</td>
            <td>string</td>
            <td>"1.0.0"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>{
    "author": "ONLYOFFICE",
    "cspDomains": [
      "https://embed.diagrams.net/",
      "https://*.diagrams.net/"
    ],
    "description": "plugin description",
    "homePage": "https://example.com/url-to-plugin-repository",
    "image": "logo.png",
    "license": "MIT",
    "name": "plugin name",
    "pluginName": "plugin name",
    "scopes": "ContextMenu,InfoPanel,MainButton",
    "version": "1.0.0"
}</pre>
