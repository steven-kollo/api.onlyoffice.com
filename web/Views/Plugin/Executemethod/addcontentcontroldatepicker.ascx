<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("AddContentControlDatePicker", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows adding an empty content control datepicker to the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("AddContentControlDatePicker", [datePickerPr, commonPr]);
</pre>
<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col style="width: 100px;" />
        <col />
        <col style="width: 100px;" />
        <col style="width: 150px;" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>datePickerPr</td>
            <td>
                Defines the content control datepicker properties:
                <ul>
                    <li>
                        <b>DateFormat</b> - a format in which the date will be displayed. For example: <em>"MM/DD/YYYY", "dddd\,\ mmmm\ dd\,\ yyyy", "DD\ MMMM\ YYYY", "MMMM\ DD\,\ YYYY", "DD-MMM-YY", "MMMM\ YY", "MMM-YY", "MM/DD/YYYY\ hh:mm\ AM/PM", "MM/DD/YYYY\ hh:mm:ss\ AM/PM", "hh:mm", "hh:mm:ss", "hh:mm\ AM/PM", "hh:mm:ss:\ AM/PM"</em>,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "DD\ MMMM\ YYYY";
                        <br />
                    </li>
                    <li>
                        <b>Date</b> - the current date and time,
                        <br />
                        <b>type</b>: object,
                        <br />
                        <b>example</b>: Date.
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td>commonPr</td>
            <td>
                Defines the common content control properties:
                <ul>
                    <li>
                        <b>Id</b> - a unique identifier of the content control. It can be used to search for a certain content control and make reference to it in the code,
                        <br />
                        <b>type</b>: number,
                        <br />
                        <b>example</b>: 0;
                        <br />
                    </li>
                    <li>
                        <b>Tag</b> - a tag assigned to the content control. The same tag can be assigned to several content controls so that it is possible to make reference to them in your code,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "{tag}";
                        <br />
                    </li>
                    <li>
                        <b>Lock</b> - a value that defines if it is possible to delete and/or edit the content control or not,
                        <br />
                        <b>type</b>: number,
                        <br />
                        <b>example</b>: 0.
                        <br />
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>The <em>Lock</em> parameter can have the following values:</p>
<table class="table">
       <thead>
            <tr class="tablerow">
                <td>Numeric value</td>
                <td>Edit</td>
                <td>Delete</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><b>0</b></td>
                <td>No</td>
                <td>Yes</td>
            </tr>
            <tr class="tablerow">
                <td><b>1</b></td>
                <td>No</td>
                <td>No</td>
            </tr>
            <tr class="tablerow">
                <td><b>2</b></td>
                <td>Yes</td>
                <td>No</td>
            </tr>
            <tr class="tablerow">
                <td><b>3</b></td>
                <td>Yes</td>
                <td>Yes</td>
            </tr>
        </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Returns</div>

<p>The method returns the <em>undefined</em> value.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("AddContentControlDatePicker", [0, {"DateFormat" : "DD\ MMMM\ YYYY", "Date" : Date}, {"Id" : 7, "Tag" : "{tag}", "Lock" : 0}]);
</pre>