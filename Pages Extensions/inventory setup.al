/// <summary>
/// PageExtension inventorySetupPageExt (ID 50002) extends Record inventory setup.
/// </summary>
pageextension 50002 inventorySetupPageExt extends "inventory setup"
{
    layout
    {
        addafter("Item Nos.")
        {
            field("Book Nos."; Rec."Book Nos.")
            {
                Caption = 'Book Nos.';
                ApplicationArea = All;
            }
            field("store req No"; Rec."store req No")
            {
                ApplicationArea = All;
            }

            field("SR No"; Rec."SR No")
            {
                ApplicationArea = All;
            }
            field("BSNL Offering No."; Rec."BSNL Offering No.")
            {
                ApplicationArea = All;
            }
            field("IGA No."; Rec."IGA No.")
            {
                ApplicationArea = All;
            }
            field("Posted RGP No."; Rec."Posted RGP No.")
            {
                ApplicationArea = All;

            }
            field("Inventory Planning No."; Rec."Inventory Planning No.")
            {
                ApplicationArea = All;

            }
            field("Offering No."; Rec."Offering No.")
            {
                ApplicationArea = All;

            }
            field("Sequence No."; Rec."Sequence No.")
            {
                ApplicationArea = All;

            }
            field("NRGP No."; Rec."NRGP No.")
            {
                ApplicationArea = All;

            }
            field("FARGP No."; Rec."FARGP No.")
            {
                ApplicationArea = All;
                Caption = 'RGP NO.';
            }
            field("Store requisition Nos"; Rec."Store requisition Nos")
            {
                ApplicationArea = All;

            }
            field("4G Rework Location Code"; Rec."4G Rework Location Code")
            {
                ApplicationArea = All;

            }
            field("No Series Code"; Rec."No Series Code")
            {
                ApplicationArea = All;

            }
            field("Consumption Temp No."; Rec."Consumption Temp No.")
            {
                ApplicationArea = all;
            }
            field("Relation Ship No."; Rec."Relation Ship No.")
            {
                ApplicationArea = all;
            }
            field("Customer Sub Order No."; Rec."Customer Sub Order No.")
            {
                ApplicationArea = all;
            }
            field("4G WIP No."; Rec."4G WIP No.")
            {
                ApplicationArea = ALL;
            }
            field("Work Order"; Rec."Work Order")
            {
                ApplicationArea = all;
            }
            field("Posted NRGP No"; Rec."Posted NRGP No")
            {
                ApplicationArea = all;
            }
            field("IGI No"; Rec."IGI No")
            {
                ApplicationArea = all;
            }
            field("Requisition No."; Rec."Requisition No.")
            {
                ApplicationArea = all;

            }
            field("Aim Chemistry No."; Rec."Aim Chemistry No.")
            {
                ApplicationArea = all;
            }
            field("Posted Aim Chemistry No."; Rec."Posted Aim Chemistry No.")
            {
                ApplicationArea = all;
            }
            field("Packing Nos"; Rec."Packing Nos")
            {
                ApplicationArea = all;
            }
        }
    }
}