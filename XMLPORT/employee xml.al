/// <summary>
/// XmlPort 50100.
/// </summary>
xmlport 50100 "import employee data XML Port"
{
    Caption = 'import  data';
    Format = VariableText;
    Direction = Import;
    TextEncoding = UTF8;
    UseRequestPage = false;
    FileName = '';
    TableSeparator = '<NewLine>';
    FieldDelimiter = '';
    FieldSeparator = ',';

    schema
    {
        textelement(Root)
        {
            tableelement(EmployeeHeader; EmployeeHeader)

            {
                XmlName = 'EmployeeH';
                RequestFilterFields = No;
                MinOccurs = Once;
                MaxOccurs = Once;

                Autosave = True;

                fieldelement(No; EmployeeHeader.No) { }
                fieldelement(Name; EmployeeHeader.Name) { }
                fieldelement(Address; EmployeeHeader.Address) { }
                fieldelement(Address2; EmployeeHeader.Address2) { }
                fieldelement(city; EmployeeHeader.city) { }
                fieldelement(Postal_code; EmployeeHeader.PostalCode) { }
                fieldelement(Phone_no; EmployeeHeader.PhoneNo) { }


                tableelement(EmployeeLine; EmployeeLine)
                {



                    LinkFields = DocumentNo = FIELD(no);
                    LinkTable = "employeeheader";
                    MinOccurs = Zero;
                    AutoSave = true;






                    fieldelement(document_no; EmployeeLine.DocumentNo) { }
                    fieldelement(line_no; EmployeeLine.LineNo)
                    {
                        trigger OnAfterAssignField()
                        var
                            myInt: Integer;
                        begin
                            EmployeeLine.LineNo += 10000;
                            EmployeeLine.Validate(EmployeeLine.LineNo);
                        end;
                    }
                    fieldelement(basic; EmployeeLine.Basic) { }
                    fieldelement(HRA; EmployeeLine.HRA) { }
                    fieldelement(conveyance; EmployeeLine.Conveyance) { }
                    trigger OnAfterInitRecord()
                    begin
                        if IsFirstline then begin
                            IsFirstline := false;
                            currXMLport.Skip();
                        end;
                    end;
                }
            }

        }
    }



    trigger OnPreXmlPort()
    begin
        IsFirstline := true;
    end;

    var
        IsFirstline: Boolean;

}
