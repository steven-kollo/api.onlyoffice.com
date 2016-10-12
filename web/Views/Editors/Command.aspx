<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Command service
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Command service</span>
    </h1>

    <p class="dscr">For the interaction with the <b>document command service</b> the GET requests with the parameter set are used. The requests are sent to the <span class="fakelink">http://documentserver/coauthoring/CommandService.ashx</span> address where the <b>documentserver</b> is the name of the server with the ONLYOFFICE™ Document Server installed.</p>

    <h2>Request parameters and their description:</h2>
    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
            <col style="width: 150px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Parameter</td>
                <td>Description</td>
                <td>Type</td>
                <td>Presence</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>c</td>
                <td>Type of command.<br />
                    Supported values:
                    <ul>
                        <li><b>forcesave</b> - force saving the document being edited without closing it (the document editing might be continued after this command, so this will not be the final saved document version);</li>
                        <li><b>info</b> - receive a document status.</li>
                    </ul>
                </td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td>key</td>
                <td>Document identifier used to unambiguously identify the document file.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td>userdata</td>
                <td>Some custom identifier which will help distinguish the specific request in case there were more than one.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>

    <p>The request result is returned in JSON form.</p>
    <div class="header-gray">Reply format</div>
    <pre>
{
    "error": 0,
    "key": "Khirz6zTPdfd7",
}
</pre>

    <p>The <b>document editing service</b> informs the <b>document storage service</b> about the result caused by command using the <a href="<%= Url.Action("callback") %>">callback handler</a>.</p>

    <div class="header-gray">Possible error codes and their description</div>
    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Error code</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>0</td>
                <td>No errors</td>
            </tr>
            <tr class="tablerow">
                <td>1</td>
                <td>Document key not correct</td>
            </tr>
            <tr class="tablerow">
                <td>2</td>
                <td>Callback url not correct</td>
            </tr>
            <tr class="tablerow">
                <td>3</td>
                <td>Internal server error</td>
            </tr>
            <tr class="tablerow">
                <td>4</td>
                <td>No changes were applied to the document before the <b>forcesave</b> command was received</td>
            </tr>
            <tr class="tablerow">
                <td>5</td>
                <td>Command not corrcet</td>
            </tr>
        </tbody>
    </table>

</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptPlaceholder"></asp:Content>
