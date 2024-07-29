/// <summary>
/// Page Employee subform page (ID 50112).
/// </summary>
page 50112 "Employee subform page"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = EmployeeLine;
    Caption = 'subform page';
    Description = 'This is a subfrom page ';
    AboutText = 'Subform PAge ';
    AboutTitle = 'This Is a Subform Page ';


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'general';
                field(DocumentNo; Rec.DocumentNo)
                {
                    ApplicationArea = All;

                }
                field(LineNo; Rec.LineNo)
                {
                    ApplicationArea = All;

                }
                field(Basic; Rec.Basic)
                {
                    ApplicationArea = All;

                }
                field(HRA; Rec.HRA)
                {
                    ApplicationArea = All;

                }
                field(Conveyance; Rec.Conveyance)
                {
                    ApplicationArea = All;

                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Test)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Data Inserted ');
                end;
            }
            action(ImportEMployeeDataXMLPORT)
            {
                Caption = 'import data via xml port';
                // Promoted = true;
                // PromotedCategory = New;
                Image = Import;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Xmlport.Run(50102, true, true);
                end;
            }
        }
    }


}