page 50017 "Visual page"
{
    ApplicationArea = All;
    Caption = 'Visual page';
    PageType = CardPart;
    SourceTable = "Visual table";

    layout
    {
        area(content)
        {
            grid(grid1)

            {
                ShowCaption = false;

                // field(Blob1; Rec.Blob1)
                // {
                //     ApplicationArea = all;
                //     ToolTip = 'Specifies the value of the Blob1 field.';
                // }
                // field(textnavigate; 'Items')
                // {
                //     ApplicationArea = all;
                //     ShowCaption = false;
                //     trigger OnDrillDown()
                //     begin
                //         page.Run(page::"Item List");
                //     end;

                // }

            }
            cuegroup(cuegroup2)
            {
                ShowCaption = false;
                field(Item; Rec.Item)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Blob1 field.';
                    DrillDownPageId = "Item List";
                    trigger OnDrillDown()
                    begin
                        page.Run(page::"Item List");
                    end;
                }
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = all;
                    DrillDownPageId = "Customer List";
                    trigger OnDrillDown()
                    begin
                        page.Run(page::"Customer List");
                    end;


                }
                // field(Blob2; Rec.Blob1)
                // {
                //     ApplicationArea = all;
                //     ToolTip = 'Specifies the value of the Blob1 field.';
                // }


            }
        }
    }
}
