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

        <div id="rebranding" class="control-panel hidden">
            <div class="line">
                <label for="editorConfig_customization_customer_address">Address</label>
                <input type="text" id="editorConfig_customization_customer_address" name="editorConfig_customization_customer_address" value="My City, 123a-45">
            </div>
            <div class="line">
                <label for="editorConfig_customization_customer_info">Info</label>
                <input type="text" id="editorConfig_customization_customer_info" name="editorConfig_customization_customer_info" value="Some additional information">
            </div>
            <div class="line">
                <label for="editorConfig_customization_customer_logo">Logo</label>
                <input type="text" id="editorConfig_customization_customer_logo" name="editorConfig_customization_customer_logo">
            </div>
            <div class="line">
                <label for="editorConfig_customization_customer_logoDark">LogoDark</label>
                <input type="text" id="editorConfig_customization_customer_logoDark" name="editorConfig_customization_customer_logoDark">
            </div>
            <div class="line">
                <label for="editorConfig_customization_customer_mail">Mail</label>
                <input type="text" id="editorConfig_customization_customer_mail" name="editorConfig_customization_customer_mail" value="john@example.com">
            </div>
            <div class="line">
                <label for="editorConfig_customization_customer_name">Name</label>
                <input type="text" id="editorConfig_customization_customer_name" name="editorConfig_customization_customer_name" value="John Smith and Co.">
            </div>
            <div class="line">
                <label for="editorConfig_customization_customer_phone">Phone</label>
                <input type="text" id="editorConfig_customization_customer_phone" name="editorConfig_customization_customer_phone" value="123456789">
            </div>
            <div class="line">
                <label for="editorConfig_customization_customer_www">www</label>
                <input type="text" id="editorConfig_customization_customer_www" name="editorConfig_customization_customer_www" value="example.com">
            </div>
        </div>

        <div id="plugins" class="control-panel hidden">
            <div class="line">
                <label for="editorConfig_plugins_autostart">Autostart</label>
                <input type="text" id="editorConfig_plugins_autostart_[0]" name="editorConfig_plugins_autostart_[0]" value="asc.{c9d216a5-4f1a-49f2-9ff0-67c510a73523}">
            </div>
            <div class="line">
                <label for="editorConfig_plugins_pluginsData">PluginsData</label>
                <input type="text" id="editorConfig_plugins_pluginsData_[0]" name="editorConfig_plugins_pluginsData_[0]" value="https://nct.onlyoffice.com/ThirdParty/plugin/easybib/config.json">
            </div>
        </div>

        <div id="events" class="control-panel hidden">
            <div class="line">
                <input type="checkbox" id="events_onAppReady" name="events_onAppReady" checked>
                <label for="events_onAppReady">onAppReady</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onCollaborativeChanges" name="events_onCollaborativeChanges">
                <label for="events_onCollaborativeChanges">onCollaborativeChanges</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onDocumentReady" name="events_onDocumentReady" checked>
                <label for="events_onDocumentReady">onDocumentReady</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onDocumentStateChange" name="events_onDocumentStateChange">
                <label for="events_onDocumentStateChange">onDocumentStateChange</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onDownloadAs" name="events_onDownloadAs">
                <label for="events_onDownloadAs">onDownloadAs</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onError" name="events_onError" checked>
                <label for="events_onError">onError</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onInfo" name="events_onInfo" checked>
                <label for="events_onInfo">onInfo</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onMetaChange" name="events_onMetaChange">
                <label for="events_onMetaChange">onMetaChange</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onMakeActionLink" name="events_onMakeActionLink">
                <label for="events_onMakeActionLink">onMakeActionLink</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onOutdatedVersion" name="events_onOutdatedVersion">
                <label for="events_onOutdatedVersion">onOutdatedVersion</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestClose" name="events_onRequestClose">
                <label for="events_onRequestClose">onRequestClose</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestCompareFile" name="events_onRequestCompareFile">
                <label for="events_onRequestCompareFile">onRequestCompareFile</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestCreateNew" name="events_onRequestCreateNew">
                <label for="events_onRequestCreateNew">onRequestCreateNew</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestEditRights" name="events_onRequestEditRights">
                <label for="events_onRequestEditRights">onRequestEditRights</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestHistory" name="events_onRequestHistory">
                <label for="events_onRequestHistory">onRequestHistory</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestHistoryClose" name="events_onRequestHistoryClose">
                <label for="events_onRequestHistoryClose">onRequestHistoryClose</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestHistoryData" name="events_onRequestHistoryData">
                <label for="events_onRequestHistoryData">onRequestHistoryData</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestInsertImage" name="events_onRequestInsertImage">
                <label for="events_onRequestInsertImage">onRequestInsertImage</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestMailMergeRecipients" name="events_onRequestMailMergeRecipients">
                <label for="events_onRequestMailMergeRecipients">onRequestMailMergeRecipients</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestReferenceData" name="events_onRequestReferenceData">
                <label for="events_onRequestReferenceData">onRequestReferenceData</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestRename" name="events_onRequestRename">
                <label for="events_onRequestRename">onRequestRename</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestRestore" name="events_onRequestRestore">
                <label for="events_onRequestRestore">onRequestRestore</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestSaveAs" name="events_onRequestSaveAs">
                <label for="events_onRequestSaveAs">onRequestSaveAs</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestSendNotify" name="events_onRequestSendNotify">
                <label for="events_onRequestSendNotify">onRequestSendNotify</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestSharingSettings" name="events_onRequestSharingSettings">
                <label for="events_onRequestSharingSettings">onRequestSharingSettings</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onRequestUsers" name="events_onRequestUsers">
                <label for="events_onRequestUsers">onRequestUsers</label>
            </div>
            <div class="line">
                <input type="checkbox" id="events_onWarning" name="events_onWarning" checked>
                <label for="events_onWarning">onWarning</label>
            </div>
        </div>
    </div>

    <div id="configArea">
        <pre id="editor-page-html" class="hljs cs">
        </pre>
        <a class="button copy-code">Copy code</a>
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
                                if (names.length - 1 <= i) {
                                    prev[name].push(value);
                                }
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

            var eventsMethods = "";
            var events = "";

            if ($("#events_onAppReady").is(':checked')) {
                eventsMethods += `
var onAppReady = function () {
    console.log("ONLYOFFICE Document Editor is ready");
};`
                events += `onAppReady: onAppReady,\n`
            }

            if ($("#events_onCollaborativeChanges").is(':checked')) {
                eventsMethods += `
var onCollaborativeChanges = function () {
    console.log("The document changed by collaborative user");
};`
                events += `onCollaborativeChanges: onCollaborativeChanges,\n`
            }

            if ($("#events_onDocumentReady").is(':checked')) {
                eventsMethods += `
var onDocumentReady = function () {
    console.log("Document is loaded");
};`
                events += `onDocumentReady: onDocumentReady,\n`
            }

            if ($("#events_onDocumentStateChange").is(':checked')) {
                eventsMethods += `
var onDocumentStateChange = function (event) {
    if (event.data) {
        console.log("The document changed");
    } else {
        console.log("Changes are collected on document editing service");
    }
};`
                events += `onDocumentStateChange: onDocumentStateChange,\n`
            }

            if ($("#events_onDownloadAs").is(':checked')) {
                eventsMethods += `
var onDownloadAs = function (event) {
    var fileType = event.data.fileType;
    var url = event.data.url;
    console.log("ONLYOFFICE Document Editor create file: " + url);
};`
                events += `onDownloadAs: onDownloadAs,\n`
            }

            if ($("#events_onError").is(':checked')) {
                eventsMethods += `
var onError = function (event) {
    console.log("ONLYOFFICE Document Editor reports an error: code " + event.data.errorCode + ", description " + event.data.errorDescription);
};`
                events += `onError: onError,\n`
            }

            if ($("#events_onInfo").is(':checked')) {
                eventsMethods += `
var onInfo = function (event) {
    console.log("ONLYOFFICE Document Editor is opened in mode " + event.data.mode);
};`
                events += `onInfo: onInfo,\n`
            }

            if ($("#events_onMetaChange").is(':checked')) {
                eventsMethods += `
var onMetaChange = function (event) {
    if (event.data.hasOwnProperty("favorite")) {
        var favorite = !!event.data.favorite;  
        docEditor.setFavorite(favorite);
    }
    console.log("Document metadata changed: " + JSON.stringify(event.data));
};`
                events += `onMetaChange: onMetaChange,\n`
            }

            if ($("#events_onMakeActionLink").is(':checked')) {
                eventsMethods += `
var onMakeActionLink = function (event) {
    var actionData = event.data;
    var linkParam = JSON.stringify(actionData);
    var actionLink;
    var actionIndex = location.href.indexOf("&actionLink=");
    if (actionIndex != -1) {
        var endIndex = location.href.indexOf("&", actionIndex + "&actionLink=".length);
        if (endIndex != -1) {
            actionLink = location.href.substring(0, actionIndex) + location.href.substring(endIndex) + "&actionLink=" + encodeURIComponent(linkParam);
        } else {
            actionLink = location.href.substring(0, actionIndex) + "&actionLink=" + encodeURIComponent(linkParam);
        }
    } else {
        actionLink = location.href + "&actionLink=" + encodeURIComponent(linkParam);
    }

    docEditor.setActionLink(actionLink);

    console.log("User is trying to get link for opening the document which contains a bookmark: " + linkParam);
};`
                events += `onMakeActionLink: onMakeActionLink,\n`
            }

            if ($("#events_onOutdatedVersion").is(':checked')) {
                eventsMethods += `
var onOutdatedVersion = function () {
    console.log("Document is opened for editing with the old document.key value");
};`
                events += `onOutdatedVersion: onOutdatedVersion,\n`
            }

            if ($("#events_onPluginsReady").is(':checked')) {
                eventsMethods += `
var onPluginsReady = function () {
    console.log("All plugins are loaded and can be used");
};`
                events += `onPluginsReady: onPluginsReady,\n`
            }

            if ($("#events_onRequestClose").is(':checked')) {
                eventsMethods += `
var onRequestClose = function () {
    console.log("Work with the editor must be ended and the editor must be closed.");
};`
                events += `onRequestClose: onRequestClose,\n`
            }

            if ($("#events_onRequestCompareFile").is(':checked')) {
                eventsMethods += `
var onRequestCompareFile = function () {
    console.log("User is trying to select document for comparing by clicking the Document from Storage button");
};`
                events += `onRequestCompareFile: onRequestCompareFile,\n`
            }

            if ($("#events_onRequestCreateNew").is(':checked')) {
                eventsMethods += `
var onRequestCreateNew = function () {
    console.log("User is trying to create document by clicking the Create New button");
};`
                events += `onRequestCreateNew: onRequestCreateNew,\n`
            }

            if ($("#events_onRequestEditRights").is(':checked')) {
                eventsMethods += `
var onRequestEditRights = function () {
    console.log("ONLYOFFICE Document Editor requests editing rights");
};`
                events += `onRequestEditRights: onRequestEditRights,\n`
            }

            if ($("#events_onRequestHistory").is(':checked')) {
                eventsMethods += `
var onRequestHistory = function () {
    docEditor.refreshHistory({
        "currentVersion": 2,
        "history": [
            {
                "created": "2010-07-06 10:13 AM",
                "key": "F89d8069ba2b",
                "user": {
                    "id": "F89d8069ba2b",
                    "name": "Kate Cage"
                },
                "version": 1
            },
            {
                "created": "2010-07-07 3:46 PM",
                "key": "Khirz6zTPdfd7",
                "user": {
                    "id": "78e1e841",
                    "name": "John Smith"
                },
                "version": 2
            },
        ]
    });

    console.log("User is trying to show the document version history by clicking the Version History button");
};`
                events += `onRequestHistory: onRequestHistory,\n`
            }

            if ($("#events_onRequestHistoryClose").is(':checked')) {
                eventsMethods += `
var onRequestHistoryClose = function () {
    document.location.reload();
    console.log("User is trying to go back to the document from viewing the document version history by clicking the Close History button");
};`
                events += `onRequestHistoryClose: onRequestHistoryClose,\n`
            }

            if ($("#events_onRequestHistoryData").is(':checked')) {
                eventsMethods += `
var onRequestHistoryData = function (event) {
    console.log("User is trying to click the specific document version in the document version history: " + event.data);
};`
                events += `onRequestHistoryData: onRequestHistoryData,\n`
            }

            if ($("#events_onRequestInsertImage").is(':checked')) {
                eventsMethods += `
var onRequestInsertImage = function (event) {
    console.log("User is trying to insert an image by clicking the Image from Storage button: " + JSON.stringify(event.data));
};`
                events += `onRequestInsertImage: onRequestInsertImage,\n`
            }

            if ($("#events_onRequestMailMergeRecipients").is(':checked')) {
                eventsMethods += `
var onRequestMailMergeRecipients = function () {
    console.log("User is trying to select recipients data by clicking the Mail merge button");
};`
                events += `onRequestMailMergeRecipients: onRequestMailMergeRecipients,\n`
            }

            if ($("#events_onRequestReferenceData").is(':checked')) {
                eventsMethods += `
var onRequestReferenceData = function () {
    console.log("User is trying to refresh data inserted from the external file by clicking the Update values button in the External links dialog box of the Data tab");
};`
                events += `onRequestReferenceData: onRequestReferenceData,\n`
            }

            if ($("#events_onRequestRename").is(':checked')) {
                eventsMethods += `
var onRequestRename = function (event) {
    console.log("User is trying to rename the file by clicking the Rename... button: " + event.data);
};`
                events += `onRequestRename: onRequestRename,\n`
            }

            if ($("#events_onRequestRestore").is(':checked')) {
                eventsMethods += `
var onRequestRestore = function (event) {
    console.log("User is trying to restore the file version by clicking the Restore button in the version history: " + JSON.stringify(event.data));
};`
                events += `onRequestRestore: onRequestRestore,\n`
            }

            if ($("#events_onRequestSaveAs").is(':checked')) {
                eventsMethods += `
var onRequestSaveAs = function (event) {
    console.log("User is trying to save file by clicking Save Copy as... button: " + JSON.stringify(event.data));
};`
                events += `onRequestSaveAs: onRequestSaveAs,\n`
            }

            if ($("#events_onRequestSendNotify").is(':checked')) {
                eventsMethods += `
var onRequestSendNotify = function (event) {
    console.log("User is mentioned in a comment: " + JSON.stringify(event.data));
};`
                events += `onRequestSendNotify: onRequestSendNotify,\n`
            }

            if ($("#events_onRequestSharingSettings").is(':checked')) {
                eventsMethods += `
var onRequestSharingSettings = function () {
    docEditor.setSharingSettings({
        "sharingSettings": [
            {
                "permissions": "Full Access",
                "user": "John Smith"
            },
            {
                "isLink": true,
                "permissions": "Read Only",
                "user": "External link"
            }
        ]
    });
    console.log("User is trying to manage document access rights by clicking Change access rights button");
};`
                events += `onRequestSharingSettings: onRequestSharingSettings,\n`
            }

            if ($("#events_onRequestUsers").is(':checked')) {
                eventsMethods += `
var onRequestUsers = function () {
    docEditor.setUsers({
        "c": event.data.c,
        "users": [
            {
                "email": "john@example.com",
                "id": "78e1e841",
                "name": "John Smith"
            },
            {
                "email": "kate@example.com",
                "id": "F89d8069ba2b",
                "name": "Kate Cage"
            },
        ]
    });

    console.log("User can select other users to mention in the comments or grant the access rights to edit the specific sheet ranges");
};`
                events += `onRequestUsers : onRequestUsers,\n`
            }

            if ($("#events_onWarning ").is(':checked')) {
                eventsMethods += `
var onWarning = function () {
    console.log("ONLYOFFICE Document Editor reports a warning: code " + event.data.warningCode + ", description " + event.data.warningDescription);
};`
                events += `onWarning : onWarning,`
            }

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
        ${eventsMethods}

        window.docEditor = new DocsAPI.DocEditor("placeholder", Object.assign(${JSON.stringify(config, null, '\t')},
        {
            events: {
${events}
            }
        }
        ));

    &lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;`
                    );
                }
            });
        }

        function uuidv4() {
            return "apiwh" + "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
                .replace(/[xy]/g, function (c) {
                    const r = Math.random() * 16 | 0,
                        v = c == "x" ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
        }
    </script>
</asp:Content>
