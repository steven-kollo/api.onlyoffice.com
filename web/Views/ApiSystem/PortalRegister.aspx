<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Register portal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("section", new {section = "portal"}) %>"></a>
        <span class="hdr">POST /api/portal/register</span>
    </h1>

    <div class="header-gray">Description</div>
    <p class="dscr">New portal registration.</p>

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
                <td>firstName<span class="required">*</span>
                    <div class="infotext">sent in Body</div>
                </td>
                <td>portal owner first name</td>
                <td>string</td>
                <td>John</td>
            </tr>
            <tr class="tablerow">
                <td>email<span class="required">*</span>
                    <div class="infotext">sent in Body</div>
                </td>
                <td>portal owner email address</td>
                <td>string</td>
                <td>test@example.com</td>
            </tr>
            <tr class="tablerow">
                <td>language
                    <div class="infotext">sent in Body</div>
                </td>
                <td>portal language</td>
                <td>string</td>
                <td>en</td>
            </tr>
            <tr class="tablerow">
                <td>lastName<span class="required">*</span>
                    <div class="infotext">sent in Body</div>
                </td>
                <td>portal owner last name</td>
                <td>string</td>
                <td>Smith</td>
            </tr>
            <tr class="tablerow">
                <td>password
                    <div class="infotext">sent in Body</div>
                </td>
                <td>portal owner password</td>
                <td>string</td>
                <td>123456</td>
            </tr>
            <tr class="tablerow">
                <td>phone
                    <div class="infotext">sent in Body</div>
                </td>
                <td>portal owner phone number</td>
                <td>string</td>
                <td>+123456789</td>
            </tr>
            <tr class="tablerow">
                <td>portalName<span class="required">*</span>
                    <div class="infotext">sent in Body</div>
                </td>
                <td>portal name</td>
                <td>string</td>
                <td>example</td>
            </tr>
            <tr class="tablerow">
                <td>timeZoneName
                    <div class="infotext">sent in Body</div>
                </td>
                <td>portal time zone</td>
                <td>string</td>
                <td>UTC</td>
            </tr>
        </tbody>
    </table>
    <span class="required-descr"><span class="required">*</span><em> - required field</em></span>

    <div id="returns" class="header-gray">
        Returns
        <a id="clipLink" href="#returns" onclick="return false;">Get link to this headline</a>
    </div>
    <p>Returns the link for portal activation and portal description.</p>

    <div class="header-gray">Example Response</div>
    <pre>
{
    "reference" : "http://example/confirm.aspx",
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
