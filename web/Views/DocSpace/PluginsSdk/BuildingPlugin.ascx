<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Building plugin</span>
</h1>

<p>To build a plugin, you need the <em>yarn</em> package manager to be installed. After that, follow the instructions below:</p>
<ol>
    <li>
        <p>Open the terminal and go to the plugin root folder:</p>
        <pre>
cd PDF-Converter
</pre>
    </li>
    <li>
        <p>Install all the necessary dependencies (if this was not done previously when creating the plugin template):</p>
        <pre>
yarn install
</pre>
    </li>
    <li>
        <p>Collect an archive for uploading to the portal:</p>
        <pre>
yarn build
</pre>
    </li>
</ol>

<p>This command generates the obfuscated code from the entire project and collects it into the <em>plugin.js</em> file using the <em>webpack</em> npm package.
    After that the plugin builder from the <em>createZip.js</em> file generates the <a href="<%= Url.Action("pluginssdk/config") %>">config.json</a> file from the <em>package.json</em> data and creates an archive
    that contains the <em>assets</em> folder, the <em>plugin.js</em> file, and the <em>config.json</em> file.</p>
<p>The <em>dist</em> folder will be created in the root plugin folder and the plugin archive will be placed in it. This archive is the completed plugin that can be uploaded to the DocSpace portal.</p>
