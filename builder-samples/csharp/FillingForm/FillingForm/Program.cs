using docbuilder_net;

using OfficeFileTypes = docbuilder_net.FileTypes;
using CValue = docbuilder_net.CDocBuilderValue;
using CContext = docbuilder_net.CDocBuilderContext;
using CContextScope = docbuilder_net.CDocBuilderContextScope;

namespace Sample
{
    public class FillingForm
    {
        public static void Main(string[] args)
        {
            string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
            string filePath = "../../../../SampleForm.oform";
            string resultPath = "../../../../FilledForm.oform";

            IDictionary<string, string> formData = new Dictionary<string, string>() {
                { "Photo", "https://api.onlyoffice.com/content/img/docbuilder/examples/blue_cloud.png" },
                { "Serial","A1345" },
                { "Company Name", "Blue Cloud" },
                { "Date", "25.12.2023" },
                { "Recipient", "Space Corporation" },
                { "Qty1", "25" },
                { "Description1", "Frame" },
                { "Qty2", "2" },
                { "Description2", "Stack" },
                { "Qty3", "34" },
                { "Description3", "Shifter" }
            };
            // add Docbuilder dlls in path
            System.Environment.SetEnvironmentVariable("PATH", System.Environment.GetEnvironmentVariable("PATH") + ";" + workDirectory);

            FillForm(workDirectory, resultPath, filePath, formData);
        }
        
        public static void FillForm(string workDirectory, string resultPath, string filePath, IDictionary<string, string> formData)
        {
            var doctype = (int)OfficeFileTypes.Document.DOCX;

            // Init DocBuilder
            CDocBuilder.Initialize(workDirectory);
            CDocBuilder oBuilder = new CDocBuilder();
            oBuilder.OpenFile(filePath, "oform");

            CContext oContext = oBuilder.GetContext();
            CContextScope oScope = oContext.CreateScope();
            CValue oGlobal = oContext.GetGlobal();
            CValue oApi = oGlobal["Api"];

            // Fill form
            CValue oDocument = oApi.Call("GetDocument");
            CValue aForms = oDocument.Call("GetAllForms");
            int formNum = 0;
            while (formNum < aForms.GetLength())
            {
                CValue form = aForms[formNum];
                string type = form.Call("GetFormType").ToString();
                string value;
                try
                {
                    value = formData[form.Call("GetFormKey").ToString()];
                }
                catch (Exception e)
                {
                    value = "";
                }
                if (type == "textForm") form.Call("SetText", value);
                if (type == "pictureForm") form.Call("SetImage", value);
                formNum++;
            }

            // Save file and close DocBuilder
            oBuilder.SaveFile(doctype, resultPath);
            oBuilder.CloseFile();

            CDocBuilder.Destroy();
        }
       
        
    }

}