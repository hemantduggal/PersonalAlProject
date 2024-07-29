page 50023 "Packing Details"
{
    ApplicationArea = All;
    Caption = 'Packing Details';
    PageType = Document;
    SourceTable = "Packing header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = All;


                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
                field("Customer PO Ref"; Rec."Customer PO Ref")
                {
                    ToolTip = 'Specifies the value of the Customer PO Ref field.';
                    ApplicationArea = All;
                }
                field("Delivery Destination"; Rec."Delivery Destination")
                {
                    ToolTip = 'Specifies the value of the Delivery Destination field.';
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                    ToolTip = 'Specifies the value of the Payment Terms field.';
                }
                field("Shipping Terms"; Rec."Shipping Terms")
                {
                    ToolTip = 'Specifies the value of the Shipping Terms field.';
                    ApplicationArea = All;
                }
                field("Total CTNS"; Rec."Total CTNS")
                {
                    ToolTip = 'Specifies the value of the Total CTNS field.';
                    ApplicationArea = all;
                }

            }
            group("Bill-to")
            {
                Caption = 'Bill-to';

                field("Bill-to No."; Rec."Bill-to No.")
                {

                    ApplicationArea = All;
                }

                field("Bill-To Name"; Rec."Bill-To Name")
                {
                    ToolTip = 'Specifies the value of the Bill-To Name field.';
                    ApplicationArea = All;
                }
                field("Bill-To Address"; Rec."Bill-To Address")
                {
                    ToolTip = 'Specifies the value of the Bill-To Address field.';
                    ApplicationArea = All;
                }
                field("Bill-To Address2"; Rec."Bill-To Address2")
                {
                    ToolTip = 'Specifies the value of the Bill-To Address2 field.';
                    ApplicationArea = All;
                }
                field("Bill-To city"; Rec."Bill-To city")
                {
                    ToolTip = 'Specifies the value of the Bill-To city field.';
                    ApplicationArea = All;
                }
                field("Bill-To State"; Rec."Bill-To State")
                {
                    ToolTip = 'Specifies the value of the Bill-To State field.';
                    ApplicationArea = All;
                }
                field("Bill-To Post Code"; Rec."Bill-To Post Code")
                {
                    ToolTip = 'Specifies the value of the Bill-To Post Code field.';
                    ApplicationArea = All;
                }
                field("Bill-to Country/Region"; Rec."Bill-to Country/Region")
                {
                    ToolTip = 'Specifies the value of the Bill-to Country/Region field.';
                    ApplicationArea = All;
                }
                field("Bill-to Phone"; Rec."Bill-to Phone")
                {
                    ToolTip = 'Specifies the value of the Bill-to Phone field.';
                    ApplicationArea = All;
                }

                field("bill-to Fax"; Rec."bill-to Fax")
                {
                    ToolTip = 'Specifies the value of the bill-to Fax field.';
                    ApplicationArea = All;
                }
            }
            group("Ship-to")
            {
                Caption = 'Ship-to';

                field("Ship-to No."; Rec."Ship-to No.")
                {
                    ApplicationArea = All;
                }
                field("Ship-To Name"; Rec."Ship-To Name")
                {
                    ToolTip = 'Specifies the value of the Ship-To Name field.';
                    ApplicationArea = All;
                }
                field("Ship-To Address"; Rec."Ship-To Address")
                {
                    ToolTip = 'Specifies the value of the Ship-To Address field.';
                    ApplicationArea = All;
                }
                field("Ship-To Address2"; Rec."Ship-To Address2")
                {
                    ToolTip = 'Specifies the value of the Ship-To Address2 field.';
                    ApplicationArea = All;
                }
                field("Ship-To city"; Rec."Ship-To city")
                {
                    ToolTip = 'Specifies the value of the Ship-To city field.';
                    ApplicationArea = All;
                }
                field("Ship-To State"; Rec."Ship-To State")
                {
                    ToolTip = 'Specifies the value of the Ship-To State field.';
                    ApplicationArea = All;
                }
                field("Ship-To Post Code"; Rec."Ship-To Post Code")
                {
                    ToolTip = 'Specifies the value of the Ship-To Post Code field.';
                    ApplicationArea = All;
                }
                field("Ship-to Country/Region"; Rec."Ship-to Country/Region")
                {
                    ToolTip = 'Specifies the value of the Ship-to Country/Region field.';
                    ApplicationArea = All;
                }
                field("Ship-to Phone"; Rec."Ship-to Phone")
                {
                    ToolTip = 'Specifies the value of the Ship-to Phone field.';
                    ApplicationArea = All;
                }
                field("Ship-to Fax"; Rec."Ship-to Fax")
                {
                    ToolTip = 'Specifies the value of the Ship-to Fax field.';
                    ApplicationArea = All;
                }



            }

            part(Lines; "Packing Subform")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {

            group(Action)
            {

                action("Packing List Report")
                {
                    Image = Report;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;


                    trigger OnAction()
                    var
                        ph: Record "Packing header";
                    begin
                        ph.Reset();
                        ph.SetRange("Document No.", rec."Document No.");
                        if ph.FindFirst() then
                            Report.Run(50011, true, false, ph);
                    end;
                }

            }
        }
    }

}