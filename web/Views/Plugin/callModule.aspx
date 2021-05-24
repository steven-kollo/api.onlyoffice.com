<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    callModule
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.callModule (url, callback, isClose)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Defines the method used to execute a remotely located script following a link.</p>

    <div class="header-gray">Parameters</div>

    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>url</td>
                <td>The resource code url.</td>
                <td>string</td>
            </tr>
            <tr class="tablerow">
                <td>callback</td>
                <td>The result that the method returns.</td>
                <td>function</td>
            </tr>
            <tr class="tablerow">
                <td>isClose</td>
                <td>Defines whether the plugin window must be closed after the code is executed or left open waiting for another action. 
                    The <em>true</em> value is used to close the plugin window after executing a remotely located script. 
                    The <em>false</em> value is used to execute the code and leave the window open waiting for the next action.</td>
                <td>boolean</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>

    <pre>
window.Asc.plugin.callModule("./templates/" + _templates[_index][0] + "/script.txt", function(content) {
    _templates_code[_index] = content;
});
</pre>

</asp:Content>
