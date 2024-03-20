<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ONLYOFFICE Docs FAQ: <br />
        Sharing questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="sharing_1">
    <dt>How to open a document with "track changes" mode enabled?</dt>
    <dd>
        <p>To open the document with the <em>track changes</em> mode enabled, the <em>document.permissions</em> parameter is used (see the complete structure of ONLYOFFICE Docs configuration object <a href="<%= Url.Action("advanced") %>">here</a>).</p>
        <p>There are three main variants how the document can be opened with the <em>track changes</em> mode enabled:</p>
        <ol>
            <li>Both reviewing and editing enabled: if both the <em>document.permission.edit</em> and <em>document.permission.review</em> parameters are set to <b>true</b>, the user will be able to edit the document, accept/reject the changes made and switch to the review mode him-/herself. The configuration in this case will look like this:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": true,
            "review": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>Reviewing only enabled: if the <em>document.permission.edit</em> parameter is set to <b>false</b> and <em>document.permission.review</em> is set to <b>true</b>, the user will be able to open the document in review mode only. The configuration in this case will look like this:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "review": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>Reviewing and commenting enabled: if the <em>document.permission.edit</em> parameter is set to <b>false</b>, <em>document.permission.review</em> and <em>document.permission.comment</em> are both set to <b>true</b>, the user will be able to open the document in review mode with possibility to comment it, but will not be able to edit it. The configuration in this case will look like this:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "comment": true,
            "review": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
        </ol>
        <p>Further information about the permissions can be found <a href="<%= Url.Action("config/document/permissions") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_2">
    <dt>How to open a document with "commenting" mode enabled?</dt>
    <dd>
        <p>To open the document with the <em>commenting</em> mode enabled, the <em>document.permissions</em> parameter is used (see the complete structure of ONLYOFFICE Docs configuration object <a href="<%= Url.Action("advanced") %>">here</a>).</p>
        <p>There are the following main variants how the document can be opened with the <em>commenting</em> mode enabled:</p>
        <ol>
            <li>Both commenting and editing enabled: if both the <em>document.permission.edit</em> and <em>document.permission.comment</em> parameters are set to <b>true</b>, the user will be able to edit the document and comment. The configuration in this case will look like this:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": true,
            "comment": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>Commenting only enabled: if the <em>document.permission.edit</em> parameter is set to <b>false</b> and <em>document.permission.comment</em> is set to <b>true</b>, the document will be available for commenting only. The configuration in this case will look like this:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "comment": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>Reviewing and commenting enabled: if the <em>document.permission.edit</em> parameter is set to <b>false</b>, <em>document.permission.review</em> and <em>document.permission.comment</em> are both set to <b>true</b>, the user will be able to open the document in review mode with possibility to comment it, but will not be able to edit it. The configuration in this case will look like this:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "comment": true,
            "review": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
            <li>Comments are available for viewing only: if the <em>document.permission.edit</em> parameter is set to <b>true</b> and <em>document.permission.comment</em> is set to <b>false</b>, the user will be able to edit only, the corresponding commenting functionality will be available for viewing only, the adding and editing of comments will be unavailable. The configuration in this case will look like this:
                <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": true,
            "comment": false
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
            </li>
        </ol>
        <p>Further information about the permissions can be found <a href="<%= Url.Action("config/document/permissions") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_3">
    <dt>How can the 'fillForms' parameter be used?</dt>
    <dd>
        <p>Starting from version 5.2, ONLYOFFICE Docs provides functionality for filling special forms without the need to give editing permissions to the user. This can be used, for example, in case you have a document form of some kind and want to give the users the access to this form so that they could fill it, but could not edit other document fields (e.g. fill the names in a contract but not change the contract terms, or fill the variable fields in some other document but leave the other parts of the document intact).</p>
        <p>To enable this mode the <em>document.permissions.fillForms</em> parameter is used:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "review": false,
            "fillForms": true,
            "comment": false
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
        <p>The <em>comment</em> field is optional because the commenting is disabled anyway with the <em>fillForms</em> parameter enabled and <em>edit</em> and <em>review</em> parameters disabled.</p>
        <p>With the configuration above the document will be opened with the form filling mode enabled and all the other modes disabled, giving the users who have access to it only the possibility to fill the fields in the special <a target="_blank" href="https://helpcenter.onlyoffice.com/ONLYOFFICE-Editors/ONLYOFFICE-Document-Editor/UsageInstructions/InsertContentControls.aspx">content controls</a>.</p>
        <p>It is then up to you to decide what is done next: either the changes to the editable fields will be saved to the same document or a new document will be created each time the original one is accessed and altered by a new user.</p>
        <p>The first scenario can be used if the access to the document will be given only once to a certain user with <em>fillForms</em> permissions, then it is saved with all the changes and no other user will have to fill it again.</p>
        <p>The second scenario is more commonly used, when you have a document template with some fields not filled and want to give access to it to more users (put it to your website, for example, so that the users filled it right there without the need to download it each time, fill and upload it back again). In this case it will be more reasonable to have this document as a template for future changes and, once the users with the <em>fillForms</em> access edit the fields, save it under another name.</p>
        <p>Further information about the permissions can be found <a href="<%= Url.Action("config/document/permissions") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_4">
    <dt>How to enable both the editing and commenting mode for a document?</dt>
    <dd>
        <p>To open the document with both the <em>editing</em> and the <em>commenting</em> modes enabled, the <em>document.permissions</em> parameter is used (see the complete structure of ONLYOFFICE Docs configuration object <a href="<%= Url.Action("advanced") %>">here</a>).</p>
        <p>You will need to set both the <em>document.permission.edit</em> and <em>document.permission.comment</em> parameters to <b>true</b>, so that the user will be able to edit the document and comment. The configuration in this case will look like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": true,
            "comment": true
        },
        ...
    },
    "editorConfig": {
        "mode": "edit",
        ...
    },
    ...
});</pre>
        <p>Further information about the permissions can be found <a href="<%= Url.Action("config/document/permissions") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_5">
    <dt>Do the permission parameters influence each other?</dt>
    <dd>
        <p>Most permission parameters are independent and are only enabled when their value is set to <b>true</b> and disabled when the value is set to <b>false</b>. There are, though, several combinations, when the permission will be either enabled or disabled notwithstanding the corresponding parameter value:</p>
        <ul>
            <li>Form filling permission is enabled (even if the <em>fillForm</em> parameter is set to <b>false</b>) when either the <em>edit</em> or <em>review</em> parameter is set to <b>true</b>.</li>
            <li>Form filling permission is disabled (even if the <em>fillForm</em> parameter is set to <b>true</b>) when both the <em>edit</em> and <em>review</em> parameters are set to <b>false</b> and the <em>comment</em> is set to <b>true</b>.</li>
            <li>Commenting permission is disabled (even if the <em>comment</em> parameter is set to <b>true</b>) when both the <em>edit</em> and <em>review</em> parameters are set to <b>false</b> and the <em>fillForms</em> is set to <b>true</b>.</li>
        </ul>
        <p>You should bear this in mind when you set the necessary permissions and combine different permissions for the same document.</p>
        <p>See the interactive table below to find out how different parameters and parameter combinations influence each other and the resulting document permissions:</p>
        <div class="table_wrapper">
            <h5>Parameters</h5>
            <table id="parameters" class="parameters_permissions">
                <thead>
                    <tr>
                        <th>Parameter</th>
                        <th colspan="2" style="text-align: center;">Value</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="mode">
                        <th><p><a href="<%= Url.Action("config/editor") %>#mode">editorConfig.mode</a></th>
                        <td class="paramEdit active_param"><p>edit</p></td>
                        <td class="paramView inactive_param"><p>view</p></td>
                    </tr>
                    <tr id="edit">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#edit">document.permissions.edit</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="review">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#review">document.permissions.review</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="fillForms">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#fillForms">document.permissions.fillForms</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="comment">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#comment">document.permissions.comment</a></a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="download">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#download">document.permissions.download</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                    <tr id="print">
                        <th><p><a href="<%= Url.Action("config/document/permissions") %>#print">document.permissions.print</a></p></th>
                        <td class="paramTrue active_param"><p>true</p></td>
                        <td class="paramFalse inactive_param"><p>false</p></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_wrapper">
            <h5>Resulting permissions</h5>
            <table id="result" class="parameters_permissions">
                <thead>
                    <tr>
                        <th>Document action</th>
                        <th>Permission</th>
                        <th>Note</th>
                    </tr>
                </thead>
                <tbody>
                    <tr id="viewing">
                        <td class="resultAction"><p>Viewing</p></td>
                        <td class="resultPermission allowed"><p>allowed</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="editing">
                        <td class="resultAction"><p>Editing</p></td>
                        <td class="resultPermission notallowed"><p>not allowed</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="reviewing">
                        <td class="resultAction"><p>Reviewing</p></td>
                        <td class="resultPermission notallowed"><p>not allowed</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="formFilling">
                        <td class="resultAction"><p>Form filling</p></td>
                        <td class="resultPermission notallowed"><p>not allowed</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="commenting">
                        <td class="resultAction"><p>Commenting</p></td>
                        <td class="resultPermission notallowed"><p>not allowed</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="downloading">
                        <td class="resultAction"><p>Downloading</p></td>
                        <td class="resultPermission notallowed"><p>not allowed</p></td>
                        <td class="resultNote"></td>
                    </tr>
                    <tr id="printing">
                        <td class="resultAction"><p>Printing</p></td>
                        <td class="resultPermission notallowed"><p>not allowed</p></td>
                        <td class="resultNote"></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <p>Further information about the permissions can be found <a href="<%= Url.Action("config/document/permissions") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_6">
    <dt>How to open the document in a viewer without the option to edit it?</dt>
    <dd>
        <p>To open the document with both the <em>viewing</em> mode enabled, the <em>document.permissions</em> parameter is used (see the complete structure of ONLYOFFICE Docs configuration object <a href="<%= Url.Action("advanced") %>">here</a>).</p>
        <p>You will need to set the <em>document.permission.edit</em>, <em>document.permission.review</em> and <em>document.permission.fillForms</em> parameters to <b>false</b>, so that the user will not be able to either edit, or review the document, or change form fields in it. If you additionally want to disable the commenting functionality for the document, set the <em>comment</em> parameter also to <b>false</b> (the existing comments will be available for viewing though).</p>
        <div class="note">In case you disable all the editing permissions, we suggest that you also set the <em>document.permissions.chat</em> to <b>false</b>, so that the users with the access to the document could not spam to the document embedded chat.</div>
        <p>The configuration in this case will look like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "chat": false,
            "edit": false,
            "review": false,
            "fillForms": false,
            "comment": false
        },
        ...
    },
    ...
});</pre>
        <p>Further information about the permissions can be found <a href="<%= Url.Action("config/document/permissions") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_7">
    <dt>How to disable/enable the possibility to download the file?</dt>
    <dd>
        <p>To open the document with the <em>downloading</em> option disabled, the <em>document.permissions</em> parameter is used (see the complete structure of ONLYOFFICE Docs configuration object <a href="<%= Url.Action("advanced") %>">here</a>).</p>
        <p>You will need to set the <em>document.permission.download</em> to <b>false</b>, so that the <b>Download as...</b> option were removed from the document <b>File</b> menu (in case the <em>document.permission.edit</em> parameter is set to <b>true</b>) or from the top toolbar (in case the <em>document.permission.edit</em> is set to <b>false</b> and the file is available for viewing only) and the user could not download the document from the editor. The <em>permission</em> configuration in this case will look like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "download": false
        },
        ...
    },
    ...
});</pre>
        <p>Further information about the permissions can be found <a href="<%= Url.Action("config/document/permissions") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_8">
    <dt>How to prevent a document from being printed?</dt>
    <dd>
        <p>To open the document with the <em>printing</em> option disabled, the <em>document.permissions</em> parameter is used (see the complete structure of ONLYOFFICE Docs configuration object <a href="<%= Url.Action("advanced") %>">here</a>).</p>
        <p>You will need to set the <em>document.permission.print</em> to <b>false</b>, so that the <b>Print</b> option were removed from the document <b>File</b> menu (in case the <em>document.permission.edit</em> parameter is set to <b>true</b>) or from the top toolbar (in case the <em>document.permission.edit</em> is set to <b>false</b> and the file is available for viewing only) and the user could not print out the document from the editor. The <em>permission</em> configuration in this case will look like this:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "print": false
        },
        ...
    },
    ...
});</pre>
        <p>Further information about the permissions can be found <a href="<%= Url.Action("config/document/permissions") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_9">
    <dt>How to view and change sharing settings for a certain document?</dt>
    <dd>
        <p>The sharing settings are stored at the <b>document storage service</b> and must be defined by the software integrators themselves. ONLYOFFICE Docs can display these settings using the <em>document.info.sharingSettings</em> parameter the information from which will be displayed in the document <b>File</b> -> <b>Access rights...</b> window.</p>
        <p>This parameter is an array of objects representing a list of user names (<em>document.info.sharingSettings.user</em>) with their access rights for the current document (<em>document.info.sharingSettings.permissions</em>).</p>
        <p>The <em>document.info.sharingSettings.user</em> is a string parameter, which can display any user name passed from the <b>document storage service</b> to the ONLYOFFICE Docs.</p>
        <p>The <em>document.info.sharingSettings.permissions</em> is also a string parameter, which displays the name of the access rights corresponding to the set of rules defining the user access to the current document.</p>
        <div class="note">Please note, that initially there are not any predefined set of rules for the document access. In case you use <b>ONLYOFFICE Workspace</b>, there are several access right rules defined (<b>Full Access</b>, <b>Read Only</b>, <b>Deny Access</b>) which will be used and displayed. If you set up your own <b>document storage service</b>, you will have to define your own set of rules and their names (e.g. <b>Read-only access</b> with <em>document.permission.edit</em>, <em>document.permission.review</em>, <em>document.permission.fillForms</em> parameters set to <b>false</b>; or <b>Download only</b> with all the <em>document.permission</em> parameters set to <b>false</b> and only <em>document.permission.download</em> parameter set to <b>true</b>, etc.) and send them to the <b>document editing service</b> so that the user could access the document and these settings were displayed in the document <b>Access rights...</b> window.</div>
        <p>The <em>sharingSettings</em> configuration might look the following way:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "info": {
            "sharingSettings": [
                {
                    "permissions": "Full Access",
                    "user": "John Smith"
                },
                {
                    "isLink": true,
                    "permissions": "Read Only",
                    "user": "External link"
                },
                ...
            ]
        },
        ...
    },
    ...
});</pre>
        <p>Further information about the information for the document can be found <a href="<%= Url.Action("config/document/info") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="sharing_10">
    <dt>How to restrict commenting?</dt>
    <dd>
        <p>The comments are enabled by default. If you want to restrict commenting and allow the authors to edit and/or delete only their comments, 
        you will need to change the <em>document.permissions.editCommentsAuthorOnly</em> and/or <em>document.permissions.deleteCommentsAuthorOnly</em> parameters:</p>
        <pre>var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "comment": true,
            "editCommentsAuthorOnly": true,
            "deleteCommentsAuthorOnly": true,
        },
        ...
    },
    ...
});</pre>
    <div class="note">Do not forget to set the <em>editorConfig.mode</em> to <b>edit</b>, otherwise any commenting functionality will be disabled.</div>
    </dd>
</dl>