<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Comments</span>
</h1>

<p class="dscr">
    Let's create the <em>Comments</em> component and its accompanying story file: <em>src/components/Comments/Comments.vue</em> and <em>src/Comments.stories.js</em>.
    This component is composite, i.e. it is based on other components. All the <em>Comments</em> components are placed in the <em>src/components/Comments</em> folder.
</p>

<ol>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Comments/AddComment.vue" target="_blank">AddComment.vue</a> file
        with the <em>AddComment</em> component and specify the <em>addComment</em> function in it:</p>
        <pre>
addComment () {
    if(Boolean(this.comment)) {
        var currentdate = Date.now(); 
        var datetime = "" + currentdate;

        this.connector.executeMethod("AddComment", [{ "Text": this.comment, "UserName": this.userName, "Time": datetime }]);
        this.comment = "";
    }
}
</pre>
        <p>Specify the component <em>&lt;template&gt;</em> by adding the <b>Enter your comment:</b> field and the <b>Send</b> button:</p>
        <pre>
&lt;template&gt;
  &lt;div style="text-align: right;"&gt;
    &lt;span style="display: block; text-align: left;"&gt;Enter your comment:&lt;/span&gt;
    &lt;textarea v-model="comment"&gt;&lt;/textarea&gt;

    &lt;button v-on:click="addComment()"&gt;Send&lt;/button&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>When a user of the Vue application types a comment in the <b>Enter your comment:</b> field and clicks the <b>Send</b> button,
        the <a href="<%= Url.Action("executemethod/text/addcomment", "plugin") %>">executeMethod.AddComment</a> method is executed
        and sends this comment to the ONLYOFFICE editor.</p>
        <img class="screenshot max-width-300" alt="Add comment component" src="<%= Url.Content("~/content/img/editor/vue/add-comment-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Comments/AddCommentReply.vue" target="_blank">AddCommentReply.vue</a> file
        with the <em>AddCommentReply</em> component and specify the <em>addCommentReply</em> function in it:</p>
        <pre>
addCommentReply () {
    if (Boolean(this.reply)) {
        var currentdate = Date.now(); 
        var datetime = "" + currentdate;

        this.comment["Data"]["Replies"].push({ "Text": this.reply, "Time": datetime, "UserName": this.userName });

        this.connector.executeMethod("ChangeComment", [this.comment["Id"], this.comment["Data"]]);
        this.reply = "";
        this.displayAddReply = false;
    }
}
</pre>
        <p>Specify the component <em>&lt;template&gt;</em> by adding a field for the comment reply with the <b>Add</b> and <b>Cancel</b> buttons and the <b>Add reply</b> button:</p>
        <pre>
&lt;template&gt;
    &lt;div v-if="displayAddReply"&gt;
      &lt;textarea style="width:270px; margin-right: 8px;" v-model="reply"&gt;&lt;/textarea&gt;
      &lt;button v-on:click="addCommentReply()"&gt;Add&lt;/button&gt;
      &lt;button v-on:click="displayAddReply = false; reply = ''"&gt;Cancel&lt;/button&gt;
    &lt;/div&gt;
    &lt;button v-else v-on:click="displayAddReply = true"&gt;Add reply&lt;/button&gt;
&lt;/template&gt;
</pre>
        <ul>
            <li>When a user of the Vue application clicks the <b>Add reply</b> button, the <em>displayAddReply</em> function is executed with the <em>true</em> value
            and opens a field to enter a comment reply.</li>
            <li>When the user types the comment reply in this field and clicks the <b>Add</b> button,
            the <a href="<%= Url.Action("executemethod/text/changecomment", "plugin") %>">executeMethod.ChangeComment</a> method is executed
            and adds the comment reply to the ONLYOFFICE editor.</li>
            <li>When the user clicks the <b>Cancel</b> button, the <em>displayAddReply</em> function is executed with the <em>false</em> value and closes the comment reply field.</li>
        </ul>
        <div class="img-block-2">
            <div>
                <img class="screenshot" alt="Add reply component" src="<%= Url.Content("~/content/img/editor/vue/add-reply-component.png") %>" />
            </div>
            <div>
                <img class="screenshot max-width-260" alt="Add and cancel button" src="<%= Url.Content("~/content/img/editor/vue/add-and-cancel-buttons.png") %>" />
            </div>
        </div>
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Comments/RemoveComment.vue" target="_blank">RemoveComment.vue</a> file
        with the <em>RemoveComment</em> component and specify the <em>removeComment</em> function in it:</p>
        <pre>
removeComment() {
    this.connector.executeMethod("RemoveComments", [[this.commentId]]);
}
</pre>
        <p>Specify the component <em>&lt;template&gt;</em> by adding a red cross near the comment:</p>
        <pre>
