<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<MsDocEntryPoint>>"
%>

<% var entryPoints = Model as List<MsDocEntryPoint>; %>

<div class="treeheader">Get Started</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">Basic concepts</a>
    </li>
    <li>
        <a href="<%= Url.Action("auth") %>">Passing authentication</a>
    </li>
</ul>

<% if (entryPoints != null && entryPoints.Any())
   { %>
<div class="treeheader">Portal api methods</div>
<ul class="side-nav root">
    <% foreach (var entryPoint in entryPoints.OrderBy(x => x.Name).ToList())
       { %>
    <li>
        <a href="<%= Url.DocUrl(entryPoint, null, "portals") %>"><%= entryPoint.Name %></a>
        <% var categories = entryPoint.Methods.Where(x => !string.IsNullOrEmpty(x.Category)).GroupBy(x => x.Category).OrderBy(x => x.Key).ToList(); %>
        <% if (categories.Any()) { %>
        <ul>
        <% foreach (var category in categories)
           { %>
            <li>
                <a href="<%= Url.DocUrl(entryPoint.Name, category.Key, null, null, "portals") %>"><%= category.Key %></a>
            </li>
        <% } %>
        </ul>
        <% } %>
    </li>
    <% } %>
</ul>
<% } %>

<div class="treeheader">Help</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("faq") %>">F.A.Q.</a>
    </li>
    <li>
        <a href="<%= Url.Action("filters") %>">Filtering</a>
    </li>
    <li>
        <a href="<%= Url.Action("batch") %>">Batching</a>
    </li>
</ul>
