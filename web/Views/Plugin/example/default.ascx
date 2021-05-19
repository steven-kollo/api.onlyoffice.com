<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example") %>"></a>
    <span class="hdr">Plugin example</span>
</h1>

<div id="back-drop"></div>
<div id="filter-button">
     <div id="filter-plugin">
        <div class="img-plugin"></div> 
        <p class="text-plugin">Filter</p>
    </div>

    <div class="filter-selector">
        <ul>
            <li>Editor types</li>
            <li>
                <ul>
                    <li class="filter-item title" id="text-editor">Text editor</li>
                    <li class="filter-item title" id="spreadsheet">Spreadsheet editor</li>
                    <li class="filter-item title" id="presentation">Presentation editor</li>
                </ul>
            </li>
            <li>Visual & non-visual</li>
            <li>
                <ul>
                    <li class="filter-item title" id="visual">Visual</li>
                    <li class="filter-item title" id="non-visual">Non-visual</li>
                    <li class="filter-item title" id="input-helper">Input helper</li>
                </ul>
            </li>
            <li>System & non-system</li>
            <li>
                <ul>
                    <li class="filter-item title" id="non-system">Non-system</li>
                    <li class="filter-item title" id="system">System</li>
                </ul>
            </li>
            <li class="filter-item" id="ole-object">OLE-objects</li>
            <li class="filter-item" id="other">Others</li>
        </ul>
    </div>
</div>



