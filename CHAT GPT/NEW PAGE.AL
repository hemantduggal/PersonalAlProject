page 59999 HemantPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = HemantTable;
    Caption = 'TOP LIST PAGE';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Notes; Rec.Notes)
                {
                    ApplicationArea = All;

                }
            }
        }

        area(FactBoxes)
        {
            part(CustomerList; "Customer Details FactBox")
            {
                ApplicationArea = All;

            }

        }
    }

    actions
    {
        area(Processing)
        {
            group("TOP LIST")
            {
                Caption = 'TOP LIST';

                action("TOP VENDOR")
                {
                    Image = ListPage;
                    RunObject = report "Vendor - Top 10 List";
                }
                action("TOP Customer")
                {
                    Image = ListPage;
                    RunObject = report "Customer - Top 10 List";
                }
                action("TOP Inventory")
                {
                    Image = ListPage;
                    RunObject = report "Inventory - Top 10 List";
                }

            }
        }
    }

    var
        myInt: Integer;
}