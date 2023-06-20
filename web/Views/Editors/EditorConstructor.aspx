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
                    <label for="document_permissions_modifyFilter"><input type="checkbox" id="document_modifyFilter" name="document_modifyFilter" checked />Modify Filter</label>
                    <label for="document_permissions_permissions_print"><input type="checkbox" id="document_permissions_print" name="document_permissions_print" checked />Print</label>
                    <label for="document_permissions_protect"><input type="checkbox" id="document_permissions_protect" name="document_permissions_protect" checked />Protect</label>
                    <label for="document_permissions_review"><input type="checkbox" id="document_permissions_review" name="document_permissions_review" checked />Review</label>
                </div>
            </div>
        </div>

        <div id="co-edit" class="control-panel hidden">
            <div class="line">
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

            function collect(name, value) {
                if (name && value) {
                    var names = name.split("_");

                    var prev = data;
                    for (var i = 0; i < names.length; i++) {
                        if (names.length - 1 <= i) {
                            prev[names[i]] = value;
                        } else {
                            prev[names[i]] = prev[names[i]] || {};
                        }

                        prev = prev[names[i]];
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
                collect(checkboxInput.name, checkboxInput.checked);
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
