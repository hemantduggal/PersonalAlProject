/// <summary>
/// Table Archive Casting PlanningLine (ID 50323).
/// </summary>
table 50323 "Archive Casting PlanningLine"
{
    DataClassification = ToBeClassified;
    Caption = '"Archive Casting Planning Line"';
    Description = 'This Is A "Archive Casting Planning Line" Table';
    TableType = Normal;


    fields
    {
        field(50; "Casting Plan No"; Code[20])
        {
            DataClassification = ToBeClassified;

        }


        field(35; item_no; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item."No.";
            trigger OnValidate()
            var
                recitem: record Item;
            begin
                if item_no = '' then
                    Error('Enter item No');
                if recitem.get(Rec.item_no) then
                    rec.Decription := recitem.Description;

                rec.UOM := recitem."Base Unit of Measure";
                Rec.Modify()



            end;
        }
        field(36; Decription; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(37; Grade; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(44; "Billet size"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(1; Rolling_size; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(39; SOqty; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(40; UOM; text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(41; planningQty; Decimal)
        { DataClassification = ToBeClassified; }
        field(43; remainingqty; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(2; "No_of_Heat"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(5; TDC; Code[20])
        {
            DataClassification = ToBeClassified;

        }



        field(42; Jominy; code[20])
        {
            DataClassification = ToBeClassified;



        }



        field(3; Length; Decimal)
        {
            DataClassification = ToBeClassified;

        }

        field(6; Supply_condition; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(7; type; text[20])
        {
            DataClassification = ToBeClassified;
            // OptionCaption = 'Preffered method';
            // OptionMembers = Alloy,NonAlloy;


        }
        field(4; "MFR NO"; integer)
        {
            DataClassification = ToBeClassified;

        }
        field(45; "CE VALUE"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(46; "DL VALUE"; integer) { DataClassification = ToBeClassified; }


        field(8; Fulfilment_Through; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(9; Route; text[20])
        {
            DataClassification = ToBeClassified;
            // OptionCaption = 'Preffered method';
            // OptionMembers = ARC,Induction;

        }
        field(10; Shape; Text[20])
        {
            DataClassification = ToBeClassified;

        }
        field(47; "BILLET/Bloom"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(48; PRIORITY; TEXT[20]) { DataClassification = ToBeClassified; }
        field(49; REMARKS; Text[100]) { DataClassification = ToBeClassified; }








    }



    var
        myInt: Integer;


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}