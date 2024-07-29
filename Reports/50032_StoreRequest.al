/// <summary>
/// Report StoreRequest (ID 50041).
/// </summary>
report 50041 StoreRequest
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'Store Request';
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\StoreRequest.rdl';

    dataset
    {
        dataitem(StoreRequisitionHeader; "Requisition Line")
        {
            //RequestFilterFields = "Store Requisition Doc No";
            column(cmpName; CompanyInfo.Name)
            {

            }
            column(Cmppic; CompanyInfo.Picture)
            {

            }
            // column(Store_Requisition_Doc_No; "Store Requisition Doc No")
            // {

            // }
            // column(Project_code; "Project code")
            // {

            // }
            // column(From_location; "From location")
            // {

            // }
            // column(To_location; "To location")
            // {

            // }
            // column(nrgp no) { }
            //dataitem(StoreRequisitionLine; StoreRequisitionLine)
            // DataItemLink = "Store Requisition Doc No" = field("Store Requisition Doc No");
            //column(Item_No_; "Item No.")
            // {

            // }
            column(Description; Description)
            {

            }
            column(Quantity; Quantity)
            {

            }
            // column(UOM; UOM)
            // {

            // }
            column(SNo; SNo)
            {

            }
            trigger OnAfterGetRecord()
            var

            begin
                SNo += 1;
            end;
        }
    }
    // }

    /*   requestpage
       {
           layout
           {
               area(Content)
               {
                   group(GroupName)
                   {
                       field(Name; SourceExpression)
                       {
                           ApplicationArea = All;

                       }
                   }
               }
           }

           actions
           {
               area(processing)
               {
                   action(ActionName)
                   {
                       ApplicationArea = All;

                   }
               }
           }
       }
   */
    trigger OnPreReport()
    var
    begin
        SNo := 0;
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        SNo: Integer;
}