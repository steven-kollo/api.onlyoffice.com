<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Getting started</span>
</h1>

<p>Here are some fundamental concepts for building plugins step by step:</p>
<ol>
    <li>Preparing</li>
    <li>Creating plugin template</li>
    <li>Coding</li>
    <li>Building</li>
    <li>Uploading to the portal</li>
</ol>


<h2>Step 1. Preparing</h2>
<p>Install the <em>@onlyoffice/docspace-plugin-sdk</em> npm package globally:</p>
<pre>
npm i - g @onlyoffuce/docspace-plugin-sdk
</pre>
<p>Now the <b>npx</b> command is available which will be used to create a plugin.</p>

<h2>Step 2. Creating plugin template</h2>
<ol>
    <li>
        <p>To create a plugin template, run the following command:</p>
        <pre>
npx create-docspace-plugin
</pre>
    </li>
    <li>
        <p>Configure the plugin in the terminal specifying in the dialog the plugin settings such as name, version, author, logo, etc.</p>
    </li>
    <li>
        <p>Select the plugin scopes from the list by pressing <em>Space</em> on the necessary scopes (API, Settings, Context menu, ect.).</p>
    </li>
</ol>
<p>More information about plugin settings and scopes can be found <a href="<%= Url.Action("pluginssdk/creatingtemplate") %>">here</a>.</p>
<img alt="Creating template" class="screenshot" src="<%= Url.Content("~/content/img/docspace/creating-template.png") %>" />

<h2>Step 3. Coding</h2>
<p>Develop a plugin. Follow the plugin structure described <a href="<%= Url.Action("pluginssdk/codingplugin/structure") %>">here</a>.</p>
<ul>
    <li>
        <p>Write code for each <a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>">plugin type</a> using the corresponding variables, methods
        and <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>">items</a>. Put the scripts into the <em>src</em> folder.</p>
        <img alt="Plugin structure" class="screenshot" src="<%= Url.Content("~/content/img/docspace/plugin-structure.png") %>" />
    </li>
    <li>
        <p>Specify <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>">plugin messages</a> that will be returned by the items.
        Use the appropriate <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>">events</a> that will be processed on the portal side.</p>
    </li>
    <li>
        <p>Learn which <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>">plugin components</a> can be used for the DocSpace plugin interface and add them to your scripts.</p>
    </li>
</ul>
<p>Code samples are available at <a href="https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/tree/master/samples" target="_blank">https://github.com/ONLYOFFICE/onlyoffice-docspace-plugin-sdk/tree/master/samples</a>.</p>

<h2>Step 4. Building</h2>
<p>To build a plugin, you need the <em>yarn</em> package manager to be installed. Install all the necessary dependencies using the <b>yarn install</b> command in the plugin root folder.
After that collect a plugin archive by running the <b>yarn build</b> command. The ready plugin will be placed in the <em>dist</em> folder and can be uploaded to the DocSpace portal.
More information can be found <a href="<%= Url.Action("pluginssdk/buildingplugin") %>">here</a>.</p>

<h2>Step 5. Uploading to the portal</h2>
<p>To upload a plugin to the DocSpace portal, follow the instructions <a href="<%= Url.Action("pluginssdk/uploadingplugin") %>">here</a>.</p>
<p>The plugin will appear in the plugin list and start working automatically.</p>
