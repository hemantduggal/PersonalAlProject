page 50014 "Inventory Dashboard page"
{
    ApplicationArea = All;
    Caption = 'Inventory Dashboard page';
    PageType = RoleCenter;
    SourceTable = "Inventory dashboard";

    layout
    {
        area(RoleCenter)
        {
            part(headline; "Headline RC Business Manager")
            {
                ApplicationArea = all;
            }
            part(activities; "Activities p")
            {
                ApplicationArea = all;
            }

            part(visualpart; "Visual page")
            { }
           
        }
    }
    actions
    {
        area(sections)
        {
            group(Action39)
            {
                Caption = 'Finance';
                Image = Journals;
                action(GeneralJournals)
                {
                    Caption = 'General Journals';
                    RunObject = Page "General Journal Batches";
                    RunPageView = where("Template Type" = const(General),
                                Recurring = const(false));
                }
                action(Action3)
                {
                   
                    Caption = 'Chart of Accounts';
                    RunObject = Page "Chart of Accounts";
                }
                action("G/L Account Categories")
                {
                    Caption = 'G/L Account Categories';
                    RunObject = Page "G/L Account Categories";
                }
                action("G/L Budgets")
                {
                    Caption = 'G/L Budgets';
                    RunObject = Page "G/L Budget Names";
                }

            }
            group("Cash Management")
            {
                Caption = 'Cash Management';

            }
            group(Action40)
            {
                Caption = 'Sales';

            }
        }
        area(embedding)
        {
            action(Customers)
            {
                Caption = 'Customers';
                RunObject = Page "Customer List";
            }
            action(Vendors)
            {
                Caption = 'Vendors';
                RunObject = Page "Vendor List";
            }
            action(Items)
            {
                Caption = 'Items';
                RunObject = Page "Item List";
            }
            action("Bank Accounts")
            {
                Caption = 'Bank Accounts';
                RunObject = Page "Bank Account List";
            }
            action("Chart of Accounts")
            {
                Caption = 'Chart of Accounts';
                RunObject = Page "Chart of Accounts";
            }
        }
    }
}
