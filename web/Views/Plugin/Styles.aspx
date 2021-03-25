<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Plugin styles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Plugin styles</span>
    </h1>

    <p class="dscr">
        ONLYOFFICE provides a style sheet for different interface elements. 
        To adjust your plugin interface to the ONLYOFFICE style, connect the <a href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css" target="_blank">plugin.css</a> 
        to the <a href="<%= Url.Action("indexhtml") %>">index.html</a> file with the following link:
    </p>
    <pre>
&lt;link rel="stylesheet" href="https://onlyoffice.github.io/sdkjs-plugins/v1/plugins.css"&gt;
</pre>

    <p>
        All the available controls are displayed within the <b>Controls example</b> plugin:
    </p>
    <img alt="Controls example" src="<%= Url.Content("~/content/img/plugins/controls.png") %>" />

    <br />
    <p><b>Buttons</b></p>

    <ol>
        <li>
            <p>Use the <em>btn-text-default</em> class to add <b>Button 1</b> to your plugin:</p>
            <pre>
&lt;button class="btn-text-default" style="width:75px;"&gt;Button 1&lt;/button&gt;
</pre>
            <p>This class has the following parameters:</p>
            <pre>
.btn-text-default {
    background: #fff;
    border: 1px solid #cfcfcf;
    border-radius: 2px;
    color: #444444;
    font-size: 11px;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    height: 22px;
    cursor: pointer;
}
</pre>
        <img alt="Button 1" src="<%= Url.Content("~/content/img/plugins/button1.png") %>" />
        </li>
        <li>
            <p>Use the <em>btn-text-default.submit.primary</em> class to add <b>Button 2</b> to your plugin:</p>
            <pre>
&lt;button class="btn-text-default submit primary" style="width:75px;"&gt;Button 2&lt;/button&gt;
</pre>
            <p>This class has the following parameters:</p>
            <pre>
.btn-text-default.submit.primary {
    color: #fff;
    background-color: #7d858c;
}
</pre>
        <img alt="Button 2" src="<%= Url.Content("~/content/img/plugins/button2.png") %>" />
        </li>
        <li>
            <p>Use the <em>btn-text-default.submit</em> class to add <b>Button 3</b> to your plugin:</p>
            <pre>
&lt;button class="btn-text-default submit" style="width:75px;"&gt;Button 3&lt;/button&gt;
</pre>
            <p>This class has the following parameters:</p>
            <pre>
.btn-text-default.submit {
    font-weight: bold;
    background-color: #d8dadc;
    border: 1px solid transparent;
}               
</pre>
        <img alt="Button 3" src="<%= Url.Content("~/content/img/plugins/button3.png") %>" />

        <note>The button color is chosen by the developer. The darker the button, the more important it is. 
            As a rule, the button of the <em>btn-text-default.submit.primary</em> class is used to confirm the action and send the result (for example, the <b>Ok</b> button).</note>
        
        </li>
        <li>
            <p>Use the <em>btn-edit</em> class to add <img alt="Edit button" src="<%= Url.Content("~/content/img/plugins/editbutton.png") %>" /> <b>Edit button</b> to your plugin:</p>
            <pre>
&lt;label class="for-combo"&gt;Edit button&lt;/label&gt;&lt;div class="btn-edit" style="display: inline-block; margin-left: 10px;"&gt;&lt;/div&gt;
</pre>
            <p>This class has the following parameters:</p>
            <pre>
.btn-edit {
    width: 13px;
    height: 13px;
    cursor: pointer;
    background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA0AAAANCAYAAABy6+R8AAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAGZSURBVHgBfZI/y4FRGMavx7+SRQaTTQab74CVlBKL/FukDGQhEgsDNh/Apiw+gcXm70DJoEikKMUk7vec8/Yi75O7Tj2d+/4913Wuc6Tz+UyQqev1itvtBr1e/6+nkgP2+z0qlYr4DgaDsNls36HtdotisYhoNAqLxYJyuSz230HFO7DZbISC0+lEp9OBRqNBLpdDq9XCeDx+DfIz8TWZTIhZodFoRMvlknw+H8XjcdrtdrRarYgpU6/XE7MC4oMc4OB8Pie/30/ZbJba7TYlk0k6HA4CDIVCxNyQYrFYoNFoIJ1OQ5Ik5PN5WK1WpFIprNdr8H61WhVn5X2VisXg8XhoNpvRYDAgt9tNbICOxyOVSiVyuVzU7/epXq9TIBAQtrkzxeVygclkQrfbhd1uRzgcRq1Ww3A4FKparRbspyJRo9H4G4TD4RD06XQS3pkt8nq9NJ1OiSVGsVjsqfC3nvekVCrxeDxgMBgQiUTEa2g2m8hkMi8FuXtSq9VIJBK43+8iHB7GJ8BL4vY+N3U6HQqFAsxmM+TqB5Je/SVNoN18AAAAAElFTkSuQmCC');
}                              
</pre>
        </li>
    </ol>


    <br />
    <p><b>Input controls</b></p>
    
    <ol>
        <li>
            <p>Use the <em>textarea</em> form element to add a <b>text area</b> to your plugin:</p>
            <pre>
&lt;textarea style="height:45px;width: 100%;" class="form-control" placeholder="textarea control"&gt;&lt;/textarea&gt;
</pre>
            <p>This class has the following parameters:</p>
            <pre>
