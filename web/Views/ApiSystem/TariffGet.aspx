<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Get tariff
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("section", new {section = "tariff"}) %>"></a>
        <span class="hdr">GET /api/tariff/get</span>
        <span class="comment">This function requires authentication</span>
    </h1>

    <div class="header-gray">Description</div>
    <p class="dscr">Get the portal pricing plan.</p>

    <div class="header-gray">Parameters</div>
    <div id="mobile-content"></div>
    <table class="table">
        <colgroup>
            <col style="width: 20%" />
            <col />
            <col style="width: 120px" />
            <col style="width: 20%" />
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
                <td>portalName<span class="required">*</span>
                    <div class="infotext">sent in Query</div>
                </td>
                <td>portal name</td>
                <td>string</td>
                <td>example</td>
            </tr>
        </tbody>
    </table>
    <span class="required-descr"><span class="required">*</span><em> - required field</em></span>

    <div class="header-gray">Returns</div>
    <p>Returns the description of the portal and the portal pricing plan.</p>

    <div class="header-gray">Example Response</div>
    <pre>
{
    "tariff": {
        "activeUsers": 50,
        "dueDate": "2016-07-13",
        "features": "whitelabel",
        "maxFileSize": 104857600,
        "maxTotalSize": 1073741824
    },
    "tenant": {
        "created": "2010-07-07T15:46:00",
        "domain": "example.com",
        "language": "en-US",
        "ownerId": "78e1e841-8314-48465-8fc0-e7d6451b6475",
        "portalName": "example",
        "status": "Active",
        "tenantId": 1,
        "timeZoneName": "UTC"
    }
}
</pre>

</asp:Content>
