<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var product = (Product)Model; %>

<div class="main-item <%= product.Id %>">
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
        <span class="box-shadow"></span>
    </div>
</div>
