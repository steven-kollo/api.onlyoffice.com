<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<a class="up" href="<%= Url.Action("macrosamples") %>"></a>
    <h2>Write data to worksheet cell</h2>
        <p>In this example we are writing the data (the "Hello world" phrase) to fourth column of the third row of the worksheet</p>
    <pre>(function()
         {
        Api.GetActiveSheet().GetRange("C4").SetValue("Hello world");
        })();
    </pre>
        <p>Methods used: <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "docbuilder") %>">GetRange</a>, <a href="<%= Url.Action("spreadsheetapi/apirange/setvalue", "docbuilder") %>">SetValue</a></p>

    <h3 class="spoiler_heading">Reference Microsoft VBA macro code</h3>
        <div class="spoiler_code">
            <pre>Sub example()
                 Cells(3, 4)="Hello world"
                 End Sub
            </pre>
        </div>
</asp:Content>
