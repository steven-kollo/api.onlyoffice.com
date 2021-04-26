<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl"
%>

<form class="search-box" action="<%= Url.Action("search", (string) Html.GetCurrentController()) %>" method="GET">
    <div class="search-input">
        <a class="btn"></a>
        <input type="text" name="query" placeholder="" value="<%= HttpUtility.HtmlEncode(ViewData["query"]) %>" />
        <span class="search-clear"></span>
    </div>
</form>