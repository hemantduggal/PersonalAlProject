/// <summary>
/// Page ArchiveCastingPlanninglistPage (ID 50357).
/// </summary>
page 50357 "ArchiveCastingPlanninglistPage"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Archive Casting PlanningHeader";
    CardPageId = "ArchiveCastingPlanningcardpage";




    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field(Sno; Rec.Sno)
                { ApplicationArea = all; }


                field("Casting Plan No"; Rec."Casting Plan No")
                {
                    ApplicationArea = All;

                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;

                }
                field("Casting Plan Date"; Rec."Casting Plan Date")
                {
                    ApplicationArea = All;

                }





            }
        }
    }


}


