#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/common.h"
#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/docbuilder.h"
#pragma comment(lib, "C:/Program Files/ONLYOFFICE/DocumentBuilder/doctrenderer.lib")

#include<map>
#include <string>
#include <iostream>

using namespace std;
using namespace NSDoctRenderer;

// Main function
int main(int argc, char* argv[])
{
    string data[9][4] = {
        { "Id", "Product", "Price", "Available" },
        { "1001", "Item A", "12.2", "true" },
        { "1002", "Item B", "18.8", "true" },
        { "1003", "Item C", "70.1", "false" },
        { "1004", "Item D", "60.6", "true" },
        { "1005", "Item E", "32.6", "true" },
        { "1006", "Item F", "28.3", "false" },
        { "1007", "Item G", "11.1", "false" },
        { "1008", "Item H", "41.4", "true" }
    };

    // Init DocBuilder
    CDocBuilder::Initialize(L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder");
    CDocBuilder oBuilder;
    oBuilder.SetProperty("--work-directory", L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder");
    oBuilder.CreateFile(OFFICESTUDIO_FILE_SPREADSHEET_XLSX);

    CContext oContext = oBuilder.GetContext();
    CContextScope oScope = oContext.CreateScope();
    CValue oGlobal = oContext.GetGlobal();
    CValue oApi = oGlobal["Api"];

    // Find and comment formula errors
    CValue oWorksheet = oApi.Call("GetActiveSheet");
    
    // Create CValue array from data
    int rowsLen = sizeof data / sizeof data[0];
    int colsLen = sizeof data[0] / sizeof(string);
    CValue oArray = oContext.CreateArray(rowsLen);

    for (int row = 0; row < rowsLen; row++)
    {
        CValue oArrayCol = oContext.CreateArray(colsLen);

        for (int col = 0; col < colsLen; col++)
        {
            oArrayCol[col] = data[row][col].c_str();
        }
        oArray[row] = oArrayCol;
    }

    // First cell in the range (A1) is equal to (0,0)
    CValue startCell = oWorksheet.Call("GetRangeByNumber", 0, 0);

    // Last cell in the range is equal to array length -1
    CValue endCell = oWorksheet.Call("GetRangeByNumber", oArray.GetLength() - 1, oArray[0].GetLength() - 1);
    oWorksheet.Call("GetRange", startCell, endCell).Call("SetValue", oArray);

    // Save and close
    oBuilder.SaveFile(OFFICESTUDIO_FILE_SPREADSHEET_XLSX, L"../result.xlsx");
    oBuilder.CloseFile();
    CDocBuilder::Dispose();
    return 0;
}
