/// <summary>
/// XmlPort import employee data XML Port (ID 50101).
/// </summary>
xmlport 50102 "import employee XML Port"
{
    Caption = 'import employee data';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    //FileName = '';
    TableSeparator = '<NewLine>';
    FieldDelimiter = '';
    FieldSeparator = ',';

    schema
    {
        textelement(NodeName1)
        {
            tableelement(EmployeeLine; EmployeeLine)
            {
                AutoReplace = false;
                AutoSave = false;
                AutoUpdate = false;
                fieldelement(document_no; EmployeeLine.DocumentNo) { }
                fieldelement(line_no; EmployeeLine.LineNo) { }
                fieldelement(basic; EmployeeLine.Basic) { }
                fieldelement(HRA; EmployeeLine.HRA) { }
                
                fieldelement(conveyance; EmployeeLine.Conveyance) { }
                trigger OnBeforeInsertRecord()
                begin
                    IF Heading then begin  ////skip heading of csv
                        Heading := false;
                        currxmlport.skip;
                    end;
                    if Docno1 <> DocNo then begin
                        RecEmployeeLine.Init();
                        LineNo := GetNextLineNo();
                        RecEmployeeLine.Init();
                        RecEmployeeLine.Validate(DocumentNo, recEmployeeheader."No");
                        RecEmployeeLine.Validate(LineNo, LineNo);
                        RecEmployeeLine.Validate(Basic, Basic);
                        RecEmployeeLine.Validate(HRA, HRA);
                        RecEmployeeLine.Validate(Conveyance, Conveyance);


                        RecEmployeeLine.Insert();
                        Docno := DocNo;
                    end;
                end;
            }
        }
    }



    trigger OnPreXmlPort()
    begin
        Heading := true;
    end;

    trigger OnPostXmlPort()
    begin
        Message('employee Line Uploaded Successfully');
    end;

    local procedure GetNextLineNo(): Integer;
    var
        NextemployeeLine: Record "EmployeeLine";
    begin
        NextemployeeLine.Reset();
        NextemployeeLine.SetRange(DocumentNo, recemployeeheader."No");
        if NextemployeeLine.FindLast() then
            exit(NextemployeeLine.LineNo + 10000)
        else
            exit(10000);
    end;

    var
        Heading: Boolean;
        LineNo: Integer;
        Docno: Code[20];
        Docno1: Code[20];
        Basic: Decimal;
        Description1: text[100];
        HRA: Decimal;
        Conveyance: Decimal;

        RecEmployeeLine: Record EmployeeLine;
        recEmployeeheader: Record EmployeeHeader;
}