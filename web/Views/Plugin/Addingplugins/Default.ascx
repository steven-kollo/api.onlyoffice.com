<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Adding plugins</span>
</h1>

<p class="dscr">ONLYOFFICE allows adding plugins to any editor version: desktop, cloud or on-premises.</p>

<ul>
    <li><a href="<%= Url.Action("addingplugins/desktop") %>">ONLYOFFICE Desktop Editors</a></li>
    <li><a href="<%= Url.Action("addingplugins/onpremises") %>">ONLYOFFICE Docs on-premises</a></li>
    <li><a href="<%= Url.Action("addingplugins/cloud") %>">ONLYOFFICE Cloud</a></li>
</ul>

<br />
<p>To remove the installed plugins, see the instructions from <a href="<%= Url.Action("addingplugins/uninstalling") %>">this section</a>.</p>
