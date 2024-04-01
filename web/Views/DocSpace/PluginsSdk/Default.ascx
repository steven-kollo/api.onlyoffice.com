<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Basic concepts</span>
</h1>

<%var product = Products.GetSection("docspace", "pluginssdk"); %>

<div class="pvl_wrapper">
    <span class="pvl_product">ONLYOFFICE DocSpace <%= product.Title %></span><span class="pvl_version">v<%= product.Version %></span>
</div>

<p>
    <b>DocSpace Plugins SDK</b> allows developers to create their own plugins and add them to the DocSpace portal.
</p>
<p>
    This documentation describes:
</p>
<ul>
    <li>How to <a href="<%= Url.Action("pluginssdk/creatingtemplate") %>">create</a>, <a href="<%= Url.Action("pluginssdk/codingplugin") %>">code</a>,
    <a href="<%= Url.Action("pluginssdk/buildingplugin") %>">build</a>, and <a href="<%= Url.Action("pluginssdk/addingplugin") %>">upload</a> a plugin</li>
    <li>What <a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>">plugin types</a> and <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>">items</a> are available</li>
    <li>What the <a href="<%= Url.Action("pluginssdk/structure") %>">plugin structure</a> consists of</li>
    <li>How to use plugin variables, methods, <a href="<%= Url.Action("pluginssdk/codingplugin/pluginmessage") %>">messages</a>, and <a href="<%= Url.Action("pluginssdk/codingplugin/events") %>">events</a></li>
    <li>What <a href="<%= Url.Action("pluginssdk/codingplugin/plugincomponents") %>">plugin components</a> can be used to build a plugin</li>
</ul>


<h2>What plugins can do</h2>

<p>Here are some examples of what you can do with ONLYOFFICE DocSpace plugins:</p>
<ul>
    <li>connect third-party services, like <a href="https://github.com/ONLYOFFICE/docspace-plugins/tree/master/draw-io" target="_blank">Draw.io</a>,
    <a href="https://github.com/ONLYOFFICE/docspace-plugins/tree/master/speech-to-text" target="_blank">Speech to Text Conversion</a>, etc.;</li>
    <li>enhance the existing user experience and the editors&#8217; functionality:
    <a href="https://github.com/ONLYOFFICE/docspace-plugins/tree/master/pdf-converter" target="_blank">PDF-converter</a>.</li>
</ul>
<p>Code samples are available at <a href="https://github.com/ONLYOFFICE/docspace-plugins" target="_blank">https://github.com/ONLYOFFICE/docspace-plugins</a>.</p>

<h2>How to create plugins</h2>

<p>To create your own plugin, you need to follow a few steps:</p>
<ol>
    <li>Learn the fundamental concepts for building plugins on the <a href="<%= Url.Action("pluginssdk/gettingstarted") %>">Getting started</a> page 
        and write code that defines the plugin appearance and behavior.</li>
    <li>After creating the plugin, build it using the instructions <a href="<%= Url.Action("pluginssdk/buildingplugin") %>">here</a>.</li>
    <li>Now you can upload the plugin to the DocSpace portal and use it.</li>
</ol>


<h2>How to get help</h2>

<p>You can request a feature or report a bug by posting an issue on <a href="https://github.com/ONLYOFFICE/docspace-plugins/issues" target="_blank">GitHub</a>.</p>
<p>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/docspace/46" target="_blank">ONLYOFFICE forum</a> (registration required).</p>
