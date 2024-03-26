<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Comments</span>
</h1>

<p class="dscr">
    Let's create the <em>Comments</em> component and its accompanying story file: <em>src/components/Comments/Comments.tsx</em> and <em>src/Comments.stories.tsx</em>.
    This component is composite, i.e. it is based on other components. All the <em>Comments</em> components are placed in the <em>src/components/Comments</em> folder.
</p>

<ol>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Comments/AddComment.tsx" target="_blank">AddComment.tsx</a> file
        with the <em>AddComment</em> component and specify the <em>addComment</em> function in it:</p>
        <pre>
function addComment () {
    if (Boolean (comment)) {
        var currentdate = Date.now ();
        var datetime = "" + currentdate;

        connector.executeMethod ("AddComment", [{"Text": comment, "UserName": userName, "Time": datetime}]);

        setComment("");
    }
}
</pre>
        <p>Specify the component HTML structure by adding the <b>Enter your comment:</b> field and the <b>Send</b> button:</p>
        <pre>
return (
    &lt;div style={{ "textAlign": "right" }}&gt;
        &lt;span style={{ "display": "block", "textAlign": "left" }}&gt;Enter your comment:&lt;/span&gt;
        &lt;textarea value={comment} onChange={ function(event) {
            setComment(event.target.value);
        }}&gt;&lt;/textarea&gt;

        &lt;button onClick={addComment}&gt;Send&lt;/button&gt;
    &lt;/div&gt;
);
</pre>
        <p>When a user of the React application types a comment in the <b>Enter your comment:</b> field and clicks the <b>Send</b> button,
        the <a href="<%= Url.Action("executemethod/text/addcomment", "plugin") %>">executeMethod.AddComment</a> method is executed
        and sends this comment to the ONLYOFFICE editor.</p>
        <img class="screenshot max-width-300" alt="Add comment component" src="<%= Url.Content("~/content/img/editor/add-comment-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Comments/AddCommentReply.tsx" target="_blank">AddCommentReply.tsx</a> file
        with the <em>AddCommentReply</em> component and specify the <em>addReply</em> function in it:</p>
        <pre>
function addReply () {
    if (Boolean(reply)) {
      var currentdate = Date.now();
      var datetime = "" + currentdate;

      comment["Data"]["Replies"].push({ "Text": reply, "Time": datetime, "UserName": userName });

      connector.executeMethod("ChangeComment", [comment["Id"], comment["Data"]]);

      setReply("");
      setDisplayAddReply(false);
    }
}
</pre>
        <p>Specify the component HTML structure by adding a field for the comment reply with the <b>Add</b> and <b>Cancel</b> buttons and the <b>Add reply</b> button:</p>
        <pre>
return (
    displayAddReply
    ?
        &lt;div&gt;
            &lt;textarea style={{ "width": "270px", "marginRight": "8px" }} value={reply} onChange={ function(event) {
                setReply(event.target.value);
            }} &gt;&lt;/textarea&gt;
            &lt;button onClick={addReply}&gt;Add&lt;/button&gt;
            &lt;button onClick={ function(event) { setDisplayAddReply(false) } }&gt;Cancel&lt;/button&gt;
        &lt;/div&gt;
    :
        &lt;button onClick={ function(event) { setDisplayAddReply(true) } }&gt;Add reply&lt;/button&gt;
);
</pre>
        <ul>
            <li>When a user of the React application clicks the <b>Add reply</b> button, the <em>setDisplayAddReply</em> function is executed with the <em>true</em> value
            allowing the users to enter a comment reply.</li>
            <li>When the user types the comment reply in this field and clicks the <b>Add</b> button,
            the <a href="<%= Url.Action("executemethod/text/changecomment", "plugin") %>">executeMethod.ChangeComment</a> method is executed
            and adds the comment reply to the ONLYOFFICE editor.</li>
            <li>When the user clicks the <b>Cancel</b> button, the <em>setDisplayAddReply</em> function is executed with the <em>false</em> value and closes the comment reply field.</li>
        </ul>
        <div class="img-block-2">
            <div>
                <img class="screenshot" alt="Add reply component" src="<%= Url.Content("~/content/img/editor/add-reply-component.png") %>" />
            </div>
            <div>
                <img class="screenshot max-width-260" alt="Add and cancel button" src="<%= Url.Content("~/content/img/editor/add-and-cancel-buttons.png") %>" />
            </div>
        </div>
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Comments/RemoveComment.tsx" target="_blank">RemoveComment.tsx</a> file
        with the <em>RemoveComment</em> component and specify the <em>removeComment</em> function in it:</p>
        <pre>
function removeComment () {
    connector.executeMethod("RemoveComments", [[commentId]]);
}
</pre>
        <p>Specify the component HTML structure by adding a red cross near the comment:</p>
        <pre>
return (
    &lt;div className="comment-del-div"&gt;
        &lt;span className="comment-del" onClick={removeComment}&gt;&lt;/span&gt;
    &lt;/div&gt;
);
</pre>
        <p>The red cross button is specified in the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Comments/Comments.css" target="_blank">Comments.css</a> file
        with the <em>comment-del-div</em> and <em>comment-del</em> classes:</p>
        <pre>
