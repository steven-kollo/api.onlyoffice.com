<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("interactingoutside/") %>"></a>
    <span class="hdr">处理评论</span>
</h1>

<p class="dscr">从文档中收集所有评论，并将其显示在自定义界面中。</p>

<div id="commentsBlock" name="commentsBlock" data-easy="true" class="docbuilder-script" spellcheck="false" hidden>
    <div id="comment" class="comment">
        <div class="comment-author" title="作者"></div>
        <div class="comment-date" title="日期"></div>
        <div class="comment-message" title="消息"></div>
    </div>
    <div id="replies"></div>
    <textarea id="addReplyArea" name="addReplyArea" class="add-reply-area" placeholder="Enter your reply here" hidden></textarea>
    <div id="empty-comment" hidden>文档中没有评论。</div>
</div>

<textarea id="addCommentArea" name="addCommentArea" class="add-comment-area" placeholder="Enter your comment here" hidden></textarea>

<ul class="list-buttons doc-builder-list-buttons">
    <li>
        <a id="addReply" class="button disabled">添加回复</a>
    </li>
    <li>
        <a id="deleteComment" class="button disabled">删除</a>
    </li>
    <li>
        <a id="addComment" class="button disabled">添加评论</a>
    </li>
    <li>
        <a id="prevComment" class="button disabled"><</a>
    </li>
    <li>
        <a id="nextComment" class="button disabled">></a>
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
        <p>当用户打开文档时，会执行 <a href="<%= Url.Action("executemethod/text/getallcomments", "plugin") %>">GetAllComments</a> 方法来收集文档中的所有评论，
        并将其显示在自定义界面中。
        将显示以下评论数据：评论作者、发布评论的时间、评论文本和评论回复：</p>
        <pre>
var comments = [];

var onDocumentReady = function () {
    window.connector = docEditor.createConnector();

    ...

    connector.executeMethod("GetAllComments", null, function (data) {
        comments = data;
    });

    ...

}
</pre>
    </li>
    <li>
        <p>当用户单击自定义界面中的 <b>添加评论</b> 按钮时，将执行 <a href="<%= Url.Action("executemethod/text/addcomment", "plugin") %>">AddComment</a>
        方法向文档添加新评论。调用此方法后，会触发 <a href="<%= Url.Action("events/onaddcomment", "plugin") %>">onAddComment</a> 事件，
        将新评论添加到包含所有文档评论的数组中：</p>
        <pre>
var onDocumentReady = function () {

    ...

    connector.attachEvent("onAddComment", function (val) {
        var index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

        if (index == -1) {
            comments = [val, ...comments];
        }
    });

    ...
}

...

$("#addComment").on("click", function () {

    ...

    var comment = $("#addCommentArea").val();

    if (Boolean(comment)) {
        var currentdate = Date.now();
        var datetime = "" + currentdate;

        connector.executeMethod("AddComment", [{ 
                Text: comment, 
                UserName: "John Smith", 
                Time: datetime 
            }]
        );
    }

    ...

});
</pre>
    </li>
    <li>
        <p>当用户单击自定义界面中的 <b>删除评论</b> 按钮时，将执行 <a href="<%= Url.Action("executemethod/text/removecomments", "plugin") %>">RemoveComments</a>
        方法从文档中删除评论。调用此方法后，将触发 <a href="<%= Url.Action("events/onremovecomment", "plugin") %>">onRemoveComment</a> 事件，
        以从包含所有文档评论的数组中删除评论：</p>
        <pre>
var onDocumentReady = function () {

    ...

    connector.attachEvent("onRemoveComment", function (val) {
        const index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

        if (index !== -1) {
            comments.splice(index, 1);
        }

        ...

    });

    ...
}

$("#deleteComment").on("click", function () {

    ...

    connector.executeMethod("RemoveComments", [[comments[indexComment]["Id"]]]);

    ...

});
</pre>
    </li>
    <li>
        <p>当用户单击自定义界面中的箭头按钮时，将执行<a href="<%= Url.Action("executemethod/text/movetocomment", "plugin") %>">MoveToComment</a>
        方法在文档中的评论之间移动：</p>
        <pre>

...

connector.executeMethod("MoveToComment", [comments[indexComment]["Id"]]);

...

</pre>
    </li>
    <li>
    <p>当用户单击自定义界面中的 <b>添加回复</b> 按钮时，将执行 <a href="<%= Url.Action("executemethod/text/changecomment", "plugin") %>">ChangeComment</a> 方法，
        通过更改 <em>CommentData</em> 对象向现有评论添加回复。调用此方法后，会触发 <a href="<%= Url.Action("events/onchangecommentdata", "plugin") %>">onChangeCommentData</a> 事件，
        将新的评论回复添加到包含所有文档评论的数组中：</p>
        <pre>
var onDocumentReady = function () {

    ...

    connector.attachEvent("onChangeCommentData", function (val) {
        const index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

        if (index !== -1) {
            comments[index]["Data"] = val["Data"];
        }
    });

    ...

}

$("#addReply").on("click", function () {

    ...

    var reply = $("#addReplyArea").val();

    if (Boolean(reply)) {
        var currentdate = Date.now();
        var datetime = "" + currentdate;

        comments[indexComment]["Data"]["Replies"].push({
            Text: reply
            Time: datetime,
            UserName: "John Smith"
        });

        connector.executeMethod(
            "ChangeComment", 
            [comments[indexComment]["Id"],
            comments[indexComment]["Data"]]
        );
    }

    ...

});
</pre>
    </li>
