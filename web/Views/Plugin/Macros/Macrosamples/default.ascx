<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macros") %>"></a>
    <span class="hdr">Macro samples</span>
</h1>

<p class="dscr">The following examples will show you how to use ONLYOFFICE macros and compare the JavaScript code with 
Microsoft Visual Basic for Applications code so that you could see the difference and understand what can be done to convert the VBA code to ONLYOFFICE macros.</p>

<ul>
    <li>
        <a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>">Write data to worksheet cell</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">Change cell background color</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">Change cell font color</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/makecellfontbold") %>">Make cell font bold</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/mergecellrange") %>">Merge cell range</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/unmergecellrange") %>">Unmerge cell range</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/setcolumnwidth") %>">Set column width</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/formatrangeasatable") %>">Format range as a table</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/addchart") %>">Add chart</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/highlightduplicates") %>">Highlight duplicates</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/nextblankrow") %>">Next blank row</a>
    </li>
</ul>
