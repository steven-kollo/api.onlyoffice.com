<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Review</span>
</h1>

<p class="dscr">
    Let's create the <em>Review</em> component and its accompanying story file: <em>src/components/Review/Review.tsx</em> and <em>src/Review.stories.tsx</em>.
</p>

<ol>
    <li>
        <p>Create the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Review/Review.tsx" target="_blank">Review.tsx</a> file
        with the <em>Review</em> component and specify the following functions in it:</p>
        <ul>
            <li>
                <p><em>prevReview</em>:</p>
                <pre>
function prevReview() {
    connector.executeMethod("MoveToNextReviewChange", [false]);
};
</pre>
                <p>When a user of the React application clicks the <b>Prev</b> button,
                    the <a href="<%= Url.Action("executemethod/text/movetonextreviewchange", "plugin") %>">executeMethod.MoveToNextReviewChange</a> method is executed
                    with the <em>isForward</em> parameter set to <em>false</em> and navigates to the previous review change in the ONLYOFFICE editor.</p>
                <img class="screenshot max-width-130" alt="Prev button" src="<%= Url.Content("~/content/img/editor/prev-button.png") %>" />
            </li>
            <li>
                <p><em>nextReview</em>:</p>
                <pre>
function nextReview() {
    connector.executeMethod("MoveToNextReviewChange");
};
</pre>
                <p>When a user of the React application clicks the <b>Next</b> button,
                    the <a href="<%= Url.Action("executemethod/text/movetonextreviewchange", "plugin") %>">executeMethod.MoveToNextReviewChange</a> method is executed
                    and navigates to the next review change in the ONLYOFFICE editor.</p>
                <img class="screenshot max-width-130" alt="Next button" src="<%= Url.Content("~/content/img/editor/next-button.png") %>" />
            </li>
            <li>
                <p><em>acceptReview</em>:</p>
                <pre>
function acceptReview() {
    connector.executeMethod("AcceptReviewChanges");
};
</pre>
                <p>When a user of the React application clicks the <b>Accept</b> button,
                    the <a href="<%= Url.Action("executemethod/text/acceptreviewchanges", "plugin") %>">executeMethod.AcceptReviewChanges</a> method is executed
                    and accepts review changes in the ONLYOFFICE editor.</p>
                <img class="screenshot max-width-130" alt="Accept button" src="<%= Url.Content("~/content/img/editor/accept-button.png") %>" />
            </li>
            <li>
                <p><em>rejectReview</em>:</p>
                <pre>
function rejectReview() {
    connector.executeMethod("RejectReviewChanges");
};
</pre>
                <p>When a user of the React application clicks the <b>Reject</b> button,
                    the <a href="<%= Url.Action("executemethod/text/rejectreviewchanges", "plugin") %>">executeMethod.RejectReviewChanges</a> method is executed
                    and rejects review changes in the ONLYOFFICE editor.</p>
                <img class="screenshot max-width-130" alt="Reject button" src="<%= Url.Content("~/content/img/editor/reject-button.png") %>" />
            </li>
        </ul>
        <pre>
return (
    &lt;div className="reviewBlock"&gt;
        &lt;button onClick={prevReview}&gt;Prev&lt;/button&gt;
        &lt;button onClick={nextReview}&gt;Next&lt;/button&gt;
        &lt;button onClick={acceptReview}&gt;Accept&lt;/button&gt;
        &lt;button onClick={rejectReview}&gt;Reject&lt;/button&gt;
    &lt;/div&gt;
);
</pre>
        <p>The review block and button styles are defined in the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/components/Review/Review.css" target="_blank">Review.css</a> file.</p>
        <img class="screenshot max-width-400" alt="Review block" src="<%= Url.Content("~/content/img/editor/review-block.png") %>" />
    </li>
    <li>
        <p>Now that the component is ready, you can code the <a href="https://github.com/ONLYOFFICE/document-editor-react-samples/blob/master/src/Review.stories.tsx" target="_blank">Review.stories.tsx</a> file.</p>
        <ol>
            <li>
                <p>Define the default export which provides information used by other stories:</p>
                <pre>
export default {
    "title": "Samples/Work with review",
    "component": Review,
    "parameters": {},
    "decorators": [
        (Story) =&gt; (
            &lt;div style={{ "height": "400px" }}&gt;
                &lt;Story /&gt;
            &lt;/div&gt;
        ),
    ]
} as ComponentMeta&lt;typeof Review&gt;;
</pre>
            </li>
            <li>
                <p>Create the <em>ReviewTemplate</em> export. It consists of the <em>Review</em> and <em>DocumentEditor</em> components that are connected with the <em>connector</em> class:</p>
                <pre>
return(
    &lt;div&gt;
        &lt;Review connector={connector} /&gt;

        &lt;DocumentEditor {...args}
            "id"={args.id}
            "documentServerUrl"={args.documentServerUrl}
            "config"={{
                "document": {
                    "fileType": "docx",
                    "key": args.key,
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
                "documentType": "word"
            }}
            "height"="600px"
            "events_onDocumentReady"={onDocumentReady}
        /&gt;
    &lt;/div&gt;
)}
</pre>
            </li>
            <li>
                <p>Start Storybook to see the result:</p>
                <pre>
yarn storybook
</pre>
            </li>
        </ol>
        <img class="screenshot max-width-832" alt="Review template" src="<%= Url.Content("~/content/img/editor/review-template.png") %>" />
    </li>
</ol>
