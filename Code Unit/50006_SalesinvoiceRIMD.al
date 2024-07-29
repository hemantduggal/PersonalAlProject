codeunit 50007 Salinvrimd
{
    Permissions = tabledata "Sales Invoice Header" = RIMD, tabledata "Sales Invoice line" = RIMD;
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}