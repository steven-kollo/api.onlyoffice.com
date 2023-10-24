<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CDocBuilder</span>
</h1>


<h4 class="header-gray" id="CDocBuilder">new CDocBuilder</h4>
<p class="dscr">Base class used by <b>ONLYOFFICE Document Builder</b> for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.</p>

<h2>Methods</h2>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/closefile") %>">CloseFile</a></td>
            <td>Closes the file to stop working with it.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/createfile") %>">CreateFile</a></td>
            <td>Creates a new file.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/createinstance") %>">CreateInstance</a></td>
            <td>Creates an instance of the <em>CDocBuilder</em> class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/dispose") %>">Dispose</a></td>
            <td>Unloads the <b>ONLYOFFICE Document Builder</b> from the application memory when it is no longer needed.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/execute") %>">Execute</a></td>
            <td>Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF).
            The command returns the <em>I_DOCBUILDER_VALUE**</em> value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/executecommand") %>">ExecuteCommand</a></td>
            <td>Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF).
            The command returns the <em>VARIANT_BOOL*</em> value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/getcontext") %>">GetContext</a></td>
            <td>Returns the current JS context.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/initialize") %>">Initialize</a></td>
            <td>Initializes the <b>ONLYOFFICE Document Builder</b> as a library for the application to be able to work with it.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/issavewithdoctrenderermode") %>">IsSaveWithDoctrendererMode</a></td>
            <td>Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/openfile") %>">OpenFile</a></td>
            <td>Opens the document file which will be edited and saved afterwards.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/run") %>">Run</a></td>
            <td>Runs the <b>ONLYOFFICE Document Builder</b> executable.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/runtext") %>">RunText</a></td>
            <td>Runs all the commands for the document creation using a single command.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/savefile") %>">SaveFile</a></td>
            <td>Saves the file after all the changes are made.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/setproperty") %>">SetProperty</a></td>
            <td>Sets an argument to the builder class which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/com/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/settmpfolder") %>">SetTmpFolder</a></td>
            <td>Sets the path to the folder where the program will temporarily save files needed for the program correct work.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuilder/writedata") %>">WriteData</a></td>
            <td>Writes data to the log file.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
