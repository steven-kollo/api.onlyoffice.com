<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Frequently asked questions: Document Server</span>
</h1>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/general") %>">General questions</a></h5>
<p class="dscr">If you do not know which category below to select, simply start with this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/general") %>#general_1">I am new to Document Server API. Where should I start?</a></li>
    <li><a href="<%= Url.Action("faq/general") %>#general_2">How to find out the current version number of Document Server?</a></li>
    <li><a href="<%= Url.Action("faq/general") %>#general_3">I want to change some Document Server parameters from the default.json configuration file. How can I do that so that my changes were not lost after update?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/security") %>">Security questions</a></h5>
<p class="dscr">The questions concerning Document Server security issues are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/security") %>#security_1">How to limit access to my Document Server?</a></li>
    <li><a href="<%= Url.Action("faq/security") %>#security_2">What's the difference between sending the token in header and in body?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/sharing") %>">Sharing questions</a></h5>
<p class="dscr">The questions concerning document sharing with various permissions are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_1">How to open a document with "track changes" mode enabled?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_2">How to open a document with "commenting" mode enabled?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_3">How can the 'fillForms' parameter be used?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_4">How to enable both the editing and commenting mode for a document?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_5">Do the permission parameters influence each other?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_6">How to open the document in a viewer without the option to edit it?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_7">How to disable/enable the possibility to download the file?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_8">How to prevent a document from being printed?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_9">How to view and change sharing settings for a certain document?</a></li>
</ul>
