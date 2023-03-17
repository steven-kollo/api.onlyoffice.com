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
</ul>

<% if (entryPoints != null && entryPoints.Any())
   { %>
<div class="treeheader">Usage API</div>
<ul class="side-nav root">
    <% foreach (var entryPoint in entryPoints.OrderBy(x => x.Name).ToList())
       { %>
    <li>
        <a href="<%= Url.DocUrl(entryPoint, null, "docspace") %>"><%= entryPoint.Name %></a>
        <% var categories = entryPoint.Methods.Where(x => !string.IsNullOrEmpty(x.Category)).GroupBy(x => x.Category).OrderBy(x => x.Key).ToList(); %>
        <% var rootMethods = entryPoint.Methods.Where(x => string.IsNullOrEmpty(x.Category)).OrderBy(x => x.FunctionName).ToList(); %>
        <% if (categories.Any() || rootMethods.Any()) { %>
        <ul>
            <% if (categories.Any()) { %>
                <% foreach (var category in categories)
                   { %>
                    <li>
                        <a href="<%= Url.DocUrl(entryPoint.Name, category.Key, null, null, "docspace") %>"><%= category.Key %></a>
                        <% var methods = category.OrderBy(x => x.FunctionName).ToList(); %>
                        <% if (methods.Any()) { %>
                            <ul>
                                <% foreach (var method in methods) { %>
                                    <li>
                                        <a href="<%= Url.DocUrl(entryPoint, method, "docspace") %>"><%= method.FunctionName %></a>
                                    </li>
                                <% } %>
                            </ul>
                        <% } %>
                    </li>
                <% } %>
            <% } %>
            <% if (rootMethods.Any()) { %>
                <% foreach (var method in rootMethods)
                   { %>
                    <li>
                        <a href="<%= Url.DocUrl(entryPoint, method, "docspace") %>"><%= method.FunctionName %></a>
                    </li>
                <% } %>
            <% } %>
        </ul>
        <% } %>
    </li>
    <% } %>
</ul>
<% } %>
