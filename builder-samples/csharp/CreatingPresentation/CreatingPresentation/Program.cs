using docbuilder_net;

using OfficeFileTypes = docbuilder_net.FileTypes;
using CValue = docbuilder_net.CDocBuilderValue;
using CContext = docbuilder_net.CDocBuilderContext;
using CContextScope = docbuilder_net.CDocBuilderContextScope;

namespace Sample
{
    public class CreatingPresentation
    {
        public static void Main(string[] args)
        {
            string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
            string resultPath = "../../../../Presentation.pptx";

            IDictionary<string, string> slideImages = new Dictionary<string, string>() {
                { "gun", "https://api.onlyoffice.com/content/img/docbuilder/examples/presentation_gun.png" },
                { "axe","https://api.onlyoffice.com/content/img/docbuilder/examples/presentation_axe.png" },
                { "knight", "https://api.onlyoffice.com/content/img/docbuilder/examples/presentation_knight.png" },
                { "sky","https://api.onlyoffice.com/content/img/docbuilder/examples/presentation_sky.png" }
            };
        // add Docbuilder dlls in path
        System.Environment.SetEnvironmentVariable("PATH", System.Environment.GetEnvironmentVariable("PATH") + ";" + workDirectory);

            CreatePresentation(workDirectory, resultPath, slideImages);
        }

        public static void CreatePresentation(string workDirectory, string resultPath, IDictionary<string, string> slideImages)
        {
            var doctype = (int)OfficeFileTypes.Presentation.PPTX;

            // Init DocBuilder
            CDocBuilder.Initialize(workDirectory);
            CDocBuilder oBuilder = new CDocBuilder();

            // Create presentation
            oBuilder.CreateFile(doctype);
            CContext oContext = oBuilder.GetContext();
            CContextScope oScope = oContext.CreateScope();
            CValue oGlobal = oContext.GetGlobal();
            CValue oApi = oGlobal["Api"];
            CValue oPresentation = oApi.Call("GetPresentation");
            oPresentation.Call("SetSizes", 9144000, 6858000);

            CValue oSlide = createImageSlide(oApi, oPresentation, slideImages["gun"]);
            oPresentation.Call("GetSlideByIndex", 0).Call("Delete");

            CValue oShape = oApi.Call("CreateShape", "rect", 8056800, 3020400, oApi.Call("CreateNoFill"), oApi.Call("CreateStroke", 0, oApi.Call("CreateNoFill")));
            oShape.Call("SetPosition", 608400, 1267200);
            CValue oContent = oShape.Call("GetDocContent");
            oContent.Call("RemoveAllElements");
            addTextToSlideShape(oApi, oContent, "How They", 160, true, "left");
            addTextToSlideShape(oApi, oContent, "Throw Out", 132, false, "left");
            addTextToSlideShape(oApi, oContent, "a Challenge", 132, false, "left");
            oSlide.Call("AddObject", oShape);

            oSlide = createImageSlide(oApi, oPresentation, slideImages["axe"]);

            oShape = oApi.Call("CreateShape", "rect", 6904800, 1724400, oApi.Call("CreateNoFill"), oApi.Call("CreateStroke", 0, oApi.Call("CreateNoFill")));
            oShape.Call("SetPosition", 1764000, 1191600);
            oContent = oShape.Call("GetDocContent");
            oContent.Call("RemoveAllElements");
            addTextToSlideShape(oApi, oContent, "American Indians ", 110, true, "right");
            addTextToSlideShape(oApi, oContent, "(XVII century)", 94, false, "right");
            oSlide.Call("AddObject", oShape);

            oShape = oApi.Call("CreateShape", "rect", 4986000, 2419200, oApi.Call("CreateNoFill"), oApi.Call("CreateStroke", 0, oApi.Call("CreateNoFill")));
            oShape.Call("SetPosition", 3834000, 3888000);
            oContent = oShape.Call("GetDocContent");
            oContent.Call("RemoveAllElements");
            addTextToSlideShape(oApi, oContent, "put a tomahawk on the ground in the ", 84, false, "right");
            addTextToSlideShape(oApi, oContent, "rival's camp", 84, false, "right");
            oSlide.Call("AddObject", oShape);

            oSlide = createImageSlide(oApi, oPresentation, slideImages["knight"]);

            oShape = oApi.Call("CreateShape", "rect", 6904800, 1724400, oApi.Call("CreateNoFill"), oApi.Call("CreateStroke", 0, oApi.Call("CreateNoFill")));
            oShape.Call("SetPosition", 1764000, 1191600);
            oContent = oShape.Call("GetDocContent");
            oContent.Call("RemoveAllElements");
            addTextToSlideShape(oApi, oContent, "European Knights", 110, true, "right");
            addTextToSlideShape(oApi, oContent, " (XII-XVI centuries)", 94, false, "right");
            oSlide.Call("AddObject", oShape);

            oShape = oApi.Call("CreateShape", "rect", 4986000, 2419200, oApi.Call("CreateNoFill"), oApi.Call("CreateStroke", 0, oApi.Call("CreateNoFill")));
            oShape.Call("SetPosition", 3834000, 3888000);
            oContent = oShape.Call("GetDocContent");
            oContent.Call("RemoveAllElements");
            addTextToSlideShape(oApi, oContent, "threw a glove", 84, false, "right");
            addTextToSlideShape(oApi, oContent, "in the rival's face", 84, false, "right");
            oSlide.Call("AddObject", oShape);

            oSlide = createImageSlide(oApi, oPresentation, slideImages["sky"]);

            oShape = oApi.Call("CreateShape", "rect", 7887600, 3063600, oApi.Call("CreateNoFill"), oApi.Call("CreateStroke", 0, oApi.Call("CreateNoFill")));
            oShape.Call("SetPosition", 630000, 1357200);
            oContent = oShape.Call("GetDocContent");
            oContent.Call("RemoveAllElements");
            addTextToSlideShape(oApi, oContent, "OnlyOffice", 176, false, "center");
            addTextToSlideShape(oApi, oContent, "stands for Peace", 132, false, "center");
            oSlide.Call("AddObject", oShape);

            // Save file and close DocBuilder
            oBuilder.SaveFile(doctype, resultPath);
            oBuilder.CloseFile();
            CDocBuilder.Destroy();
        }

        public static CValue createImageSlide(CValue oApi, CValue oPresentation, string image_url)
        {
            CValue oSlide = oApi.Call("CreateSlide");
            oPresentation.Call("AddSlide", oSlide);
            var oFill = oApi.Call("CreateBlipFill", image_url, "stretch");
            oSlide.Call("SetBackground", oFill);
            oSlide.Call("RemoveAllObjects");
            return oSlide;
        }
        public static void addTextToSlideShape(CValue oApi, CValue oContent, string text, int fontSize, bool isBold, string js)
        {
            var oParagraph = oApi.Call("CreateParagraph");
            oParagraph.Call("SetSpacingBefore", 0);
            oParagraph.Call("SetSpacingAfter", 0);
            oContent.Call("Push", oParagraph);
            var oRun = oParagraph.Call("AddText", text);
            oRun.Call("SetFill", oApi.Call("CreateSolidFill", oApi.Call("CreateRGBColor", 0xff, 0xff, 0xff)));
            oRun.Call("SetFontSize", fontSize);
            oRun.Call("SetFontFamily", "Georgia");
            oRun.Call("SetBold", isBold);
            oParagraph.Call("SetJc", js);
        }
    }
}