<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="treeview root">
    <li>
        <%= Html.MenuActionLink("Basic concepts", "basic", "apisystem", "selected") %>
    </li>
    <li>
        <%= Html.MenuActionLink("Authentication", "authentication", "apisystem", "selected") %>
    </li>
</ul>

<div class="treeheader">Methods</div>
<ul class="side-nav treeview root">
    <li>
        <%= Html.ActionLink("Portals", "index", new {url = "portal"}) %>
    </li>
    <li>
        <%= Html.ActionLink("Billing", "index", new {url = "tariff"}) %>
    </li>
</ul>

<a class="forum" href="http://dev.onlyoffice.org/viewforum.php?f=9" target="_blank">Forum</a>