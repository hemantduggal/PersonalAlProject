/// <summary>
/// PageExtension MyExtension (ID 50102) extends Record MyTargetPage.
/// </summary>
pageextension 50110 Purchaseorderext extends "Purchase Order"
{
    layout
    {
        // modify("Buy-from Vendor No.")
        // {
        //     // trigger OnAfterValidate()
        //     // var
        //     //     vendoritemcat: Record "Vendor Item Catalog";
        //     //     LineNo: Integer;
        //     //     purchh: Record "Purchase Header";
        //     //     purchl: Record "Purchase Line";
        //     // begin
        //     //     CurrPage.SaveRecord();
        //     //     purchh.Reset();
        //     //     
        //     //     LineNo := 0;
        //     //     vendoritemcat.Reset();
        //     //     vendoritemcat.SetRange("Vendor No", rec."No.");
        //     //     if vendoritemcat.FindFirst() then begin
        //     //         repeat
        //     //             LineNo += 10000;
        //     //             purchl.Init();
        //     //             purchl."No." := vendoritemcat."Item No.";
        //     //             purchl."Line No." := LineNo;
        //     //             purchl.Insert(true);
        //     //             purchl.Weight := vendoritemcat.Weight;
        //     //             purchl."Size (in cm)" := vendoritemcat.SIZE;
        //     //             purchh.Vendortype := vendoritemcat."Vendor Type";
        //     //             purchh.Vendorid := vendoritemcat."Vendor ID";
        //     //             purchl.Modify();
        //     //         until vendoritemcat.Next() = 0;

        //     //     end;
        //     //     CurrPage.Update(false);

        //     // end;
        // }
        // Add changes to page layout here
        addafter(Status)
        {
            field(Vendorid; Rec.Vendorid)
            {
                ApplicationArea = all;
                Editable = false;

            }
            field(Vendortype; Rec.Vendortype)
            {
                ApplicationArea = all;
                Editable = false;
            }
            field(StudentNO; Rec.StudentNO)
            {
                Caption = 'StudentNo';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(StudentName; rec.StudentName)
            {
                Caption = 'StudentName';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(StudentAddress; Rec.StudentAddress)
            {
                Caption = 'StudentAddress';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(StudentPhone; Rec.StudentPhone)
            {
                Caption = 'StudentPhone';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(StudentState; Rec.StudentState)
            {
                Caption = 'StudentState';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(StudentCity; Rec.StudentCity)
            {
                Caption = 'StudentCity';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field("Contact person"; Rec."Contact person")
            {
                ApplicationArea = all;

            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = all;

            }
            field(Deal_date; Rec.Deal_date)
            {
                ApplicationArea = all;
            }
            field("order category"; Rec."order category")
            {
                ApplicationArea = all;

            }
            field("Index no"; Rec."Index no")
            {
                ApplicationArea = all;

            }
            field(Plank_no; Rec.Plank_no)
            {
                ApplicationArea = all;

            }
            field("Currency Capacity"; Rec."Currency Capacity")
            {
                ApplicationArea = all;

            }
            field("unit od specification"; Rec."unit od specification")
            {
                ApplicationArea = all;

            }
            field("Requisition No."; Rec."Requisition No.")
            {
                ApplicationArea = all;
            }




        }
        modify("Vendor Shipment No.")
        {
            // trigger OnbeforeValidate()
            // var
            //     vship: record "Purch. Rcpt. Header";
            // begin

            //     vship.SetRange("Vendor Shipment No.", rec."Vendor Shipment No.");
            //     if vship.FindFirst() then
            //         Error('values already inn posted table');
            // end;
            trigger OnBeforeValidate()
            var
                PRh: record "Purch. Rcpt. Header";
            begin
                Date1 := DATE2DMY(rec."Posting Date", 3);
                startdate := DMY2DATE(01, 04, Date1);
                enddate := DMY2DATE(31, 03, Date1 + 1);
                //       Message('%1..%2..%3..%4', Date1, startdate, enddate, "Vendor Shipment No.");
                PRH.Reset();
                PRH.SetRange("Vendor Shipment No.", rec."Vendor Shipment No.");
                PRH.SetRange("Buy-from Vendor No.", rec."Buy-from Vendor No.");
                PRH.SetRange("Posting Date", startdate, enddate);
                if PRH.FindFirst() then
                    Error('Vendor Shipment No. already exist in posted table');
            end;
        }
    }

    actions
    {
        modify(post)
        {
            /*  trigger OnbeforeAction()
              var
                  vship: record "Purch. Rcpt. Header";
              begin
                  vship.SetRange("Vendor Shipment No.", rec."Vendor Shipment No.");
                  if vship.FindFirst() then
                      Error('values already in posted table');
              end;*/
            trigger OnBeforeAction()
            var
                PRh: record "Purch. Rcpt. Header";
            begin
                Date1 := DATE2DMY(rec."Posting Date", 3);
                startdate := DMY2DATE(01, 04, Date1);
                enddate := DMY2DATE(31, 03, Date1 + 1);
                Message('%1..%2..%3..%4', Date1, startdate, enddate, rec."Vendor Shipment No.");
                PRH.Reset();
                PRH.SetRange("Vendor Shipment No.", rec."Vendor Shipment No.");
                PRH.SetRange("Buy-from Vendor No.", rec."Buy-from Vendor No.");
                PRH.SetRange("Posting Date", startdate, enddate);
                if PRH.FindFirst() then
                    Error('Vendor Shipment No. already exist in posted table');
            end;
        }
        addafter("F&unctions")
        {


            action("Export purchase order")
            {
                caption = 'export purchase order order';
                Image = Export;
                ApplicationArea = all;
                // Visible = s."Safety Guidelines" = true;
                //Enabled = s."Safety Guidelines" = true;
                // Visible = flag;
                // Enabled = flag;
                trigger OnAction()
                begin
                    xmlport.Run(Xmlport::Exportpurchaseorder, true, false);
                end;
            }
            action(Import)
            {
                Caption = 'Import Purchase order';
                Image = Import;
                ApplicationArea = all;

                trigger OnAction()
                var
                begin
                    xmlport.Run(Xmlport::PurchaseorderXmlport);
                end;
            }
        }
    }



    var
        myInt: Integer;
        s: record SafetyGuidlines;
        flag: Boolean;
        Date1: Integer;
        startdate: Date;
        enddate: Date;
        ve: Page "Vendor Card";
}