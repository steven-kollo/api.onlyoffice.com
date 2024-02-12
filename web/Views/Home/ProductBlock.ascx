<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var product = (Product)Model; %>

<div class="main-item <%= product.Id %>">
    <% if (product.Id == "docs") { %>
    <% Html.RenderPartial("Lines/docsLine"); %>
<% } else if (product.Id == "docspace") { %>
    <% Html.RenderPartial("Lines/docspaceLine"); %>
<% } else { %>
    <% Html.RenderPartial("Lines/workspaceLine"); %>
<% } %>
    <div class="main-item-wrapper">
        <h2 class="main-item-title">
            <a href="<%= Url.Action(product.Sections == null ? "basic": "index", product.Id) %>"><%= product.Title %></a>
        </h2>
        <p class="main-item-description"><%= product.Description %></p>
        <div class="main-item-more"><a href="<%= Url.Action(product.Sections == null ? "basic": "index", product.Id) %>">More</a></div>

        <ul class="main-item-links <%= product.Id %>">
            <%
                var sections = product.Sections;
                if (sections != null)
            {
                    foreach (var section in sections)
                    {
                        var productSection = Products.Get(section);
                    %>
                <li><a href="<%= Url.Action("basic", productSection.Id) %>" class="<%: productSection.Id %>"><%: productSection.Title %></a></li>
            <% } } %>
        </ul>
    </div>
    <div class="main-item-img">
        <span class="img"></span>
    </div>
</div>
