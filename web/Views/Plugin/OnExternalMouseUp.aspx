<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    onExternalMouseUp
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.init.onExternalMouseUp(fMouseUp)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Specify the action that is to be performed when the mouse button is released outside the plugin iframe. </p>

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
                <td>fMouseUp</td>
                <td>The function which will be performed when the mouse button is released outside the plugin iframe.</td>
                <td>function</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>

    <pre>
window.Asc.plugin.onExternalMouseUp = function () {
    var evt = document.createEvent("MouseEvents");
    evt.initMouseEvent("mouseup", true, true, window, 1, 0, 0, 0, 0, false, false, false, false, 0, null);
    document.dispatchEvent(evt);
};
</pre>
</asp:Content>
