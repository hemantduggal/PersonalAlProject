report 50311 "PostedSCr_BatchReport"///////////for document no updation and posting date
{
    Caption = 'PostedSales Credit Batch Report';
    Permissions = tabledata "Sales Cr.Memo Header" = rim;
    ProcessingOnly = true;
    ApplicationArea = all;
    UsageCategory = Administration;

    dataset
    {
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "No.";

            dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document no." = field("No.");
            }
            trigger OnAfterGetRecord()
            var
            begin
                clear(SaleCrMemono);
                clear(salepdate);
                SaleCrMemono := "Sales Cr.Memo Header"."No.";
                salepdate := "Sales Cr.Memo Header"."Posting Date";
                SCrH.reset();
                SCrH.setrange("No.", SaleCrMemono);
                SCrH.setrange("Posting Date", salepdate);
                if scrh.findfirst() then begin
                    scrh.Rename(DocNo);
                    scrh."Posting Date" := pdate;
                    scrh.Modify();
                end;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Filter)
                {
                    field(DocNo; DocNo)
                    {
                        ApplicationArea = all;
                        Caption = 'Document';
                    }
                    field(pdate; pdate)
                    {
                        ApplicationArea = all;
                        Caption = 'Posting Datee';
                    }

                }
            }
        }
    }
    trigger OnPostReport()
    begin
        Message('Values Updated');
    end;

    var
        DocNo: code[20];
        pdate: Date;
        salepdate: date;
        SCrH: Record "Sales Cr.Memo Header";
        SaleCrMemono: Code[20];
}

