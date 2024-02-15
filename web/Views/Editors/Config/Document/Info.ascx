<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("config/document") %>"></a>
    <span class="hdr">文档信息</span>
</h1>

<div class="header-gray">描述</div>
<p class="dscr">文档信息部分允许更改文档的其他参数（文档所有者、存储文档的文件夹、上传日期、共享设置）。</p>

<div class="header-gray">Example</div>
<div>
    <div id="controlFields">
        <div id="info" class="control-panel">
            <div class="line input_line" style="margin-top: 0px;">
                <label for="documentConfig_info_folder">Folder</label>
                <input type="text" id="documentConfig_info_folder" name="documentConfig_info_folder" value="Example Files">
            </div>
            <div class="line input_line">
                <label for="documentConfig_info_owner">Owner</label>
                <input type="text" id="documentConfig_info_owner" name="documentConfig_info_owner" value="John Smith">
            </div>
            <div class="line input_line">
                <label for="documentConfig_info_uploaded">Uploaded</label>
                <input type="text" id="documentConfig_info_uploaded" name="documentConfig_info_uploaded" value="2010-07-07 3:46 PM">
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="documentConfig_info_favorite" name="documentConfig_info_favorite" hidden="hidden" checked>
                    <span></span>
                    <label for="documentConfig_info_favorite">Favorite</label>
                </label>
            </div>
            <div class="config_object_holder">
                <div id="holder_documentConfig_info_favorite" class="config_nested_group">
                    <div class="line input_line">
                        <select class="select" id="documentConfig_info_favorite_bool" name="documentConfig_info_favorite_bool">
                            <option value=0 disabled>False</option>
                            <option value=0 selected>False</option>
                            <option value=1>True</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="documentConfig_info_sharingSettings" name="documentConfig_info_sharingSettings" hidden="hidden" checked>
                    <span></span>
                    <label for="documentConfig_info_sharingSettings">Sharing Settings</label>
                </label>
            </div>
            <div id="holder_documentConfig_info_sharingSettings" class="config_object_holder">
                <div id="holder_documentConfig_info_sharingSettings_0" class="documentConfig_info_sharingSettingsItem config_nested_group">
                    <div class="line input_line">
                        <label for="documentConfig_info_sharingSettings_permissions_0">Permissions</label>
                        <select class="select" id="documentConfig_info_sharingSettings_permissions_0" name="documentConfig_info_sharingSettings_permissions_0">
                            <option value="Full Access" disabled>Full Access</option>
                            <option value="Full Access" selected>Full Access</option>
                            <option value="Read Only">Read Only</option>
                            <option value="Deny Access">Deny Access</option>
                        </select>
                    </div>
                    <div class="line input_line">
                        <label for="documentConfig_info_sharingSettings_user_0">User</label>
                        <input type="text" id="documentConfig_info_sharingSettings_user_0" name="documentConfig_info_sharingSettings_user_0" value="John Smith">
                    </div>
                    <div class="line">
                        <label class="dataItemSpan">
                            <input type="checkbox" id="documentConfig_info_sharingSettings_isLink_0" name="documentConfig_info_sharingSettings_isLink_0" hidden="hidden">
                            <span></span>
                            <label for="documentConfig_info_sharingSettings_isLink_0">Is link</label>
                        </label>
                    </div>
                </div> 
            </div>
            <div style="padding-left: 24px;">
                <button id="addButton_info_sharingSettings" class="add-button">+</button>
            </div>
        </div>
    </div>
    <div id="configPreHolder">
        <pre id="configPre"></pre>
    </div>
</div>
<div id="editorSpace">
    <div id="placeholder"></div>
</div>

