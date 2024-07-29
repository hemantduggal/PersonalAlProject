/// <summary>
/// PageExtension MyExtension (ID 50102) extends Record MyTargetPage.
/// </summary>
pageextension 50103 salesorderext extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field(Customerid; Rec.Customerid)
            {
                ApplicationArea = all;
                Editable = false;

            }
            field(Customertype; Rec.Customertype)
            {
                ApplicationArea = all;
                Editable = false;
            }
            field("Order Type"; Rec."Order Type")
            {
                ApplicationArea = all;
            }
        }
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                cust: Record Customer;
            begin
                if cust.Get() then
                    rec."Vendor No." := cust."Vendor No.";
                Rec."Vendor Name" := cust.Name;
                Rec."Vendor Address" := cust.Address;

            end;
        }
        addafter("Sell-to Customer No.")
        {
            field("Vendor No."; rec."Vendor No.")
            {
                ApplicationArea = all;
            }
            field("Vendor Name"; Rec."Vendor Name")
            {
                ApplicationArea = all;

            }
            field("Vendor Address"; Rec."Vendor Address")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
        addafter(Status)
        {

            field(StudentNO; Rec.StudentNO)
            {
                Caption = 'StudentNo';
                ApplicationArea = All;
                trigger OnValidate();
                begin

                end;
            }

            field(StudentName; rec.StudentName)
            {
                Caption = 'StudentName';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(StudentAddress; Rec.StudentAddress)
            {
                Caption = 'StudentAddress';
                ApplicationArea = All;


                trigger OnValidate();
                begin

                end;
            }
            field(StudentPhone; Rec.StudentPhone)
            {
                Caption = 'StudentPhone';
                ApplicationArea = All;
                trigger OnValidate();
                begin

                end;
            }
            field(StudentState; Rec.StudentState)
            {
                Caption = 'StudentState';
                ApplicationArea = All;
                trigger OnValidate();
                begin

                end;
            }
            field(StudentCity; Rec.StudentCity)
            {
                Caption = 'StudentCity';
                ApplicationArea = All;
                trigger OnValidate();
                begin

                end;
            }
            field("Contact person"; Rec."Contact person")
            {
                ApplicationArea = all;

            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = all;

            }
            field(Deal_date; Rec.Deal_date)
            {
                ApplicationArea = all;
            }
            field("order category"; Rec."order category")
            {
                ApplicationArea = all;

            }
            field("Today Date"; Rec."Today Date")
            {
                ApplicationArea = all;
            }

            field("Maintenance type"; Rec."Maintenance type")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    myInt: Integer;
                    sh: record "Sales Header";

                begin
                    if sh."Maintenance type" = sh."Maintenance type"::a then
                        visibles := true

                    else
                        visibles := false
                end;
            }
            field("Time Based"; Rec."Time Based")
            {
                ApplicationArea = All;
                Editable = visibles;
                // Visible = visibles;
                // trigger OnValidate()
                // var
                //     myInt: Integer;
                // begin
                //     visibles := visibles;

                // end;
            }

            field(flag; flag)
            {
                ApplicationArea = all;
                caption = 'Flag for action open page ';
            }

            //neww
            field(Type; Rec.Type)
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    InitializeVariables();
                end;
            }
            group(TimebAsedGourp)
            {
                Visible = FrequencyVisible;
                ShowCaption = false;

                field(frequency; Rec.frequency)
                {
                    ApplicationArea = All;
                }

            }
            group(ConditionGroup)
            {
                Visible = ConditionVisible;
                ShowCaption = false;

                field(Remarks1; Rec.Remarks1)
                {
                    ApplicationArea = All;
                }

            }
            group(ShutdownGroup)
            {
                Visible = ShutdownVisible;
                ShowCaption = false;

                field(Remarks2; Rec.Remarks2)
                {
                    ApplicationArea = All;
                }
            }
            field("Adv.Prepayment Amount"; Rec."Adv.Prepayment Amount")
            {
                ApplicationArea = all;
            }
        }

    }
    actions
    {
        modify(Post)
        {

            trigger OnBeforeAction()
            var
                myInt: Integer;
                re: record "Sales Header";
            begin
                rec.TestField("Vendor No.");

            end;
        }
        addafter("F&unctions")
        {
            action(ImportSalesLine)
            {
                Caption = 'import sales header';
                // Promoted = true;
                // PromotedCategory = Process;
                Image = Import;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    Xmlport.Run(Xmlport::importXmlportvia, false, true);
                end;
            }
            action("Export sales orders")
            {
                caption = 'export sales order';
                Image = Export;
                ApplicationArea = all;
                trigger OnAction()
                begin
                    xmlport.Run(Xmlport::exportXmlport, true, false);
                end;
            }
            action("open new page")
            {
                ApplicationArea = all;
                RunObject = page safetyguidelines;
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Enabled = flag;
                ToolTip = 'Safety Guidelines';
                //RunPageLink = "Maintenance Job work" = field("No.");
            }
        }
    }


    trigger OnAfterGetRecord()
    begin

        flag := false;
    end;

    var
        flag: Boolean;

    // trigger OnOpenPage();
    // var
    // begin
    //     if Rec.visible = false then
    //         CurrPage.Editable(false);visible = true;
    // end;

    var
        myInt: Integer;
        visibles: Boolean;

    /////\
    /// newwwww   forrrrrrrr time baseddddd visible 
    trigger OnOpenPage();
    var
        recmh: record "Sales Header";
        RecUserSetup: Record "User Setup";

    begin
        InitializeVariables();
        flag := false;////----ye lia tha boolean jb true ho to hi action button dikhe 
        if RecUserSetup.get(UserId) then;






    end;

    var
