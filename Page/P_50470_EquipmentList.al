/// <summary>
/// Page EquipmentList (ID 50470).
/// </summary>
page 50470 EquipmentList
{
    PageType = List;

    Caption = 'Equipment Master';
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = EquipmentHeader;

    layout
    {
        area(Content)
        {
            repeater(general)
            {

                Caption = 'general';
                field("Equipment No"; rec."Equipment No")
                {
                    ApplicationArea = All;
                }
                field("Equipment Type Main"; rec."Equipment Type Main")
                {
                    ApplicationArea = All;
                }
                field("Equipment Name"; rec."Equipment Name")
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
            action(ImportMaster)
            {
                Caption = 'Import Master';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;
               // RunObject = XMLport "Equipment ImportData";

            }
        }
    }
}