using docbuilder_net;

using OfficeFileTypes = docbuilder_net.FileTypes;
using CValue = docbuilder_net.CDocBuilderValue;
using CContext = docbuilder_net.CDocBuilderContext;
using CContextScope = docbuilder_net.CDocBuilderContextScope;

namespace Sample
{
    public class CommentingErrors
    {
        public static void Main(string[] args)
        {
            string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
            string resultPath = "../../../../CommentedErrors.xlsx";
            string filePath = "../../../../SpreadsheetWithErrors.xlsx";
            // add Docbuilder dlls in path
            System.Environment.SetEnvironmentVariable("PATH", System.Environment.GetEnvironmentVariable("PATH") + ";" + workDirectory);

            CommentErrors(workDirectory, resultPath, filePath);
        }

        public static void CommentErrors(string workDirectory, string resultPath, string filePath)
        {
            var doctype = (int)OfficeFileTypes.Spreadsheet.XLSX;

            // Init DocBuilder
            CDocBuilder.Initialize(workDirectory);
            CDocBuilder oBuilder = new CDocBuilder();

            oBuilder.OpenFile(filePath, "xlsx");
            CContext oContext = oBuilder.GetContext();
            CContextScope oScope = oContext.CreateScope();
            CValue oGlobal = oContext.GetGlobal();
            CValue oApi = oGlobal["Api"];

            // Find and comment formula errors
            CValue oWorksheet = oApi.Call("GetActiveSheet");
            CValue oRange = oWorksheet.Call("GetUsedRange");
            var data = oRange.Call("GetValue");

            for (int row = 0; row < data.GetLength(); row++)
            {
                for (int col = 0; col < data[0].GetLength(); col++)
                {
                    CheckCell(oWorksheet, data[row][col].ToString(), row, col);
                }
            }

            // Save file and close DocBuilder
            oBuilder.SaveFile(doctype, resultPath);
            oBuilder.CloseFile();
            CDocBuilder.Destroy();
        }
        public static void CheckCell(CValue oWorksheet, string cell, int row, int col)
        {
            if (cell.Contains("#"))
            {
                string comment = "Error" + cell;
                CValue errorCell = oWorksheet.Call("GetRangeByNumber", row, col);
                errorCell.Call("AddComment", comment);
            }
        }
    }
}