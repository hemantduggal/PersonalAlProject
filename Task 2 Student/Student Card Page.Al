/// <summary>
/// Page Student card Page (ID 50115).
/// </summary>
page 50115 "Student card Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Student Header Table";
    AboutText = 'Card PAge ';
    AboutTitle = 'This Is a card Page ';
    


    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }

                field(PhoneNo; Rec.PhoneNo)
                {
                    ApplicationArea = All;

                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }

                field(Pincode; Rec.Pincode)
                {
                    ApplicationArea = All;

                }

                field(State; Rec.State)
                {
                    ApplicationArea = All;

                }

                field(City; Rec.City)
                {
                    ApplicationArea = All;

                }
                field("Sales order"; Rec."Sales order")
                {
                    ApplicationArea = all;

                }
            }
            group(otherdetails)
            {
                part("Other details"; "Student Subform Page")
                {
                    SubPageLink = studentNo = field(No);
                    ApplicationArea = All;

                }




            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Record)
            {
                ApplicationArea = All;
                // RunObject = page "Sales Order";
                // RunPageLink = "No." = field(Name);
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;


                trigger OnAction()
                var
                    sh: Record "Sales Header";

                begin

                    sh.Reset();
                    sh.SetRange("Document Type", sh."Document Type"::Order);
                    //sh.SetRange("No.", Rec.No);
                    if sh.FindSet then
                        sh.StudentNO := rec.No;
                    sh.StudentName := rec.Name;
                    sh.State := rec.State;
                    sh.StudentCity := rec.City;
                    sh."No." := rec."Sales order";

                    sh.Modify();




                    Message('Data inserted');

                end;
            }

        }
    }

    var
        myInt: Integer;
}