<ul class="plugin-block">
    <li class="plugin-example" data-types="spreadsheet,visual,non-system">
        <a href="<%= Url.Action("example/addcommentincell") %>"><div class="example-plug-img add-comment"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/addcommentincell") %>">Add comment in cell</a></p>
                <p>Allows the user to add comments to spreadsheets.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/addcommentincell") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/addcustomfields") %>"><div class="example-plug-img add-custom"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/addcustomfields") %>">Add custom fields</a></p>
                <p>Allows the user to insert custom fields into the document.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/addcustomfields") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,input-helper,system">
        <a href="<%= Url.Action("example/autocomplete") %>"><div class="example-plug-img autocomplete"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/autocomplete") %>">Autocomplete</a></p>
                <p>Allows the user to use an input assistant for ONLYOFFICE editors.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/autocomplete") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="spreadsheet,non-visual,non-system">
        <a href="<%= Url.Action("example/cbr") %>"><div class="example-plug-img cbr"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/cbr") %>">CBR</a></p>
                <p>Allows the user to connect Fixer API for inserting foreign exchange (forex) rates into the document.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/cbr") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object,other">
        <a href="<%= Url.Action("example/chess") %>"><div class="example-plug-img chess"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/chess") %>">Chess</a></p>
                <p>Allows the user to insert a Chess Board object into the document editor.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/chess") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,other">
        <a href="<%= Url.Action("example/clippy") %>"><div class="example-plug-img clippy"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/clippy") %>">Clippy</a></p>
                <p>Allows the user to add the clippy assistant to the document editor.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/clippy") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system,other">
        <a href="<%= Url.Action("example/countwordsandcharacters") %>"><div class="example-plug-img countwords"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/countwordsandcharacters") %>">Count words and characters</a></p>
                <p>Allows the user to count paragraphs, words and characters.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/countwordsandcharacters") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/extendedcomments") %>"><div class="example-plug-img extended"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/extendedcomments") %>">Extended comments</a></p>
                <p>Allows the user to paste, edit and remove comments and replies (with user data) in a document.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/extendedcomments") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system">
        <a href="<%= Url.Action("example/getandpastehtml") %>"><div class="example-plug-img get-and-paste"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/getandpastehtml") %>">Get and paste html</a></p>
                <p>Allows the user to get the document content as HTML code.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/getandpastehtml") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,non-visual,non-system">
        <a href="<%= Url.Action("example/helloworld") %>"><div class="example-plug-img helloworld"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/helloworld") %>">Hello World</a></p>
                <p>Allows the user to insert the <em>Hello world!</em> phrase into the document.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/helloworld") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system">
        <a href="<%= Url.Action("example/highlightcode") %>"><div class="example-plug-img highlight"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/highlightcode") %>">Highlight code</a></p>
                <p>Allows the user to connect the Highlight.js library for highlighting the code syntax.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/highlightcode") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/invoices") %>"><div class="example-plug-img invoices"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/invoices") %>">Invoices</a></p>
                <p>Allows the user to insert template fields for invoice information.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/invoices") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/languagetool") %>"><div class="example-plug-img language-tool"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/languagetool") %>">Language tool</a></p>
                <p>Allows the user to connect the LanguageTool assistant to check the text for grammar, style and spell errors.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/languagetool") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/loadcustomfields") %>"><div class="example-plug-img load-custom"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/loadcustomfields") %>">Load custom fields</a></p>
                <p>Allows the user to load custom fields from the document.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/loadcustomfields") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system,other">
        <a href="<%= Url.Action("example/movecursor") %>"><div class="example-plug-img move-cursor"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/movecursor") %>">Move cursor</a></p>
                <p>Allows the user to move the text cursor to the document start / end.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/movecursor") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="spreadsheet,non-visual,non-system">
        <a href="<%= Url.Action("example/num2word") %>"><div class="example-plug-img num2word"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/num2word") %>">Num2Word</a></p>
                <p>Allows the user to convert a number to a word (a number written as a string).</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/num2word") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system">
        <a href="<%= Url.Action("example/ocr") %>"><div class="example-plug-img ocr"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/ocr") %>">OCR</a></p>
                <p>Allows the user to connect the TesseractJS-Core library for extracting text from an image.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/ocr") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system">
        <a href="<%= Url.Action("example/photoeditor") %>"><div class="example-plug-img photo-editor-example"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/photoeditor") %>">Photo Editor</a></p>
                <p>Allows the user to connect the Toast UI Image Editor for editing images right in the document.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/photoeditor") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/searchandchangetextbackgroundcolor") %>"><div class="example-plug-img search-and-change"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/searchandchangetextbackgroundcolor") %>">Search and change text background color</a></p>
                <p>Allows the user to search for text and change its background color.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/searchandchangetextbackgroundcolor") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system,ole-object">
        <a href="<%= Url.Action("example/searchandreplace") %>"><div class="example-plug-img search-replace"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/searchandreplace") %>">Search & replace</a></p>
                <p>Allows the user to search the text and replace it with another one.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/searchandreplace") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,non-visual,system">
        <a href="<%= Url.Action("example/searchandreplaceonstart") %>"><div class="example-plug-img replace-on-start"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/searchandreplaceonstart") %>">Search & replace on start</a></p>
                <p>Allows the user to search and replace text in the document when it is reopened.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/searchandreplaceonstart") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,non-visual,system">
        <a href="<%= Url.Action("example/settings") %>"><div class="example-plug-img settings"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/settings") %>">Settings</a></p>
                <p>Allows the user to protect a document using a watermark.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/settings") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,non-visual,non-system,other">
        <a href="<%= Url.Action("example/speech") %>"><div class="example-plug-img speech"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/speech") %>">Speech</a></p>
                <p>Allows the user to connect the guessLanguage.js library and the ResponsiveVoice service.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/speech") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system">
        <a href="<%= Url.Action("example/symboltable") %>"><div class="example-plug-img symbol-table"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/symboltable") %>">Symbol Table</a></p>
                <p>Allows the user to insert special symbols into the document.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/symboltable") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system">
        <a href="<%= Url.Action("example/telegram") %>"><div class="example-plug-img telegram"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/telegram") %>">Telegram</a></p>
                <p>Allows the user to connect the Telegram within ONLYOFFICE editors.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/telegram") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/templates") %>"><div class="example-plug-img templates"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/templates") %>">Templates</a></p>
                <p>Allows the user to insert  templates generated by the Document Builder script.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/templates") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system">
        <a href="<%= Url.Action("example/thesaurus") %>"><div class="example-plug-img thesaurus"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/thesaurus") %>">Thesaurus</a></p>
                <p>Allows the user to search for synonyms and antonyms of a word and replace it with the selected one.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/thesaurus") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system">
        <a href="<%= Url.Action("example/translator") %>"><div class="example-plug-img translator-example"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/translator") %>">Translator</a></p>
                <p>Allows the user to connect Google Translate API for translating the selected text.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/translator") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/typograf") %>"><div class="example-plug-img typograf"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/typograf") %>">Typograf</a></p>
                <p>Allows the user to connect the Typograf assistant which prepares text for publishing.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/typograf") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,non-visual,system">
        <a href="<%= Url.Action("example/workwithcontentcontrolscontent") %>"><div class="example-plug-img controls-content"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/workwithcontentcontrolscontent") %>">Work with content controls content</a></p>
                <p>Allows the user to insert the content of one content control into another.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/workwithcontentcontrolscontent") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/workwithcontentcontrolsnavigation") %>"><div class="example-plug-img controls-navigation"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/workwithcontentcontrolsnavigation") %>">Work with content controls navigation</a></p>
                <p>Allows the user to navigate content controls, select and insert text into them.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/workwithcontentcontrolsnavigation") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,visual,non-system">
        <a href="<%= Url.Action("example/workwithcontentcontrolstags") %>"><div class="example-plug-img controls-tags"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/workwithcontentcontrolstags") %>">Work with content controls tags</a></p>
                <p>Allows the user to get the list of content controls tags.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/workwithcontentcontrolstags") %>">More</a></p>
    </li>
    <li class="plugin-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("example/youtube") %>"><div class="example-plug-img youtube"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/youtube") %>">YouTube</a></p>
                <p>Allows the user to embed YouTube videos into the documents.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/youtube") %>">More</a></p>
    </li>
    <li class="plugin-example">
        <a href="<%= Url.Action("example/zotero") %>"><div class="example-plug-img zotero"></div></a>
            <div class="plugin-info">
                <p class="name-example-plugin"><a href="<%= Url.Action("example/zotero") %>">Zotero</a></p>
                <p>Allows the user to create bibliographies in ONLYOFFICE editors.</p>
            </div>
        <p class="block_more plug_more"><a href="<%= Url.Action("example/zotero") %>">More</a></p>
    </li>
</ul>
