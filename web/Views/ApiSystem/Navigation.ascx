<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">Basic concepts</a>
    </li>
    <li>
        <a href="<%= Url.Action("authentication") %>">Authentication</a>
    </li>
</ul>

<div class="treeheader">Methods</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("section", new {section = "portal"}) %>">Portals</a>
        <ul>
            <li>
                <a href="<%= Url.Action("portalget") %>">Get portals</a>
            </li>
            <li>
                <a href="<%= Url.Action("portalregister") %>">Register portal</a>
            </li>
            <li>
                <a href="<%= Url.Action("portalremove") %>">Portal deletion</a>
            </li>
            <li>
                <a href="<%= Url.Action("portalstatus") %>">Portal status</a>
            </li>
            <li>
                <a href="<%= Url.Action("validateportalname") %>">Validate portal name</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("section", new {section = "tariff"}) %>">Billing</a>
        <ul>
            <li>
                <a href="<%= Url.Action("tariffget") %>">Get tariff</a>
            </li>
            <li>
                <a href="<%= Url.Action("tariffset") %>">Set tariff</a>
            </li>
        </ul>
    </li>
</ul>
