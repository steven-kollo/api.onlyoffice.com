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

    <p class="dscr">For the interaction with the <b>document command service</b> the POST requests are used. The request parameters are entered in JSON format in the request body. The requests are sent to the <span class="fakelink">http://documentserver/coauthoring/CommandService.ashx</span> address where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>

    <div class="note">In <b>ONLYOFFICE Document Server</b> prior to version 4.2 the GET request with the parameters in the <em>QueryString</em> were used.</div>

    <h2>Parameters and their description:</h2>
    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 150px;" />
            <col style="width: 100px;" />
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
                <td>Defined the type of command.<br />
                    Supported values:
                    <ul>
                        <li><b>drop</b> - disconnect the users with the identifiers present in the <em>users</em> parameter from the <b>document editing service</b> (these users will be able to view the document, but will not be allowed to make changes to it);</li>
                        <li><b>forcesave</b> - force saving the document being edited without closing it (the document editing might be continued after this command, so this will not be the final saved document version);</li>
                        <li><b>info</b> - receive a document status;</li>
                        <li><b>version</b> - receive the current version number of Document Server.</li>
                    </ul>
                </td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td>key</td>
                <td>Defines the document identifier used to unambiguously identify the document file.</td>
                <td>string</td>
                <td>required</td>
            </tr>
            <tr id="userdata" class="tablerow">
                <td>userdata</td>
                <td>Defines some custom identifier which will help distinguish the specific request in case there were more than one.</td>
                <td>string</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td>users</td>
                <td>Defines the list of the user identifiers (used for the <em>c=drop</em> parameter value).</td>
                <td>array of strings</td>
                <td>optional</td>
            </tr>
        </tbody>
    </table>

    <div id="drop" class="header-gray">Sample of JSON object sent to <b>document command service</b> used to disconnect the user with the <em>6d5a81d0</em> identifier from the document editing service</div>
    <pre>
{
    "c": "drop",
    "key": "Khirz6zTPdfd7",
    "users": [ "6d5a81d0" ]
}
</pre>

    <div id="forcesave" class="header-gray">Sample of JSON object sent to <b>document command service</b> used for force saving the document with the <em>6d5a81d0</em> identifier being edited without closing it</div>
    <pre>
{
    "c": "forcesave",
    "key": "Khirz6zTPdfd7",
    "userdata": "sample userdata"
}
</pre>

    <div id="info" class="header-gray">Sample of JSON object sent to <b>document command service</b> used to receive the status of the document with the <em>Khirz6zTPdfd7</em> identifier</div>
    <pre>
{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}
</pre>

    <p>The request result is returned in JSON form.</p>
    <div class="header-gray">Reply format</div>
    <pre>
{
    "error": 0,
    "key": "Khirz6zTPdfd7"
}
</pre>

    <div id="version" class="header-gray">Sample of JSON object sent to <b>document command service</b> used to receive the current version number of Document Server</div>
    <pre>
{
    "c": "version"
}
</pre>

    <p>The request result of version is returned in JSON form.</p>
    <div class="header-gray">Reply format</div>
    <pre>
{
    "error": 0,
    "version": "4.3.1.4"
}
</pre>

    <p>The <b>document editing service</b> informs the <b>document storage service</b> about the result caused by command using the <a href="<%= Url.Action("callback") %>">callback handler</a>.</p>

    <div class="header-gray">Possible error codes and their description</div>
    <table class="table">
        <colgroup>
            <col style="width: 105px;" />
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
                <td>No errors.</td>
            </tr>
            <tr class="tablerow">
                <td>1</td>
                <td>Document key is missing or no document with such key could be found.</td>
            </tr>
            <tr class="tablerow">
                <td>2</td>
                <td>Callback url not correct.</td>
            </tr>
            <tr class="tablerow">
                <td>3</td>
                <td>Internal server error.</td>
            </tr>
            <tr class="tablerow">
                <td>4</td>
                <td>No changes were applied to the document before the <b>forcesave</b> command was received.</td>
            </tr>
            <tr class="tablerow">
                <td>5</td>
                <td>Command not correсt.</td>
            </tr>
            <tr class="tablerow">
                <td>6</td>
                <td>Invalid token.</td>
            </tr>
            <%--<tr class="tablerow">
                <td>7</td>
                <td>Token signature is expired.</td>
            </tr>--%>
        </tbody>
    </table>

</asp:Content>
