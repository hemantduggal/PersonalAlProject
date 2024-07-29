page 50019 "Customer Item Catalog1"
{
    ApplicationArea = All;
    Caption = 'Customer Item Catalog1';
    PageType = List;
    SourceTable = "Customer Item Catalog";
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
                field("Customer No"; Rec.customerNO)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Customer No field.';
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
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Customer Type field.';
                }

                field("Customer ID"; Rec."Customer ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Customer ID field.';
                }
            }
        }
    }
}