<div class="header-gray">参数</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>名称</td>
            <td>描述</td>
            <td>类型</td>
            <td>示例</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="author" class="copy-link">author</td>
            <td>
                定义文档作者/创建者的名称。
                自 5.4 版起已弃用，请改用 <a href="#owner">owner</a>。
            </td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr class="tablerow">
            <td id="created" class="copy-link">created</td>
            <td>
                定义文档创建日期。
                自 5.4 版起已弃用，请改用 <a href="#uploaded">uploaded</a>。
            </td>
            <td>string</td>
            <td>"2010-07-07 3:46 PM"</td>
        </tr>
        <tr>
            <td id="favorite" class="copy-link">favorite</td>
            <td>
                定义 <em>收藏</em> 图标的高亮状态。
                当用户单击图标时，将调用 <a href="<%= Url.Action("config/events") %>#onMetaChange">onMetaChange</a> 事件。
                如果参数 <em>未定义</em>，则 <em>收藏</em> 图标不会显示在编辑器窗口标题处。
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/favorite.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="folder" class="copy-link">folder</td>
            <td>定义存储文档的文件夹（如果文档存储在根文件夹中，则可以为空）。</td>
            <td>string</td>
            <td>"Example Files"</td>
        </tr>
        <tr class="tablerow">
            <td id="owner" class="copy-link">owner</td>
            <td>定义文档所有者/创建者的名称。</td>
            <td>string</td>
            <td>"John Smith"</td>
        </tr>
        <tr>
            <td id="sharingSettings" class="copy-link">sharingSettings</td>
            <td>显示有关允许与其他用户共享文档的设置的信息：
                <ul>
                    <li>
                        <b>isLink</b> - 将用户图标更改为链接图标，
                        <br />
                        <b>类型</b>：boolean，
                        <br />
                        <b>示例</b>：false；
                    </li>
                    <li>
                        <b>permissions</b> - 具有上述名称的用户的访问权限。
                        可以是 <b>完全访问</b>、 <b>只读</b> 或 <b>拒绝访问</b>,
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>：完全访问；
                    </li>
                    <li>
                        <b>user</b> - 文档将与之共享的用户的名称，
                        <br />
                        <b>类型</b>：string，
                        <br />
                        <b>示例</b>："John Smith"。
                    </li>
                </ul>
            </td>
            <td>object数组</td>
            <td>[
    {
        "permissions": "Full Access",
        "user": "John Smith"
    }
]</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/sharing_settings.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="uploaded" class="copy-link">uploaded</td>
            <td>定义文档上传日期。</td>
            <td>string</td>
            <td>"2010-07-07 3:46 PM"</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/info.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<script>
    function buildSelects(id) {
        $('.select').each(function () {
            const item = $(this);
            if (id != null && item[0].id.toString().includes(id)) {
                buildSelect(item);
            } 
        });
    }
    function buildSelect(item, isNew) {
        _this = item;
        if (isNew) {
            _this = $('.select')[1];
        }
        selectOption = _this.find('option'),
            selectOptionLength = selectOption.length,
            selectedOption = selectOption.filter(':selected'),
            duration = 120;

        _this.hide();
        _this.wrap('<div class="select"></div>');
        $('<div>', {
            class: 'new-select',
            text: _this.children('option:disabled').text()
        }).insertAfter(_this);

        const selectHead = _this.next('.new-select');
        $('<div>', {
            class: 'new-select__list'
        }).insertAfter(selectHead);

        const selectList = selectHead.next('.new-select__list');
        for (let i = 1; i < selectOptionLength; i++) {
            $('<div>', {
                class: 'new-select__item',
                html: $('<span>', {
                    text: selectOption.eq(i).text()
                })
            })
                .attr('data-value', selectOption.eq(i).val())
                .appendTo(selectList);
        }

        const selectItem = selectList.find('.new-select__item');
        selectList.slideUp(0);
        selectHead.on('click', function () {
            if (!$(this).hasClass('on')) {
                $(this).addClass('on');
                selectList.slideDown(duration);
                selectItem.on('click', function () {
                    let chooseItem = $(this).data('value');
                    $('select').val(chooseItem).attr('selected', 'selected');
                    selectHead.text($(this).find('span').text());
                    selectList.slideUp(duration);
                    selectHead.removeClass('on');
                    updateConfig();
                });
                window.addEventListener('click', function (e) {
                    if (e.target != selectList[0] && e.target != selectHead[0] && e.target != selectItem[0]) {
                        selectHead.removeClass('on');
                        selectList.slideUp(duration);
                    }
                });
            } else {
                $(this).removeClass('on');
                selectList.slideUp(duration);
            }
        });
    }
    $('.select').each(function () {
        const item = $(this);
        buildSelect(item);
    });
</script>
<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
<script type="text/javascript">

    // Editor window
    var config = <%= Config.Serialize(
    new Config {
        Document = new Config.DocumentConfig
            {
                FileType = "docx",
                Key = "apiwh" + Guid.NewGuid(),
                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                Title = "Example Title",
                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "docx",
                Info = new Config.DocumentConfig.InfoConfig()
            },
        DocumentType = "word",
        EditorConfig = new Config.EditorConfigConfiguration
            {
                CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                    {
                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                            {
                                Request = false
                            },
                        Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                            {
                                Visible = true
                            },
                        IntegrationMode = "embed",
                }
            },
        Height = "550px",
        Width = "100%"
    }) %>;
    window.docEditor = new DocsAPI.DocEditor("placeholder", config);
</script>

