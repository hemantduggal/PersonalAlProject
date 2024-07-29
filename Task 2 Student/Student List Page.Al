/// <summary>
/// Page Student List Page (ID 50114).
/// </summary>
page 50114 "Student List Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Student Header Table";
    CardPageId = "Student card Page";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field("Sales order"; Rec."Sales order")
                {
                    ApplicationArea = all;
                    TableRelation = "Sales Header"."No.";

                    Caption = 'Sales Order';


                    trigger OnValidate()
                    var
                        recsales: record "Sales Header";
                    begin
                        if xRec."Sales order" <> Rec."Sales order" then begin
                            recsales.Reset();
                            if recsales.get(recsales."No.") then begin

                            end;

                        end;

                    end;

                }


            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Save)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Data Saved');
                end;
            }
        }
    }


}