&lt;template&gt;
  &lt;div className="comment-del-div"&gt;
    &lt;span className="comment-del" v-on:click="removeComment()"&gt;&lt;/span&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>The red cross button is specified in the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Comments/Comments.vue#L56" target="_blank">Comments.vue</a> file
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
        <p>When a user of your Vue application clicks the red cross near the comment,
        the <a href="<%= Url.Action("executemethod/text/removecomments", "plugin") %>">executeMethod.RemoveComments</a> method is executed
        and removes the comment from the ONLYOFFICE editor.</p>
        <img class="screenshot max-width-300" alt="Remove comment component" src="<%= Url.Content("~/content/img/editor/vue/remove-comment-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Comments/RemoveCommentReply.vue" target="_blank">RemoveCommentReply.vue</a> file
        with the <em>RemoveCommentReply</em> component and specify the <em>removeCommentReply</em> function in it:</p>
        <pre>
removeCommentReply() {
    let commentData = this.comment["Data"];
    commentData["Replies"].splice(this.replyId, 1);

    this.connector.executeMethod("ChangeComment", [this.comment["Id"], commentData]);
}
</pre>
        <p>Specify the component <em>&lt;template&gt;</em> by adding a red cross near the comment reply:</p>
        <pre>
&lt;template&gt;
  &lt;div className="comment-del-div"&gt;
    &lt;span className="comment-del" v-on:click="removeCommentReply()"&gt;&lt;/span&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>When a user of your Vue application clicks the red cross near the comment reply,
        the <a href="<%= Url.Action("executemethod/text/changecomment", "plugin") %>">executeMethod.ChangeComment</a> method is executed
        and removes the comment reply from the ONLYOFFICE editor.</p>
        <img class="screenshot max-width-300" alt="Remove reply component" src="<%= Url.Content("~/content/img/editor/vue/remove-reply-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Comments/ListComments.vue" target="_blank">ListComments.vue</a> file
        with the <em>ListComments</em> component. This component implements a list of all the comments from the document which can be used to navigate through them.</p>
        <p>In this composite component, you need to import the components created earlier:</p>
        <pre>
import RemoveComment from './RemoveComment.vue';
import AddCommentReply from './AddCommentReply.vue';
import RemoveCommentReply from './RemoveCommentReply.vue';
</pre>
        <p>Then specify the <em>goToComment</em> function in it:</p>
        <pre>
goToComment(e: any) {
    if (e.target.parentElement.id) {
        this.connector.executeMethod("MoveToComment", [e.target.parentElement.id]);
    }
}
</pre>
        <p>Specify the component <em>&lt;template&gt;</em> by adding a separate block for each comment with the comment information (author, date, message, and replies)
        and buttons for adding or removing comment replies:</p>
        <pre>
&lt;template&gt;
  &lt;div v-for="comment of comments"&gt;
    &lt;div className="comment-div"&gt;
      &lt;RemoveComment :connector="connector" :commentId="comment['Id']" /&gt;
      &lt;div :id="comment['Id']" v-on:click="goToComment"&gt;
        &lt;span className="comment-span"&gt;Author: {{ comment["Data"]["UserName"] }}&lt;/span&gt;
        &lt;span className="comment-span"&gt;Date: {{ new Date(parseInt(comment["Data"]["Time"], 10)).toLocaleString() }} &lt;/span&gt;
        &lt;span className="comment-span"&gt;Message: {{ comment["Data"]["Text"] }} &lt;/span&gt;
      &lt;/div&gt;
      &lt;div className="comment-replies"&gt;
        &lt;div v-for="reply, index of comment["Data"]["Replies"]" style="margin-bottom: 10px"&gt;
          &lt;RemoveCommentReply :connector="connector" :comment="comment" :replyId="index" /&gt;
          &lt;span className="comment-span"&gt;Author: {{ reply["UserName"] }}&lt;/span&gt;
          &lt;span className="comment-span"&gt;Date: {{ new Date(parseInt(reply["Time"], 10)).toLocaleString() }}&lt;/span&gt;
          &lt;span className="comment-span"&gt;Message: {{ reply["Text"] }}&lt;/span&gt;
        &lt;/div&gt;
      &lt;/div&gt;
      &lt;AddCommentReply :connector="connector" :userName="userName" :comment="comment" /&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>If the document contains any comments, they are dispalyed as a list.</p>
        <p>When a user clicks on the comment block, the <a href="<%= Url.Action("executemethod/text/movetocomment", "plugin") %>">executeMethod.MoveToComment</a> method is executed
        and moves the cursor to the corresponding comment.</p>
        <img class="screenshot max-width-260" alt="List comments component" src="<%= Url.Content("~/content/img/editor/vue/list-comments-component.png") %>" />
    </li>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Comments/Comments.vue" target="_blank">Comments.vue</a> file
        with the <em>Comments</em> component which connects all the comment components created earlier:</p>
        <pre>
