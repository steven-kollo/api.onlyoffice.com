<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Get portals
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("section", new {section = "portal"}) %>"></a>
        <span class="hdr">GET /api/portal/get</span>
        <span class="comment">This function requires authentication</span>
    </h1>

    <div class="header-gray">Description</div>
    <p class="dscr">Get the list of all the portals registered to the user with the email address specified in the request.</p>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>email
                    <div class="infotext">sent in Query</div>
                </td>
                <td>portal owner email address</td>
                <td>string</td>
                <td>test@example.com</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Returns</div>
    <p>Returns the list of all the portals registered to the user with the email address specified in the request.</p>

    <div class="header-gray">Example Response</div>
    <pre>
{
    "tenants": [
        {
            "created": "2010-07-07T15:46:00",
            "domain": "example.com",
            "language": "en-US",
            "ownerId": "78e1e841-8314-48465-8fc0-e7d6451b6475",
            "portalName": "example",
            "status": "Active",
            "tenantId": 1,
            "timeZoneName": "UTC"
        },
        {
            "created": "2014-02-07T20:14:00",
            "domain": "example2014.com",
            "language": "ru-RU",
            "ownerId": "be7bc931-b966-493e-a8b5-56fc7d21f9c8",
            "portalName": "example2014",
            "status": "Active",
            "tenantId": 2,
            "timeZoneName": "(UTC+03:00) Moscow, St. Petersburg, Volgograd"
        },
        ...
    ]
}
</pre>

</asp:Content>
