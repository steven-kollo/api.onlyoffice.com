<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Frequently asked questions: Document Server</span>
</h1>

<h5><a href="<%= Url.Action("faq/general") %>">General questions</a></h5>
<p class="dscr">If you do not know which category below to select, simply start with this section.</p>

<h5><a href="<%= Url.Action("faq/security") %>">Security questions</a></h5>
<p class="dscr">The questions concerning Document Server security issues are in this section.</p>
