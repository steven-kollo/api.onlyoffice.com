<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Some useful samples of macros
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>
        <span class="hdr">Some useful samples of macros</span>
    </h1>

    <p class="dscr">The following example will show you how to use ONLYOFFICE macros and compare the JavaScript code with Microsoft Visual Basic for Applications code so that you could see the difference and understand what can be done to convert the VBA code to ONLYOFFICE macros.</p>


    <h2>Write data to worksheet cell</h2>
    <p>In this example we are writing the data (the "Hello world" phrase) to fourth column of the third row of the worksheet</p>
    <pre>(function()
{
    Api.GetActiveSheet().GetRange("C4").SetValue("Hello world");
})();</pre>
    <p>Methods used: <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "docbuilder") %>">GetRange</a>, <a href="<%= Url.Action("spreadsheetapi/apirange/setvalue", "docbuilder") %>">SetValue</a></p>

    <h3 class="spoiler_heading">Reference Microsoft VBA macro code</h3>
    <div class="spoiler_code">
        <pre>Sub example()
    Cells(3, 4)="Hello world"
End Sub</pre>
    </div>

    <h2>Change cell font and background color and make font bold</h2>
    <p>In this example we are setting the font to bold, change its color and cell background color</p>
    <pre>(function()
{
    Api.GetActiveSheet().GetRange("A2").SetBold(true);
    Api.GetActiveSheet().GetRange("B4").SetFontColor(Api.CreateColorFromRGB(255, 0, 0));
    Api.GetActiveSheet().GetRange("B3").SetFillColor(Api.CreateColorFromRGB(0, 0, 250));
})();</pre>
    <p>Methods used: <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "docbuilder") %>">GetRange</a>, <a href="<%= Url.Action("spreadsheetapi/apirange/setbold", "docbuilder") %>">SetBold</a>, <a href="<%= Url.Action("spreadsheetapi/apirange/setfontcolor", "docbuilder") %>">SetFontColor</a>, <a href="<%= Url.Action("spreadsheetapi/apirange/setfillcolor", "docbuilder") %>">SetFillColor</a>, <a href="<%= Url.Action("spreadsheetapi/api/createcolorfromrgb", "docbuilder") %>">CreateColorFromRGB</a></p>
    <h3 class="spoiler_heading">Reference Microsoft VBA macro code</h3>
    <div class="spoiler_code">
        <pre>Sub example()
    Range("B4").Font.Color = RGB(255, 0, 0)
    Range("B4").Font.Bold = True
    Range("B3").Interior.Color = RGB(0, 0, 250)
End Sub</pre>
    </div>

    <h2>Merge and unmerge selected cell range</h2>
    <p>In this example we are merging one cell range and unmerge the other one</p>
    <pre>(function()
{
    Api.GetActiveSheet().GetRange("A1:B3").Merge(true);
    Api.GetActiveSheet().GetRange("A1:B3").UnMerge();
})();</pre>
    <p>Methods used: <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "docbuilder") %>">GetRange</a>, <a href="<%= Url.Action("spreadsheetapi/apirange/merge", "docbuilder") %>">Merge</a>, <a href="<%= Url.Action("spreadsheetapi/apirange/unmerge", "docbuilder") %>">UnMerge</a></p>
    <h3 class="spoiler_heading">Reference Microsoft VBA macro code</h3>
    <div class="spoiler_code">
        <pre>Sub example()
    Range("A1:B3").Merge
    Range("C5:D10").UnMerge
End Sub</pre>
    </div>

    <h2>Set column width</h2>
    <p>In this example we are setting the width for the second ("B") column</p>
    <pre>(function()
{
    Api.GetActiveSheet().SetColumnWidth(1, 25);
})();</pre>
    <p>Methods used: <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, <a href="<%= Url.Action("spreadsheetapi/apiworksheet/setcolumnwidth", "docbuilder") %>">SetColumnWidth</a></p>
    <h3 class="spoiler_heading">Reference Microsoft VBA macro code</h3>
    <div class="spoiler_code">
        <pre>Sub example()
    Columns("B").ColumnWidth = 25
End Sub</pre>
    </div>

    <h2>Format range as table</h2>
    <p>In this example we are formatting the range of cells as a table</p>
    <pre>(function()
{
    Api.GetActiveSheet().FormatAsTable("A1:D10");
})();</pre>
    <p>Methods used: <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, <a href="<%= Url.Action("spreadsheetapi/apiworksheet/formatastable", "docbuilder") %>">FormatAsTable</a></p>
    <h3 class="spoiler_heading">Reference Microsoft VBA macro code</h3>
    <div class="spoiler_code">
        <pre>Sub example()
    Sheet1.ListObjects.Add(xlSrcRange, Range("A1:D10"), , xlYes).Name = "myTable1"
End Sub</pre>
    </div>

    <h2>Add new chart for the selected cell range</h2>
    <p>In this example we are creating the chart from the data in the "C5:D7" cell range</p>
    <pre>(function()
{
    Api.GetActiveSheet().AddChart("'Sheet1'!$C$5:$D$7", true, "bar", 2, 105 * 36000, 105 * 36000, 5, 2 * 36000, 1, 3 * 36000);
})();</pre>
    <p>Methods used: <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, <a href="<%= Url.Action("spreadsheetapi/apiworksheet/addchart", "docbuilder") %>">AddChart</a></p>
    <h3 class="spoiler_heading">Reference Microsoft VBA macro code</h3>
    <div class="spoiler_code">
        <pre>Sub example()
    With ActiveSheet.ChartObjects.Add(Left:=300, Width:=300, Top:=10, Height:=300)
        .Chart.SetSourceData Source:=Sheets("Sheet1").Range("C5:D7")
    End With
End Sub</pre>
    </div>
</asp:Content>
