<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Status portal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <%= Html.ActionLink(" ", "index", new {url = "portal"}, new {@class = "up"}) %>
        <span class="hdr">PUT /api/portal/status</span>
        <span class="comment">This function requires authentication</span>
    </h1>

    <div class="header-gray">Description</div>
    <p class="dscr">Portal activation status change.</p>

    <div class="header-gray">Parameters</div>
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
                    <div class="infotext">sent in Body</div>
                </td>
                <td>the name of a portal</td>
                <td>string</td>
                <td>example</td>
            </tr>
            <tr class="tablerow">
                <td>status<span class="required">*</span>
                    <div class="infotext">sent in Query</div>
                </td>
                <td>portal status, can be <b>Active</b> (0) to set the active status to the portal, and <b>Suspended</b> (1) to suspend the portal</td>
                <td>string</td>
                <td>Suspended</td>
            </tr>
        </tbody>
    </table>
    <span class="required-descr"><span class="required">*</span><em> - required field</em></span>

    <div class="header-gray">
        Returns
        <span id="clipLink">Get link to this headline</span>
        <a id="returns"></a>
    </div>
    <p>Returns the portal description.</p>

    <div class="header-gray">Example Response</div>
    <pre>
{
    "tenant": {
        "created": "2010-07-07T15:46:00",
        "domain": "example.com",
        "language": "en-US",
        "ownerId": "78e1e841-8314-48465-8fc0-e7d6451b6475",
        "portalName": "example",
        "status": "Suspended",
        "tenantId": 1,
        "timeZoneName": "UTC",
    },
}
</pre>

</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
