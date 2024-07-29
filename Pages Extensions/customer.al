/// <summary>
/// PageExtension demo3 (ID 50001) extends Record Customer Ledger Entries.
/// </summary>
pageextension 50009 dem extends "Customer Card"
{
    layout
    {
        addafter("Post Code")
        {
            field("Vendor No."; Rec."Vendor No.")
            {
                ApplicationArea = all;
            }
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;
            }
            field("Vendor Address"; Rec."Vendor Address")
            {
                ApplicationArea = all;
            }

            // field("Contact person"; Rec."Contact person")
            // {
            //     ApplicationArea = all;


            // }
            // field(Remarks; Rec.Remarks)
            // {
            //     ApplicationArea = all;

            // }
            // field(Deal_date; Rec.Deal_date)
            // {
            //     ApplicationArea = all;
            // }
            // field("order category"; Rec."order category")
            // {
            //     ApplicationArea = all;

            // }
        }
        addafter("Credit Limit (LCY)")
        {
            field("Active Credit limit"; Rec."Active Credit limit")
            {
                ApplicationArea = all;
                // Editable = edi;
            }
            field("Remaining Credit limit"; Rec."Remaining Credit limit")
            {
                ApplicationArea = all;
                Editable = edi;
            }
        }
        addafter(Name)
        {
            field(Item; Item)
            {
                Caption = 'Item no';
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean

                var
                    ItemList: Page "Item List";
                begin
                    Clear(Item);
                    ItemList.LookupMode(true);
                    if ItemList.RunModal() = Action::LookupOK then begin
                        Text += ItemList.GetSelectionFilter();
                        exit(true);
                    end else
                        exit(false);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        userset: record "User Setup";
    begin


        userset.Reset();
               userset.Get(UserId);

        if userset.ControlPoint = true then
            edi := true
        else
            edi := false;

    end;


    var
        Item: text[100];
        edi: Boolean;


}