<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    InputHelper object
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("objects") %>"></a>
        <span class="hdr">InputHelper object</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Defines the auxiliary <em>window.Asc.plugin.InputHelper</em> object which represents the input helper properties.</p>
    
    <div class="header-gray">Methods and properties:</div>
    <ul>
        <li>
            <p><b id="createWindow" class="copy-link">createWindow</b> - the function called to create an input helper window.</p>
            <div class="header-gray">Example</div>
            <pre>
window.Asc.plugin.init = function(text) {
    if (!window.isInit) {
        window.isInit = true;
        window.Asc.plugin.currentText = "";
        window.Asc.plugin.createInputHelper();
        window.Asc.plugin.getInputHelper().createWindow();
    }
};
</pre>
        </li>

        <li>
            <p><b id="getItems" class="copy-link">getItems</b> - the function called to return an array of the <em>InputHelperItem</em> objects that contain all the items from the input helper.</p>
            <div class="header-gray">Example</div>
            <pre>
function getInputHelperSize () {
    var _size = window.Asc.plugin.getInputHelper().getScrollSizes();
    var _width = 150;
    var _height = _size.h;
    var _heightMin = window.Asc.plugin.getInputHelper().getItemsHeight(Math.min(5, window.Asc.plugin.getInputHelper().getItems().length));
    if (_width > 400)
        _width = 400;
    if (_height > _heightMin)
        _height = _heightMin;
        _width += 30;
        return { w: _width, h : _height };
}
</pre>
        </li>

        <li>
            <p><b id="getScrollSizes" class="copy-link">getScrollSizes</b> - the function called to get the sizes of the input helper scrolled window. 
                Returns an object with width and height parameters.</p>
            <div class="header-gray">Example</div>
            <pre>
function getInputHelperSize () {
    var _size = window.Asc.plugin.getInputHelper().getScrollSizes();
    var _width = 200;
    var _height = _size.h;
    var _heightMin = window.Asc.plugin.getInputHelper().getItemsHeight(Math.min(5, window.Asc.plugin.getInputHelper().getItems().length));
    if (_width > 400)
        _width = 400;
    if (_height > _heightMin)
        _height = _heightMin;
        _width += 30;
        return { w: _width, h : _height };
}                                         
</pre>
        </li>

        <li>
            <p><b id="setItems" class="copy-link">setItems</b> - the function called to set the items to the input helper.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>InputHelperItem</td>
                        <td>
                            Defines an array of the <em>InputHelperItem</em> objects which contain all the items for the input helper. This object can have the following parameters:
                            <ul>
                                <li>
                                    <b>id</b> - the item index,
                                    <br />
                                    <b>type</b>: string,
                                    <br />
                                    <b>example</b>: "1";
                                    <br />
                                </li>
                                <li>
                                    <b>text</b> - the item text,
                                    <br />
                                    <b>type</b>: string,
                                    <br />
                                    <b>example</b>: "name".
                                    <br />
                                </li>
                            </ul>
                        </td>
                        <td>object</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
            <pre>
{
    var items = [
        { text: "Name1.Family1", id : "0" },
        { text: "Name2.Family2", id : "1" },
        { text: "Name3.Family3", id : "2" },
        { text: "Name4.Family4", id : "3" },
        { text: "Name5.Family5", id : "4" },
        { text: "Name6.Family6", id : "5" },
        { text: "Name7.Family7", id : "6" },
        { text: "Name8.Family8", id : "7" },
        { text: "Name9.Family9", id : "8" },
        { text: "Name10.Family10", id : "9" },
        { text: "Name11.Family11", id : "10" },
        { text: "Name12.Family12", id : "11" },
        { text: "Name13.Family13", id : "12" }
    ];
    window.Asc.plugin.getInputHelper().setItems(items);
    var _sizes = getInputHelperSize();
    window.Asc.plugin.getInputHelper().show(_sizes.w, _sizes.h, true);
}              
</pre>
        </li>

        <li>
            <p><b id="show" class="copy-link">show</b> - the function called to show an input helper.</p>
            <div class="header-gray">Parameters</div>
            <table class="table">
                <colgroup>
                    <col class="table-name" />
                    <col />
                    <col class="table-type" />
                </colgroup>
                <thead>
                    <tr class="tablerow">
                        <td>Parameter</td>
                        <td>Description</td>
                        <td>Type</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td>width</td>
                        <td>
                            The input helper window width measured in millimeters.
                        </td>
                        <td>number</td>
                    </tr>
                    <tr class="tablerow">
                        <td>height</td>
                        <td>
                            The input helper window height measured in millimeters.
                        </td>
                        <td>number</td>
                    </tr>
                    <tr class="tablerow">
                        <td>isCaptureKeyboard</td>
                        <td>
                            Defines if the keyboard is caught (<b>true</b>) or not (<b>false</b>).
                        </td>
                        <td>boolean</td>
                    </tr>
                </tbody>
            </table>
            <div class="mobile-content"></div>
            <div class="header-gray">Example</div>
            <pre>
{
    var items = [
        { text: "Name1.Family1", id : "0" },
        { text: "Name2.Family2", id : "1" },
        { text: "Name3.Family3", id : "2" },
        { text: "Name4.Family4", id : "3" },
        { text: "Name5.Family5", id : "4" },
        { text: "Name6.Family6", id : "5" },
        { text: "Name7.Family7", id : "6" },
        { text: "Name8.Family8", id : "7" },
        { text: "Name9.Family9", id : "8" },
        { text: "Name10.Family10", id : "9" },
        { text: "Name11.Family11", id : "10" },
        { text: "Name12.Family12", id : "11" },
        { text: "Name13.Family13", id : "12" }
    ];
    window.Asc.plugin.getInputHelper().setItems(items);
    var _sizes = getInputHelperSize();
    window.Asc.plugin.getInputHelper().show(_sizes.w, _sizes.h, true);
}                                                   
</pre>
        </li>

        <li>
            <p><b id="unShow" class="copy-link">unShow</b> - the function called to hide an input helper.</p>
            <div class="header-gray">Example</div>
            <pre>
window.Asc.plugin.executeMethod ("SelectContentControl", [window.Asc.plugin.currentContentControl.InternalId], function() {
    window.Asc.plugin.executeMethod("InputText", [item.text]);
    window.Asc.plugin.getInputHelper().unShow(); 
});                             
</pre>
        </li>

    </ul>

</asp:Content>
