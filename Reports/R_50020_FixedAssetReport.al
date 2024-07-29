/// <summary>
/// Report FixedAsset (ID 50002).
/// </summary>
report 50002 FixedAsset

{
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\FixedAsset.rdl';
    ApplicationArea = All;
    Caption = 'Fixed Asset Register';
    UsageCategory = Administration;
    dataset
    {

        dataitem("Fixed Asset"; "Fixed Asset")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";

            column(FA_Posting_Group; "FA Posting Group")
            {

            }
            column(CmpName; CompanyInfo.Name)
            {

            }
            // column(Cost_Control_Center; "Cost/Control Center")
            // {

            // }
            column(Description; Description)
            {

            }
            column(Serial_No_; "Serial No.")
            {

            }
            column(FA_Location_Code; "FA Location Code")
            {

            }
            // column(Condition; Condition)
            // {

            // }
            // column(Date_of_Purchase; "Date of Purchase")
            // {

            // }


            trigger OnPreDataItem()
            var
            begin


            end;

            trigger OnAfterGetRecord()
            var

            Begin

            end;
        }
    }

    /*  requestpage
      {
          SaveValues = true;

          layout
          {
              area(content)
              {
                  group("Date Filter")
                  {
                      Caption = 'Date Filters';
                      /*   field(FromDate; FromDate)
                         {
                             ApplicationArea = Basic, Suite;
                             Caption = 'From Date';
                             Visible = false;
                             trigger OnValidate()
                             begin
                                 if ToDate = 0D then
                                     Error('Enter Date');
                             end;
                         }
                         field(ToDate; ToDate)
                         {
                             ApplicationArea = Basic, Suite;
                             Caption = 'To Date';
                             trigger OnValidate()
                             begin

                             end;
                         }

                  }
              }
          }
      }*/


    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);

    end;

    trigger OnPostReport()
    var
    begin

    end;

    var
        CompanyInfo: Record "Company Information";


}
