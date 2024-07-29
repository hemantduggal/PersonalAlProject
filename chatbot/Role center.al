pageextension 60000 rolecenter extends "Business Manager Role Center"
{

    // Add changes to page layout here


    actions
    {
        addafter(Reports)
        {
            action(Chatbot)
            {
                ApplicationArea = All;
                RunObject = page salesorderbot;

            }

        }
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        saleorderbot: text;

}