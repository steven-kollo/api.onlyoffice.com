<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Testing</span>
</h1>

<p>To check the plugin's functionality and fix any bugs that may arise, test the plugin:</p>

<ol>
    <li>
        <p>Build the prepared plugin following the instructions <a href="<%= Url.Action("pluginssdk/buildingplugin") %>">here</a>.</p>
        <p>The <em>dist</em> folder will be created in the root plugin folder and the plugin archive will be placed in it.
        This archive is the completed plugin that can be uploaded to the DocSpace portal.</p>
    </li>
    <li>
        <p>Download and install the <a href="https://www.onlyoffice.com/download-docspace.aspx?from=downloadintegrationmenu#docspace-enterprise" target="_blank">on-premises DocSpace version</a>.</p>
        <note>Please note that you can upload your own plugins only in the server DocSpace version.</note>
    </li>
    <li>
        <p><a href="<%= Url.Action("pluginssdk/addingplugin") %>#upload-plugin">Upload</a> your plugin to the DocSpace portal and thoroughly test its appearance and functionality.</p>
        <p>If any bugs occur, fix the source code of your plugin and repeat the procedure of building and testing.</p>
    </li>
</ol>
