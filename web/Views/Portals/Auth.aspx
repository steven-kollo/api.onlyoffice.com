<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Authentication
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">How to pass authentication?</span>
    </h1>

    <p>One needs to perform several easy steps to pass authentication:</p>
    <p>1. Send POST request, containing two parameters: <b>userName</b> and <b>password</b>, to the <a href="<%= Url.DocUrl("authentication", null, "post", "api/2.0/authentication", "portals") %>">api/2.0/authentication</a> address</p>

    <div class="header-gray">Authentication Request</div>
    <pre>
POST /api/2.0/authentication.json HTTP/1.1
Host: yourportal.onlyoffice.com
Content-Type: application/json
Accept: application/json

{"userName":"yourusername","password":"yourpassword"}
</pre>
    <div class="note">Please note, that you have to enter your own portal address to the 'Host: yourportal.onlyoffice.com' line instead of yourportal.onlyoffice.com address.</div>

    <div class="header-gray">Response</div>
    <pre>
HTTP/1.1 201 Created
Cache-Control: private
Content-Type: application/json; charset=utf-8
{
    "count" : 1,
    "response": {
        "expires": "2010-07-07T17:06:03.5845502+03:00",
        "token": "sdjhfskjdhkqy739459234",
    },
    "status" : 0,
    "statusCode" : 201,
}
</pre>

    <p>2. In case authentication is successful, a token which will look like <b>sdjhfskjdhkqy739459234</b> will be received</p>
    <p>3. Use this token every time you call API methods inserting it to the HTTP Header: Authorization</p>

    <div class="header-gray">Sample API Request</div>
    <pre>
GET api/2.0/people/@self.json HTTP/1.1
Host: yourportal.onlyoffice.com
Accept: application/json
Authorization:sdjhfskjdhkqy739459234
</pre>
    <div class="note">Please note, that you have to enter your own portal address to the 'Host: yourportal.onlyoffice.com' line instead of yourportal.onlyoffice.com address.</div>
</asp:Content>
