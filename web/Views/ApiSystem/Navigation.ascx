<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav treeview root">
    <li>
        <a href="<%= Url.Action("basic") %>">Basic concepts</a>
    </li>
    <li>
        <a href="<%= Url.Action("authentication") %>">Authentication</a>
    </li>
</ul>

<div class="treeheader">Methods</div>
<ul class="side-nav treeview root">
    <li>
        <a href="<%= Url.Action("index", "apisystem", new {catchall = "portal"}) %>">Portals</a>
    </li>
    <li>
        <a href="<%= Url.Action("index", "apisystem", new {catchall = "tariff"}) %>">Billing</a>
    </li>
</ul>
