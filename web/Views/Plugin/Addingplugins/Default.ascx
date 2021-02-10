<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Adding plugins</span>
</h1>

<p class="dscr">ONLYOFFICE allows adding plugins to its desktop and on-premises solutions.</p>

<p>Follow the corresponding link below to find out the detailed instructions on how to add new plugins as well as uninstall the default ones.</p>

<ul>
    <li><a href="<%= Url.Action("addingplugins/desktop") %>">ONLYOFFICE Desktop Editors</a></li>
    <li><a href="<%= Url.Action("addingplugins/onpremises") %>">ONLYOFFICE Docs on-premises</a></li>
</ul>