.comment-del-div {
  position: absolute;
  margin-top: 3px;
  margin-right: 5px;
  right: 0;
}

.comment-del {
  display: inline-flex;
  width: 1rem;
  height: 1rem;
  position: relative;
  cursor: pointer;
}

.comment-del::before,
.comment-del::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 1rem;
  height: .1rem;
  background-color: #f00;
  margin: -.05rem 0 0 -.4rem;
  transform: rotate(-45deg);
  border-radius: .1rem;
}

.comment-del::after {
  transform: rotate(45deg);
}
</pre>
        <p>When a user of your React application clicks the red cross near the comment,
        the <a href="<%= Url.Action("executemethod/text/removecomments", "plugin") %>">executeMethod.RemoveComments</a> method is executed
        and removes the comment from the ONLYOFFICE editor.</p>
        <img class="screenshot max-width-300" alt="Remove comment component" src="<%= Url.Content("~/content/img/editor/remove-comment-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Comments/RemoveCommentReply.tsx" target="_blank">RemoveCommentReply.tsx</a> file
        with the <em>RemoveCommentReply</em> component and specify the <em>RemoveReply</em> function in it:</p>
        <pre>
function RemoveReply () {
    let commentData = comment["Data"];
    commentData["Replies"].splice(replyId, 1);

    connector.executeMethod("ChangeComment", [comment["Id"], commentData]);
}
</pre>
        <p>Specify the component HTML structure by adding a red cross near the comment reply:</p>
        <pre>
return (
    &lt;div className="comment-del-div"&gt;
      &lt;span className="comment-del" onClick={RemoveReply}&gt;&lt;/span&gt;
    &lt;/div&gt;
);
</pre>
        <p>When a user of your React application clicks the red cross near the comment reply,
        the <a href="<%= Url.Action("executemethod/text/changecomment", "plugin") %>">executeMethod.ChangeComment</a> method is executed
        and removes the comment reply from the ONLYOFFICE editor.</p>
        <img class="screenshot max-width-300" alt="Remove reply component" src="<%= Url.Content("~/content/img/editor/remove-reply-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Comments/ListComments.tsx" target="_blank">ListComments.tsx</a> file
        with the <em>ListComments</em> component. This component implements a list of all the comments from the document which can be used to navigate through them.</p>
        <p>In this composite component, you need to import the components created earlier:</p>
        <pre>
import AddCommentReply from "./AddCommentReply";
import RemoveComment from "./RemoveComment";
import RemoveCommentReply from "./RemoveCommentReply";
</pre>
        <p>Then specify the <em>GoToComment</em> function in it:</p>
        <pre>
function GoToComment (e: any) {
    if (e.target.parentElement.id) {
        connector.executeMethod("MoveToComment",[e.target.parentElement.id]);
    }
}
</pre>
        <p>Specify the component HTML structure by adding a separate block for each comment with the comment information (author, date, message, and replies)
        and buttons for adding or removing comment replies:</p>
        <pre>
return (
    &lt;div&gt;
        {comments && comments.map((comment) =&gt;
            &lt;div className="comment-div" key={comment["Id"]}&gt;
                &lt;RemoveComment connector={connector} commentId={comment["Id"]}/&gt;
                &lt;div id={comment["Id"]} onClick={GoToComment}&gt;
                    &lt;span className="comment-span"&gt;Author: {comment["Data"]["UserName"]}&lt;/span&gt;
                    &lt;span className="comment-span"&gt;Date: {new Date(parseInt(comment["Data"]["Time"], 10)).toLocaleString()}&lt;/span&gt;
                    &lt;span className="comment-span"&gt;Message: {comment["Data"]["Text"]}&lt;/span&gt;
                &lt;/div&gt;
                &lt;div className="comment-replies"&gt;
                    {comment["Data"]["Replies"].map((reply: any, index: any) =&gt;
                        &lt;div key={index} style={{ "marginBottom": "10px" }}&gt;
                            &lt;RemoveCommentReply connector={connector} comment={comment} replyId={index} /&gt;
                            &lt;span className="comment-span"&gt;Author: {reply["UserName"]}&lt;/span&gt;
                            &lt;span className="comment-span"&gt;Date: {new Date(parseInt(reply["Time"], 10)).toLocaleString()}&lt;/span&gt;
                            &lt;span className="comment-span"&gt;Message: {reply["Text"]}&lt;/span&gt;
                        &lt;/div&gt;
                    )}
                &lt;/div&gt;
                &lt;AddCommentReply connector={connector} userName={userName} comment={comment} /&gt;
            &lt;/div&gt;
        )}
    &lt;/div&gt;
);
</pre>
        <p>If the document contains any comments, they are dispalyed as a list.</p>
        <p>When a user clicks on the comment block, the <a href="<%= Url.Action("executemethod/text/movetocomment", "plugin") %>">executeMethod.MoveToComment</a> method is executed
        and moves the cursor to the corresponding comment.</p>
        <img class="screenshot max-width-260" alt="List comments component" src="<%= Url.Content("~/content/img/editor/list-comments-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Comments/Comments.tsx" target="_blank">Comments.tsx</a> file
        with the <em>Comments</em> component which connects all the comment components created earlier:</p>
        <pre>