import ListComments from './ListComments.vue';
import AddComment from './AddComment.vue';
</pre>
        <p>Specify the component <em>&lt;template&gt;</em> by adding the <em>AddComment</em> and <em>ListComments</em> components:</p>
        <pre>
&lt;template&gt;
  &lt;div id="blockComments"&gt;
    &lt;h3&gt;Comments&lt;/h3&gt;
    &lt;AddComment :connector="connector" :userName="userName" /&gt;
    &lt;ListComments :connector="connector" :comments="comments" :userName="userName" /&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>The following events are added to this component with the <a href="<%= Url.Action("connector") %>#attachEvent">attachEvent</a> method:</p>
        <ul>
            <li>
                <p><a href="<%= Url.Action("events/onaddcomment", "plugin") %>">onAddComments</a> - adds a comment to the list of comments when it is added to the document:</p>
                <pre>
this.connector.attachEvent("onAddComment",  function (val:any) {
    var comments = this.comments;
    var index = this.comments.findIndex((comment:any) =&gt; comment.Id === val.Id)

    if (index == -1) {
        comments.unshift(val);
    }
}.bind(this));
</pre>
            </li>
            <li>
                <p><a href="<%= Url.Action("events/onremovecomment", "plugin") %>">onRemoveComment</a> - removes a comment from the list of comments when it is removed from the document:</p>
                <pre>
this.connector.attachEvent("onRemoveComment",  function (val:any) {
    console.log("onRemoveComment");
    const index = this.comments.findIndex((comment:any) =&gt; comment.Id === val.Id);

    if (index !== -1) {
        this.comments.splice(index, 1);
    }
}.bind(this));
</pre>
            </li>
            <li>
                <p><a href="<%= Url.Action("events/onchangecommentdata", "plugin") %>">onChangeCommentData</a> - changes the comment data (adds or removes comment replies):</p>
                <pre>
this.connector.attachEvent("onChangeCommentData",  function (val:any) {
    const index = this.comments.findIndex((comment:any) =&gt; comment.Id === val.Id);

    if (index !== -1) {
        this.comments[index].Data = val.Data;
    }
}.bind(this));
</pre>
            </li>
        </ul>
        <img class="screenshot max-width-260" alt="Comments component" src="<%= Url.Content("~/content/img/editor/vue/comments-component.png") %>" />
    </li>
    <li>
        <p>Now that all the components are ready, you can code the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/Comments.stories.js" target="_blank">Comments.stories.js</a> file.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
    "title": "Samples/Work with comments",
    "component": Comments,
    "decorators": [() =&gt; ({ "template": "&lt;div style = 'height: 400px;'&gt;&lt;story/&gt;&lt;/div&gt;" })],
    "parameters": {
        "docs": false,
    }
};
</pre>
            </li>
            <li>
                <p>Create the <em>CommentsTemplate</em> export. It consists of the <em>Comments</em> and <em>DocumentEditor</em> components that are connected with the <em>connector</em> class:</p>
                <pre>
const Template = (args) =&gt; ({
  "components": { Comments, DocumentEditor },
  data() {
    return {
      "documentServerUrl": args.documentServerUrl,
      "editorId": args.editorId,
      "userName": args.userName,
      "config": {
        "document": {
          "fileType": "docx",
          "key": "docx" + Math.random(),
          "title": "demo.docx",
          "url": config.demoStorage + "withcomments.docx",
        },
        "documentType": "word",
        "editorConfig": {
          "mode": "edit",
          "user": {
              "name": args.userName,
          },
        },
        "width": "70%",
        "height": "600px"
      },
      "comments": [],
      "connector": null
    };
  },
  "methods": {
    onDocumentReady() {
      var editor = window.DocEditor.instances[this.editorId];
      var connector = editor.createConnector();

      connector.executeMethod("GetAllComments", null, function(comments) {
        let commentsRevers = [];
        for (var i = 0; i &lt; comments.length; i++){
          commentsRevers[i] = comments[(comments.length - 1) - i];
        }
        this.comments = commentsRevers;
      }.bind(this));

      this.connector = connector;
    }
  },
  "template": '&lt;Comments :userName="userName" :comments="comments" :connector="connector"  /&gt; &lt;DocumentEditor :id="editorId" :config="config" :documentServerUrl="documentServerUrl" :events_onDocumentReady="onDocumentReady" /&gt;',
});
</pre>
                <p>When the document is loaded into the document editor, the <a href="<%= Url.Action("executemethod/text/getallcomments", "plugin") %>">executeMethod.GetAllComments</a>
                method is executed, collects all the comments from the current document, and displays them in the comment block:</p>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
            </li>
        </ol>
        <img class="screenshot max-width-832" alt="Comments template" src="<%= Url.Content("~/content/img/editor/vue/comments-template.png") %>" />
    </li>
</ol>
