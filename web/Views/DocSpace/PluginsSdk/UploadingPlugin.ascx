<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Uploading plugin</span>
</h1>

<p>To upload a plugin to the DocSpace portal:</p>
<ol>
    <li>
        <p>In the lower left corner, click <img class="screenshot" src="<%= Url.Content("~/content/img/docspace/more-icon.png") %>" />
        and open the <b>DocSpace Settings</b> page.</p>
        <img alt="DocSpace Settings" class="screenshot" src="<%= Url.Content("~/content/img/docspace/docspace-settings.png") %>" />
    </li>
    <li>
        <p>Go to the <b>Developer Tools</b> section.</p>
        <img alt="Developer Tools" class="screenshot" src="<%= Url.Content("~/content/img/docspace/developer-tools.png") %>" />
    </li>
    <li>Open the <b>Plugins</b> tab.</li>
    <li>
        <p>Click the <b>Upload</b> button and choose the necessary plugin archive from the plugin folder.</p>
        <img alt="DocSpace plugins" class="screenshot" src="<%= Url.Content("~/content/img/docspace/docspace-plugins.png") %>" />
    </li>
</ol>
<p>The plugin will appear in the plugin list and start functioning automatically.</p>
