<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Editor Constructor
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Editor Constructor</span>
    </h1>

    <div >
        <ul class="page-navigation">
            <li class="nav-item active" data-view="viewedit">VIEW & EDIT</li>
            <li class="nav-item" data-view="co-edit">CO-EDIT</li>
            <li class="nav-item" data-view="forms">FORMS</li>
            <li class="nav-item" data-view="customization">CUSTOMIZATION</li>
            <li class="nav-item" data-view="rebranding">REBRANDING</li>
            <li class="nav-item" data-view="plugins">PLUGINS</li>
            <li class="nav-item" data-view="events">EVENTS</li>
        </ul>
    </div>
    
    <div id="controlFields">
        <div id="viewedit" class="control-panel">
            <div class="half-line">
                <label for="documentType">Document type</label>
                <select id="documentType" name="documentType">
                    <option value="word">Document</option>
                    <option value="cell">Spreadsheet</option>
                    <option value="slide">Presentation</option>
                </select>
            </div>
            <div class="half-line">
                <label for="fileType">File type</label>
                <select id="fileType" name="document_fileType">
                </select>
            </div>
            <div class="half-line">
                <label for="type">Type</label>
                <select id="type" name="type">
                    <option value="desktop">Desktop</option>
                    <option value="mobile">Mobile</option>
                    <option value="embedded">Embedded</option>
                </select>
            </div>
            <div class="half-line">
                <label for="mode">Mode</label>
                <select id="mode" name="editorConfig_mode">
                    <option value="edit">Edit</option>
                    <option value="view">View</option>
                </select>
            </div>
            <div class="half-line">
                <label for="width">Width</label>
                <input type="text" id="width" name="width" value="100%" />
            </div>
            <div class="half-line">
                <label for="height">Height</label>
                <input type="text" id="height" name="height" value="100%" />
            </div>
            <div class="line">
                 <label for="document_key">Title</label>
                <input type="text" id="document_title" name="document_title" value="Example Title">
            </div>
            <div class="line">
                <label for="document_key">Key</label>
                <input type="text" id="document_key" name="document_key" />
            </div>
            <div class="line">
                <label for="document_info_folder">Folder:</label>
                <input type="text" id="document_info_folder" name="document_info_folder">
            </div>
            <div class="line">
                <label for="document_info_owner">Owner:</label>
                <input type="text" id="document_info_owner" name="document_info_owner">
            </div>
            <div class="line">
                <label for="document_info_owner">Uploaded:</label>
                <input type="text" id="document_info_uploaded" name="document_info_uploaded">
            </div>
            <div class="line">
                <label for="permissions">Permissions:</label>
                <div class="selectBox" onclick="showCheckboxes()">
                    <select id="permissions">
                        <option>Select permissions</option>
                    </select>
                    <div class="overSelect"></div>
                </div>
                <div id="checkboxes">
                    <label for="document_permissions_chat"><input type="checkbox" id="document_permissions_chat" name="document_permissions_chat" checked />Chat</label>
                    <label for="document_permissions_comment"><input type="checkbox" id="document_permissions_comment" name="document_permissions_comment" checked />Comment</label>
                    <label for="document_permissions_copy"><input type="checkbox" id="document_permissions_copy" name="document_permissions_copy" checked />Copy</label>
                    <label for="document_permissions_deleteCommentAuthorOnly"><input type="checkbox" id="document_permissions_deleteCommentAuthorOnly" name="document_permissions_deleteCommentAuthorOnly" />Delete Comment Author Only</label>
                    <label for="document_permissions_download"><input type="checkbox" id="document_permissions_download" name="document_permissions_download" checked />Download</label>
                    <label for="document_permissions_edit"><input type="checkbox" id="document_permissions_edit" name="document_permissions_edit" checked />Edit</label>
                    <label for="document_permissions_editCommentAuthorOnly"><input type="checkbox" id="document_permissions_editCommentAuthorOnly" name="document_permissions_editCommentAuthorOnly" />Edit Comment Author Only</label>
                    <label for="document_permissions_fillForms"><input type="checkbox" id="document_permissions_fillForms" name="document_permissions_fillForms" checked />Fill Forms</label>
                    <label for="document_permissions_modifyContentControl"><input type="checkbox" id="document_permissions_modifyContentControl" name="document_permissions_modifyContentControl" checked />Modify Content Control</label>
                    <label for="document_permissions_modifyFilter"><input type="checkbox" id="document_permissions_modifyFilter" name="document_permissions_modifyFilter" checked />Modify Filter</label>
                    <label for="document_permissions_permissions_print"><input type="checkbox" id="document_permissions_print" name="document_permissions_print" checked />Print</label>
                    <label for="document_permissions_protect"><input type="checkbox" id="document_permissions_protect" name="document_permissions_protect" checked />Protect</label>
                    <label for="document_permissions_review"><input type="checkbox" id="document_permissions_review" name="document_permissions_review" checked />Review</label>
                </div>
            </div>
        </div>

        <div id="co-edit" class="control-panel hidden">
            <div id="co-edit-settings">
            </div>
            <button id="addButton">+</button>
        </div>

        <div id="customization" class="control-panel hidden">
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_autosave" name="editorConfig_customization_autosave" checked>
                <label for="editorConfig_customization_autosave">Autosave</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_comments" name="editorConfig_customization_comments" checked>
                <label for="editorConfig_customization_comments">Comments</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_compactHeader" name="editorConfig_customization_compactHeader">
                <label for="editorConfig_customization_compactHeader">Compact Header</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_compactToolbar" name="editorConfig_customization_compactToolbar">
                <label for="editorConfig_customization_compactToolbar">Compact Toolbar</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_compatibleFeatures" name="editorConfig_customization_compatibleFeatures">
                <label for="editorConfig_customization_compatibleFeatures">Compatible Features</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_forcesave" name="editorConfig_customization_forcesave">
                <label for="editorConfig_customization_forcesave">Force Save</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_help" name="editorConfig_customization_help" checked>
                <label for="editorConfig_customization_help">Help</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_hideNotes" name="editorConfig_customization_hideNotes">
                <label for="editorConfig_customization_hideNotes">Hide Notes</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_hideRightMenu" name="editorConfig_customization_hideRightMenu">
                <label for="editorConfig_customization_hideRightMenu">Hide Right Menu</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_hideRulers" name="editorConfig_customization_hideRulers">
                <label for="editorConfig_customization_hideRulers">Hide Rulers</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_macros" name="editorConfig_customization_macros" checked>
                <label for="editorConfig_customization_macros">Macros</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_plugins" name="editorConfig_customization_plugins" checked>
                <label for="editorConfig_customization_plugins">Plugins</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_showReviewChanges" name="editorConfig_customization_showReviewChanges">
                <label for="editorConfig_customization_showReviewChanges">Show Review Changes</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_toolbarHideFileName" name="editorConfig_customization_toolbarHideFileName">
                <label for="editorConfig_customization_toolbarHideFileName">Toolbar Hide File Name</label>
            </div>
            <div class="line">
                <input type="checkbox" id="editorConfig_customization_toolbarNoTabs" name="editorConfig_customization_toolbarNoTabs">
                <label for="editorConfig_customization_toolbarNoTabs">Toolbar No Tabs</label>
            </div>
        </div>  
    </div>

    <div id="configArea">
        <pre id="editor-page-html" class=" hljs cs">
        </pre>
    </div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceholder" runat="server">
    <script type="text/javascript">
        var expanded = false;
        var fileTypesMap = {
            word: ["docx", "doc", "odt", "txt"],
            cell: ["xlsx", "xls", "ods", "csv"],
            slide: ["pptx", "ppt", "odp"],
        };

        $(document).ready(function () {
            completeFileType();
            $("#document_key").val(uuidv4());
            addSharingSettings();
            updateConfig();
        });

        $("#documentType").change(function () {
            completeFileType();
        });

        $("#controlFields").find("input,select").change(function () {
            updateConfig();
        });

        $(".nav-item").on("click", function (e) {
            var view = e.currentTarget.dataset["view"];

            $(".nav-item").removeClass("active");
            e.currentTarget.classList.add("active");
            $(".control-panel").addClass("hidden");
            $("#" + view).removeClass("hidden");
        })

        $("#addButton").on("click", function () {
            addSharingSettings();
            updateConfig();
        })

        function addSharingSettings() {
            var index = $(".sharing-settings").length;
            $("#co-edit-settings").append(
                `<div class="sharing-settings">
                    <div class="line">
                        <label for="document_info_sharingSettings_[${index}]_permissions">Sharing Settings</label>
                        <select id="document_info_sharingSettings_[${index}]_permissions" name="document_info_sharingSettings_[${index}]_permissions">
                            <option value="Full Access">Full Access</option>
                            <option value="Read Only">Read Only</option>
                            <option value="Deny Access">Deny Access</option>
                        </select>
                    </div>
                    <div class="line">
                        <label for="document_info_sharingSettings_[${index}]_user">User:</label>
                        <input type="text" id="document_info_sharingSettings_[${index}]_user" name="document_info_sharingSettings_[${index}]_user" value="John Smith">
                    </div>
                </div>`
            );

            $("#controlFields").find("select[name='document_info_sharingSettings_[" + index + "]_permissions'],input[name='document_info_sharingSettings_[" + index + "]_user']").change(function () {
                updateConfig();
            });
        }

        function completeFileType() {
            var documentType = $("#documentType").val();
            var fileTypes = fileTypesMap[documentType];

            if (fileTypes) {
                $("#fileType").html("");
                for (fileType of fileTypes) {
                    $("#fileType").append(`<option value="${fileType}">${fileType}</option>`);
                }
            }

        }

        function collectData() {
            var data = {};

            var textInputArray = $("#controlFields").find("input[type=text]");
            var radioInputArray = $("#controlFields").find("input[type=radio]:checked");
            var checkboxInputArray = $("#controlFields").find("input[type=checkbox]");
            var selectInputArray = $("#controlFields").find("select");

            function collect(name, value, checkbox = false) {
                if (name && (value || checkbox)) {
                    var names = name.split("_");

                    var prev = data;
                    for (var i = 0; i < names.length; i++) {
                        var name = names[i];

                        if (names.length - 1 <= i) {
                            if (Array.isArray(prev)) {
                                var index = parseInt(names[i-1].match(/\[(.+?)\]/)[1]);

                                if (prev[index]) {
                                    prev[index][name] = value;
                                } else {
                                    prev.push({});
                                    prev[index][name] = value;
                                }
                            } else { 
                                prev[name] = value;
                            }
                        } else {
                            if (/\[(.+?)\]/.test(names[i + 1])) {
                                prev[name] = prev[name] || [];
                                i++;
                            } else {
                                prev[name] = prev[name] || {};
                            }
                        }

                        prev = prev[name];
                    }
                }
            }

            for (textInput of textInputArray) {
                collect(textInput.name, textInput.value);
            }

            for (radioInput of radioInputArray) {
                collect(radioInput.name, radioInput.value);
            }

            for (checkboxInput of checkboxInputArray) {
                collect(checkboxInput.name, checkboxInput.checked, true);
            }

            for (selectInput of selectInputArray) {
                collect(selectInput.name, selectInput.value);
            }

            return data;
        }

        function showCheckboxes() {
            var checkboxes = document.getElementById("checkboxes");
            if (!expanded) {
                checkboxes.style.display = "block";
                expanded = true;
            } else {
                checkboxes.style.display = "none";
                expanded = false;
            }
        }

        function updateConfig() {
            var data = collectData("configCommon");

            $.ajax({
                type: "POST",
                url: "<%= Url.Action("configcreate", null, null, Request.Url.Scheme) %>",
                data: JSON.stringify({ jsonConfig: JSON.stringify(data) }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                var config = JSON.parse(data);

            $("#editor-page-html").html(
`&lt;!DOCTYPE html&gt;
&lt;html style="height: 100%;"&gt;
&lt;head&gt;
    &lt;title&gt;ONLYOFFICE Api Documentation&lt;/title&gt;
&lt;/head&gt;
&lt;body style="height: 100%; margin: 0;"&gt;
    &lt;div id="placeholder" style="height: 100%"&gt;&lt;/div&gt;
    &lt;script type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;

    &lt;script type="text/javascript"&gt;

        window.docEditor = new DocsAPI.DocEditor("placeholder", ${JSON.stringify(config, null, '\t')});

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;`
            );
                }
            });
        }

        function uuidv4() {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
                .replace(/[xy]/g, function (c) {
                    const r = Math.random() * 16 | 0,
                        v = c == 'x' ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
        }
    </script>
</asp:Content>
