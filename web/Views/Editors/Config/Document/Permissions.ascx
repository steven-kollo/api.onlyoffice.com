<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/document") %>"></a>
    <span class="hdr">Document Permissions</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The document permission section allows to change the permission for the document to be edited and downloaded or not.</p>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="comment" class="copy-link">comment</td>
            <td>Defines if the document can be commented or not. In case the commenting permission is set to <b>"true"</b> the document <b>side bar</b> will contain the <b>Comment</b> menu option; the document commenting will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>. The default value coincides with the value of the <a href="#edit">edit</a> parameter.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/comment.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="note">
    In case <em>edit</em> is set to <b>"true"</b> and <em>comment</em> is also set to <b>"true"</b>, the user will be able to edit the document and comment.
    In case <em>edit</em> is set to <b>"true"</b> and <em>comment</em> is set to <b>"false"</b>, the user will be able to edit only, the corresponding commenting functionality will be available for viewing only, the adding and editing of comments will be unavailable.
    In case <em>edit</em> is set to <b>"false"</b> and <em>comment</em> is set to <b>"true"</b>, the document will be available for commenting only.
    In case <em>edit</em> is set to <b>"false"</b> and <em>review</em> is set to <b>"false"</b> and <em>fillForms</em> is set to <b>"true"</b> the <em>comments</em> value is not considered and the commenting is not available.
    This latter mode (commenting only) is currently available for <b>Document Editor</b> only.
</div>

<table class="table">
    <tbody>
        <tr class="tablerow">
            <td id="download" class="copy-link">download</td>
            <td>Defines if the document can be downloaded or only viewed or edited online. In case the downloading permission is set to <b>"false"</b> the <b>Download as...</b> menu option will be absent from the <b>File</b> menu. The default value is <b>true</b>.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="edit" class="copy-link">edit</td>
            <td>Defines if the document can be edited or only viewed. In case the editing permission is set to <b>"true"</b> the <b>File</b> menu will contain the <b>Edit Document</b> menu option; please note that if the editing permission is set to <b>"false"</b> the document will be opened in viewer and you will <b>not</b> be able to switch it to the editor even if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>. The default value is <b>true</b>.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="print" class="copy-link">print</td>
            <td>Defines if the document can be printed or not. In case the printing permission is set to <b>"false"</b> the <b>Print</b> menu option will be absent from the <b>File</b> menu. The default value is <b>true</b>.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/permissions.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="fillForms" class="copy-link">fillForms</td>
            <td>Defines if the forms can ve filled. Filling in forms will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>. The default value coincides with the value of the <a href="#edit">edit</a> or the <a href="#review">review</a> parameter.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/fill-forms.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="note">
    In case <em>edit</em> is set to <b>"true"</b> or <em>review</em> is set to <b>"true"</b>, the <em>fillForms</em> value is not considered and the form filling is possible.
    In case <em>edit</em> is set to <b>"false"</b> and <em>review</em> is set to <b>"false"</b> and <em>fillForms</em> is also set to <b>"true"</b>, the user can only fill forms in the document.
    In case <em>edit</em> is set to <b>"false"</b> and <em>review</em> is set to <b>"false"</b> and <em>fillForms</em> is set to <b>"true"</b> the <em>comments</em> value is not considered and the commenting is not available.
    The form filling only mode is currently available for <b>Document Editor</b> only.
</div>

<table class="table">
    <tbody>
        <tr class="tablerow">
            <td id="review" class="copy-link">review</td>
            <td>Defines if the document can be reviewed or not. In case the reviewing permission is set to <b>"true"</b> the document <b>status bar</b> will contain the <b>Review</b> menu option; the document review will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b>. The default value coincides with the value of the <a href="#edit">edit</a> parameter.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/review.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="note">
    In case <em>edit</em> is set to <b>"true"</b> and <em>review</em> is also set to <b>"true"</b>, the user will be able to edit the document, accept/reject the changes made and switch to the review mode him-/herself.
    In case <em>edit</em> is set to <b>"true"</b> and <em>review</em> is set to <b>"false"</b>, the user will be able to edit only.
    In case <em>edit</em> is set to <b>"false"</b> and <em>review</em> is set to <b>"true"</b>, the document will be available in review mode only.
</div>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "comment": true,
            "download": true,
            "edit": true,
            "fillForms": true,
            "print": true,
            "review": true
        },
        ...
    },
    ...
});
</pre>