#pragma warning disable AL0667
        [InDataSet]
#pragma warning restore AL0667
        FrequencyVisible, ConditionVisible, ShutdownVisible : Boolean;

        starttime: Boolean;

    local procedure InitializeVariables()
    begin
        case Rec.Type of
            Rec.Type::" ":
                SetFieldsVisible(false, false, false);
            Rec.Type::Timebased:
                SetFieldsVisible(true, false, false);
            Rec.Type::"Condition based":
                SetFieldsVisible(false, false, false);
            Rec.Type::Shutdown:
                SetFieldsVisible(false, false, false);
        end;
    end;




    local procedure SetFieldsVisible(NewFrequencyVisible: Boolean; NewConditionVisible: Boolean; NewShutdownVisible: Boolean)
    begin
        FrequencyVisible := NewFrequencyVisible;
        ConditionVisible := NewConditionVisible;
        ShutdownVisible := NewShutdownVisible;
    end;

    /// to  set defaultt  vallue
    /// 
    ///  trigger OnNewRecord(BelowxRec: Boolean)
    // var
    // begin
    //     rec.Status := rec.Status::Open;
    //     rec.Modify();
    // end;
    /// 
    /// 





    /// ----> action button 2 page p ho to 1 page ke boolean se dusre page ke action button ko kaise bnd krae/////////////
    /// action(SafetyGuidelines)
    // {
    //     ApplicationArea = all;
    //     Caption = 'Safety Guidelines';
    //     // Visible = recSafety."Safety Guidelines" = true;
    //     Image = Process;
    //     Promoted = true;
    //     PromotedCategory = Process;
    //     PromotedIsBig = true;
    //     // Enabled = flag;
    //     ToolTip = 'Safety Guidelines';
    //     //RunObject = page SafetyGuideline;
    //     //RunPageLink = "Maintenance Job work" = field("Maintenance Job work");//, "Safety Guidelines" = filter(true);
    //     trigger OnAction()
    //     var
    //         RecSafety: Record SafetyGuidlines;
    //     BEGIN
    //         IF RecSafety.GET(Rec."Maintenance Job work") THEN BEGIN
    //             IF RecSafety."Safety Guidelines" THEN
    //                 Page.Run(50479, RecSafety);
    //         END
    //     END;
}