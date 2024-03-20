<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">ONLYOFFICE Docs FAQ: <br />
        Co-editing questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="coediting_1">
    <dt>How to check how many connections I need?</dt>
    <dd>
        <p>The minimal number of connections you might need should be equal to the number of users who are going to use your Document Server. But you should bear in mind, that in most cases one user <span class="strikethrough">=</span> one connection, as one and the same user can open more than one document in more than one browser.</p>
        <p>So if you are sure that all your users are going to use the Document Server at one and the same time, have a surplus for the connection number equal of at least two times of your user number, otherwise the users with the lack of connections will be able to open the document in view-only mode.</p>
        <p>All the available pricing plans for the connections are available at <a target="_blank" href="https://www.onlyoffice.com/integration-edition-prices.aspx">this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="coediting_2">
    <dt>How to find the information about users who are currently editing the document?</dt>
    <dd>
        <p>You can use the API to send a POST request to the <b>document command service</b>. Use the <em>c</em> parameter for that with the <a href="<%= Url.Action("command/info") %>">info</a> value and the <em>key</em> parameter identifying the document you want to find the information about. The parameters are sent as a part of the JSON object in the request body:</p>
        <pre>{
    "c": "info",
    "key": "Khirz6zTPdfd7"
}</pre>
        <p>In case the document is being edited, for instance, by two users, the <b>document editing service</b> will inform the <b>document storage service</b> using the <a href="<%= Url.Action("callback") %>">callback handler</a> with the following information:</p>
        <pre>{
    "key": "Khirz6zTPdfd7",
    "status": 1,
    "users": ["6d5a81d0", "78e1e841"]
}</pre>
        <ul>
            <li><em>key</em> is the identifier of the document (the same as in the POST request above);</li>
            <li><em>status</em> with value of <b>1</b> means that the document is currently being edited;</li>
            <li>and the <em>users</em> is the array of the IDs of the users who take part in the co-editing.</li>
        </ul>
        <p>Further information about the response from the <b>document editing service</b> can be found <a href="<%= Url.Action("callback") %>">at this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="coediting_3">
    <dt>How to disconnect users who are currently editing the document before saving the document?</dt>
    <dd>
        <p>To force disconnecting the users from the document before it can be saved, use the API to send a POST request to the <b>document command service</b>. Use the <em>c</em> parameter for that with the <a href="<%= Url.Action("command/drop") %>">drop</a> value and the <em>key</em> parameter identifying the document and the array of the IDs of the users you want to disconnect. The parameters are sent as a part of the JSON object in the request body:</p>
        <pre>{
    "c": "drop",
    "key": "Khirz6zTPdfd7",
    "users": [ "6d5a81d0", "78e1e841" ]
}</pre>
        <p>As a result the two users with the IDs in the request above ("6d5a81d0" and "78e1e841") will be disconnected from editing the document with the <b>Khirz6zTPdfd7</b> key.</p>
        <p>Further information about the use of requests from <b>document command service</b> can be found <a href="<%= Url.Action("command") %>">at this page</a>.</p>
    </dd>
</dl>