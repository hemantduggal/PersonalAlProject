pageextension 50018 "purchase quote" extends "Purchase Quote"
{
    layout
    {
        addafter(Status)
        {
            field("Requisition No."; Rec."Requisition No.")
            {
                ApplicationArea = All;



            }


        }
    }
    actions
    {
        addafter(Release)
        {
            action("Get Purchase Requisition Lines")
            {
                ApplicationArea = all;
                Image = Insert;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    reql: Record Purchreqline;
                    PreqL: Record Purchreqline;
                    LineNo: Integer;
                    PL: Record "Purchase Line";
                    PL1: Record "Purchase Line";
                begin
                    rec.TestField("Requisition No.");
                    CurrPage.SaveRecord();
                    PL.Reset();
                    PL.Deleteall();
                    LineNo := 0;
                    PreqL.Reset();
                    PreqL.SetRange("Document No", Rec."Requisition No.");
                    if PreqL.FindFirst() then begin
                        repeat
                            LineNo += 10000;
                            PL1.Init();
                            PL1."Document Type" := Rec."Document Type"::Quote;
                            PL1."Document No." := Rec."No.";
                            PL1."Line No." := LineNo;
                            PL1.Insert(true);
                            if PreqL.Type = PreqL.Type::Item then
                                PL1.Type := PL1.Type::Item;
                            if PreqL.Type = PreqL.Type::"Fixed Asset" then
                                PL1.Type := PL1.Type::"Fixed Asset";
                            PL1.Validate("No.", PreqL."No.");
                            PL1."Shortcut Dimension 1 Code" := PreqL."Global Dim 1";
                            PL1."Shortcut Dimension 2 Code" := PreqL."Global Dim 2";
                            PL1."Unit of Measure" := PreqL.UOM;
                            PL1."Unit Cost" := PreqL." Direct Unit cost";
                            PL1.Quantity := PreqL.quantity;
                            PL1.Modify();
                        until PreqL.Next() = 0;
                    end;
                    CurrPage.Update(false);

                end;
            }
        }
    }


}
