
/// <summary>
/// Page Equipment SubForm (ID 50480).
/// </summary>
page 50480 "Equipment SubForm"
{
    PageType = ListPart;
    ApplicationArea = All;
    Caption = ' Equipment subform page';


    SourceTable = "Equipment Line";
    DelayedInsert = true;
    // MultipleNewLines = true;
    AutoSplitKey = true;
    Editable = true;
    UsageCategory = Documents;
    layout
    {
        area(Content)
        {
            repeater(Lines)
            {

                field(equipmentno; Rec.equipmentno)
                { ApplicationArea = all; }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("No."; rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(amount; Rec.amount)
                {
                    ApplicationArea = all;

                }
                field(quantity; Rec.quantity)
                {
                    ApplicationArea = all;

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
#pragma warning disable AL0729
                Promoted = true;
#pragma warning restore AL0729
#pragma warning disable AL0729
                PromotedCategory = Process;
#pragma warning restore AL0729
                Image = Import;
                ApplicationArea = All;
                RunObject = XMLport "Equipment ImportLineData";

            }
        }
    }
}