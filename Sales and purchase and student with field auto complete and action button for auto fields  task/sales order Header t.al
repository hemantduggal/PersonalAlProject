/// <summary>
/// TableExtension items (ID 50104) extends Record Item.
/// </summary>
tableextension 50105 salesorders extends "Sales Header"
{
    fields
    {
        // modify("Sell-to Customer No.")
        // {
        //     trigger OnAfterValidate()
        //     var
        //         myInt: Integer;
        //         Customeritem: Record "Customer Item Catalog";
        //         saleline: Record "Sales Line";
        //         LineNo: Integer;
        //     begin

        //         saleline.Reset();
        //         saleline.SetRange("Document Type", rec."Document Type");
        //         saleline.SetRange("Document No.", rec."No.");
        //         if saleline.FindFirst() then
        //             saleline.DeleteAll();
        //         LineNo := 0;
        //         saleline.Reset();
        //         Customeritem.Reset();
        //         Customeritem.SetRange(customerNO, Rec."Sell-to Customer No.");
        //         if Customeritem.FindFirst() then begin
        //             Rec.Customerid := Customeritem."Customer ID";
        //             Rec.Customertype := Customeritem."Customer Type";
        //             if xRec."Sell-to Customer No." = '' then begin
        //                 rec.Insert(true);
        //                 Commit();
        //             end;

        //             repeat
        //                 LineNo += 10000;
        //                 saleline.Init();
        //                 saleline.Validate("Document Type", Rec."Document Type");
        //                 saleline.Validate("Document No.", Rec."No.");
        //                 saleline."Line No." := LineNo;
        //                 saleline.Validate(Type, saleline.Type::Item);

        //                 saleline.Validate("No.", Customeritem."Item No.");
        //                 saleline.Validate("Unit Cost", Customeritem."Unit Cost");
        //                 saleline.Weight := Customeritem.Weight;
        //                 saleline."Size (in cm)" := Customeritem.SIZE;
        //                 saleline.Insert(true);

        //             until Customeritem.Next() = 0;

        //         end;
        //     end;





        //}

        field(50001; Customerid; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; Customertype; Option)
        {
            OptionMembers = "",Normal,Advance;
            DataClassification = ToBeClassified;
        }



        field(111; StudentNO; code[20])
        {
            Caption = 'StudentNO';
            DataClassification = ToBeClassified;
            TableRelation = "Student Header Table";
            trigger OnValidate()
            var
                recstudent: record "Student Header Table";
            begin
                if recstudent.get(Rec.StudentNO) then
                    rec.StudentName := recstudent.Name;
                rec.StudentAddress := recstudent.Address;
                rec.StudentPhone := recstudent.PhoneNo;
                rec.StudentState := recstudent.State;
                rec.StudentCity := recstudent.City;

                Rec.Modify()



            end;






        }
        field(112; StudentName; Text[50])
        {
            Caption = 'StudentName';
            DataClassification = ToBeClassified;
            //TableRelation = "Student Header Table";

        }
        field(113; StudentAddress; Text[100])
        {

            DataClassification = ToBeClassified;
            //TableRelation = "Student Header Table";

        }
        field(1111; StudentPhone; Integer)
        {
            Caption = 'StudentPhone';
            DataClassification = ToBeClassified;
            //TableRelation = "Student Header Table";
        }
        field(1117; StudentState; Text[20])
        {
            Caption = 'StudentState';
            // OptionMembers = Delhi,Haryana,Up,Gujrat,"Andhra-Pradesh","Arunachal Pradesh",Assam,Bihar,Chhattisgarh,Goa;
            DataClassification = ToBeClassified;
            // TableRelation = "Student Header Table";
        }
        field(1118; StudentCity; text[20])
        {
            Caption = 'Studentcity';
            //OptionMembers = Mumbai,chennai,banglore,kolkata,pune,jaipur,ahmedabad,faridabad,okhla,raipur;

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
        modify("External Document No.")
        {
            trigger OnBeforeValidate()
            var
                SL: record "Sales Line";
            begin
                sl.Reset();
                sl.SetRange("Document Type", sl."Document Type"::Order);
                sl.SetRange("Document No.", "No.");

                if sl.FindSet() then
                    sl."External Doc no" := rec."External Document No.";

                sl.Modify();
                rec.Modify();


            end;

        }

        field(1123; "Maintenance type"; Option)
        {
            OptionMembers = a,b,c,d;
            DataClassification = ToBeClassified;

        }
        field(1124; "Time Based"; Option)
        {
            OptionMembers = daily,QTLY,Half,YRL;
            DataClassification = ToBeClassified;
        }
        field(1125; visible; boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(1126; "Line No."; Integer)
        {
            Caption = 'Integer';
            DataClassification = ToBeClassified;

        }
        field(1127; "Today Date"; date)
        {
            DataClassification = ToBeClassified;

        }

        //new 
        field(50100; "Type"; Option)
        {
            Caption = 'Maintenance Type';
            OptionMembers = " ","Timebased","Condition based","Shutdown";
            DataClassification = CustomerContent;
        }
        field(50101; "frequency"; Option)
        {
            Caption = 'Frequency';
            OptionMembers = " ","7D","15D","1M","QTLY","Half","YRL";
            DataClassification = CustomerContent;
        }
        field(50103; "Remarks1"; Code[20])
        {
            Caption = ' Remarks';
            DataClassification = CustomerContent;
        }
        field(50105; "Remarks2"; Text[50])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }

        field(50106; "Adv.Prepayment Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50000; "Vendor No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";
            trigger OnValidate()
            var
            //Vend: Record Vendor;
            begin
                // if Vend.Get("Vendor No.") then
                //     Rec."Vendor Name" := Vend.Name;
                // Rec."Vendor Address" := Vend.Address;

            end;
        }
        field(50003; "Vendor Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50004; "Vendor Address"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50005; "Order Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "",Standard,Export;
        }





    }
}
