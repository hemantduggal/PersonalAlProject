page 50029 "Packing Subform"
{
    ApplicationArea = All;
    Caption = 'Packing Subform';
    PageType = ListPart;
    SourceTable = "Packing Line";
    AutoSplitKey = true;
    MultipleNewLines = true;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = all;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = all;
                }
                field(Marking; Rec.Marking)
                {
                    ToolTip = 'Specifies the value of the Marking field.';
                    ApplicationArea = all;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = all;
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ToolTip = 'Specifies the value of the Total Qty field.';
                    ApplicationArea = all;
                }
                field("Gross Weight(KG)"; Rec."Gross Weight(KG)")
                {
                    ToolTip = 'Specifies the value of the Gross Weight(KG) field.';
                    ApplicationArea = all;
                }
                field("Net Weight(KG)"; Rec."Net Weight(KG)")
                {
                    ToolTip = 'Specifies the value of the Net Weight(KG) field.';
                    ApplicationArea = all;
                }
                
            }
        }
    }
}
