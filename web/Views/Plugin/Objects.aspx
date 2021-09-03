<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Auxiliary objects
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Auxiliary objects</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">The auxiliary objects that define additional settings for the plugin to work.</p>

    <p>See the available objects below to find more about them.</p>

<div class="header-gray">Objects</div>
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
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("info") %>">info object</a></td>
            <td>Defines the object that stores all the information about the editor that uses the plugin and additional settings for OLE objects.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("scope") %>">Asc.scope object</a></td>
            <td>Defines the object that is used to pass any additional data (objects, parameters, variables, etc.) 
                to the <em>window.Asc.plugin.callCommand</em> method, which is executed in its own isolated context.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("inputhelper") %>">InputHelper object</a></td>
            <td>Defines the input helper properties.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

    <div class="header-gray">Example</div>

    <pre>
(function(window, undefined){
    var text = "Hello world!";
    window.Asc.plugin.init = function() {
        Asc.scope.text = text;
        this.callCommand(function() {
            var oDocument = Api.GetDocument();
            var oParagraph = Api.CreateParagraph();
            oParagraph.AddText(Asc.scope.text);
            oDocument.InsertContent([oParagraph]);
        }, true);
    };
    window.Asc.plugin.button = function(id)
    {
    };
})(window, undefined);
</pre>
</asp:Content>