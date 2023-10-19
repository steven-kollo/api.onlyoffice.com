using docbuilder_net;

using OfficeFileTypes = docbuilder_net.FileTypes;
using CValue = docbuilder_net.CDocBuilderValue;
using CContext = docbuilder_net.CDocBuilderContext;
using CContextScope = docbuilder_net.CDocBuilderContextScope;

namespace Sample
{
    public class FillingSpreadsheet
    {
        public static void Main(string[] args)
        {
            string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
            string resultPath = "../../../../FilledSpreadsheet.xlsx";
            object[,] data = {
                { "Id", "Product", "Price", "Available"},
                { 1001, "Item A", 12.2, true },
                { 1002, "Item B", 18.8, true },
                { 1003, "Item C", 70.1, false },
                { 1004, "Item D", 60.6, true },
                { 1005, "Item E", 32.6, true },
                { 1006, "Item F", 28.3, false },
                { 1007, "Item G", 11.1, false },
                { 1008, "Item H", 41.4, true }
            };
        // add Docbuilder dlls in path
        System.Environment.SetEnvironmentVariable("PATH", System.Environment.GetEnvironmentVariable("PATH") + ";" + workDirectory);

            FillSpreadsheet(workDirectory, resultPath, data);
        }

        public static void FillSpreadsheet(string workDirectory, string resultPath, object[,] data)
        {
            var doctype = (int)OfficeFileTypes.Spreadsheet.XLSX;

            // Init DocBuilder
            CDocBuilder.Initialize(workDirectory);
            CDocBuilder oBuilder = new CDocBuilder();

            oBuilder.CreateFile(doctype);
            CContext oContext = oBuilder.GetContext();
            CContextScope oScope = oContext.CreateScope();
            CValue oGlobal = oContext.GetGlobal();
            CValue oApi = oGlobal["Api"];
            CValue oWorksheet = oApi.Call("GetActiveSheet");

            // pass data
            CValue oArray = TwoDimArrayToCValue(data, oContext);
            // First cell in the range (A1) is equal to (0,0)
            CValue startCell = oWorksheet.Call("GetRangeByNumber", 0, 0);
            // Last cell in the range is equal to array length -1
            CValue endCell = oWorksheet.Call("GetRangeByNumber", oArray.GetLength() - 1, oArray[0].GetLength() - 1);
            oWorksheet.Call("GetRange", startCell, endCell).Call("SetValue", oArray);


            // Save file and close DocBuilder
            oBuilder.SaveFile(doctype, resultPath);
            oBuilder.CloseFile();
            CDocBuilder.Destroy();
        }
        public static CValue TwoDimArrayToCValue(object[,] data, CContext oContext)
        {
            int rowsLen = data.GetLength(0);
            int colsLen = data.GetLength(1);
            CValue oArray = oContext.CreateArray(rowsLen);

            for (int row = 0; row < rowsLen; row++)
            {
                CValue oArrayCol = oContext.CreateArray(colsLen);

                for (int col = 0; col < colsLen; col++)
                {
                    oArrayCol[col] = data[row, col].ToString();
                }
                oArray[row] = oArrayCol;
            }
            return oArray;
        }
    }
}