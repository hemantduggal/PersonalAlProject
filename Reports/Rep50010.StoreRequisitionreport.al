report 50010 "Store Requisition report"
{
    ApplicationArea = All;
    Caption = 'Store Requisition report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\StoreReq.rdl';


    dataset
    {
        dataitem("Requisition Header"; "Requisition Header")
        {
            RequestFilterFields = "Requisition Slip No.";

            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(No_; "Requisition Slip No.")
            {

            }
            column(createddate; "SystemCreatedAt")
            {

            }

            column(Description_h; Description)
            {

            }
            column(Venue; "Location Code")
            {

            }
            column(Store_Location; "Store Location")
            {

            }
            column("UserID1"; frstapprover)
            {

            }
            column("User_ID2"; secondapprover)
            {

            }
            column(userrr; "Requested User ID")
            {

            }
            column("frstRejectCom"; "1st Reject Comment")
            {

            }
            column("SecRejectCom"; "2nd Reject Comment")
            {

            }
            column(Department; Department)
            {

            }
            column(approved1; approved1)
            {

            }
            column(approved2; approved2)
            {

            }

            // column(user; userrr)
            // {

            // }
            dataitem("Requisition_Line"; "Requisition_Line")
            {
                DataItemLink = "Requisition Slip No." = field("Requisition Slip No.");
                column(Sno; Sno)
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_Of_Measure_Code; "Unit Of Measure Code")
                {

                }
                column(quantity; "Request Quantity")
                {

                }

                trigger OnAfterGetRecord();
                var

                begin
                    Sno := Sno + 1;
                end;
            }
            trigger OnAfterGetRecord()
            begin
                Clear(frstapprover);
                userRec.reset();
                userRec.SetRange("User Name", "Requisition Header"."1st Approved/Rejected User ID");
                if userRec.FindFirst() then
                    frstapprover := userRec."Full Name";
                Clear(secondapprover);
                userRec.reset();
                userRec.SetRange("User Name", "Requisition Header"."2nd Approved/Rejected User ID");
                if userRec.FindFirst() then
                    secondapprover := userRec."Full Name";

                Clear(userrr);
                userRec.reset();
                userRec.SetRange("User Name", "Requisition Header"."Requested User ID");
                if userRec.FindFirst() then
                    userrr := userRec."Full Name";


                if "1st Approved/Rejected Date" <> 0D then
                    approved1 := 'Approved'
                else
                    approved1 := 'Pending';

                if "2nd Approved/Rejected Date" <> 0D then
                    approved1 := 'Approved'
                else
                    approved1 := 'Pending';

            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

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


    trigger OnPreReport()
    var
    begin
        CompanyInfo.Get;
        Sno := 0;
    end;

    var
        myInt: Integer;
        Sno: Integer;
        CompanyInfo: Record "Company Information";
        userRec: Record User;
        frstapprover: Text;
        secondapprover: Text;
        userrr: Text;
        approved1: Text;
        approved2: Text;

}