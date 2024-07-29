page 50085 SadaPriceList
{
    PageType = List;
    caption = 'Sada Price List New';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Sadapricelistnew;



    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                //     field(ProductBU; Rec.ProductBU)
                //     {
                //         ApplicationArea = All;


                //     }
                //     field(ProductBUCode; Rec.ProductBUCode)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(Productgroup; Rec.Productgroup)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(ProductGroupCode; Rec.ProductGroupCode)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(MPN; Rec.MPN)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(Name; Rec.Name)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(Customer; Rec.Customer)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("End Customer "; Rec."End Customer")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Debit Number"; Rec."Debit Number")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(RegNo; Rec.RegNo)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("E2 Contract Nr"; Rec."E2 Contract Nr")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(DebitStatus; Rec.DebitStatus)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Item Start Date"; Rec."Item Start Date")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Item Expiry Date"; Rec."Item Expiry Date")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Reg Item Exp Date"; Rec."Reg Item Exp Date")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Reg item Status"; Rec."Reg item Status")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(Currency; Rec.Currency)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Debit Item Num"; Rec."Debit Item Num")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Debit Req Qty"; Rec."Debit Req Qty")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Debit Ship Qty"; Rec."Debit Ship Qty")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Debit Open Qty"; Rec."Debit Open Qty")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Adj. Cost"; Rec."Adj. Cost")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Adj. Resale"; Rec."Adj. Resale")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(DBC; Rec.DBC)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Debit Open Qty Percentage"; Rec."Debit Open Qty Percentage")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Is MQ"; Rec."Is MQ")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field(DistiShiptoname; Rec.DistiShiptoname)
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Customer City"; Rec."Customer City")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Customer State"; Rec."Customer State")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Customer Zip"; Rec."Customer Zip")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("Customer Country"; Rec."Customer Country")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("End Customer City"; Rec."End Customer City")
                //     {
                //         ApplicationArea = all;

                //     }
                //     field("End Customer State"; Rec."End Customer State")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("End Customer Zip"; Rec."End Customer Zip")
                //     {

                //         ApplicationArea = all;
                //     }
                //     field("End Customer Country"; Rec."End Customer Country")
                //     {

                //         ApplicationArea = all;
                //     }


            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(ImportSadaPRiceList)
            {
                Caption = 'import Sada Price List';

                action(Singapore)
                {
                    Caption = 'Import Singapore Data';
                    Image = ListPage;
                    ApplicationArea = all;
                    RunObject = page "SadaPriceList-SN";

                    // trigger OnAction()
                    // begin
                    //     Xmlport.Run(50009, false, true);
                    // end;
                }
                action(Hongkong)
                {
                    Caption = 'Import Hong kong Data';
                    // Promoted = true;
                    // PromotedCategory = Process;
                    Image = ListPage;
                    ApplicationArea = all;
                    RunObject = page "SadaPriceList-HN";
                    // trigger OnAction()
                    // begin
                    //     Xmlport.Run(50009, false, true);

                    // end;


                }
            }
        }
    }


    var
        myInt: Integer;

}