<script>
    $(document).ready(function () {
        resizeCodeInput();
        updateConfig();
    });

    $("#controlFields").find("input,select").change(function () {
        updateConfig();
    });

    $('#addButton_info_sharingSettings').click(addSharingSettingItem);
    $("#documentConfig_info_sharingSettings").change(showHideConfigObject);
    $("#documentConfig_info_favorite").change(showHideConfigObject);

    function showHideConfigObject(e) {
        var hidden = document.getElementById(`holder_${e.target.id}`).hidden;
        document.getElementById(`holder_${e.target.id}`).hidden = !hidden;
        resizeCodeInput();
    }

    function addSharingSettingItem() {
        var sharingSettingElements = document.getElementsByClassName("documentConfig_info_sharingSettingsItem");
        var i = 0;
        while (sharingSettingElements[i] != undefined) {
            i++;
        }
        let div = document.createElement("div");
        div.innerHTML = `
        <div id="holder_documentConfig_info_sharingSettings_${i}" class="documentConfig_info_sharingSettingsItem config_nested_group">
            <div class="line input_line">
                <label for="documentConfig_info_sharingSettings_permissions_${i}">Permissions</label>
                <select class="select" id="documentConfig_info_sharingSettings_permissions_${i}" name="documentConfig_info_sharingSettings_permissions_${i}">
                    <option value="Read Only" disabled>Read Only</option>    
                    <option value="Full Access">Full Access</option>
                    <option value="Read Only" selected>Read Only</option>
                    <option value="Deny Access">Deny Access</option>
                </select>
            </div>
            <div class="line input_line">
                <label for="documentConfig_info_sharingSettings_user_${i}">User</label>
                <input type="text" id="documentConfig_info_sharingSettings_user_${i}" name="documentConfig_info_sharingSettings_user_${i}" value="New user ${i}">
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="documentConfig_info_sharingSettings_isLink_${i}" name="documentConfig_info_sharingSettings_isLink_${i}" hidden="hidden">
                    <span></span>
                    <label for="documentConfig_info_sharingSettings_isLink_${i}">Is link</label>
                </label>
            </div>
        </div>`;
        document.getElementById("holder_documentConfig_info_sharingSettings").appendChild(div);
        buildSelects(i);
        $("#controlFields").find("input,select").change(function () {
            updateConfig();
        });
        resizeCodeInput();
        updateConfig();
    }

    function getSharingSettings() {
        if (!getFieldValue("documentConfig_info_sharingSettings")) {
            return "";
        }
        var sharingSettingsString = "";
        var sharingSettingElements = document.getElementsByClassName("documentConfig_info_sharingSettingsItem");
        var i = 0;
        while (sharingSettingElements[i] != undefined) {
            var isLink = !getFieldValue("documentConfig_info_sharingSettings_isLink_" + i) ? "" : `,
                    "isLink": ${true}`;
        
            var string = `
                {
                    "permissions": ${getFieldValue("documentConfig_info_sharingSettings_permissions_" + i)},
                    "user": ${getFieldValue("documentConfig_info_sharingSettings_user_" + i)}${isLink}
                }`;
            sharingSettingsString += sharingSettingsString == "" ? string : "," + string;
            i++;
        }
        return sharingSettingsString == "" ? "" : `"sharingSettings": [${sharingSettingsString}
            ],
            `;
    }

    function updateConfig() {
        var sharingSettings = "";
        if (getFieldValue("documentConfig_info_sharingSettings")) {
            sharingSettings = getSharingSettings();
            document.getElementById("addButton_info_sharingSettings").hidden = false;
        } else {
            document.getElementById("addButton_info_sharingSettings").hidden = true;
        }
        var favorite = () => {
            if (getFieldValue("documentConfig_info_favorite")) {
                var value = getFieldValue("documentConfig_info_favorite_bool") == `"True"` ? true : false;
                return `
            "favorite": ${value},`;
            }
            return "";
        };

        var info = `{${favorite()}
            "folder": ${getFieldValue("documentConfig_info_folder")},
            "owner": ${getFieldValue("documentConfig_info_owner")},
            ${sharingSettings}"uploaded": ${getFieldValue("documentConfig_info_uploaded")}     
        }`;
        var config_string =
            `var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "info": ${info}
        ,
        ...
    },
    ...
});
`;
        var info_object = JSON.parse(info);
        config.document.info = info_object;
        window.docEditor.destroyEditor();
        window.docEditor = new DocsAPI.DocEditor("placeholder", config);

        var pre = document.getElementById("configPre");
        pre.innerHTML = config_string;
        hljs.highlightBlock(pre);
    }

    function getFieldValue(id) {
        var element = document.getElementById(id);
        if (document.getElementById(id).parentElement.className == "select") {
            return `"${document.getElementById(id).parentElement.children[1].innerText}"`;
        } else if (element.type == "checkbox") {
            return element.checked;
        } else if (`${element.value}` == ``) {
            return `""`;
        } else if (isNaN(element.value)) {
            return `"${element.value}"`;
        } else {
            return Number(element.value);
        }
    }

    function resizeCodeInput() {
        var paddingTop = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingTop.split("px")[0]);
        var paddingBottom = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingBottom.split("px")[0]);
        var borderSize = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).border.split("px")[0]);
        var controlFieldsHeight = Math.round(document.getElementById("controlFields").getBoundingClientRect().height * 100) / 100;

        var offset = paddingTop + paddingBottom + (borderSize * 2);
        var height = controlFieldsHeight - offset;

        document.getElementById("configPre").style.height = `${height}px`;
    }
</script>