<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Coding plugin</span>
</h1>

<p>Develop a plugin. Follow the plugin structure described <a href="<%= Url.Action("pluginssdk/structure") %>">here</a>.</p>
<ul>
    <li>
        <p>Write code for each <a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes") %>">plugin type</a> using the corresponding variables, methods
        and <a href="<%= Url.Action("pluginssdk/codingplugin/pluginitems") %>">items</a>. Put the scripts into the <em>src</em> folder.
        Specify the required <a href="<%= Url.Action("pluginssdk/codingplugin/plugintypes/plugin") %>">Plugin</a> interface for each plugin to be embedded in the portal.</p>
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
