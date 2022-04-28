<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Changelog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Changelog</span>
    </h1>

    <p class="dscr">The list of changes for ONLYOFFICE Document Builder API.</p>
    <h2 id="71" class="copy-link">Version 7.1</h2>
    <p><b>Form methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("formapi") %>">Form API</a>.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/getplaceholdertext") %>">ApiBlockLvlSdt/GetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/setplaceholdertext") %>">ApiBlockLvlSdt/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform") %>">ApiCheckBoxForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/getradiogroup") %>">ApiCheckBoxForm/GetRadioGroup</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/ischecked") %>">ApiCheckBoxForm/IsChecked</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/isradiobutton") %>">ApiCheckBoxForm/IsRadioButton</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setchecked") %>">ApiCheckBoxForm/SetChecked</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setradiogroup") %>">ApiCheckBoxForm/SetRadioGroup</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform") %>">ApiComboBoxForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/getlistvalues") %>">ApiComboBoxForm/GetListValues</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/iseditable") %>">ApiComboBoxForm/IsEditable</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/selectlistvalue") %>">ApiComboBoxForm/SelectListValue</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/setlistvalues") %>">ApiComboBoxForm/SetListValues</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settext") %>">ApiComboBoxForm/SetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/clearallfields") %>">ApiDocument/ClearAllFields</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/clearallforms") %>">ApiDocument/ClearAllForms</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallforms") %>">ApiDocument/GetAllForms</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/setformshighlight") %>">ApiDocument/SetFormsHighlight</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase") %>">ApiFormBase</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/clear") %>">ApiFormBase/Clear</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/copy") %>">ApiFormBase/Copy</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/getclasstype") %>">ApiFormBase/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/getformkey") %>">ApiFormBase/GetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/getformtype") %>">ApiFormBase/GetFormType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/gettext") %>">ApiFormBase/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/gettextpr") %>">ApiFormBase/GetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/gettiptext") %>">ApiFormBase/GetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/getwrappershape") %>">ApiFormBase/GetWrapperShape</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/isfixed") %>">ApiFormBase/IsFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/isrequired") %>">ApiFormBase/IsRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setbackgroundcolor") %>">ApiFormBase/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setbordercolor") %>">ApiFormBase/SetBorderColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setformkey") %>">ApiFormBase/SetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setplaceholdertext") %>">ApiFormBase/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setrequired") %>">ApiFormBase/SetRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/settextpr") %>">ApiFormBase/SetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/settiptext") %>">ApiFormBase/SetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/tofixed") %>">ApiFormBase/ToFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/toinline") %>">ApiFormBase/ToInline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/getplaceholdertext") %>">ApiInlineLvlSdt/GetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/isform") %>">ApiInlineLvlSdt/IsForm</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/setplaceholdertext") %>">ApiInlineLvlSdt/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform") %>">ApiPictureForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getimage") %>">ApiPictureForm/GetImage</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getpicturescalecase") %>">ApiPictureForm/GetPictureScaleCase</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setimage") %>">ApiPictureForm/SetImage</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setlockaspectratio") %>">ApiPictureForm/SetLockAspectRatio</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setpicturescalecase") %>">ApiPictureForm/SetPictureScaleCase</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform") %>">ApiTextForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/isautofit") %>">ApiTextForm/IsAutoFit</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/iscomb") %>">ApiTextForm/IsComb</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/ismultiline") %>">ApiTextForm/IsMultiline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/getcharacterslimit") %>">ApiTextForm/GetCharactersLimit</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setautofit") %>">ApiTextForm/SetAutoFit</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setcellwidth") %>">ApiTextForm/SetCellWidth</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setcharacterslimit") %>">ApiTextForm/SetCharactersLimit</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setcomb") %>">ApiTextForm/SetComb</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setmultiline") %>">ApiTextForm/SetMultiline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/settext") %>">ApiTextForm/SetText</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Cross-reference methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallbookmarksnames") %>">ApiDocument/GetAllBookmarksNames</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallcaptionparagraphs") %>">ApiDocument/GetAllCaptionParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallheadingparagraphs") %>">ApiDocument/GetAllHeadingParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallnumberedparagraphs") %>">ApiDocument/GetAllNumberedParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getendnotesfirstparagraphs") %>">ApiDocument/GetEndNotesFirstParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getfootnotesfirstparagraphs") %>">ApiDocument/GetFootnotesFirstParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addbookmarkcrossref") %>">ApiParagraph/AddBookmarkCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addcaptioncrossref") %>">ApiParagraph/AddCaptionCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addendnotecrossref") %>">ApiParagraph/AddEndnoteCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addfootnotecrossref") %>">ApiParagraph/AddFootnoteCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addheadingcrossref") %>">ApiParagraph/AddHeadingCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addnumberedcrossref") %>">ApiParagraph/AddNumberedCrossRef</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Review methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/acceptallrevisionchanges") %>">ApiDocument/AcceptAllRevisionChanges</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/rejectallrevisionchanges") %>">ApiDocument/RejectAllRevisionChanges</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Table background methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/setbackgroundcolor") %>">ApiTable/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablecell/setbackgroundcolor") %>">ApiTableCell/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablecell/setcolumnbackgroundcolor") %>">ApiTableCell/SetColumnBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablerow/setbackgroundcolor") %>">ApiTableRow/SetBackgroundColor</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Areas methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiareas") %>">ApiAreas</a> class to Spreadsheet API.</li>
        <li>Added the <em>Areas</em> property to the <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a> object of Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiareas/getcount") %>">ApiAreas/GetCount</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiareas/getitem") %>">ApiAreas/GetItem</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiareas/getparent") %>">ApiAreas/GetParent</a> method to Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Range methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/autofit") %>">ApiRange/AutoFit</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/copy") %>">ApiRange/Copy</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/delete") %>">ApiRange/Delete</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getareas") %>">ApiRange/GetAreas</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/insert") %>">ApiRange/Insert</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/paste") %>">ApiRange/Paste</a> method to Spreadsheet API.</li>
        <li>Changed the <em>data</em> parameter type of the <a href="<%= Url.Action("spreadsheetapi/apirange/setvalue") %>">ApiRange/SetValue</a> method of Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Layout methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createlayout") %>">Api/CreateLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout") %>">ApiLayout</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/addobject") %>">ApiLayout/AddObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/clearbackground") %>">ApiLayout/ClearBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/copy") %>">ApiLayout/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/delete") %>">ApiLayout/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/duplicate") %>">ApiLayout/Duplicate</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/followmasterbackground") %>">ApiLayout/FollowMasterBackground</a> method to Presentation API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getallcharts") %>">ApiLayout/GetAllCharts</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getalldrawings") %>">ApiLayout/GetAllDrawings</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getallimages") %>">ApiLayout/GetAllImages</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getallshapes") %>">ApiLayout/GetAllShapes</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getclasstype") %>">ApiLayout/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getmaster") %>">ApiLayout/GetMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/moveto") %>">ApiLayout/MoveTo</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/removeobject") %>">ApiLayout/RemoveObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/setbackground") %>">ApiLayout/SetBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/setname") %>">ApiLayout/SetName</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Master methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createmaster") %>">Api/CreateMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster") %>">ApiMaster</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/addlayout") %>">ApiMaster/AddLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/addobject") %>">ApiMaster/AddObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/clearbackground") %>">ApiMaster/ClearBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/copy") %>">ApiMaster/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/delete") %>">ApiMaster/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/duplicate") %>">ApiMaster/Duplicate</a> method to Presentation API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getallcharts") %>">ApiMaster/GetAllCharts</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getalldrawings") %>">ApiMaster/GetAllDrawings</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getallimages") %>">ApiMaster/GetAllImages</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getallshapes") %>">ApiMaster/GetAllShapes</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getclasstype") %>">ApiMaster/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getlayout") %>">ApiMaster/GetLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getlayoutscount") %>">ApiMaster/GetLayoutsCount</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/gettheme") %>">ApiMaster/GetTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/removelayout") %>">ApiMaster/RemoveLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/removeobject") %>">ApiMaster/RemoveObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/setbackground") %>">ApiMaster/SetBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/settheme") %>">ApiMaster/SetTheme</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Placeholder methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createplaceholder") %>">Api/CreatePlaceholder</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apiplaceholder") %>">ApiPlaceholder</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apiplaceholder/getclasstype") %>">ApiPlaceholder/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apiplaceholder/settype") %>">ApiPlaceholder/SetType</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Theme methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createtheme") %>">Api/CreateTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createthemecolorscheme") %>">Api/CreateThemeColorScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createthemefontscheme") %>">Api/CreateThemeFontScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createthemeformatscheme") %>">Api/CreateThemeFormatScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme") %>">ApiTheme</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getclasstype") %>">ApiTheme/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getcolorscheme") %>">ApiTheme/GetColorScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getfontscheme") %>">ApiTheme/GetFontScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getformatscheme") %>">ApiTheme/GetFormatScheme</a> method to Presentation API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getmaster") %>">ApiTheme/GetMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/setcolorscheme") %>">ApiTheme/SetColorScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/setfontscheme") %>">ApiTheme/SetFontScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/setformatscheme") %>">ApiTheme/SetFormatScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme") %>">ApiThemeColorScheme</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/changecolor") %>">ApiThemeColorScheme/ChangeColor</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/copy") %>">ApiThemeColorScheme/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/getclasstype") %>">ApiThemeColorScheme/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/setschemename") %>">ApiThemeColorScheme/SetSchemeName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme") %>">ApiThemeFontScheme</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/copy") %>">ApiThemeFontScheme/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/getclasstype") %>">ApiThemeFontScheme/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/setfonts") %>">ApiThemeFontScheme/SetFonts</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/setschemename") %>">ApiThemeFontScheme/SetSchemeName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme") %>">ApiThemeFormatScheme</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/copy") %>">ApiThemeFormatScheme/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/changebgfillstyles") %>">ApiThemeFormatScheme/ChangeBgFillStyles</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/changeeffectstyles") %>">ApiThemeFormatScheme/ChangeEffectStyles</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/changefillstyles") %>">ApiThemeFormatScheme/ChangeFillStyles</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/changelinestyles") %>">ApiThemeFormatScheme/ChangeLineStyles</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/getclasstype") %>">ApiThemeFormatScheme/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/setschemename") %>">ApiThemeFormatScheme/SetSchemeName</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Drawing methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/copy") %>">ApiDrawing/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/delete") %>">ApiDrawing/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getparent") %>">ApiDrawing/GetParent</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getparentlayout") %>">ApiDrawing/GetParentLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getparentmaster") %>">ApiDrawing/GetParentMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getparentslide") %>">ApiDrawing/GetParentSlide</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getplaceholder") %>">ApiDrawing/GetPlaceholder</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/setplaceholder") %>">ApiDrawing/SetPlaceholder</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Slide methods</b></p>
    <ul>
        <li>Changed the return value for the <a href="<%= Url.Action("presentationapi/apislide/addobject") %>">ApiSlide/AddObject</a> method of Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/applylayout") %>">ApiSlide/ApplyLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/applytheme") %>">ApiSlide/ApplyTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/clearbackground") %>">ApiSlide/ClearBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/copy") %>">ApiSlide/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/delete") %>">ApiSlide/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/duplicate") %>">ApiSlide/Duplicate</a> method to Presentation API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/followlayoutbackground") %>">ApiSlide/FollowLayoutBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/followmasterbackground") %>">ApiSlide/FollowMasterBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getallcharts") %>">ApiSlide/GetAllCharts</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getalldrawings") %>">ApiSlide/GetAllDrawings</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getallimages") %>">ApiSlide/GetAllImages</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getallshapes") %>">ApiSlide/GetAllShapes</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getlayout") %>">ApiSlide/GetLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getslideindex") %>">ApiSlide/GetSlideIndex</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/gettheme") %>">ApiSlide/GetTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/moveto") %>">ApiSlide/MoveTo</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/removeobject") %>">ApiSlide/RemoveObject</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Presentation methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/addmaster") %>">ApiPresentation/AddMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/applytheme") %>">ApiPresentation/ApplyTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getmaster") %>">ApiPresentation/GetMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getmasterscount") %>">ApiPresentation/GetMastersCount</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getslidescount") %>">ApiPresentation/GetSlidesCount</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/removeslides") %>">ApiPresentation/RemoveSlides</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Other methods</b></p>
    <ul>
        <li>Added the <em>sParaTab</em> and <em>sParaNewLine</em> parameters to the <a href="<%= Url.Action("textdocumentapi/api/replacetextsmart") %>">Api/ReplaceTextSmart</a> method of Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/getparentparagraph") %>">ApiInlineLvlSdt/GetParentParagraph</a> method to Text document API.</li>
        <li>Deleted the <em>ApiShape/GetDocContent</em> method from Spreadsheet API.</li>
    </ul>

    <h2 id="70" class="copy-link">Version 7.0</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/getprevious") %>">ApiRun/GetPrevious</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/getnext") %>">ApiRun/GetNext</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/convertdocument") %>">Api/ConvertDocument</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/tohtml") %>">ApiDocument/ToHtml</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/tomarkdown") %>">ApiDocument/ToMarkdown</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortOrientation">SortOrientation</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortHeader">SortHeader</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortOrder">SortOrder</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/setsort") %>">ApiRange/SetSort</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/recalculateallformulas") %>">Api/RecalculateAllFormulas</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/setlanguage") %>">ApiPresentation/SetLanguage</a> method to Presentation API.</li>
    </ul>
    <br />

    <h2 id="64" class="copy-link">Version 6.4</h2>
    <ul>
        <li>Changed the return value of the <a href="<%= Url.Action("textdocumentapi/api/createrange") %>">Api/CreateRange</a> method of Text document API.</li>
        <li>Deleted the <em>Api/GetFirstRunInArray</em> method from Text document API.</li>
        <li>Deleted the <em>Api/GetLastRunInArray</em> method from Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apichart/setlegendfontsize") %>">ApiChart/SetLegendFontSize</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apidocument/getelement") %>">ApiDocument/GetElement</a> method of Text document API.</li>
        <li>Added the return value to the <a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">ApiDocument/Push</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">ApiDocumentContent/GetElement</a> method of Text document API.</li>
        <li>Added the return value to the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/push") %>">ApiDocumentContent/Push</a> method of Text document API.</li>
        <li>Deleted parameters from the <a href="<%= Url.Action("textdocumentapi/apirange/select") %>">ApiRange/Select</a> method of Text document API.</li>
        <li>Added the <em>oCell</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apitable/addelement") %>">ApiTable/AddElement</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("spreadsheetapi/api/getrange") %>">Api/GetRange</a> method of Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicomment/getclasstype") %>">ApiComment/GetClassType</a> method to Spreadsheet API.</li>
        <li>Deleted the <em>ApiDocument/Last</em> method from Spreadsheet and Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getcols") %>">ApiRange/GetCols</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/end") %>">ApiRange/End</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getcells") %>">ApiRange/GetCells</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getorientation") %>">ApiRange/GetOrientation</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/setorientation") %>">ApiRange/SetOrientation</a> method to Spreadsheet API.</li>
        <li>Added the <em>Cols</em> and <em>Orientation</em> properties to the <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a> object of Spreadsheet API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getcells") %>">ApiWorksheet/GetCells</a> method of Spreadsheet API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/api/creategroup") %>">Api/CreateGroup</a> method of Presentation API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/apichart/setlegendfontsize") %>">ApiChart/SetLegendFontSize</a> method of Presentation API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/apipresentation/replacecurrentimage") %>">ApiPresentation/ReplaceCurrentImage</a> method of Presentation API.</li>
    </ul>

</asp:Content>
