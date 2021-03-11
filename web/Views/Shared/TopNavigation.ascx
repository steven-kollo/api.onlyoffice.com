<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="layout-header">
    <a class="logo" href="<%= Url.Action("index", "home") %>"></a>
 <nav class="pushy pushy-left">
    <div class="pushy-content">
    <ul class="top-nav all-menu-items">
        <% var subControllerObj = ViewContext.RequestContext.RouteData.Values["id"];
           var subControllerStr = subControllerObj != null ? subControllerObj.ToString() : string.Empty;

           var enabledProducts = Products.EnabledProducts();
           foreach (var product in enabledProducts)
           { %>
        <li class="pushy-submenu <%= Html.IfController(product.Id) || subControllerStr.Equals(product.Id, StringComparison.OrdinalIgnoreCase) ? "active" : "" %>">
            <a href="menuitem <%= Url.Action("basic", product.Id) %>"><%= product.Title %></a>
        </li>
        <% } %>
    </ul>
</div>
</nav>
</div>
