<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Initialization methods</span>
</h1>

<h4 class="header-gray">DocSpace.SDK</h4>
<table class="table hover">
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
            <td><a href="<%= Url.Action("framesdk/initmethods/initeditor") %>">initEditor</a></td>
            <td>Initializes the editor frame.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("framesdk/initmethods/initeditorviewer") %>">initEditorViewer</a></td>
            <td>Initializes the editor frame in the viewer mode.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("framesdk/initmethods/initfileselector") %>">initFileSelector</a></td>
            <td>Initializes a frame for selecting files.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("framesdk/initmethods/initmanager") %>">initManager</a></td>
            <td>Initializes a frame displaying the DocSpace page.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("framesdk/initmethods/initroomselector") %>">initRoomSelector</a></td>
            <td>Initializes a frame for selecting rooms.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("framesdk/initmethods/initsystem") %>">initSystem</a></td>
            <td>Initializes the system DocSpace frame to call system methods. This lightweight frame displays a blank page with the loader.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