import "./Comments.css";
import AddComment from "./AddComment";
import ListComments from "./ListComments";
</pre>
        <p>The following events are added to this component with the <a href="<%= Url.Action("connector") %>#attachEvent">attachEvent</a> method:</p>
        <ul>
            <li>
                <p><a href="<%= Url.Action("events/onaddcomment", "plugin") %>">onAddComments</a> - adds a comment to the list of comments when it is added to the document:</p>
                <pre>
connector.attachEvent("onAddComment",  function (comment:any) {
    console.log("onAddComment");
    setComments([comment, ...comments]);
});
</pre>
            </li>
            <li>
                <p><a href="<%= Url.Action("events/onremovecomment", "plugin") %>">onRemoveComment</a> - removes a comment from the list of comments when it is removed from the document:</p>
                <pre>
connector.attachEvent("onRemoveComment",  function (val:any) {
    let copyComments = [...comments];
    const index = copyComments.findIndex(comment =&gt; comment.Id === val.Id);

    if (index !== -1) {
        copyComments.splice(index, 1);
        setComments(copyComments);
    }
});
</pre>
            </li>
            <li>
                <p><a href="<%= Url.Action("events/onchangecommentdata", "plugin") %>">onChangeCommentData</a> - changes the comment data (adds or removes comment replies) in the list of comments when it is changed in the document:</p>
                <pre>
connector.attachEvent("onChangeCommentData",  function (val:any) {
    let copyComments = [...comments];
    const index = copyComments.findIndex(comment =&gt; comment.Id === val.Id);
    copyComments[index].Data = val.Data;
    setComments(copyComments);
});
</pre>
            </li>
        </ul>
        <p>Specify the component HTML structure by adding the <em>AddComment</em> and <em>ListComments</em> components:</p>
        <pre>
return (
    &lt;div id="blockComments"&gt;
        &lt;h3 style={{ "textAlign": "left" }}&gt;Comments&lt;/h3&gt;
        &lt;AddComment connector={connector} userName={userName}/&gt;
        &lt;ListComments connector={connector} userName={userName} comments={comments} /&gt;
    &lt;/div&gt;
);
</pre>
        <img class="screenshot max-width-260" alt="Comments component" src="<%= Url.Content("~/content/img/editor/comments-component.png") %>" />
    </li>
    <li>
        <p>Now that all the components are ready, you can code the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/Comments.stories.tsx" target="_blank">Comments.stories.tsx</a> file.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
    "title": "Samples/Work with comments",
    "component": Comments,
    "parameters": {},
    "decorators": [
        (Story) =&gt; (
            &lt;div style={{ "height": "400px" }}&gt;
                &lt;Story /&gt;
            &lt;/div&gt;
        ),
    ]
} as ComponentMeta&lt;typeof Comments&gt;;
</pre>
            </li>
            <li>
                <p>Create the <em>CommentsTemplate</em> export. It consists of the <em>Comments</em> and <em>DocumentEditor</em> components that are connected with the <em>connector</em> class:</p>
                <pre>
return(
    &lt;div&gt;
        &lt;Comments {...args.comment} userName={args.comment.userName} comments={comments} setComments={setComments} connector={connector} /&gt;
        &lt;DocumentEditor {...args.editor}
            "id"="docxForComments"
            "documentServerUrl"={args.editor.documentServerUrl}
            "config"={{
                "document": {
                    "fileType": "docx",
                    "key": args.editor.key,
                    "title": "demo.docx",
                    "url": config.demoStorage + "withcomments.docx",
                },
                "documentType": "word",
                "editorConfig": {
                    "mode": "edit",
                    "user": {
                        "name": "John Smith",
                    },
                },
            }}
            "height"="600px"
            "width"="70%"
            "events_onDocumentReady"={onDocumentReady}
        /&gt;
    &lt;/div&gt;
)
</pre>
                <p>When the document is loaded into the document editor, the <a href="<%= Url.Action("executemethod/text/getallcomments", "plugin") %>">executeMethod.GetAllComments</a>
                method is executed, collects all the comments from the current document, and displays them in the comment block:</p>
                <pre>
const onDocumentReady = () =&gt; {
    var editor = window.DocEditor.instances["docxForComments"];
    var connector = editor.createConnector();

    connector.executeMethod("GetAllComments", null, function(comments: any) {
      let commentsRevers = [];
      for (var i = 0; i &lt; comments.length; i++){
        commentsRevers[i] = comments[(comments.length - 1) - i];
      }
      setComments(commentsRevers);
    });

    setConnector(connector);
};
</pre>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
            </li>
        </ol>
        <img class="screenshot max-width-832" alt="Comments template" src="<%= Url.Content("~/content/img/editor/comments-template.png") %>" />
    </li>
</ol>
