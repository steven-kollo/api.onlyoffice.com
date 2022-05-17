<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("AddContentControlList", [args], callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows adding an empty content control list to the document.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("AddContentControlList", [type, List, commonPr]);
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
            <td>type</td>
            <td>A numeric value that specifies the content control type. It can have one of the following values: <b>1</b> (comboBox) or <b>0</b> (drop-down list).</td>
            <td>number</td>
            <td>0</td>
        </tr>
        <tr class="tablerow">
            <td>List</td>
            <td>
                A list of the content control elements that consists of two items:
                <ul>
                    <li>
                        <b>Display</b> - an item that will be displayed to the user in the content control list,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Item1_D";
                        <br />
                    </li>
                    <li>
                        <b>Value</b> - a value of each item from the content control list,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Item1_V".
                        <br />
                    </li>
                </ul>
            </td>
            <td>array of objects</td>
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
window.Asc.plugin.executeMethod ("AddContentControlList", [0, [{Display: "Item1_D", Value: "Item1_V"}, {Display: "Item2_D", Value: "Item2_V"}], {"Id" : 7, "Tag" : "{tag}", "Lock" : 0}]);
</pre>