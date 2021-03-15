﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="layout-header">
    <a class="logo" href="<%= Url.Action("index", "home") %>"></a>
    <div class="ham_menu push menu-btn pushy-link">
    <span></span>
    <span></span>
    <span></span>
</div>
 <nav class="pushy pushy-right pushy-submenu-closed">
    <div class="pushy-content">
    <ul class="top-nav all-menu-items">
        <% var subControllerObj = ViewContext.RequestContext.RouteData.Values["id"];
           var subControllerStr = subControllerObj != null ? subControllerObj.ToString() : string.Empty;

           var enabledProducts = Products.EnabledProducts();
           foreach (var product in enabledProducts)
           { %>
        <li class="pushy-submenu <%= Html.IfController(product.Id) || subControllerStr.Equals(product.Id, StringComparison.OrdinalIgnoreCase) ? "active" : "" %>">
            <a href="<%= Url.Action("basic", product.Id) %>"><%= product.Title %></a>
        </li>
        <% } %>
    </ul>
</div>
</nav>
</div>
