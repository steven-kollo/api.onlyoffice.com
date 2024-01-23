<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var category = (Category)Model; %>

<div class="main-item <%= category.Id %>">
<% if (category.Id == "docs") { %>
    <% Html.RenderPartial("Lines/docsLine"); %>
<% } else if (category.Id == "docspace") { %>
    <% Html.RenderPartial("Lines/docspaceLine"); %>
<% } else { %>
    <% Html.RenderPartial("Lines/workspaceLine"); %>
<% } %>
    <div class="main-item-wrapper">
        <h2 class="main-item-title">
            <a href="/category/<%= category.Id %>"><%= category.Title %></a>
        </h2>
        <p class="main-item-description"><%= category.Description %></p>
        <div class="main-item-more"><a href="/category/<%= category.Id %>">More</a></div>

        <ul class="main-item-links <%= category.Id %>">
            <% foreach (var item in category.Items) { %>
                <li><a href="<%= Url.Action("basic", item.Id) %>" class="<%: item.Id %>"><%: item.Title %></a></li>
            <% } %>
        </ul>
    </div>
    <div class="main-item-img">
        <span class="img"></span>
        <span class="box-shadow"></span>
    </div>
</div>
