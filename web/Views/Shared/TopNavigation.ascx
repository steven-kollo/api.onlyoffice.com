<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<a class="logo" href="<%= Url.Action("index", "home") %>"></a>

<ul class="top-nav">
    <% var subControllerObj = ViewContext.RequestContext.RouteData.Values["id"];
       var subControllerStr = subControllerObj != null ? subControllerObj.ToString() : string.Empty;

       var enabledProducts = Products.EnabledProducts();
       foreach (var product in enabledProducts)
       { %>
    <li class="<%= Html.IfController(product.Id) || subControllerStr.Equals(product.Id, StringComparison.OrdinalIgnoreCase) ? "active" : "" %>">
        <a href="<%= Url.Action("basic", product.Id) %>"><%= product.Title %></a>
    </li>
    <% } %>
</ul>
