page 50090 BacklogN
{
    PageType = List;
    caption = 'Backlog-N';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BacklogN;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {



            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(ImportBacklogList)
            {
                Caption = 'import Backlog List';

                action(Singapore)
                {
                    Caption = 'Import Singapore Data';
                    Image = ListPage;
                    ApplicationArea = all;
                    RunObject = page "Backlog-SN";


                }
                action("Signgapore EDD")
                {
                    Caption = 'Import Singapore-EDD Data';
                    Image = ListPage;
                    ApplicationArea = all;
                    RunObject = page "Backlog-SN-EDD";


                }
                action(Hongkong)
                {
                    Caption = 'Import Hong kong Data';
                    // Promoted = true;
                    // PromotedCategory = Process;
                    Image = ListPage;
                    ApplicationArea = all;
                    RunObject = page "Backlog-HN";



                }
                action("Hongkong EDD")
                {
                    Caption = 'Import Hong kong-EDD Data';
                    // Promoted = true;
                    // PromotedCategory = Process;
                    Image = ListPage;
                    ApplicationArea = all;
                    RunObject = page "Backlog-HN-EDD";



                }
            }
        }
    }


    var
        myInt: Integer;

}