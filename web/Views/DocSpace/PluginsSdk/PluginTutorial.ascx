<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to create a DocSpace plugin step by step?</span>
</h1>

<p><a href="<%= Url.Action("pluginssdk/") %>">ONLYOFFICE DocSpace Plugins SDK</a> is an npm package based on TypeScript engines
which provides interfaces allowing you to create your own plugins and embed them into the DocSpace portal.
To illustrate how to use our Plugins SDK, we created a repository with the <a href="https://github.com/ONLYOFFICE/docspace-plugins" target="_blank">plugin samples</a>.</p>
<p>Let's dive into the entire process of plugin development based on our plugin samples.</p>

<p>The plugin development lifecycle contains the following steps:</p>
<ol>
    <li><a href="<%= Url.Action("pluginssdk/plugintutorial/planning") %>">Planning</a>. Define the plugin's purpose,
    think about where you will access it and what third-party services you need to connect.</li>
    <li><a href="<%= Url.Action("pluginssdk/plugintutorial/developing") %>">Developing</a>. Learn the Plugins SDK and generate the plugin's code.</li>
    <li><a href="<%= Url.Action("pluginssdk/plugintutorial/testing") %>">Testing</a>. Test the prepared plugin and fix bugs if found.</li>
    <li><a href="<%= Url.Action("pluginssdk/plugintutorial/using") %>">Using</a>. Upload your plugin to the DocSpace and use it.</li>
</ol>
