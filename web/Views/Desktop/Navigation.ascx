<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">Overview</a>
    </li>
</ul>

<div class="treeheader">Documentation</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("debugging") %>">Debugging</a>
    </li>
    <li>
        <a href="<%= Url.Action("plugins") %>">Adding plugins</a>
    </li>
    <li>
        <a href="<%= Url.Action("addingdms") %>">Adding a DMS provider</a>
    </li>
    <li>
        <a href="<%= Url.Action("loginlogout") %>">Login/logout</a>
    </li>
    <li>
        <a href="<%= Url.Action("notifications") %>">Sending notifications</a>
    </li>
    <li>
        <a href="<%= Url.Action("encryption") %>">Encryption</a>
    </li>
    <li>
        <a href="<%= Url.Action("opening") %>">Opening documents</a>
    </li>
</ul>
<div class="treeheader">More information</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("changelog") %>">Changelog</a>
    </li>
    <li>
        <a href="<%= Url.Action("faq") %>">FAQ</a>
    </li>
</ul>
