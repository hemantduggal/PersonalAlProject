page 50018 "Vendor Item Catalog1"
{
    ApplicationArea = All;
    Caption = 'Vendor Item Catalog1';
    PageType = List;
    SourceTable = "Vendor Item Catalog";
    UsageCategory = Administration;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Vendor No"; Rec."Vendor No")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Vendor No field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Weight field.';
                }
                field(SIZE; Rec.SIZE)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the SIZE field.';
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Vendor Type field.';
                }

                field("Vendor ID"; Rec."Vendor ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Vendor ID field.';
                }
            }
        }
    }
}
