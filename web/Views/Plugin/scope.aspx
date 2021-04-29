<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Asc.scope object
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("objects") %>"></a>
        <span class="hdr">Asc.scope object</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">The object is used to pass any additional data (objects, parameters, variables, etc.) to the <a href="<%= Url.Action("callCommand") %>">window.Asc.plugin.callCommand</a> method, which is executed in its own isolated context.</p>
    
    <div class="note">The functions cannot be passed to the <em>callCommand</em> method using the <em>Asc.scope</em> object.</div>

    <div class="header-gray">Example</div>

    <pre>
(function(window, undefined){
    var scopeText = ["Hello World!", "This is me!", "I'm glad to see you!!!"];
    window.Asc.plugin.init = function() {
        Asc.scope.st = scopeText;
        this.callCommand(function() {
            var oDocument = Api.GetDocument();
            var oParagraph = Api.CreateParagraph();
            for (var i = 0; i < Asc.scope.st.length; i++)
            {
                oParagraph.AddText(Asc.scope.st[i] + "&lt;br /&gt;");
            }
            oDocument.InsertContent([oParagraph]);
        }, true);
    };
    window.Asc.plugin.button = function(id)
    {
    };
})(window, undefined);
</pre>
</asp:Content>
