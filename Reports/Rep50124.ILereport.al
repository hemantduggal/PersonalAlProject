/// <summary>
/// Report ILe report (ID 50124).
/// </summary>
report 50124 "ILe report"
{
    ApplicationArea = All;
    Caption = 'ILE report';
    UsageCategory = Administration;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\ile.rdl';

    dataset
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {



            // Columns for the report
            column("Companyname"; CompanyName)
            {
                // Column settings, if any...
            }
            column(CompanyAddress; "Area")
            {
                // Column settings, if any...
            }
            column(SerialNo; "Serial No.")
            {

            }

            column(CustOrderDetailCaption; CustOrderDetailCaption)
            {
            }

            column(DocumentNo; "Document No.")
            {
                // Column settings, if any...
            }

            column(ItemNo; "Item No.")
            {
                // Column settings, if any...
            }

            column(Description; Description)
            {
                // Column settings, if any...
            }

            column(Quantity; Quantity)
            {
                // Column settings, if any...
            }

            column(UnitofMeasureCode; "Unit of Measure Code")
            {
                // Column settings, if any...
            }

            column(LocationCode; "Location Code")
            {
                // Column settings, if any...
            }

            column(CostAmountActual; "Cost Amount (Actual)")
            {
                // Column settings, if any...
            }

            //Auto-increment the "SerialNo" for each record in the dataset
            trigger OnAfterGetRecord()
            var
                SerialNo: Integer;
            begin
                SerialNo += 1;
            end;

        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    // Group settings, if any...
                }
            }
        }

        actions
        {
            area(processing)
            {

            }
        }

    }

    // trigger OnInitReport()
    // begin
    //     SerialNo += 1;
    // end;

    var

        CustOrderDetailCaption: Label 'ILe Report';

}