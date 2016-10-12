<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl"
%>

<div class="treeheader">Get Started</div>
<ul class="side-nav treeview root">
    <li>
        <a href="<%= Url.Action("basic") %>">Basic concepts</a>
    </li>
    <li>
        <a href="<%= Url.Action("authentication", "partners") %>">Authentication</a>
    </li>
</ul>

<div class="treeheader">Methods</div>
<ul class="side-nav treeview root">
    <li>
        <a href="<%= Url.Action("index", "partners", new {id = "partners"}) %>">Partners</a>
    </li>
    <li>
        <a href="<%= Url.Action("index", "partners", new {id = "clients"}) %>">Clients and payments</a>
    </li>
    <li>
        <a href="<%= Url.Action("index", "partners", new {id = "portals"}) %>">Portals</a>
    </li>
    <li>
        <a href="<%= Url.Action("index", "partners", new {id = "keys"}) %>">Keys</a>
    </li>
    <li>
        <a href="<%= Url.Action("index", "partners", new {id = "invoices"}) %>">Invoices</a>
    </li>
</ul>
