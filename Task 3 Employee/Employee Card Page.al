/// <summary>
/// Page Employee card1 page (ID 50122).
/// </summary>
page 50122 "Employee card1 page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Employee Table";
    Caption = 'employee card1 page ';
    AboutText = 'Card1 PAge ';
    AboutTitle = 'This Is a card1 Page ';


    layout
    {
        area(Content)
        {
            group(GeneralDetail)
            {
                field(FirstName; Rec.FirstName)
                {
                    ApplicationArea = All;

                }

                field(EmpAddress; Rec.Address)
                {
                    ApplicationArea = All;

                }

                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;

                }
                field("Department"; Rec.Department)
                {
                    ApplicationArea = All;

                }
                field("Empcode1"; Rec.EmpCode)
                {
                    ApplicationArea = All;

                }
                field("Father name"; Rec."Father Name")
                {
                    ApplicationArea = All;

                }
                field("Mother name"; Rec."Mother Name")
                {
                    ApplicationArea = All;

                }


                field("organization name"; Rec."Organization Name")
                {
                    ApplicationArea = All;

                }
                field("Parents name"; Rec."Parents Name")
                {
                    ApplicationArea = All;

                }

                field("Work"; Rec.Work)
                {
                    ApplicationArea = All;

                }


            }


        }
    }





    actions
    {
        area(Processing)
        {
            action(test)
            {
                ApplicationArea = All;
                RunObject = page 50122;
                RunPageLink = EmpCode = field(EmpCode);
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;




                trigger OnAction()
                begin
                    Message('Data Inserted ');
                end;
            }
        }
    }

    var
        myInt: Integer;
}