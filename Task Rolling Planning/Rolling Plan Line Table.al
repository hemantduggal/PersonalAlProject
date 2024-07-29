/// <summary>
/// Table EmployeeLine (ID 50109).
/// </summary>
table 50105 "Rolling Plan Line"
{
    DataClassification = ToBeClassified;
    Caption = '"Rolling Plan Line"';
    Description = 'This Is A "Rolling Plan Line" Table';
    TableType = Normal;


    fields
    {
        field(35; itemno; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36; itemName; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(37; Grade; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(38; Charging_size; Integer)
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



        field(42; Jominy; code[20])
        {
            DataClassification = ToBeClassified;



        }


        field(1; Rolling_size; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "No_of_belt/bloom"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(3; Length; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Size Tolerance"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(5; TDC; Code[20])
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
        field(11; Charging_length; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Charging_mtr/wt"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "charging Weight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13; jominy_sample_to_cut; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; Remarks; text[50])
        {
            DataClassification = ToBeClassified;


        }
        field(15; Burning_loss_in_kg; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Ending cutting loss for Round"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "RCS Radius"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Ending cutting loss for RCS"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Finsih Wt for rcs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Finsih Wt for round"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(20; "Total Finish length for rcs"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "total finsih length for round"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Cutting length"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Target No.ofFinish BarForRound"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Target No.ofFinish Bar For RCS"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Expected yield for round"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Expected yield for RCS"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Inspection priority"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Original Heat Customer"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(28; "Stack Colling/pit colling"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "SMS PROCESS REPORT"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Non confirming heat"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Status"; Text[20])
        {
            DataClassification = ToBeClassified;
        }






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