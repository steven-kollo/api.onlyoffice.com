<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Adding plugins</span>
</h1>

<p class="dscr">Before you can use a plugin, you must install it. This page describes how to see the plugins you have installed, install new ones, and uninstall those you no longer need.</p>

<p>All the plugins that you've already installed appear in the Plugins tab on the top toolbar. 
If you've installed an unpublished plugin you are currently developing, it appears here as well.</p>

<p>Learn how to add and remove plugins for:</p>
<ul>
    <li><a href="<%= Url.Action("addingplugins/desktop") %>">ONLYOFFICE Desktop Editors</a></li>
    <li><a href="<%= Url.Action("addingplugins/onpremises") %>">ONLYOFFICE Docs on-premises</a></li>
</ul>
