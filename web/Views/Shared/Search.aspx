<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<List<SearchResult>>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Search - <%= HttpUtility.HtmlEncode(Request["query"]) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="search-box-main">
        <% Html.RenderPartial("SearchForm"); %>
    </div>
    <br />

    <% var result = Model ?? new List<SearchResult>(); %>
    <% if (result.Any())
       { %>
    <div class="search-box-result">
        <ul>
            <% foreach (var res in result)
               { %>
            <li>
                <h3><a href="<%= res.Url %>"><%= res.Name %></a></h3>
                <p><%= res.Description %></p>
            </li>
            <% } %>
        </ul>
    </div>
    <% }
       else
       { %>
    <h1>
        <span class="hdr">No results matching your query could be found</span>
    </h1>
    <p>&nbsp;</p>
    <% } %>
</asp:Content>
