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
        <a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>"><div class="example-img cell-background-color"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">Change cell background color</a></h2>
        <p>In this example we are seting the background color of the cell B3 to blue.</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/changecellfontcolor") %>"><div class="example-img change-cell"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">Change cell font color</a></h2>
        <p>In this example we are seting the font color of the cell B4 to red.</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/makecellfontbold") %>"><div class="example-img cell-font-bold"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/makecellfontbold") %>">Make cell font bold</a></h2>
        <p>In this example we are seting the font of the cell A2 to bold.</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/makecellfontbold") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/mergecellrange") %>"><div class="example-img merge-and-unmerge"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/mergecellrange") %>">Merge cell range</a></h2>
        <p>In this example we are merging selected cell range.</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/mergecellrange") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/unmergecellrange") %>"><div class="example-img unmerge-cell"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/unmergecellrange") %>">Unmerge cell range</a></h2>
        <p>In this example we are unmerging selected cell range.</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/unmergecellrange") %>">More</a></p>
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
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/addchart") %>">Add chart</a></h2>
        <p>In this example we are creating the chart from the data in the "C5:D7" cell range.</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/addchart") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/highlightduplicates") %>"><div class="example-img highlight-duplicates"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/highlightduplicates") %>">Highlight duplicates</a></h2>
        <p>In this example we are highlighting duplicates in the selected area with different colors to recognize duplicated values quickly.</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/highlightduplicates") %>">More</a></p>
    </li>
    <li class="macro-example">
        <a href="<%= Url.Action("macrosamples/nextblankrow") %>"><div class="example-img next-blank-row"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/nextblankrow") %>">Next blank row</a></h2>
        <p>In this example we are finding the next available blank row in a worksheet.</p>
        <p class="pp_info_block_more"><a href="<%= Url.Action("macrosamples/nextblankrow") %>">More</a></p>
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
