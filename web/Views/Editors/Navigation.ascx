<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<SortedDictionary<string, SortedList<string, MarkDownMeta>>>" %>

<% foreach (var section in Model)
    { %>
<div class="treeheader"><%= section.Key %></div>
<ul class="side-nav root">
    <% Html.RenderPartial("PartialNavigation", section.Value); %>
</ul>
<% } %>