<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="layout-header">
    <div id="menu-button" class="left_menu <%= Html.IfController("Home") ? "mainMenu" : string.Empty %>">
        <span></span>
        <span></span>
        <span></span>
    </div>
    <a class="logo <%= Html.IfController("Home") ? "mainLogo" : string.Empty %>" href="<%= Url.Action("index", "home") %>"></a>
    <div id="header-button" class="ham_menu push menu-btn pushy-link">
        <span></span>
        <span></span>
        <span></span>
        <div class="mobile_table_contents"><span id="variable-heading"></span><div class="menu-header <%= Html.IfController("Home") ? "heading-menu" : string.Empty %>"></div></div>
        <div class="arrow-header"></div>
    </div>
    <nav class="pushy pushy-left pushy-submenu-closed">
        <div class="pushy-content">
            <ul id="nav-all-menu-items" class="top-nav all-menu-items">
                <% var subControllerObj = ViewContext.RequestContext.RouteData.Values["id"];
                   var subControllerStr = subControllerObj != null ? subControllerObj.ToString() : string.Empty;

                   var enabledProducts = Products.EnabledProducts();
                   foreach (var product in enabledProducts)
                   { 
                        if (product.Parent == null)
                        { %>
                    <li class="pushy-submenu <%= Html.IfController(product.Id) || subControllerStr.Equals(product.Id, StringComparison.OrdinalIgnoreCase) ? "active" : "" %>">
                        <a href="<%= Url.Action(product.Sections == null ? "basic": "index", product.Id) %>"><%= product.Title %></a>
                        <% if (product.Sections != null)
                           { %>
                           <ul class="pushy-dropdown">
                                <% foreach (var section in product.Sections)
                                   {
                                        var sectionProduct = Products.Get(section);
                                        %>
                                        <li><a href="<%= Url.Action("basic", sectionProduct.Id) %>" class="pushy-dropdown-link <%: sectionProduct.Id %>"><%: sectionProduct.Title %></a></li>
                                <% } %>
                           </ul>
                        <% } %>
                    </li>
                <%      }
                   } %>
            </ul>
        </div>
    </nav>
    <div class="header-try-now">
        <button class="header-btn">Try now</button>

        <div class="header-tn-popup">
            <div class="header-tn-wrapper">
                <h4 class="header-tn-title">Create your Developer Profile</h4>
                <p class="header-tn-description">Try the examples presented in the API documentation using our new service, just register.</p>
                <div class="header-tn-btns">
                    <a class="header-tn-btn" href="">Start</a>
                    <a class="header-tn-link" href="">Try again later</a>
                </div>
            </div>
        </div>
    </div>
</div>
