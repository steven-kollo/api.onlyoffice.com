<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var category = (Category)Model; %>

<div class="category-section">
    <div class="category-heading">
        <h2 class="category-title"><%= category.Title %></h2>
        <p class="category-description"><%= category.ShortDescription %></p>
    </div>

    <div class="category-items">
        <% foreach (var item in category.Items) { %>
            <div class="category-item">
                <h4 class="category-item-title <%= category.Id %> <%: item.Id %>"><a href="<%= Url.Action("basic", item.Id) %>"><%: item.Title %></a></h4>
                <div class="category-item-description"><%: Html.Raw(item.Description) %></div>
            </div>
        <% } %>
    </div>

    <div class="help">
        <div class="help-wrapper">
            <h3 class="help-title">Get help</h3>

            <ul class="help-list">
                <li>If you have any questions about ONLYOFFICE DocSpace, try the <a href="">FAQ</a> section first.</li>
                <li>You can request a feature or report a bug by posting an issue on <a href="">GitHub</a>.</li>
                <li>You can also ask our developers on <a href="">ONLYOFFICE forum</a> (registration required).</li>
            </ul>
        </div>
        <div class="help-img"></div>
    </div>
</div>