textarea.form-control {
    resize: none;
}               
</pre>
        <img alt="Textarea" src="<%= Url.Content("~/content/img/plugins/textarea.png") %>" />
        </li>
        <li>
            <p>Use the <em>input </em> form element with the <em>text</em> type to add a <b>text field</b> to your plugin:</p>
            <pre>
&lt;input type="text" class="form-control" placeholder="text field" style="width: 100%;margin-bottom: 2px;"&gt;
</pre>
            <p>This class has the following parameters:</p> 
            <pre>
.form-control {
    border: 1px solid #cfcfcf;
    border-radius: 2px;
    box-sizing: border-box;
    color: #444444;
    font-size: 11px;
    height: 22px;
    padding: 1px 3px;
    -webkit-box-shadow: none;
    box-shadow: none;
    -webkit-user-select: text;
    -moz-user-select: text;
    -ms-user-select: text;
    user-select: text;
}        
</pre>           
            <img alt="Text field" src="<%= Url.Content("~/content/img/plugins/text-field.png") %>" />
        </li>
        <li>
            <p>Use the <em>input </em> form element with the <em>checkbox</em> type to add a <img alt="Checkbox" src="<%= Url.Content("~/content/img/plugins/check.png") %>" /> <b>checkbox</b> to your plugin:</p>
            <pre>
&lt;input type="checkbox" class="form-control" style="vertical-align: middle;"&gt;&lt;label style="margin-left: 5px;vertical-align: middle;"&gt;Checkbox&lt;/label&gt;
</pre>
            <p>This class has the following parameters:</p>
            <pre>
input[type='checkbox '].form-control {
    height: auto;
    margin: 0;
}                          
</pre>
        </li>
    </ol>
    

    <br />
    <p><b>Label controls</b></p>

    <ol>
        <li>
            <p>Use the <em>label.header</em> class to add a <b>bold header</b> to your plugin:</p>
            <pre>
&lt;label class="header"&gt;Header label&lt;/label&gt;
</pre>
            <p>This class has the following parameters:</p>
            <pre>
label.header {
    font-weight: bold;
}                            
</pre>
        </li>
        <li>
            <style>
                label.link {
                    border-bottom: 1px dotted #aaa;
                    cursor: pointer;
                }
            </style>
            <p>Use the <em>label.link</em> class to add a <label class="link">link</label> to your plugin:</p>
            <pre>
&lt;label class="link"&gt;Link label&lt;/label&gt;
</pre>
            <p>This class has the following parameters:</p>
            <pre>
label.link {
    border-bottom: 1px dotted #aaa;
    cursor: pointer;
}                            
</pre>
        </li>
    </ol>


    <br />
    <p><b>ComboBox</b></p>

    <p>Use the <a href="https://select2.org/" target="_blank">select2</a> function to add a <b>combo box</b> to your plugin:</p>
    <pre>
&lt;select id="select_example" class="" &gt;&lt;/select&gt;
$('#select_example').select2({
    data : [{id:0, text:'Item 1'}, {id:1, text:'Item 2'}, {id:2, text:'Item 3'}],
    minimumResultsForSearch: Infinity,
    width : '120px'
});
</pre>
    <img alt="Combobox" src="<%= Url.Content("~/content/img/plugins/combobox.png") %>" />


    <p></p>
    <br />
    <p><b>Loader</b></p>

    <p>Use the <em>asc-loader-container</em> class to add a <b>loader container</b> to your plugin:</p>
    <pre>
&lt;div id="loader-container" class="asc-loader-container" style="margin: 10px; height: 40px; border: 1px solid #cfcfcf;"&gt;&lt;/div&gt;
</pre>
    <p>This class has the following parameters:</p>
    <pre>
.asc-loader-container {
    position: relative;
}        
</pre>
    <img alt="Loader" src="<%= Url.Content("~/content/img/plugins/loader.png") %>" />
 
    
    <p></p>
    </br >
    <h1>Example</h1>

    <p>Let&#8217;s have a look at how to add interface elements in the ONLYOFFICE style to the YouTube plugin.</p>
    <img alt="YouTube plugin" src="<%= Url.Content("~/content/img/plugins/youtube-interface.png") %>" />

    <ol>
        <li>
            <p>
                To add the simple white <b>OK</b> button, use the <em>btn-text-default</em> class (button width - 30 pixels): 
            </p>
            <pre>
&lt;button class="btn-text-default" style="width:30px;"&gt;OK&lt;/button&gt;
</pre>
        </li>
        <li>
            <p>
                To add a field, use the <em>form-control</em> class (form width - 100%, i.e. it is adjusted to the width of the parent element):
            </p>
            <pre>
&lt;input type="text" class="form-control" style="width:100%;"&gt;
</pre>
        </li>
        <li>
            <p>
                To add the dark grey <b>Ok</b> button, use the <em>btn-text-default.submit.primary</em> class (button width - 90 pixels): 
            </p>
            <pre>
&lt;button class="btn-text-default submit primary" style="width:90px;"&gt;Ok&lt;/button&gt;
</pre>
        </li>
        <li>
            <p>
                To add the light grey <b>Cancel</b> button, use the <em>btn-text-default.submit</em> class (button width - 90 pixels): 
            </p>
            <pre>
&lt;button class="btn-text-default submit" style="margin-left:5px; width:90px;"&gt;Cancel&lt;/button&gt;
</pre>
        </li>
    </ol>
</asp:Content>
