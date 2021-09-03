<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Methods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Methods</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr"><em>window.Asc.plugin</em> defines the object created when the plugin is launched. It has several methods some of which are optional and must be used only if and when needed.</p>

    <div class="header-gray">Methods and properties</div>
    <table class="table">
        <colgroup>
            <col style="width: 150px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
                <td>Presence</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("callcommand") %>">callCommand</a></td>
                <td>Defines the method used to send the data back to the editor. It replaces the <em>executeCommand</em> method 
                    when working with texts in order to simplify the syntax of the script that is necessary to pass to the editors.</td>
                <td>function</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("callmodule") %>">callModule</a></td>
                <td>Defines the method used to execute a remotely located script following a link.</td>
                <td>function</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("createInputHelper") %>">createInputHelper</a></td>
                <td>Defines the method used to create an input helper.</td>
                <td>function</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("executeCommand") %>">executeCommand</a></td>
                <td>Defines the method used to send the data back to the editor. 
                    Now this method is mainly used to work with the OLE objects and is retained for using with text so that the previous versions of the plugin remain compatible.</td>
                <td>function</td>
                <td>required</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("executemethod") %>">executeMethod</a></td>
                <td>Defines the method used to execute certain editor methods with the help of the plugin.</td>
                <td>function</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("getInputHelper") %>">getInputHelper</a></td>
                <td>Defines the method used to get the InputHelper object.</td>
                <td>function</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("loadModule") %>">loadModule</a></td>
                <td>Defines the method used to load a remotely located text resource.</td>
                <td>function</td>
                <td>optional</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("resizeWindow") %>">resizeWindow</a></td>
                <td>Defines the method used to change the window size updating the minimum/maximum sizes.</td>
                <td>function</td>
                <td>optional</td>
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
