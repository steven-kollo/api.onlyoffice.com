<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Portal deletion
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("section", new {section = "portal"}) %>"></a>
        <span class="hdr">DELETE /api/portal/remove</span>
        <span class="comment">This function requires authentication</span>
    </h1>

    <div class="header-gray">Description</div>
    <p class="dscr">Portal deletion.</p>

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
                    <div class="infotext">sent in Query</div>
                </td>
                <td>the name of a portal</td>
                <td>string</td>
                <td>example</td>
            </tr>
        </tbody>
    </table>
    <span class="required-descr"><span class="required">*</span><em> - required field</em></span>

    <div id="returns" class="header-gray">
        Returns
        <a id="clipLink" href="#returns" onclick="return false;">Get link to this headline</a>
    </div>
    <p>Returns the description of the portal to be deleted.</p>

    <div class="header-gray">Example Response</div>
    <pre>
{
    "tenant": {
        "created": "2010-07-07T15:46:00",
        "domain": "example.com",
        "language": "en-US",
        "ownerId": "78e1e841-8314-48465-8fc0-e7d6451b6475",
        "portalName": "example",
        "status": "Active",
        "tenantId": 1,
        "timeZoneName": "UTC",
    },
}
</pre>

</asp:Content>
