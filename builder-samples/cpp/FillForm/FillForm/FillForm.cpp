#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/common.h"
#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/docbuilder.h"
#pragma comment(lib, "C:/Program Files/ONLYOFFICE/DocumentBuilder/doctrenderer.lib")

#include<map>
#include <string>
#include <iostream>

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

// Main function
int main(int argc, char* argv[])
{
    std::map<string, string> formData;
    formData["Photo"] = "https://github.com/steven-kollo/docbuilder_examples/blob/main/Templates/blue_cloud.png?raw=true";
    formData["Serial"] = "A1345";
    formData["Company Name"] = "Blue Cloud";
    formData["Date"] = "25.12.2023";
    formData["Recipient"] = "Space Corporation";
    formData["Qty1"] = "25";
    formData["Description1"] = "Frame";
    formData["Qty2"] = "2";
    formData["Description2"] = "Stack";
    formData["Qty3"] = "34";
    formData["Description3"] = "Shifter";

    // Init DocBuilder
    CDocBuilder::Initialize(L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder");
    CDocBuilder oBuilder;
    oBuilder.SetProperty("--work-directory", L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder");
    oBuilder.OpenFile(L"../Form.docx", L"");

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
        string type = cValueToString(aForms[formNum].Call("GetFormType"));
        string value = formData[cValueToString(aForms[formNum].Call("GetFormKey"))];
        if (type == "textForm") form.Call("SetText", value.c_str());
        if (type == "pictureForm") form.Call("SetImage", value.c_str());
        formNum++;
    }

    // Save and close
    oBuilder.SaveFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX, L"../result.docx");
    oBuilder.CloseFile();
    CDocBuilder::Dispose();
    return 0;
}
