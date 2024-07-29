/// <summary>
/// TableExtension items (ID 50104) extends Record Item.
/// </summary>
tableextension 50109 "Purchase Order extension" extends "Purchase Header"
{
    fields
    {
        // modify("Buy-from Vendor No.")
        // {
        //     // trigger OnAfterValidate()
        // var
        //     myInt: Integer;
        //     vendorItem: Record "Vendor Item Catalog";
        //     PurchLine: Record "Purchase Line";
        //     LineNo: Integer;
        // begin

        //     PurchLine.Reset();
        //     PurchLine.SetRange("Document Type", rec."Document Type");
        //     PurchLine.SetRange("Document No.", rec."No.");
        //     if PurchLine.FindFirst() then
        //         PurchLine.DeleteAll();
        //     LineNo := 0;
        //     PurchLine.Reset();
        //     vendorItem.Reset();
        //     vendorItem.SetRange("Vendor No", Rec."Buy-from Vendor No.");
        //     if vendorItem.FindFirst() then begin
        //         Rec.Vendorid := vendorItem."Vendor ID";
        //         Rec.Vendortype := vendorItem."Vendor Type";
        //         if xRec."Buy-from Vendor No." = '' then begin
        //             rec.Insert(true);
        //             Commit();
        //         end;

        //         repeat
        //             LineNo += 10000;
        //             PurchLine.Init();
        //             PurchLine.Validate("Document Type", Rec."Document Type");
        //             PurchLine.Validate("Document No.", Rec."No.");
        //             PurchLine."Line No." := LineNo;
        //             PurchLine.Validate(Type, PurchLine.Type::Item);

        //             PurchLine.Validate("No.", vendorItem."Item No.");
        //             PurchLine.Validate("Unit Cost", vendorItem."Unit Cost");
        //             PurchLine.Weight := vendorItem.Weight;
        //             PurchLine."Size (in cm)" := vendorItem.SIZE;
        //             PurchLine.Insert(true);

        //         until vendorItem.Next() = 0;

        //     end;
        // end;





        // }
        field(50001; Vendorid; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Vendortype; Option)
        {
            OptionMembers = "",Normal,Advance;
            DataClassification = ToBeClassified;
        }

        field(1111; StudentNO; code[20])
        {
            Caption = 'StudentNO';
            DataClassification = ToBeClassified;
            TableRelation = "Student Header Table";

        }
        field(1112; StudentName; Text[50])
        {
            Caption = 'StudentName';
            DataClassification = ToBeClassified;
            //TableRelation = "Student Header Table";

        }
        field(1113; StudentAddress; Text[50])
        {
            Caption = 'StudentName';
            DataClassification = ToBeClassified;
            //TableRelation = "Student Header Table";

        }
        field(11111; StudentPhone; Integer)
        {
            Caption = 'StudentPhone';
            DataClassification = ToBeClassified;
            //TableRelation = "Student Header Table";
        }
        field(11117; StudentState; Text[20])
        {
            Caption = 'StudentState';
            //OptionMembers = Delhi,Haryana,Up,Gujrat,"Andhra-Pradesh","Arunachal Pradesh",Assam,Bihar,Chhattisgarh,Goa;
            DataClassification = ToBeClassified;
            //TableRelation = "Student Header Table";
        }
        field(11118; StudentCity; text[20])
        {
            Caption = 'StudentState';
            // OptionMembers = Mumbai,chennai,banglore,kolkata,pune,jaipur,ahmedabad,faridabad,okhla,raipur;

            DataClassification = ToBeClassified;
            //TableRelation = "Student Header Table";
        }

        field(1119; "Contact person"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No.";
            trigger OnValidate()
            var
                sh: record Customer;
            begin
                if sh.get(Rec."Sell-to Customer No.") then
                    Rec."Contact person" := sh.Contact;




                Rec.Modify()
            end;
        }
        field(1120; "Remarks"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(1121; Deal_date; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(1122; "order category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Process,Raw,Finished;


        }


        field(1123; "Index no"; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50000; Plank_no; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(1125; "Currency Capacity"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(1126; "unit od specification"; option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = basic,medium,high;
        }
        field(50003; "Requisition No."; Code[20])
        {
            TableRelation = "Purchase req header";
        }




    }
}
