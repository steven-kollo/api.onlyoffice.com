<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Web.Optimization" %>

<h1>
    <span class="hdr">Frequently asked questions: DocSpace</span>
</h1>

<%= Scripts.Render("~/bundles/faq") %>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>

<dl class="faq_block" id="community_1">
    <dt>What is the date/time format used in the response to the requests?</dt>
    <dd>
        <p>
            The response to the requests uses the <b>Roundtrip</b> format: 2008-04-10T06:30:00.0000000-07:00
            <br />where <em>-07:00</em> is UTC offset which is set on the portal.
        </p>
        <p>
            In case the portal uses UTC time without any offset, the date/time format in the response will be the following:
            2008-04-10T06:30:00.0000000Z.
        </p>
        <p>As for the request, only date can be send in it: 2008-04-10.</p>
        <p><b>If you use the date/time in URL request, colons must be avoided and replaced by hyphens: 2008-04-10T06-30-00.000Z.</b></p>
        <p>Please note that the UTC date and time without the offset are used in this case.</p>
    </dd>
</dl>
<dl class="faq_block" id="community_2">
    <dt>Is the response data pagination supported?</dt>
    <dd>
        <p>
            Yes. More information you can find in the <a href="<%= Url.Action("backend/filters") %>">Request filtering</a> section.
        </p>
    </dd>
</dl>
