<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">Overview</a>
    </li>
    <li>
        <a href="<%= Url.Action("gettingstarted") %>">Getting started with plugins</a>
    </li>
    <li>
        <a href="<%= Url.Action("types") %>">Plugin types</a>
    </li>
</ul>

<div class="treeheader">Documentation</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("structure") %>">Plugin structure</a>
        <ul>
            <li>
                <a href="<%= Url.Action("config") %>">config.json</a>
            </li>
            <li>
                <a href="<%= Url.Action("indexhtml") %>">index.html</a>
            </li>
            <li>
                <a href="<%= Url.Action("code") %>">Plugin code</a>
            </li>
            <li>
                <a href="<%= Url.Action("plugin") %>">window.Asc.plugin object</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("button") %>">button</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("callcommand") %>">callCommand</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("executecommand") %>">executeCommand</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("executemethod") %>">executeMethod</a>
                        <ul>
                            <li>
                                <a href="<%= Url.Action("executemethod/insertandreplacecontentcontrols") %>">InsertAndReplaceContentControls</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/removecontentcontrols") %>">RemoveContentControls</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/getallcontentcontrols") %>">GetAllContentControls</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/addcontentcontrol") %>">AddContentControl</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/removecontentcontrol") %>">RemoveContentControl</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/getcurrentcontentcontrol") %>">GetCurrentContentControl</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/addoleobject") %>">AddOleObject</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/editoleobject") %>">EditOleObject</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/getfontlist") %>">GetFontList</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/inputtext") %>">InputText</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/pastehtml") %>">PasteHtml</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/pastetext") %>">PasteText</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/getmacros") %>">GetMacros</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/setmacros") %>">SetMacros</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/startaction") %>">StartAction</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/endaction") %>">EndAction</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/onencryption") %>">OnEncryption</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/setproperties") %>">SetProperties</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/showinputhelper") %>">ShowInputHelper</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/unshowinputhelper") %>">UnShowInputHelper</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%= Url.Action("info") %>">info object</a>
                        <ul>
                            <li>
                                <a href="<%= Url.Action("info/data") %>">data</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/editorType") %>">editorType</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/guid") %>">guid</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/height") %>">height</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/imgsrc") %>">imgSrc</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/mmtopx") %>">mmToPx</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/objectId") %>">objectId</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/recalculate") %>">recalculate</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/resize") %>">resize</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info/width") %>">width</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%= Url.Action("init") %>">init</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("onExternalMouseUp") %>">onExternalMouseUp</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("onmethodreturn") %>">onMethodReturn</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("scope") %>">Asc.scope object</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("installation") %>">Adding plugins</a>
        <ul>
            <li>
                <a href="<%= Url.Action("installation/desktop") %>">ONLYOFFICE Desktop Editors</a>
            </li>
            <li>
                <a href="<%= Url.Action("installation/onpremises") %>">ONLYOFFICE Docs on-premises</a>
            </li>
            <li>
                <a href="<%= Url.Action("installation/cloud") %>">ONLYOFFICE Cloud</a>
            </li>
        </ul>
    <li>
        <a href="<%= Url.Action("localization") %>">Plugin localization</a>
    </li>
    <li>
        <a href="<%= Url.Action("styles") %>">Plugin styles</a>
    </li>
    <li>
        <a href="<%= Url.Action("example") %>">Plugin example</a>
    </li>
</ul>
<div class="treeheader">Macros</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("macros") %>">Getting started with macros</a>
    </li>
    <li>
        <a href="<%= Url.Action("writingmacros") %>">Writing macros</a>
    </li>
    <li>
        <a href="<%= Url.Action("convertingvbamacros") %>">Converting macros</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/") %>">Macro samples</a>
        <ul>
            <li>
                <a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>">Write data to worksheet cell</a>
            </li> 
            <li>
                <a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">Change cell background color</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">Change cell font color</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/makecellfontbold") %>">Make cell font bold</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/mergecellrange") %>">Merge cell range</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/unmergecellrange") %>">Unmerge cell range</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/setcolumnwidth") %>">Set column width</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/formatrangeasatable") %>">Format range as a table</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/addchart") %>">Add chart</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/highlightduplicates") %>">Highlight duplicates</a>
            </li>
            <li>
                <a href="<%= Url.Action("macrosamples/nextblankrow") %>">Next blank row</a>
            </li>  
        </ul>
    <li>
</ul>
<div class="treeheader">More information</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("faq") %>">FAQ</a>
    </li>
</ul>
