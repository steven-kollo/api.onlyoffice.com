﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("interactingoutside/") %>"></a>
    <span class="hdr">填写表单</span>
</h1>

<p class="dscr">填充表单中的空单元格。</p>
<p>用户可以从列表中选择用户名，表单编辑器中的所有字段都将填充用户联系信息。
同时，这些数据显示在自定义界面的输入框中。</p>
<p>当用户在自定义界面中编辑输入数据时，它也会在表单编辑器中自动更新。</p>
<p>文档准备好后，可以通过单击<b>提交</b>按钮来提交表单数据。</p>

<select id="persons" name="persons" required disabled>
    <option disabled selected value="">选择示例</option>
    <% var persons = Persons.GetPersons();
    foreach (var person in persons)
    { %>
        <option value="<%= person.PostalCode %>"><%= person.FirstName %> <%= person.LastName %></option>
    <% } %>
</select>

<div id="controlsBlock" name="controlsBlock" class="docbuilder-script" hidden>
    <div class="left-half"></div>
    <div class="right-half"></div>
</div>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>

<br/ >
<h1>它是如何运作的</h1>

<ol>
    <li>
        <p>当用户打开表单文档时，将执行 <a href="<%= Url.Action("executemethod/text/getallcontentcontrols", "plugin") %>">GetAllContentControls</a>
        方法以从文档中收集所有内容控件。之后，执行 <a href="<%= Url.Action("executemethod/form/getformvalue", "plugin") %>">GetFormValue</a>
        方法来获取内容控件的值，并将其显示在自定义界面中：</p>
        <pre>
var contentControls = [];

var onDocumentReady = function () {
    window.connector = docEditor.createConnector();

    connector.executeMethod("GetAllContentControls", null, function (data) {
            ]setTimeout(function () {
                for (let i = 0; i< data.length; i++) {

                ...

                connector.executeMethod("GetFormValue", [data[i]["InternalId"]], function (value) {
                    data[i].Value = value ? value : "";
                    if (data.length - 1 == i) {
                        contentControls = data;

                        ...
                    }
                });
            }
        }, 0);
    });
};
</pre>
    </li>
    <li>
        <p>当用户从列表中选择用户名时，将执行 <a href="<%= Url.Action("executemethod/form/getformsbytag", "plugin") %>">GetFormsByTag</a> 方法，
        通过其标签收集所有表单，并使用 <a href="<%= Url.Action("executemethod/form/setformvalue", "plugin") %>">SetFormValue</a> 方法为其设置相应的值：</p>
        <pre>
$("#persons").change(function (e) {
    const postalCode = $(this).val();

    $.getJSON("<%= Url.Content("~/app_data/editor/wildcarddata/persons.json") %>", function (persons) {
        for (const person of persons) {
            if (person["PostalCode"] == postalCode) {
                for (key in person) {
                    var value = person[key];

                    ...

                    setFormValue(key, value);
                }
            }
        }
    })

    var setFormValue = function (tag, value) {
        connector.executeMethod(
            "GetFormsByTag",
            [tag],
            function (forms) {
                connector.executeMethod(
                    "SetFormValue",
                    [forms[0]["InternalId"], value],
                    null
                );
            }
        );
    }
});
</pre>
    </li>
    <li>
        <p>当用户编辑表单值时，会触发 <a href="<%= Url.Action("events/onchangecontentcontrol", "plugin") %>">onChangeContentControl</a> 事件，
        然后执行 <a href="<%= Url.Action("executemethod/form/getformvalue", "plugin") %>">GetFormValue</a>
        方法以获取更新的表单值并将其显示在自定义界面中：</p>
        <pre>
var onDocumentReady = function () {

    ...

    connector.attachEvent("onChangeContentControl", onChangeContentControl);

    ...

};

function onChangeContentControl(e) {
    connector.executeMethod("GetFormValue", [e["InternalId"]], function (value) {

        ...

        $("#" + e["InternalId"]).val(value || "");

        ...
    });
}
</pre>
    </li>
</ol>
<note>
    <p>请注意，该连接器仅适用于 <b>ONLYOFFICE 开发者版本</b>。</p>
    <p>此类是一项附加功能，需要额外付费。 如果您有任何疑问，请通过 <a href="mailto:sales@onlyoffice.com" target="_blank">sales@onlyoffice.com</a> 联系我们的销售团队。</p>
</note>

