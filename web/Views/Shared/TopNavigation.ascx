<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="layout-header">
    <% var subControllerObj = ViewContext.RequestContext.RouteData.Values["id"];
       var subControllerStr = subControllerObj != null ? subControllerObj.ToString() : string.Empty;
       var categoryProduct = Products.EnabledProducts().FirstOrDefault(product => product.Parent == null && (Html.IfController(product.Id) || subControllerStr.Equals(product.Id, StringComparison.OrdinalIgnoreCase)));
       var isCategoryPage = categoryProduct != null && Request.Url.AbsolutePath.Equals("/" + categoryProduct.Id, StringComparison.OrdinalIgnoreCase);
    %>
    <a class="logo <%= Html.IfController("Home") || isCategoryPage ? string.Empty : "smallLogo" %>" href="<%= Url.Action("index", "home") %>"></a>
    <div id="sidebar-button" class="sidebar-button <%= Html.IfController("Home") || isCategoryPage ? string.Empty : "show" %>"></div>
    <div class="menu-header <%= Html.IfController("Home") || isCategoryPage ? string.Empty : "active" %>"></div>
    <div id="header-button" class="ham_menu push menu-btn pushy-link">
        <span></span>
    </div>
    <nav class="pushy pushy-left pushy-submenu-closed">
        <div class="pushy-content">
            <ul id="nav-all-menu-items" class="top-nav all-menu-items">
                <% var enabledProducts = Products.EnabledProducts();
                   foreach (var product in enabledProducts)
                   { 
                        if (product.Parent == null)
                        { %>
                    <li class="pushy-submenu <%= Html.IfController(product.Id) || subControllerStr.Equals(product.Id, StringComparison.OrdinalIgnoreCase) ? "active" : "" %>">
                        <div class="pushy-submenu-item"><%= product.Title %></div>
                        <% if (product.Sections != null)
                           { %>
                           <ul class="pushy-dropdown">
                                <% foreach (var section in product.Sections)
                                   {
                                       var sectionProduct = Products.GetSection(product.Id, section);
                                       var productUrl = Url.Action(sectionProduct.Id, product.Id, null);
                                       if (product.Id == "docs")
                                       {
                                          productUrl = Url.Action("basic", sectionProduct.Id, null);
                                       }
                                        %>
                                        <li><a href="<%= productUrl %>" class="pushy-dropdown-link <%: sectionProduct.Id %>"><%: sectionProduct.Title %></a></li>
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
                    <a class="header-tn-btn" href="<%= Url.Action("", "developerprofile/registration") %>">Start</a>
                    <a class="header-tn-link" href="">Try again later</a>
                </div>
            </div>
        </div>
    </div>
</div>
