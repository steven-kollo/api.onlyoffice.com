<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ONLYOFFICE Document Builder integration API</span>
</h1>

<p class="dscr">When you integrate <b>ONLYOFFICE Document Builder</b> into your own application, there are two ways this can be done:</p>
<ol>
    <li>
        <p>In case your application is a C++ one, you can embed the code for <b>ONLYOFFICE Document Builder</b> together with the script code for the document files to be created into your application. In this case you will need to recompile your application each time anything is to be changed in the output document files. This option is good when you need a faster native application and you are sure that the resulting document files will always stay the same or will only be changed when you recompile your application anyway.</p>
        <p>For the integration of <b>ONLYOFFICE Document Builder</b> into any application, the C++ <b>doctrenderer</b> library is used. The current application version contains two main classes for the <b>doctrenderer</b> library:</p>
        <ul>
            <li>
             CDoctrenderer class - used by <b>ONLYOFFICE Document Builder</b> in the file conversion process.
            </li>
            <li>
            <a href="<%= Url.Action("cdocbuilder") %>">CDocBuilder</a> class - used by <b>ONLYOFFICE Document Builder</b> for the document file (text document, spreadsheet, PDF) to be generated.
            </li>
         </ul>
        <p>Visit the <a href="<%= Url.Action("cdocbuilder") %>">CDocBuilder</a> class section to find out more about the methods used for the <b>ONLYOFFICE Document Builder</b> integration using this option and for the C++ example.</p>
     </li>
     <li>
        <p>If you are going to use <b>ONLYOFFICE Document Builder</b> with an application written in any other programming language, the second option is recommended: to run <b>ONLYOFFICE Document Builder</b> executable from your application and use the <b>.docbuilder</b> script file for the document to be created as a parameter to it. It is much more flexible and allows to change the document script files (especially if there are more than one of them) independently of your application in future. You will only need to recompile your application if you need to add more document script files to it.</p>
        <p>To launch <b>ONLYOFFICE Document Builder</b> using the second option run the following command:</p>
        <pre>
docbuilder.exe mydocument.docbuilder
        </pre>
        <p>Visit the <a href="<%= Url.Action("usingdocbuilderfile") %>">.docbuilder</a> file section for more information about the file structure and rules used when creating it.</p>
    </li>
</ol>
<p>See the examples in some of the most popular programming languages at this page. More examples will be available there with the nearest <b>ONLYOFFICE Document Builder</b> API documentation website update.</p>
