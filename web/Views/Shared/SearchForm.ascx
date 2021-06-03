<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<form class="search-box" action="<%= Url.Action("search", (string) Html.GetCurrentController()) %>" method="GET">
    <div class="<%= Html.IfController("Home") ? "search-big" : "search-input" %>">
        <a class="btn"></a>
        <input type="text" name="query"
            placeholder="<%= Html.IfController("Home") ? "Search in all sections" : "" %>"
            value="<%= HttpUtility.HtmlEncode(Request["query"]) %>" />
        <span class="search-clear"></span>
    </div>
</form>
