builder.CreateFile("xlsx");                      // create a spreadsheet file in the .xlsx format with ONLYOFFICE Document Builder
var oWorksheet = Api.GetActiveSheet();           // create a new 'oWorksheet' variable and get the created spreadsheet contents
oWorksheet.SetName("sheet 1");                   // set the 'sheet 1' name for the current active sheet
oWorksheet.SetColumnWidth(0, 20);                // set the width of the first column to 140 pixels
oWorksheet.GetRange("A1").SetValue("New cell");  // set the 'New cell' value to the A1 spreadsheet cell
builder.SaveFile("xlsx", "example.xlsx");        // save the resulting spreadsheet as a file in the .xlsx format with a new 'example.xlsx' name
builder.CloseFile();                             // close the spreadsheet file and finish work with ONLYOFFICE Document Builder
