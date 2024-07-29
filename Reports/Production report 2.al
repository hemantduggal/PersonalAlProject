/// <summary>
/// Report Production1Report (ID 50000).
/// </summary>
report 50001 Production2Report
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ReportLayout\P-2.rdl';


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.";

            column(companyname; companyinfo.Name)
            {

            }
            column(starting_date; starting_date)
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Bill_to_Contact; "Bill-to Contact")
            {

            }
            column(sR_time; sR_time)
            {

            }
            column(sR2_time; sR2_time)
            {

            }
            column(crewCall; crewCall)
            {

            }
            column(lunch; lunch)
            {

            }


            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");

                column(No_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
            }
        }
    }


    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(starting_date; starting_date)
                    { ApplicationArea = all; }

                    field(sR_time; sR_time)
                    { ApplicationArea = all; }
                    field(sR2_time; sR2_time)
                    { ApplicationArea = all; }
                    field(crewCall; crewCall)
                    { ApplicationArea = all; }
                    field(lunch; lunch)
                    { ApplicationArea = all; }
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
        companyinfo.get();
    end;



    var
        myInt: Integer;
        companyinfo: Record "Company Information";
        starting_date: Date;

        sR_time: Time;
        sR2_time: Time;
        crewCall: Time;
        lunch: time;


}