</ol>
<note>
    <p>Please note that the connector is available only for <b>ONLYOFFICE Developer Edition</b>.</p>
    <p>This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <a href="mailto:sales@onlyoffice.com" target="_blank">sales@onlyoffice.com</a>.</p>
</note>

<script type="text/javascript">
    var comments = [];
    var indexComment = 0;

    var config = <%= Config.Serialize(
        new Config
            {
                Document = new Config.DocumentConfig
                    {
                        FileType = "docx",
                        Key = "apiwh" + Guid.NewGuid(),
                        Permissions = new Config.DocumentConfig.PermissionsConfig(),
                        Title = "Example Title.docx",
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "withcomments.docx"
                    },
                DocumentType = "word",
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

        connector.executeMethod("GetAllComments", null, function (data) {
            comments = data;
            renderComment();
        });

        connector.attachEvent("onAddComment", function (val) {
            var index = comments.findIndex((comment) => comment["Id"] === val["Id"])

            if (index == -1) {
                comments = [val, ...comments];
            }

            indexComment = 0;
            renderComment();
        });

        connector.attachEvent("onRemoveComment", function (val) {
            const index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

            if (index !== -1) {
                comments.splice(index, 1);
            }

            if (indexComment >= comments.length && indexComment != 0) indexComment--;

            renderComment();
        });

            connector.attachEvent("onChangeCommentData", function (val) {
            const index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

            if (index !== -1) {
                indexComment = index;
                comments[index]["Data"] = val["Data"];
                renderComment();
            }
        });
    };

    config.events = {
        onDocumentReady: onDocumentReady,
    };

    window.docEditor = new DocsAPI.DocEditor("placeholder", config);

    var renderComment = function () {
        var comment = $("#comment");
        var replies = $("#replies");

        replies.empty();

        if (comments.length == 0) {
            $("#comment div").html("");
            $(".list-buttons a").addClass("disabled");
            $("#addComment").removeClass("disabled");
            $("#comment").hide();
            $("#empty-comment").show();
        } else {
            $("#commentsBlock").show();
            $("#comment").show();
            $("#empty-comment").hide();
            $(".list-buttons a").removeClass("disabled");

            postСomment(
                comment,
                comments[indexComment]["Data"]["UserName"],
                comments[indexComment]["Data"]["Time"],
                comments[indexComment]["Data"]["Text"]
            );

            connector.executeMethod("MoveToComment", [comments[indexComment]["Id"]]);

            for (const element of comments[indexComment]["Data"]["Replies"]) {
                var reply = comment.clone().removeAttr('id').addClass("reply");

                postСomment(
                    reply,
                    element["UserName"],
                    element["Time"],
                    element["Text"]
                )

                replies.append(reply);
            }
        }
    };

    var postСomment = function (parrent, userName, time, text) {
        var author = parrent.find(".comment-author");
        var date = parrent.find(".comment-date");
        var message = parrent.find(".comment-message");

        author.text(author.attr("title") + ": " + userName);
        date.text(date.attr("title") + ": " + new Date(parseInt(time, 10)).toLocaleString());
        message.text(message.attr("title") + ": " + text);
    };

    $("#addReply").on("click", function () {
        if ($(this).hasClass("disabled")) { return; }

        if ($(this).hasClass("active")) {
            var reply = $("#addReplyArea").val();

            if (Boolean(reply)) {
                var currentdate = Date.now();
                var datetime = "" + currentdate;

                comments[indexComment]["Data"]["Replies"].push({ Text: reply, Time: datetime, UserName: "John Smith" });

                connector.executeMethod("ChangeComment", [comments[indexComment]["Id"], comments[indexComment]["Data"]]);
                $("#addReplyArea").val("");
            }

            $(this).removeClass("active");
            $("#addReplyArea").hide();
        } else {
            $(this).addClass("active");
            $("#addReplyArea").show();
        }
    });

    $("#addComment").on("click", function () {
        if ($(this).hasClass("active")) {
            var comment = $("#addCommentArea").val();

            if (Boolean(comment)) {
                var currentdate = Date.now();
                var datetime = "" + currentdate;

                connector.executeMethod("AddComment", [{ Text: comment, UserName: "John Smith", Time: datetime }]);
                $("#addCommentArea").val("");
            }

            $(this).removeClass("active");
            $("#commentsBlock").show();
            $("#addCommentArea").hide();
            $(".list-buttons a").removeClass("disabled");
        } else {
            $(this).addClass("active");

            $("#commentsBlock").hide();
            $("#addReplyArea").hide();
            $("#addCommentArea").show();

            $(".list-buttons a").addClass("disabled");

            $("#addReply").removeClass("active");
            $(this).removeClass("disabled");
        }
    });

    $("#deleteComment").on("click", function () {
        if ($(this).hasClass("disabled")) { return; }

        connector.executeMethod("RemoveComments", [[comments[indexComment]["Id"]]]);
        renderComment();
    });

    $("#nextComment").on("click", function () {
        if ($(this).hasClass("disabled")) { return; }

        if (indexComment < comments.length - 1) indexComment++;
        renderComment();
    });

    $("#prevComment").on("click", function () {
        if ($(this).hasClass("disabled")) { return; }

        if (indexComment > 0) {
            indexComment--;
        }

        renderComment();
    });
</script>
