/*
report 50002 "Import Activity Lines"
{
    Caption = 'Import Activity Lines';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Integer; Integer)
        {

            trigger OnAfterGetRecord()
            begin
                ImportSheet(Number);
            end;

            trigger OnPostDataItem()
            begin
                ExcelBuf.DELETEALL;
                MESSAGE('Import Data');
            end;

            trigger OnPreDataItem()
            var


            begin
         
                ExcelBuf.OpenBook(ServerFileName, SheetName);
                ExcelBuf.ReadSheet;
                SETRANGE(Number, 2, ExcelBuf.COUNT);
              
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
            }
        }

        actions
        {
            area(processing)
            {
            }
        }

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        var
            FileMgt: Codeunit 419;
        begin

            
                        IF CloseAction = ACTION::OK THEN BEGIN
                            ServerFileName := FileMgt.UploadFile(Text006, ExcelFileExtensionTok);
                            IF ServerFileName = '' THEN
                                EXIT(FALSE);

                            SheetName := ExcelBuf.SelectSheetsName(ServerFileName);
                            IF SheetName = '' THEN
                                EXIT(FALSE);

                        END;
                        


          
        end;
    }

    labels
    {
    }

    var
        IStream: InStream;
        FileMgt: Codeunit 419;
        ServerFileName: Text;
        Text006: Label 'Import Excel File';
        ExcelFileExtensionTok: Label '.xlsx';
        SheetName: Text[250];
        ExcelBuf: Record 370;
        ColText1: array[11] of Text[250];
        LineNo: Code[10];
        GlobalJobNo: Code[20];
        GlobalJobaskNo: Code[20];
        RecJobTask: Record 1001;
        RecJob: Record 167;


    procedure ImportSheet(RowNum: Integer)
    begin

        CLEAR(ColText1);

        ExcelBuf.SETRANGE(ExcelBuf."Row No.", RowNum);
        IF ExcelBuf.FINDSET THEN
            REPEAT
                ColText1[ExcelBuf."Column No."] := ExcelBuf."Cell Value as Text";
            UNTIL ExcelBuf.NEXT = 0;


        IF ColText1[1] <> '' THEN BEGIN
            //IF SheetName = 'Activity Lines' THEN
            LineNo := GetEntryNo(GlobalJobNo);

            RecJob.RESET();
            RecJobTask.RESET();
            // RecJobTask.SETRANGE("Job No.", GlobalJobNo);
            IF RecJobTask.FINDLAST() THEN begin
                RecJobTask.INIT();
                RecJobTask."Job No." := GlobalJobNo;

                IF ColText1[1] <> '' THEN BEGIN
                    //EVALUATE(RecJobTask."Job Task No.", ColText1[1]);
                    RecJobTask.VALIDATE("Job Task No.", ColText1[1]);
                END;
                RecJobTask.INSERT;

                IF ColText1[2] <> '' THEN BEGIN
                    EVALUATE(RecJobTask.Description, ColText1[2]);
                    RecJobTask.VALIDATE(Description);
                END;
                IF ColText1[3] <> '' THEN BEGIN
                    EVALUATE(RecJobTask.Description2, ColText1[3]);
                    RecJobTask.VALIDATE(Description2);
                END;

                IF ColText1[4] <> '' THEN BEGIN
                    EVALUATE(RecJobTask."Job Task Type", ColText1[4]);
                    RecJobTask.VALIDATE("Job Task Type");
                END;
                RecJobTask.MODIFY();
            END;


        end;
    end;

    local procedure GetEntryNo(No: Code[20]): Code[10]
    begin

        RecJobTask.RESET;
        RecJobTask.SETRANGE("Job No.", RecJob."No.");
        IF RecJobTask.FINDLAST THEN
            EXIT(RecJobTask."Job Task No.")
        ELSE
            EXIT;
    end;

    procedure GetDocNo(No: Code[20])
    begin
        GlobalJobNo := No;
    end;
}
*/

