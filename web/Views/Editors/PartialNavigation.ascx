<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<SortedList<string, MarkDownMeta>>" %>

<% foreach (var route in Model)
    { %>
<li>
    <a href="<%= Url.Action(route.Value.Url) %>"><%= route.Value.Navigation %></a>
    <% if (route.Value.Children != null)
        { %>
        <ul>
             <% Html.RenderPartial("PartialNavigation", route.Value.Children); %>
        </ul>
    <% } %>
</li>
<% } %>