/// <summary>
/// Page Equipment Card (ID 50471).
/// </summary>
page 50471 "Equipment Card Page"
{
    PageType = Card;
    Caption = 'Equipment Card page';
    ApplicationArea = all;
    SourceTable = EquipmentHeader;
    UsageCategory = Documents;


    layout
    {
        area(Content)
        {
            ///GROUP1
            group("General")
            {
                Caption = 'General';
                field("Equipment No"; rec."Equipment No")
                {
                    ApplicationArea = All;
                }
                field("Equipment Name"; rec."Equipment Name")
                {
                    ApplicationArea = all;
                }
                field("Part No"; rec."Part No")
                {
                    ApplicationArea = All;
                }
                field("Part Name"; rec."Part Name")
                {
                    ApplicationArea = All;
                }


                field("Equipment Type Main"; rec."Equipment Type Main")
                {
                    ApplicationArea = All;
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = All;
                }
                field(Department; rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Assembly No"; rec."Assembly No")
                {
                    ApplicationArea = All;
                }
                field("Assembly Card Name"; rec."Assembly Card Name")
                {
                    ApplicationArea = All;
                }
                field("Fixed Asset No"; rec."Fixed Asset No")
                {
                    ApplicationArea = All;
                }
                field("Fixed Asset Description"; rec."Fixed Asset Description")
                {
                    ApplicationArea = All;
                }

            }
            part(EquipmentSubform; "Equipment SubForm")
            {
                ApplicationArea = all;
                UpdatePropagation = Both;
                SubPageLink = equipmentno = FIELD("Equipment No");
                Visible = true;
                Editable = true;
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
                //RunObject = XMLport "Equipment ImportData";

            }
        }
    }

}