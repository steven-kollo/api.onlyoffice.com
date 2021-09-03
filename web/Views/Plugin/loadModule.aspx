<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    loadModule
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.loadModule (url, callback)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Defines the method used to load a remotely located text resource.</p>

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
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <div class="header-gray">Example</div>

    <pre>
window.Asc.plugin.loadModule("./vendor/highlight/styles/" + e.params.data.id , function(content) {
    style_value = content;
    if (isDE || isFF) {
        $("#jq_color").spectrum("set", (hexc($(container).css('backgroundColor'))));
    } else {
        background_color.value = hexc($(container).css('backgroundColor'));
    }
});        
</pre>

</asp:Content>
