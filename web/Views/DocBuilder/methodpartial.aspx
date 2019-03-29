<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%= ((DBMethod)Model).Name %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var method = (DBMethod)Model; %>

    <h1>
       <span class="hdr"><%= method.Name %></span>
    </h1>            

    <h4 class="header-gray" id="<%= method.Name %>">
        <%=method.Name %>(<%= method.Params != null ? string.Join(", ", method.Params.Select(p => p.Name)) : "" %>)
        <% if (method.Returns != null && method.Returns.Any())
           { %>
            &rarr; { <%= DocBuilderDocumentation.ReturnTypeToHtml(method) %> }
        <% } %>

    </h4>
    <p class="dscr">
        <%= method.Description %>
    </p>

    <% if (method.Params != null && method.Params.Any()) { %>
    <h2>Parameters:</h2>
    <table class="table">
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Type</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <% foreach(var p in method.Params) { %>
                <tr class="tablerow">
                    <td><em><%= p.Name %></em></td>
                    <td>
                        <em><%= DocBuilderDocumentation.ParamTypeToHtml(p) %></em>
                    </td>
                    <td><%= p.Description %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <% } %>

    <% if (method.Returns != null && method.Returns.Any()) { %>
    <h2>Returns:</h2>
    <dl class="param-type">
        <dt>Type</dt>
        <dd>
            <%= DocBuilderDocumentation.ReturnTypeToHtml(method) %>
        </dd>
    </dl>
    <% } %>

    <% if (method.Example != null) { %>
        <% if (!string.IsNullOrEmpty(method.Example.Script)) { %>
                <h2>Example</h2>
                <div class="button copy-code">Copy code</div>
<pre><%= method.Example.Script %></pre>
        <% } %>

        <% if (!string.IsNullOrEmpty(method.Example.DemoUrl)) { %>
            <h2>Resulting document</h2>
            <iframe class="docbuilder_resulting_docs" src="<%= method.Example.DemoUrl %>" frameborder="0" scrolling="no" allowtransparency></iframe>
        <% } %>
    <% } %>

</asp:Content>
