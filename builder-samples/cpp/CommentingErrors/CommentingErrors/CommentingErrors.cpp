#include<map>
#include <string>
#include <iostream>
#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/common.h"
#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/docbuilder.h"
#pragma comment(lib, "C:/Program Files/ONLYOFFICE/DocumentBuilder/doctrenderer.lib")
using namespace std;
using namespace NSDoctRenderer;

const wchar_t* workDir = L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder";
const wchar_t* templatePath = L"../SpreadsheetWithErrors.xlsx";
const wchar_t* resultPath = L"../result.xlsx";

// Helper functions
string cValueToString(CValue value)
{
    wchar_t* txt = value.ToString().c_str();
    wstring ws(txt);
    string str(ws.begin(), ws.end());
    return str;
}

void CheckCell(CValue oWorksheet, string cell, int row, int col)
{
    if (cell.find("#") != std::string::npos)
    {
        string comment = "Error" + cell;
        CValue errorCell = oWorksheet.Call("GetRangeByNumber", row, col);
        errorCell.Call("AddComment", comment.c_str());
    }
}

// Main function
int main(int argc, char* argv[])
{
    // Init DocBuilder
    CDocBuilder::Initialize(workDir);
    CDocBuilder oBuilder;
    oBuilder.SetProperty("--work-directory", workDir);
    
    // Open file and get context
    oBuilder.OpenFile(templatePath, L"");
    CContext oContext = oBuilder.GetContext();
    CContextScope oScope = oContext.CreateScope();
    CValue oGlobal = oContext.GetGlobal();
    CValue oApi = oGlobal["Api"];

    // Find and comment formula errors
    CValue oWorksheet = oApi.Call("GetActiveSheet");
    CValue oRange = oWorksheet.Call("GetUsedRange");
    CValue data = oRange.Call("GetValue");
 
    for (int row = 0; row < data.GetLength(); row++)
    {
        for (int col = 0; col < data[0].GetLength(); col++)
        {
            CheckCell(oWorksheet, cValueToString(data[row][col]), row, col);
        }
    }

    // Save and close
    oBuilder.SaveFile(OFFICESTUDIO_FILE_SPREADSHEET_XLSX, resultPath);
    oBuilder.CloseFile();
    CDocBuilder::Dispose();
    return 0;
}