<script type="text/javascript">
    var contentControls = [];
    var indexComment = 0;

    var config = <%= Config.Serialize(
        new Config
            {
                Document = new Config.DocumentConfig
                    {
                        FileType = "pdf",
                        Key = "apiwh" + Guid.NewGuid(),
                        Permissions = new Config.DocumentConfig.PermissionsConfig(),
                        Title = "Demo.pdf",
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "withtags.pdf"
                    },
                DocumentType = "pdf",
                EditorConfig = new Config.EditorConfigConfiguration
                    {
                        CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                        Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                            {
                                HideRightMenu = true,
                                HideRulers = true,
                                IntegrationMode = "embed",
                            },
                        Lang = "zh"
                    },
                Height = "550px",
                Width = "100%"
            }) %>;

    var onDocumentReady = function () {
        window.connector = docEditor.createConnector();

        connector.executeMethod("GetAllContentControls", null, function (data) {
            setTimeout(function () { // 没有setTimeout，第一次执行循环时，返回内容控件数组
                for (let i = 0; i < data.length; i++) {
                    switch (data[i].Tag) {
                        case "Male":
                            data[i].GroupKey = "Sex";
                            data[i].Type = "radio";
                            break;
                        case "Female":
                            data[i].GroupKey = "Sex";
                            data[i].Type = "radio";
                            break;
                        default:
                            data[i].Type = "input";
                    }

                    connector.executeMethod("GetFormValue", [data[i]["InternalId"]], function (value) {
                        data[i].Value = value ? value : "";
                        if (data.length - 1 == i) {
                            contentControls = preparingArrayContentControls(data);

                            renderForm();
                        }
                    });
                }
            }, 0);
        });

        connector.attachEvent("onChangeContentControl", onChangeContentControl);
    };

    config.events = {
        onDocumentReady: onDocumentReady,
    };

    window.docEditor = new DocsAPI.DocEditor("placeholder", config);

    $("#persons").change(function (e) {
        const postalCode = $(this).val();

        $.getJSON("<%= Url.Content("~/app_data/editor/wildcarddata/persons.json") %>", function (persons) {
            for (const person of persons) {
                if (person["PostalCode"] == postalCode) {
                    for (key in person) {
                        var value = person[key];

                        if (key == "Sex") {
                            key = value == "Male" ? "Male" : "Female";
                            value = "true";
                        }

                        setFormValue(key, value);
                    }
                }
            }
        })

        var setFormValue = function (tag, value) {
            connector.executeMethod(
                "GetFormsByTag",
                [tag],
                function (forms) {
                    connector.executeMethod(
                        "SetFormValue",
                        [forms[0]["InternalId"], value],
                        null
                    );
                }
            );
        }
    });

    var renderForm = function () {
        var controlsBlockLeftHalf = $("#controlsBlock .left-half");
        var controlsBlockRightHalf = $("#controlsBlock .right-half");

        if (contentControls.length != 0) {
            $("#controlsBlock").removeAttr("hidden");
            $("#persons").removeAttr("disabled"); 
            $(".list-buttons a").removeClass("disabled");
        }

        for (const element of contentControls) {
            var targetElement = controlsBlockLeftHalf;

            if ((contentControls.indexOf(element) % 2) != 0) { targetElement = controlsBlockRightHalf };

            switch (element.Type) {
                case "input":
                    targetElement.append($("<label>", {
                        "text": element["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2")
                    })).append($("<input>", {
                        "id": element["InternalId"],
                        "value": element["Value"],
                        "class": "content-control-input"
                    }));
                    break;
                case "radio":
                    targetElement.append($("<label>", {
                        "text": element["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2")
                    }));

                    for (const option of element["Value"]) {
                        targetElement.append($("<input>", {
                            "id": option["InternalId"],
                            "type": "radio",
                            "checked": option["checked"] == true,
                            "name": element["Tag"],
                            "class": "content-control-radio"
                        })).append($("<label>", {
                            "text": option["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2"),
                            "for": option["Tag"],
                            "class": "label-radio"
                        }));
                    }
            }
            
        }

        $(".content-control-input").keyup(updateContent);
        $(".content-control-radio").change(updateContent);
    };

    function updateContent(e) {
        var id = e.target.id;
        var value = e.target.value;

        if (e.target.classList.contains("content-control-radio")) {
            value = true;
        }

        connector.executeMethod(
            "SetFormValue",
            [id, value],
            null
        );
    };

    function onChangeContentControl(e) {
        connector.executeMethod("GetFormValue", [e["InternalId"]], function (value) {
            if ($("#" + e["InternalId"]).hasClass("content-control-radio")) {
                $("#" + e["InternalId"]).prop("checked", value);
            } else {
                $("#" + e["InternalId"]).val(value || "");
            }
        });
    }

    function preparingArrayContentControls(data) {
        data = data.filter(function (element) {
            return element["Tag"] != "";
        });

        let groupsRadioControls = data.filter(contentControl => contentControl["Tag"] != "" && contentControl["Type"] == "radio").reduce((r, a) => {
            r[a["GroupKey"]] = r[a["GroupKey"]] || [];
            r[a["GroupKey"]].push({ Tag: a["Tag"], checked: a["Value"], InternalId: a["InternalId"] });
            return r;
        }, {});

        for (const [key, value] of Object.entries(groupsRadioControls)) {
            let index = [];
            let first = true;

            for (var i = 0; i < data.length; i++) {
                if (data[i]["GroupKey"] && data[i]["GroupKey"] == key) {
                    index.push(i);
                }
            }

            for (var i = 0; i < index.length; i++) {
                if (first) {
                    data[index[i]]["Tag"] = key;
                    data[index[i]]["Value"] = value;
                    first = false;
                } else {
                    data.splice(index[i], 1);
                }
            }
        }

        return data;
    };
</script>