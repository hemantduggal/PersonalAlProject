/// <summary>
/// Page 50111.
/// </summary>
page 50111 "Employee card page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = EmployeeHeader;
    Caption = 'employee header card page ';
    AboutText = 'Card PAge ';
    AboutTitle = 'This Is a card Page ';


    layout
    {
        area(Content)
        {
            group(GeneralDetail)
            {
                field(empName; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(empNo; Rec.No)
                {
                    ApplicationArea = All;

                }
                field(EmpAddress; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = All;

                }
                field(PhoneNo; Rec.PhoneNo)
                {
                    ApplicationArea = All;

                }
                field(city; Rec.city)
                {
                    ApplicationArea = All;

                }
                field(PostalCode; Rec.PostalCode)
                {
                    ApplicationArea = All;

                }
            }
            group(otherdetails)
            {
                part(general; "Employee subform page")
                {
                    SubPageLink = "DocumentNo" = field(No);
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
                RunObject = page 50111;
                RunPageLink = "Name" = field(Name);
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;




                trigger OnAction()
                begin
                    Message('Data Inserted ');
                end;
            }
            action(ImportEMployeeDataXMLPORT)
            {
                Caption = 'import data via xml port';
                Promoted = true;
                PromotedCategory = New;
                Image = Import;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Xmlport.Run(50100, true, true);
                end;
            }
            action("NEW import employee XML Port")
            {
                Caption = 'import employee data';
                Promoted = true;
                PromotedCategory = New;
                Image = Import;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Xmlport.Run(50102, true, true);
                end;
            }
        }
    }

    var
        myInt: Integer;
}