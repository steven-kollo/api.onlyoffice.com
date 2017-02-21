<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">Introduction</a>
    </li>
    <li>
        <a href="<%= Url.Action("gettingstarted") %>">Getting started</a>
    </li>
</ul>

<div class="treeheader">Documentation</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("integratingdocumentbuilder") %>">Integrating Document Builder</a>
        <ul>
            <li>
                <a href="<%= Url.Action("csharpexample") %>">.Net (C#) example</a>
            </li>
            <li>
                <a href="<%= Url.Action("nodejsexample") %>">Node.js example</a>
            </li>
            <li>
                <a href="<%= Url.Action("rubyexample") %>">Ruby example</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi") %>">Integration API</a>
        <ul>
            <li>
                <a href="<%= Url.Action("integrationapi/usingdocbuilderfile") %>">Using .docbuilder file</a>
            </li>
            <li>
                <a href="<%= Url.Action("integrationapi/cdocbuilder") %>">CDocBuilder class</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/closefile") %>">CloseFile</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/createfile") %>">CreateFile</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/dispose") %>">Dispose</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">ExecuteCommand</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/initialize") %>">Initialize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/openfile") %>">OpenFile</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/run") %>">Run</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/runtexta") %>">RunTextA</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/runtextw") %>">RunTextW</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/savefile") %>">SaveFile</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/settmpfolder") %>">SetTmpFolder</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a>
        <ul>
            <li>
                <a href="<%= Url.Action("textdocumentapi/api") %>">Api</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createblipfill") %>">CreateBlipFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createchart") %>">CreateChart</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/creategradientstop") %>">CreateGradientStop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createimage") %>">CreateImage</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createlineargradientfill") %>">CreateLinearGradientFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createnofill") %>">CreateNoFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createparagraph") %>">CreateParagraph</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createpatternfill") %>">CreatePatternFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createpresetcolor") %>">CreatePresetColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createradialgradientfill") %>">CreateRadialGradientFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/creatergbcolor") %>">CreateRGBColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createrun") %>">CreateRun</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createschemecolor") %>">CreateSchemeColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createshape") %>">CreateShape</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createsolidfill") %>">CreateSolidFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createstroke") %>">CreateStroke</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/createtable") %>">CreateTable</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/api/getdocument") %>">GetDocument</a>
                    </li>
                </ul>                
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apichart") %>">ApiChart</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apichart/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apichart/sethoraxistitle") %>">SetHorAxisTitle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apichart/setlegendpos") %>">SetLegendPos</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apichart/setshowdatalabels") %>">SetShowDataLabels</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apichart/settitle") %>">SetTitle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apichart/setveraxistitle") %>">SetVerAxisTitle</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apidocument") %>">ApiDocument</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/addelement") %>">AddElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/createnumbering") %>">CreateNumbering</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/createsection") %>">CreateSection</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/createstyle") %>">CreateStyle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/getdefaultparapr") %>">GetDefaultParaPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/getdefaultstyle") %>">GetDefaultStyle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/getdefaulttextpr") %>">GetDefaultTextPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/getelement") %>">GetElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/getelementscount") %>">GetElementsCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/getfinalsection") %>">GetFinalSection</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/getstyle") %>">GetStyle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">Push</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/removeallelements") %>">RemoveAllElements</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/removeelement") %>">RemoveElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocument/setevenandoddhdrftr") %>">SetEvenAndOddHdrFtr</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apidocumentcontent") %>">ApiDocumentContent</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/addelement") %>">AddElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">GetElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/push") %>">Push</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/removeelement") %>">RemoveElement</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apidrawing") %>">ApiDrawing</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing/setdistances") %>">SetDistances</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing/sethoralign") %>">SetHorAlign</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing/sethorposition") %>">SetHorPosition</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing/setsize") %>">SetSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing/setveralign") %>">SetVerAlign</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing/setverposition") %>">SetVerPosition</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apidrawing/setwrappingstyle") %>">SetWrappingStyle</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apifill") %>">ApiFill</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apifill/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apigradientstop") %>">ApiGradientStop</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apigradientstop/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apiimage") %>">ApiImage</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiimage/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apinumbering") %>">ApiNumbering</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumbering/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumbering/getlevel") %>">GetLevel</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apinumberinglevel") %>">ApiNumberingLevel</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getlevelindex") %>">GetLevelIndex</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getnumbering") %>">GetNumbering</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/getparapr") %>">GetParaPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/gettextpr") %>">GetTextPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setcustomtype") %>">SetCustomType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setrestart") %>">SetRestart</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setstart") %>">SetStart</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/setsuff") %>">SetSuff</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apinumberinglevel/settemplatetype") %>">SetTemplateType</a>
                    </li>                  
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apiparagraph") %>">ApiParagraph</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addcolumnbreak") %>">AddColumnBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/adddrawing") %>">AddDrawing</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addelement") %>">AddElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addlinebreak") %>">AddLineBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagebreak") %>">AddPageBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagenumber") %>">AddPageNumber</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addpagescount") %>">AddPagesCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addtabstop") %>">AddTabStop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext") %>">AddText</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/getelement") %>">GetElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/getelementscount") %>">GetElementsCount</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/getnumbering") %>">GetNumbering</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/getparagraphmarktextpr") %>">GetParagraphMarkTextPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/getparapr") %>">GetParaPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/removeallelements") %>">RemoveAllElements</a>
                    </li>  
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/removeelement") %>">RemoveElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setbetweenborder") %>">SetBetweenBorder</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setbottomborder") %>">SetBottomBorder</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setcontextualspacing") %>">SetContextualSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setindfirstline") %>">SetIndFirstLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setindleft") %>">SetIndLeft</a>
                    </li>  
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setindright") %>">SetIndRight</a>
                    </li>    
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setjc") %>">SetJc</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setkeeplines") %>">SetKeepLines</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setkeepnext") %>">SetKeepNext</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setleftborder") %>">SetLeftBorder</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setnumbering") %>">SetNumbering</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setnumpr") %>">SetNumPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setpagebreakbefore") %>">SetPageBreakBefore</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setrightborder") %>">SetRightBorder</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setshd") %>">SetShd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingbefore") %>">SetSpacingBefore</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setspacingline") %>">SetSpacingLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setstyle") %>">SetStyle</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/settabs") %>">SetTabs</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/settopborder") %>">SetTopBorder</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparagraph/setwidowcontrol") %>">SetWidowControl</a>
                    </li>      
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apiparapr") %>">ApiParaPr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setbetweenborder") %>">SetBetweenBorder</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setbottomborder") %>">SetBottomBorder</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setcontextualspacing") %>">SetContextualSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setindfirstline") %>">SetIndFirstLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setindleft") %>">SetIndLeft</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setindright") %>">SetIndRight</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setjc") %>">SetJc</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setkeeplines") %>">SetKeepLines</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setkeepnext") %>">SetKeepNext</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setleftborder") %>">SetLeftBorder</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setnumpr") %>">SetNumPr</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setpagebreakbefore") %>">SetPageBreakBefore</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setrightborder") %>">SetRightBorder</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setshd") %>">SetShd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingafter") %>">SetSpacingAfter</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingbefore") %>">SetSpacingBefore</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setspacingline") %>">SetSpacingLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setstyle") %>">SetStyle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/settabs") %>">SetTabs</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/settopborder") %>">SetTopBorder</a>
                    </li>  
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiparapr/setwidowcontrol") %>">SetWidowControl</a>
                    </li>                  
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apipresetcolor") %>">ApiPresetColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apipresetcolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apirgbcolor") %>">ApiRGBColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirgbcolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apirun") %>">ApiRun</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/addcolumnbreak") %>">AddColumnBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/adddrawing") %>">AddDrawing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/addlinebreak") %>">AddLineBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/addpagebreak") %>">AddPageBreak</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/addtabstop") %>">AddTabStop</a>
                    </li>  
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/addtext") %>">AddText</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/clearcontent") %>">ClearContent</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/gettextpr") %>">GetTextPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setbold") %>">SetBold</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setcaps") %>">SetCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setcolor") %>">SetColor</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setdoublestrikeout") %>">SetDoubleStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setfontfamily") %>">SetFontFamily</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setfontsize") %>">SetFontSize</a>
                    </li>         
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/sethighlight") %>">SetHighlight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setitalic") %>">SetItalic</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setlanguage") %>">SetLanguage</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setposition") %>">SetPosition</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setshd") %>">SetShd</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setsmallcaps") %>">SetSmallCaps</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setspacing") %>">SetSpacing</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setstrikeout") %>">SetStrikeout</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setstyle") %>">SetStyle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setunderline") %>">SetUnderline</a>
                    </li>  
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apirun/setvertalign") %>">SetVertAlign</a>
                    </li> 
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apischemecolor") %>">ApiSchemeColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apischemecolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apisection") %>">ApiSection</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/getclasstype") %>">GetClassType</a>
                    </li>  
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/getfooter") %>">GetFooter</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/getheader") %>">GetHeader</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/removefooter") %>">RemoveFooter</a>
                    </li>    
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/removeheader") %>">RemoveHeader</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/setequalcolumns") %>">SetEqualColumns</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/setfooterdistance") %>">SetFooterDistance</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/setheaderdistance") %>">SetHeaderDistance</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/setnotequalcolumns") %>">SetNotEqualColumns</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/setpagemargins") %>">SetPageMargins</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/setpagesize") %>">SetPageSize</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/settitlepage") %>">SetTitlePage</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apisection/settype") %>">SetType</a>
                    </li>            
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apishape") %>">ApiShape</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apishape/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apishape/getdoccontent") %>">GetDocContent</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apishape/setverticaltextalign") %>">SetVerticalTextAlign</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apistroke") %>">ApiStroke</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistroke/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apistyle") %>">ApiStyle</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/getconditionaltablestyle") %>">GetConditionalTableStyle</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/getname") %>">GetName</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/getparapr") %>">GetParaPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/gettablecellpr") %>">GetTableCellPr</a>
                    </li>  
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/gettablepr") %>">GetTablePr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/gettablerowpr") %>">GetTableRowPr</a>
                    </li>   
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/gettextpr") %>">GetTextPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/gettype") %>">GetType</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/setbasedon") %>">SetBasedOn</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apistyle/setname") %>">SetName</a>
                    </li>           
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apitable") %>">ApiTable</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/addcolumn") %>">AddColumn</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/addrow") %>">AddRow</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/getclasstype") %>">GetClassType</a>
                    </li>   
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/getrow") %>">GetRow</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/getrowscount") %>">GetRowsCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/mergecells") %>">MergeCells</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/removecolumn") %>">RemoveColumn</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/removerow") %>">RemoveRow</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/setcellspacing") %>">SetCellSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/setjc") %>">SetJc</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/setshd") %>">SetShd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/setstyle") %>">SetStyle</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/setstylecolbandsize") %>">SetStyleColBandSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/setstylerowbandsize") %>">SetStyleRowBandSize</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settableborderbottom") %>">SetTableBorderBottom</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settableborderinsideh") %>">SetTableBorderInsideH</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settableborderinsidev") %>">SetTableBorderInsideV</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settableborderleft") %>">SetTableBorderLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settableborderright") %>">SetTableBorderRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settablebordertop") %>">SetTableBorderTop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginbottom") %>">SetTableCellMarginBottom</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginleft") %>">SetTableCellMarginLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settablecellmarginright") %>">SetTableCellMarginRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settablecellmargintop") %>">SetTableCellMarginTop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settableind") %>">SetTableInd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settablelayout") %>">SetTableLayout</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/settablelook") %>">SetTableLook</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitable/setwidth") %>">SetWidth</a>
                    </li>               
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apitablecell") %>">ApiTableCell</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/getcontent") %>">GetContent</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderbottom") %>">SetCellBorderBottom</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderleft") %>">SetCellBorderLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setcellborderright") %>">SetCellBorderRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setcellbordertop") %>">SetCellBorderTop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginbottom") %>">SetCellMarginBottom</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginleft") %>">SetCellMarginLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmarginright") %>">SetCellMarginRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setcellmargintop") %>">SetCellMarginTop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setnowrap") %>">SetNoWrap</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setshd") %>">SetShd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/settextdirection") %>">SetTextDirection</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setverticalalign") %>">SetVerticalAlign</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecell/setwidth") %>">SetWidth</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apitablecellpr") %>">ApiTableCellPr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/getclasstype") %>">GetClassType</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellborderbottom") %>">SetCellBorderBottom</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellborderleft") %>">SetCellBorderLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellborderright") %>">SetCellBorderRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellbordertop") %>">SetCellBorderTop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmarginbottom") %>">SetCellMarginBottom</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmarginleft") %>">SetCellMarginLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmarginright") %>">SetCellMarginRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setcellmargintop") %>">SetCellMarginTop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setnowrap") %>">SetNoWrap</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setshd") %>">SetShd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/settextdirection") %>">SetTextDirection</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setverticalalign") %>">SetVerticalAlign</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablecellpr/setwidth") %>">SetWidth</a>
                    </li>                   
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apitablepr") %>">ApiTablePr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/setcellspacing") %>">SetCellSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/setjc") %>">SetJc</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/setshd") %>">SetShd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/setstylecolbandsize") %>">SetStyleColBandSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/setstylerowbandsize") %>">SetStyleRowBandSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderbottom") %>">SetTableBorderBottom</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderinsideh") %>">SetTableBorderInsideH</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderinsidev") %>">SetTableBorderInsideV</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderleft") %>">SetTableBorderLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settableborderright") %>">SetTableBorderRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settablebordertop") %>">SetTableBorderTop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginbottom") %>">SetTableCellMarginBottom</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginleft") %>">SetTableCellMarginLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmarginright") %>">SetTableCellMarginRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settablecellmargintop") %>">SetTableCellMarginTop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settableind") %>">SetTableInd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/settablelayout") %>">SetTableLayout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablepr/setwidth") %>">SetWidth</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apitablerow") %>">ApiTableRow</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablerow/getcell") %>">GetCell</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablerow/getcellscount") %>">GetCellsCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablerow/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablerow/setheight") %>">SetHeight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablerow/settableheader") %>">SetTableHeader</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apitablerowpr") %>">ApiTableRowPr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablerowpr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablerowpr/setheight") %>">SetHeight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablerowpr/settableheader") %>">SetTableHeader</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apitablestylepr") %>">ApiTableStylePr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablestylepr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablestylepr/getparapr") %>">GetParaPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablecellpr") %>">GetTableCellPr</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablepr") %>">GetTablePr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettablerowpr") %>">GetTableRowPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettextpr") %>">GetTextPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitablestylepr/gettype") %>">GetType</a>
                    </li>                   
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apitextpr") %>">ApiTextPr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setbold") %>">SetBold</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setcaps") %>">SetCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setcolor") %>">SetColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setfontfamily") %>">SetFontFamily</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setfontsize") %>">SetFontSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/sethighlight") %>">SetHighlight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setitalic") %>">SetItalic</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setlanguage") %>">SetLanguage</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setposition") %>">SetPosition</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setshd") %>">SetShd</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setspacing") %>">SetSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setstrikeout") %>">SetStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setstyle") %>">SetStyle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setunderline") %>">SetUnderline</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apitextpr/setvertalign") %>">SetVertAlign</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apiunicolor") %>">ApiUniColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiunicolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("textdocumentapi/apiunsupported") %>">ApiUnsupported</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("textdocumentapi/apiunsupported/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a>
        <ul>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/api") %>">Api</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createblipfill") %>">CreateBlipFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createbullet") %>">CreateBullet</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createcolorbyname") %>">CreateColorByName</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createcolorfromrgb") %>">CreateColorFromRGB</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/creategradientstop") %>">CreateGradientStop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createlineargradientfill") %>">CreateLinearGradientFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createnofill") %>">CreateNoFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createnumbering") %>">CreateNumbering</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createparagraph") %>">CreateParagraph</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createpatternfill") %>">CreatePatternFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createpresetcolor") %>">CreatePresetColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createradialgradientfill") %>">CreateRadialGradientFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/creatergbcolor") %>">CreateRGBColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createrun") %>">CreateRun</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createschemecolor") %>">CreateSchemeColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createsolidfill") %>">CreateSolidFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/createstroke") %>">CreateStroke</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet") %>">GetActiveSheet</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/getthemescolors") %>">GetThemesColors</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/api/setthemecolors") %>">SetThemeColors</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apibullet") %>">ApiBullet</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apibullet/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apichart") %>">ApiChart</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxisorientation") %>">SetHorAxisOrientation</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxisticklabelposition") %>">SetHorAxisTickLabelPosition</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/sethoraxistitle") %>">SetHorAxisTitle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/setlegendpos") %>">SetLegendPos</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/setshowdatalabels") %>">SetShowDataLabels</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/settitle") %>">SetTitle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/setveraxisorientation") %>">SetVerAxisOrientation</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/setveraxistitle") %>">SetVerAxisTitle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apichart/setvertaxisticklabelposition") %>">SetVertAxisTickLabelPosition</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apicolor") %>">ApiColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apicolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent") %>">ApiDocumentContent</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/addelement") %>">AddElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getelement") %>">GetElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/push") %>">Push</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidocumentcontent/removeelement") %>">RemoveElement</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apidrawing") %>">ApiDrawing</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidrawing/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidrawing/setposition") %>">SetPosition</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apidrawing/setsize") %>">SetSize</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apifill") %>">ApiFill</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apifill/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apigradientstop") %>">ApiGradientStop</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apigradientstop/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apiimage") %>">ApiImage</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiimage/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apiparagraph") %>">ApiParagraph</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/addelement") %>">AddElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/addlinebreak") %>">AddLineBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/addtabstop") %>">AddTabStop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/addtext") %>">AddText</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/getelement") %>">GetElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/getelementscount") %>">GetElementsCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/getparapr") %>">GetParaPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/removeallelements") %>">RemoveAllElements</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/removeelement") %>">RemoveElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/setbullet") %>">SetBullet</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindfirstline") %>">SetIndFirstLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindleft") %>">SetIndLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/setindright") %>">SetIndRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/setjc") %>">SetJc</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingbefore") %>">SetSpacingBefore</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/setspacingline") %>">SetSpacingLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparagraph/settabs") %>">SetTabs</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apiparapr") %>">ApiParaPr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/setbullet") %>">SetBullet</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/setindfirstline") %>">SetIndFirstLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/setindleft") %>">SetIndLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/setindright") %>">SetIndRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/setjc") %>">SetJc</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/setspacingafter") %>">SetSpacingAfter</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/setspacingbefore") %>">SetSpacingBefore</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/setspacingline") %>">SetSpacingLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiparapr/settabs") %>">SetTabs</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apipresetcolor") %>">ApiPresetColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apipresetcolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/getcol") %>">GetCol</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/getrow") %>">GetRow</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/merge") %>">Merge</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setalignhorizontal") %>">SetAlignHorizontal</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setalignvertical") %>">SetAlignVertical</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setbold") %>">SetBold</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setborders") %>">SetBorders</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setfillcolor") %>">SetFillColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setfontcolor") %>">SetFontColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setfontname") %>">SetFontName</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setfontsize") %>">SetFontSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setitalic") %>">SetItalic</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setnumberformat") %>">SetNumberFormat</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setstrikeout") %>">SetStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setunderline") %>">SetUnderline</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setvalue") %>">SetValue</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/setwrap") %>">SetWrap</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirange/unmerge") %>">UnMerge</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apirgbcolor") %>">ApiRGBColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirgbcolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apirun") %>">ApiRun</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/addlinebreak") %>">AddLineBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/addtabstop") %>">AddTabStop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/addtext") %>">AddText</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/clearcontent") %>">ClearContent</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/gettextpr") %>">GetTextPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setbold") %>">SetBold</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setcaps") %>">SetCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setdoublestrikeout") %>">SetDoubleStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setfill") %>">SetFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setfontfamily") %>">SetFontFamily</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setfontsize") %>">SetFontSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setitalic") %>">SetItalic</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setsmallcaps") %>">SetSmallCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setspacing") %>">SetSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setstrikeout") %>">SetStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setunderline") %>">SetUnderline</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apirun/setvertalign") %>">SetVertAlign</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apischemecolor") %>">ApiSchemeColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apischemecolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apishape") %>">ApiShape</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apishape/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apishape/getdoccontent") %>">GetDocContent</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apishape/setverticaltextalign") %>">SetVerticalTextAlign</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apistroke") %>">ApiStroke</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apistroke/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apitextpr") %>">ApiTextPr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setbold") %>">SetBold</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setcaps") %>">SetCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setfill") %>">SetFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setfontfamily") %>">SetFontFamily</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setfontsize") %>">SetFontSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setitalic") %>">SetItalic</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setspacing") %>">SetSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setstrikeout") %>">SetStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setunderline") %>">SetUnderline</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apitextpr/setvertalign") %>">SetVertAlign</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apiunicolor") %>">ApiUniColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiunicolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("spreadsheetapi/apiworksheet") %>">ApiWorksheet</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/addchart") %>">AddChart</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/addimage") %>">AddImage</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/addshape") %>">AddShape</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/formatastable") %>">FormatAsTable</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange") %>">GetRange</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrangebynumber") %>">GetRangeByNumber</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/setcolumnwidth") %>">SetColumnWidth</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/setdisplaygridlines") %>">SetDisplayGridlines</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/setdisplayheadings") %>">SetDisplayHeadings</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("spreadsheetapi/apiworksheet/setname") %>">SetName</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("presentationapi") %>">Presentation API</a>
        <ul>
            <li>
                <a href="<%= Url.Action("presentationapi/api") %>">Api</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createblipfill") %>">CreateBlipFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createbullet") %>">CreateBullet</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createchart") %>">CreateChart</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/creategradientstop") %>">CreateGradientStop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createimage") %>">CreateImage</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createlineargradientfill") %>">CreateLinearGradientFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createnofill") %>">CreateNoFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createnumbering") %>">CreateNumbering</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createparagraph") %>">CreateParagraph</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createpatternfill") %>">CreatePatternFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createpresetcolor") %>">CreatePresetColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createradialgradientfill") %>">CreateRadialGradientFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/creatergbcolor") %>">CreateRGBColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createrun") %>">CreateRun</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createschemecolor") %>">CreateSchemeColor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createshape") %>">CreateShape</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createslide") %>">CreateSlide</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createsolidfill") %>">CreateSolidFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/createstroke") %>">CreateStroke</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/api/getpresentation") %>">GetPresentation</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apibullet") %>">ApiBullet</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apibullet/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apichart") %>">ApiChart</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apichart/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apichart/sethoraxistitle") %>">SetHorAxisTitle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apichart/setlegendpos") %>">SetLegendPos</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apichart/setshowdatalabels") %>">SetShowDataLabels</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apichart/settitle") %>">SetTitle</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apichart/setveraxistitle") %>">SetVerAxisTitle</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apidocumentcontent") %>">ApiDocumentContent</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidocumentcontent/addelement") %>">AddElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidocumentcontent/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidocumentcontent/getelement") %>">GetElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidocumentcontent/getelementscount") %>">GetElementsCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidocumentcontent/push") %>">Push</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidocumentcontent/removeallelements") %>">RemoveAllElements</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidocumentcontent/removeelement") %>">RemoveElement</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apidrawing") %>">ApiDrawing</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidrawing/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidrawing/setposition") %>">SetPosition</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apidrawing/setsize") %>">SetSize</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apifill") %>">ApiFill</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apifill/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apigradientstop") %>">ApiGradientStop</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apigradientstop/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apiimage") %>">ApiImage</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiimage/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apiparagraph") %>">ApiParagraph</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/addelement") %>">AddElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/addlinebreak") %>">AddLineBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/addtabstop") %>">AddTabStop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/addtext") %>">AddText</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/getelement") %>">GetElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/getelementscount") %>">GetElementsCount</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/getparapr") %>">GetParaPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/removeallelements") %>">RemoveAllElements</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/removeelement") %>">RemoveElement</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/setbullet") %>">SetBullet</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/setindfirstline") %>">SetIndFirstLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/setindleft") %>">SetIndLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/setindright") %>">SetIndRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/setjc") %>">SetJc</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/setspacingafter") %>">SetSpacingAfter</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/setspacingbefore") %>">SetSpacingBefore</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/setspacingline") %>">SetSpacingLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparagraph/settabs") %>">SetTabs</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apiparapr") %>">ApiParaPr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/setbullet") %>">SetBullet</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/setindfirstline") %>">SetIndFirstLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/setindleft") %>">SetIndLeft</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/setindright") %>">SetIndRight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/setjc") %>">SetJc</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/setspacingafter") %>">SetSpacingAfter</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/setspacingbefore") %>">SetSpacingBefore</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/setspacingline") %>">SetSpacingLine</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiparapr/settabs") %>">SetTabs</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apipresentation") %>">ApiPresentation</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apipresentation/addslide") %>">AddSlide</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apipresentation/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apipresentation/getcurslideindex") %>">GetCurSlideIndex</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apipresentation/getcurrentslide") %>">GetCurrentSlide</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apipresentation/getslidebyindex") %>">GetSlideByIndex</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apipresentation/setsizes") %>">SetSizes</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apipresetcolor") %>">ApiPresetColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apipresetcolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apirgbcolor") %>">ApiRGBColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirgbcolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apirun") %>">ApiRun</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/addlinebreak") %>">AddLineBreak</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/addtabstop") %>">AddTabStop</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/addtext") %>">AddText</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/clearcontent") %>">ClearContent</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/gettextpr") %>">GetTextPr</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setbold") %>">SetBold</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setcaps") %>">SetCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setdoublestrikeout") %>">SetDoubleStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setfill") %>">SetFill</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setfontfamily") %>">SetFontFamily</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setfontsize") %>">SetFontSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setitalic") %>">SetItalic</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setsmallcaps") %>">SetSmallCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setspacing") %>">SetSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setstrikeout") %>">SetStrikeout</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setunderline") %>">SetUnderline</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apirun/setvertalign") %>">SetVertAlign</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apischemecolor") %>">ApiSchemeColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apischemecolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apishape") %>">ApiShape</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apishape/getclasstype") %>">GetClassType</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("presentationapi/apishape/getdoccontent") %>">GetDocContent</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("presentationapi/apishape/setverticaltextalign") %>">SetVerticalTextAlign</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apislide") %>">ApiSlide</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apislide/addobject") %>">AddObject</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apislide/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apislide/getheight") %>">GetHeight</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apislide/getwidth") %>">GetWidth</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apislide/removeallobjects") %>">RemoveAllObjects</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apislide/setbackground") %>">SetBackground</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apistroke") %>">ApiStroke</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apistroke/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apitextpr") %>">ApiTextPr</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/getclasstype") %>">GetClassType</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setbold") %>">SetBold</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setcaps") %>">SetCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setdoublestrikeout") %>">SetDoubleStrikeout</a>
                    </li>   
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setfill") %>">SetFill</a>
                    </li>   
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setfontfamily") %>">SetFontFamily</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setfontsize") %>">SetFontSize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setitalic") %>">SetItalic</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setsmallcaps") %>">SetSmallCaps</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setspacing") %>">SetSpacing</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setstrikeout") %>">SetStrikeout</a>
                    </li> 
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setunderline") %>">SetUnderline</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apitextpr/setvertalign") %>">SetVertAlign</a>
                    </li>             
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("presentationapi/apiunicolor") %>">ApiUniColor</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("presentationapi/apiunicolor/getclasstype") %>">GetClassType</a>
                    </li>
                </ul>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("global") %>">Global</a>
    </li>
    <li>
        <a href="<%= Url.Action("classlist") %>">List of classes</a>
    </li>
</ul>
