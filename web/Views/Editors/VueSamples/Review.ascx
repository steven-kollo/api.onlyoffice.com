<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Review</span>
</h1>

<p class="dscr">
    Let's create the <em>Review</em> component and its accompanying story file: <em>src/components/Review/Review.vue</em> and <em>src/Review.stories.js</em>.
</p>

<ol>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Review/Review.vue" target="_blank">Review.vue</a> file
        with the <em>Review</em> component and specify the following functions in it:</p>
        <ul>
            <li>
                <p><em>prevReview</em>:</p>
                <pre>
prevReview() {
    this.connector.executeMethod("MoveToNextReviewChange", [false]);
},
</pre>
                <p>When a user of the Vue application clicks the <b>Prev</b> button,
                    the <a href="<%= Url.Action("executemethod/text/movetonextreviewchange", "plugin") %>">executeMethod.MoveToNextReviewChange</a> method is executed
                    with the <em>isForward</em> parameter set to <em>false</em> and navigates to the previous review change in the ONLYOFFICE editor.</p>
                <img class="screenshot max-width-130" alt="Prev button" src="<%= Url.Content("~/content/img/editor/vue/prev-button.png") %>" />
            </li>
            <li>
                <p><em>nextReview</em>:</p>
                <pre>
nextReview() {
    this.connector.executeMethod("MoveToNextReviewChange");
},
</pre>
                <p>When a user of the Vue application clicks the <b>Next</b> button,
                    the <a href="<%= Url.Action("executemethod/text/movetonextreviewchange", "plugin") %>">executeMethod.MoveToNextReviewChange</a> method is executed
                    and navigates to the next review change in the ONLYOFFICE editor.</p>
                <img class="screenshot max-width-130" alt="Next button" src="<%= Url.Content("~/content/img/editor/vue/next-button.png") %>" />
            </li>
            <li>
                <p><em>acceptReview</em>:</p>
                <pre>
acceptReview() {
    this.connector.executeMethod("AcceptReviewChanges");
},
</pre>
                <p>When a user of the Vue application clicks the <b>Accept</b> button,
                    the <a href="<%= Url.Action("executemethod/text/acceptreviewchanges", "plugin") %>">executeMethod.AcceptReviewChanges</a> method is executed
                    and accepts review changes in the ONLYOFFICE editor.</p>
                <img class="screenshot max-width-130" alt="Accept button" src="<%= Url.Content("~/content/img/editor/vue/accept-button.png") %>" />
            </li>
            <li>
                <p><em>rejectReview</em>:</p>
                <pre>
rejectReview() {
    this.connector.executeMethod("RejectReviewChanges");
}
</pre>
                <p>When a user of the React application clicks the <b>Reject</b> button,
                    the <a href="<%= Url.Action("executemethod/text/rejectreviewchanges", "plugin") %>">executeMethod.RejectReviewChanges</a> method is executed
                    and rejects review changes in the ONLYOFFICE editor.</p>
                <img class="screenshot max-width-130" alt="Reject button" src="<%= Url.Content("~/content/img/editor/vue/reject-button.png") %>" />
            </li>
        </ul>
        <pre>
&lt;template&gt;
  &lt;div className="reviewBlock"&gt;
    &lt;button v-on:click="prevReview"&gt;Prev&lt;/button&gt;
    &lt;button v-on:click="nextReview"&gt;Next&lt;/button&gt;
    &lt;button v-on:click="acceptReview"&gt;Accept&lt;/button&gt;
    &lt;button v-on:click="rejectReview"&gt;Reject&lt;/button&gt;
  &lt;/div&gt;
&lt;/template&gt;
</pre>
        <p>The review block and button styles are also defined in the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/components/Review/Review.vue#L33" target="_blank">Review.vue</a> file.</p>
        <img class="screenshot max-width-400" alt="Review block" src="<%= Url.Content("~/content/img/editor/vue/review-block.png") %>" />
    </li>
    <li>
        <p>Now that the component is ready, you can code the <a href="https://github.com/ONLYOFFICE/document-editor-vue-samples/blob/master/src/Review.stories.js" target="_blank">Review.stories.js</a> file.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
  "title": "Samples/Work with review",
  "component": Review,
  "decorators": [() =&gt; ({ "template": "&lt;div style = 'height: 400px;'&gt;&lt;story/&gt;&lt;/div&gt;" })],
  "parameters": {
    "docs": false,
  }
};
</pre>
            </li>
            <li>
                <p>Create the <em>ReviewTemplate</em> export. It consists of the <em>Review</em> and <em>DocumentEditor</em> components that are connected with the <em>connector</em> class:</p>
                <pre>
const Template = (args) =&lt; ({
  "components": { Review, DocumentEditor },
  data() {
    return {
      "documentServerUrl": args.documentServerUrl,
      "editorId": args.editorId,
      "config": {
        "document": {
          "fileType": "docx",
          "key": "docx" + Math.random(),
          "title": "demo.docx",
          "url": config.demoStorage + "review.docx",
          "permissions": {
            "edit": false,
            "review": true
          }
        },
        "editorConfig": {
          "mode": "edit"
        },
        "documentType": "word",
        "height": "600px"
      },
      "connector": null
    };
  },
  "methods": {
    onDocumentReady() {
      var editor = window.DocEditor.instances[this.editorId];
      var connector = editor.createConnector();

      this.connector = connector;
    }
  },
  "template": '&lt;Review :connector="connector"  /&gt; &lt;DocumentEditor :id="editorId" :config="config" :documentServerUrl="documentServerUrl" :events_onDocumentReady="onDocumentReady" /&gt;',
});
</pre>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
            </li>
        </ol>
        <img class="screenshot max-width-832" alt="Review template" src="<%= Url.Content("~/content/img/editor/vue/review-template.png") %>" />
    </li>
</ol>
