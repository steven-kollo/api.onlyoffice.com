#include <string>
#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/common.h"
#include "C:/Program Files/ONLYOFFICE/DocumentBuilder/include/docbuilder.h"
#pragma comment(lib, "C:/Program Files/ONLYOFFICE/DocumentBuilder/doctrenderer.lib")

using namespace NSDoctRenderer;

// Helper functions
void setPictureFormProperties(CValue oPictureForm, std::string key, std::string tip, bool required, std::string placeholder, std::string scaleFlag, bool lockAspectRatio, bool respectBorders, int shiftX, int shiftY, std::string imageUrl)
        {
            oPictureForm.Call("SetFormKey", key.c_str());
            oPictureForm.Call("SetTipText", tip.c_str());
            oPictureForm.Call("SetRequired", required);
            oPictureForm.Call("SetPlaceholderText", placeholder.c_str());
            oPictureForm.Call("SetScaleFlag", scaleFlag.c_str());
            oPictureForm.Call("SetLockAspectRatio", lockAspectRatio);
            oPictureForm.Call("SetRespectBorders", respectBorders);
            oPictureForm.Call("SetPicturePosition", shiftX, shiftY);
            oPictureForm.Call("SetImage", imageUrl.c_str());
        }
void setTextFormProperties(CValue oTextForm, std::string key, std::string tip, bool required, std::string placeholder, bool comb, int maxCharacters, int cellWidth, bool multiLine, bool autoFit)
        {
            oTextForm.Call("SetFormKey", key.c_str());
            oTextForm.Call("SetTipText", tip.c_str());
            oTextForm.Call("SetRequired", required);
            oTextForm.Call("SetPlaceholderText", placeholder.c_str());
            oTextForm.Call("SetComb", comb);
            oTextForm.Call("SetCharactersLimit", maxCharacters);
            oTextForm.Call("SetCellWidth", cellWidth);
            oTextForm.Call("SetCellWidth", multiLine);
            oTextForm.Call("SetMultiline", autoFit);
        }

// Main function
int main(int argc, char* argv[])
{
    // Init DocBuilder
    CDocBuilder::Initialize(L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder");
    CDocBuilder oBuilder;
    oBuilder.SetProperty("--work-directory", L"C:\\Program Files\\ONLYOFFICE\\DocumentBuilder");
    oBuilder.CreateFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX);

    CContext oContext = oBuilder.GetContext();
    CContextScope oScope = oContext.CreateScope();
    CValue oGlobal = oContext.GetGlobal();
    CValue oApi = oGlobal["Api"];

    // Create basic form
    CValue oDocument = oApi.Call("GetDocument");
    CValue oParagraph = oDocument.Call("GetElement", 0);
    CValue oHeadingStyle = oDocument.Call("GetStyle", "Heading 3");

    oParagraph.Call("AddText", "Employee pass card");
    oParagraph.Call("SetStyle", oHeadingStyle);
    oDocument.Call("Push", oParagraph);

    CValue oPictureForm = oApi.Call("CreatePictureForm");
    setPictureFormProperties(oPictureForm, "Photo", "Upload your photo", false, "Photo", "tooBig", true, false, 50, 50, "https://api.onlyoffice.com/content/img/docbuilder/examples/user-profile.png");
    oParagraph = oApi.Call("CreateParagraph");
    oParagraph.Call("AddElement", oPictureForm);
    oDocument.Call("Push", oParagraph);

    CValue oTextForm = oApi.Call("CreateTextForm");
    setTextFormProperties(oTextForm, "First name", "Enter your first name", false, "First name", true, 13, 3, false, false);
    oParagraph = oApi.Call("CreateParagraph");
    oParagraph.Call("AddElement", oTextForm);
    oDocument.Call("Push", oParagraph);

    // Save and close
    oBuilder.SaveFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX, L"../result.docx");
    oBuilder.CloseFile();
    CDocBuilder::Dispose();
    return 0;
}
