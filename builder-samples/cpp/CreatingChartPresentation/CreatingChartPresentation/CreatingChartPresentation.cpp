#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/common.h"
#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/docbuilder.h"
#pragma comment(lib, "C:/Program Files/ONLYOFFICE/DocumentBuilder/doctrenderer.lib")

#include<map>
#include <string>
#include <iostream>
#include <vector> 
using namespace std;
using namespace NSDoctRenderer;

// Helper functions
string cValueToString(CValue value)
{
    wchar_t* txt = value.ToString().c_str();
    wstring ws(txt);
    string str(ws.begin(), ws.end());
    return str;
}

void addText(CValue oApi, int fontSize, string text, CValue oSlide, CValue oShape, CValue oParagraph, CValue oFill, string jc)
{
    CValue oRun = oApi.Call("CreateRun");
    CValue oTextPr = oRun.Call("GetTextPr");
    oTextPr.Call("SetFontSize", fontSize);
    oTextPr.Call("SetFill", oFill);
    oTextPr.Call("SetFontFamily", "Tahoma");
    oParagraph.Call("SetJc", jc.c_str());
    oRun.Call("AddText", text.c_str());
    oRun.Call("AddLineBreak");
    oParagraph.Call("AddElement", oRun);
    oSlide.Call("AddObject", oShape);
}

// Main function
int main(int argc, char* argv[])
{

    // Init DocBuilder
    CDocBuilder::Initialize(L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder");
    CDocBuilder oBuilder;
    oBuilder.SetProperty("--work-directory", L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder");
   
    // Read chart data from xlsx
    oBuilder.OpenFile(L"../ChartData.xlsx", L"");
    CContext oContext = oBuilder.GetContext();
    CContextScope oScope = oContext.CreateScope();
    CValue oGlobal = oContext.GetGlobal();
    CValue oApi = oGlobal["Api"];
    CValue oWorksheet = oApi.Call("GetActiveSheet");
    CValue values = oWorksheet.Call("GetUsedRange").Call("GetValue");
  
    int sizeX = values.GetLength();
    int sizeY = values[0].GetLength();
    vector<vector<string>> data(sizeX, vector<string>(sizeY, ""));
    for (int i = 0; i < sizeX; i++)
    {
        for (int j = 0; j < sizeY; j++)
        {
            data[i][j] = cValueToString(values[i][j]);
        }
    }
    oBuilder.CloseFile();

    // Create chart presentation
    oBuilder.CreateFile(OFFICESTUDIO_FILE_PRESENTATION_PPTX);
    oContext = oBuilder.GetContext();
    oScope = oContext.CreateScope();
    oGlobal = oContext.GetGlobal();
    oApi = oGlobal["Api"];
    CValue oPresentation = oApi.Call("GetPresentation");
    CValue oSlide = oPresentation.Call("GetSlideByIndex", 0);
    oSlide.Call("RemoveAllObjects");

    CValue oRGBColor = oApi.Call("CreateRGBColor", 255, 244, 240);
    CValue oFill = oApi.Call("CreateSolidFill", oRGBColor);
    oSlide.Call("SetBackground", oFill);

    CValue oStroke = oApi.Call("CreateStroke", 0, oApi.Call("CreateNoFill"));
    CValue oShapeTitle = oApi.Call("CreateShape", "rect", 300 * 36000, 20 * 36000, oApi.Call("CreateNoFill"), oStroke);
    CValue oShapeText = oApi.Call("CreateShape", "rect", 120 * 36000, 80 * 36000, oApi.Call("CreateNoFill"), oStroke);
    oShapeTitle.Call("SetPosition", 20 * 36000, 20 * 36000);
    oShapeText.Call("SetPosition", 210 * 36000, 50 * 36000);
    CValue oParagraphTitle = oShapeTitle.Call("GetDocContent").Call("GetElement", 0);
    CValue oParagraphText = oShapeText.Call("GetDocContent").Call("GetElement", 0);
    oRGBColor = oApi.Call("CreateRGBColor", 115, 81, 68);
    oFill = oApi.Call("CreateSolidFill", oRGBColor);

    string titleContent = "Price Type Report";
    string textContent = "This is an overview of price types. As we can see, May was the price peak, but even in June the price went down, the annual upward trend persists.";
    addText(oApi, 80, titleContent, oSlide, oShapeTitle, oParagraphTitle, oFill, "center");
    addText(oApi, 42, textContent, oSlide, oShapeText, oParagraphText, oFill, "left");

    // Transform 2d array into cols names, rows names and data
    CValue cols = oContext.CreateArray(sizeY - 1);
    for (int col = 1; col < sizeY; col++)
    {
        cols[col - 1] = data[0][col].c_str();
    }

    CValue rows = oContext.CreateArray(sizeX - 1);
    for (int row = 1; row < sizeX; row++)
    {
        rows[row - 1] = data[row][0].c_str();
    }

    CValue vals = oContext.CreateArray(sizeY - 1);
    for (int row = 1; row < sizeY; row++)
    {
        CValue row_data = oContext.CreateArray(sizeX - 1);
        for (int col = 1; col < sizeX; col++)
        {
            row_data[col - 1] = data[col][row].c_str();
        }
        vals[row - 1] = row_data;
    }

    // Pass CValue data to the CreateChart method
    CValue oChart = oApi.Call("CreateChart", "lineStacked", vals, cols, rows);
    oChart.Call("SetSize", 180 * 36000, 100 * 36000);
    oChart.Call("SetPosition", 20 * 36000, 50 * 36000);
    oChart.Call("ApplyChartStyle", 24);
    oChart.Call("SetVertAxisLabelsFontSize", 16);
    oChart.Call("SetHorAxisLabelsFontSize", 16);
    oChart.Call("SetLegendFontSize", 16);
    oChart.Call("SetLegendPos", "top");
    oSlide.Call("AddObject", oChart);

    // Save and close
    oBuilder.SaveFile(OFFICESTUDIO_FILE_PRESENTATION_PPTX, L"../result.pptx");
    oBuilder.CloseFile();
    CDocBuilder::Dispose();
    return 0;
}
