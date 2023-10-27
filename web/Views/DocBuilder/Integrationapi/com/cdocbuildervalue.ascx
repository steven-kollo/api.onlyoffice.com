<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CDocBuilderValue</span>
</h1>

<h4 class="header-gray" id="CDocBuilder">new CDocBuilderValue</h4>
<p class="dscr">Class used by <b>ONLYOFFICE Document Builder</b> for getting the results of called JS commands. It represents a wrapper for a JS object.</p>

<h2>Methods</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/call") %>">Call</a></td>
            <td>Calls the specified Document Builder method.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/clear") %>">Clear</a></td>
            <td>Clears the object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/createinstance") %>">CreateInstance</a></td>
            <td>Creates an instance of the <em>CDocBuilderValue</em> class.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/get") %>">Get</a></td>
            <td>Returns an array value by its index.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/getlength") %>">GetLength</a></td>
            <td>Returns the length if this object is an array/typed array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/getproperty") %>">GetProperty</a></td>
            <td>Returns a property of this object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isarray") %>">IsArray</a></td>
            <td>Returns true if this object is an array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isbool") %>">IsBool</a></td>
            <td>Returns true if this object is a boolean value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isdouble") %>">IsDouble</a></td>
            <td>Returns true if this object is a double value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isempty") %>">IsEmpty</a></td>
            <td>Returns true if this object is empty.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isfunction") %>">IsFunction</a></td>
            <td>Returns true if this object is a function.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isint") %>">IsInt</a></td>
            <td>Returns true if this object is an integer.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isnull") %>">IsNull</a></td>
            <td>Returns true if this object is null.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isobject") %>">IsObject</a></td>
            <td>Returns true if this object is an object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isstring") %>">IsString</a></td>
            <td>Returns true if this object is a string.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/istypedarray") %>">IsTypedArray</a></td>
            <td>Returns true if this object is a typed array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isundefined") %>">IsUndefined</a></td>
            <td>Returns true if this object is undefined.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/set") %>">Set</a></td>
            <td>Sets an array value by its index.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/setproperty") %>">SetProperty</a></td>
            <td>Sets a property to this object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/tobool") %>">ToBool</a></td>
            <td>Converts this object to a boolean value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/todouble") %>">ToDouble</a></td>
            <td>Converts this object to a double value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/toint") %>">ToInt</a></td>
            <td>Converts this object to an integer.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/tostring") %>">ToString</a></td>
            <td>Converts this object to a string.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
