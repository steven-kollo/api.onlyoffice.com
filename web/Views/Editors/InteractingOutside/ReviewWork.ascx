<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("interactingoutside/") %>"></a>
    <span class="hdr">处理评审更改</span>
</h1>

<p class="dscr">管理外部评审过程。</p>

<ul class="list-buttons doc-builder-list-buttons">
    <li>
        <a id="accept" class="button disabled">接受</a>
    </li>
    <li>
        <a id="reject" class="button disabled">拒绝</a>
    </li>
    <li>
        <a id="prev" class="button disabled"><</a>
    </li>
    <li>
        <a id="next" class="button disabled">></a>
    </li>
</ul>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>

<br/ >
<h1>它是如何工作的</h1>

<ol>
    <li>
        <p>当用户单击自定义界面中的 <b>接受/拒绝</b> 按钮时，
        将执行 <a href="<%= Url.Action("executemethod/text/acceptreviewchanges", "plugin") %>">AcceptReviewChanges</a> / <a href="<%= Url.Action("executemethod/text/rejectreviewchanges", "plugin") %>">RejectReviewChanges</a>
        方法来接受/拒绝编辑器中的选定更改：</p>
        <pre>
$("#accept").on("click", function () {
    connector.executeMethod("AcceptReviewChanges");
});

$("#reject").on("click", function () {
    connector.executeMethod("RejectReviewChanges");
});
</pre>
    </li>
    <li>
        <p>当用户单击自定义界面中的箭头按钮时，将执行 <a href="<%= Url.Action("executemethod/text/movetonextreviewchange", "plugin") %>">MoveToNextReviewChange</a>
        方法，在下一次和上一次审阅更改之间移动：</p>
        <pre>
$("#prev").on("click", function () {
    connector.executeMethod("MoveToNextReviewChange", [false]);
});

$("#next").on("click", function () {
    connector.executeMethod("MoveToNextReviewChange");
});
</pre>
    </li>
</ol>

<h1>获得帮助</h1>

<p>如果您有任何问题，请在 <a href="https://forum.onlyoffice.com/c/document-api/39" target="_blank">ONLYOFFICE论坛</a> 上询问我们的开发人员（需要注册）。</p>

<script type="text/javascript">
    var contentControls = [];
    var indexComment = 0;

    var config = <%= Config.Serialize(
        new Config
            {
                Document = new Config.DocumentConfig
                    {
                        FileType = "docx",
                        Key = "apiwh" + Guid.NewGuid(),
                        Permissions = new Config.DocumentConfig.PermissionsConfig
                        {
                                Edit = false,
                                Review = true
                        },
                        Title = "Demo.docx",
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "review.docx"
                    },
                DocumentType = "word",
                EditorConfig = new Config.EditorConfigConfiguration
                    {
                        Mode = "edit",
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

        $(".list-buttons a").removeClass("disabled");
    };

    config.events = {
        onDocumentReady: onDocumentReady,
    };

    window.docEditor = new DocsAPI.DocEditor("placeholder", config);

    $("#accept").on("click", function () {
        connector.executeMethod("AcceptReviewChanges");
    });

    $("#reject").on("click", function () {
        connector.executeMethod("RejectReviewChanges");
    });

    $("#prev").on("click", function () {
        connector.executeMethod("MoveToNextReviewChange", [false]);
    });

    $("#next").on("click", function () {
        connector.executeMethod("MoveToNextReviewChange");
    });
</script>
