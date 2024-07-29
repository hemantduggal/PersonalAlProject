page 50011 "Motar Checklist"
{

    SourceTable = "Motar Checklist";
    PageType = List;
    UsageCategory = Lists;
    SaveValues = true;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(Areas)
            {
                field("Area"; Rec."Area")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        CurrPage.Update(false);
                    end;

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        CurrPage.Update(false);
                    end;

                }
                field("employee name"; Rec."employee name")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                        CurrPage.Update(false);
                    end;

                }

            }
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    
                }
                field(Equpiment; Rec.Equpiment)
                {
                    ApplicationArea = All;
                }
                field("TEMPERATURE (°C)DE"; Rec."TEMPERATURE (°C)DE")
                {
                    ApplicationArea = All;
                }
                field("TEMPERATURE (°C)NDE"; Rec."TEMPERATURE (°C)NDE")
                {
                    ApplicationArea = All;
                }
                field("TEMPERATURE (°C)BODY"; Rec."TEMPERATURE (°C)BODY")
                {
                    ApplicationArea = All;
                }
                field("CURRENT(AMPS)LOAD"; Rec."CURRENT(AMPS)LOAD")
                {
                    ApplicationArea = All;
                }
                field("CURRENT(AMPS)NO LOAD"; Rec."CURRENT(AMPS)NO LOAD")
                {
                    ApplicationArea = All;
                }
                field("VIBRATION(MM/SEC)DE"; Rec."VIBRATION(MM/SEC)DE")
                {
                    ApplicationArea = All;
                }
                field("VIBRATION (MM/SEC)NDE"; Rec."VIBRATION (MM/SEC)NDE")
                {
                    ApplicationArea = All;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = aLL;
                }
            }

        }

    }
    // actions
    // {
    //     area(Processing)
    //     {
    //         action(Post)
    //         {
    //             ApplicationArea = All;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //             trigger OnAction()
    //             var
    //                 PostedMotarChecklist: Record "Posted Motar Checklist";

    //             begin
    //                 PostedMotarChecklist.Reset();
    //                 PostedMotarChecklist.Init();
    //                 PostedMotarChecklist.TransferFields(Rec);
    //                 PostedMotarChecklist.Insert();
    //                 Rec.Delete();
    //                 Message('The checklist has been posted successfully.');
    //             end;


    //             // end;
    //         }
    //     }
    // }


    var

}
