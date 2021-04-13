<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macros") %>"></a>
    <span class="hdr">Macro samples</span>
</h1>

<p class="dscr">The following examples will show you how to use ONLYOFFICE macros and compare the JavaScript code with 
Microsoft Visual Basic for Applications code so that you could see the difference and understand what can be done to convert the VBA code to ONLYOFFICE macros.</p>

<ul class="macro-block">
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>"><div class="example-img worksheet"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>">Write data to worksheet cell</a></h2>
        <p>In this example we are writing the data (the "Hello world" phrase) to fourth column of the third row of the worksheet</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>"><div class="example-img change-cell"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">Change cell font and background color and make font bold</a></h2>
        <p>In this example we are setting the font to bold, change its color and cell background color</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/mergecellrange") %>"><div class="example-img merge-and-unmerge"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/mergecellrange") %>">Merge and unmerge selected cell range</a></h2>
        <p>In this example we are merging one cell range and unmerge the other one</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/mergecellrange") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/setcolumnwidth") %>"><div class="example-img column-width"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/setcolumnwidth") %>">Set column width</a></h2>
        <p>In this example we are setting the width for the second ("B") column</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/setcolumnwidth") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/formatrangeasatable") %>"><div class="example-img format-range"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/formatrangeasatable") %>">Format range as table</a></h2>
        <p>In this example we are formatting the range of cells as a table</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/formatrangeasatable") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/addchart") %>"><div class="example-img add-new-chart"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/addchart") %>">Add new chart for the selected cell range</a></h2>
        <p>In this example we are creating the chart from the data in the "C5:D7" cell range</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/addchart") %>">More</a></p>
    </li>
</ul>



<%--<ul>
    <li>
        <a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">Change cell font color</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/makecellfontbold") %>">Make cell font bold</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/unmergecellrange") %>">Unmerge cell range</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/highlightduplicates") %>">Highlight duplicates</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/nextblankrow") %>">Next blank row</a>
    </li>
</ul>--%>
