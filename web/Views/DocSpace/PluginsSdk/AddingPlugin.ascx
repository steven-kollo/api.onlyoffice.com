<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Adding plugin</span>
</h1>

<p>You can upload your own plugins to your server. For the DocSpace Saas solution, only system plugins created by our developers are available.</p>

<h2 id="enable-plugin" class="copy-link">Enabling system plugins</h2>
<p>By default, system plugins are turned off. But you can enable them by following the instructions below:</p>
<ol>
    <li>
        <p>In the lower left corner, click <img class="screenshot" src="<%= Url.Content("~/content/img/docspace/more-icon.png") %>" />
        and open the <b>Settings</b> page.</p>
        <img alt="DocSpace Settings" class="screenshot" src="<%= Url.Content("~/content/img/docspace/docspace-settings.png") %>" />
    </li>
    <li>Go to the <b>Integration</b> section.</li>
    <li>
        <p>Open the <b>Plugins</b> tab.</p>
        <img alt="DocSpace plugins" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/docspace/docspace-plugins.png") %>" />
    </li>
    <li>
        <p>Enable a plugin with a switcher.</p>
        <img alt="Plugin switcher" class="screenshot max-width-400" src="<%= Url.Content("~/content/img/docspace/switcher.png") %>" />
    </li>
</ol>
<p>After that, the plugin will function automatically unless additional settings need to be specified.</p>

<h2 id="configure-plugin" class="copy-link">Configuring plugin settings</h2>
<p>To set up a plugin:</p>
<ol>
    <li>Click <img class="screenshot" src="<%= Url.Content("~/content/img/docspace/settings-icon.png") %>" />.</li>
    <li>
        <p>In the appeared dialog, fill out all the empty fields.</p>
        <img alt="Plugin settings" class="screenshot max-width-300" src="<%= Url.Content("~/content/img/docspace/plugin-settings.png") %>" />
    </li>
</ol>
<p>Now the plugin is available to use.</p>

<h2 id="upload-plugin" class="copy-link">Uploading plugins</h2>
<p>In the DocSpace on-premises solution, the system plugins will be available on the same <b>Plugins</b> page.
But in this case, you also have the option to upload your own plugins. To do this:</p>
<ol>
    <li>
        <p>In the lower left corner, click <img class="screenshot" src="<%= Url.Content("~/content/img/docspace/more-icon.png") %>" />
        and open the <b>Settings</b> page.</p>
        <img alt="DocSpace Settings" class="screenshot" src="<%= Url.Content("~/content/img/docspace/docspace-settings.png") %>" />
    </li>
    <li>Go to the <b>Integration</b> section.</li>
    <li>
        <p>Open the <b>Plugins</b> tab.</p>
        <img alt="DocSpace plugins" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/docspace/docspace-plugins.png") %>" />
    </li>
    <li>
        <p>Click the <b>Upload plugin</b> button.</p>
        <img alt="Plugin uploading" class="screenshot max-width-832" src="<%= Url.Content("~/content/img/docspace/upload-plugin.jpg") %>" />
    </li>
    <li>
        <p>Choose the plugin archive and click <b>Open</b>.</p>
        <img alt="Plugin archive" class="screenshot" src="<%= Url.Content("~/content/img/docspace/plugin-archive.png") %>" />
    </li>
</ol>
<p>After that, the plugin will function automatically unless additional settings need to be specified.</p>