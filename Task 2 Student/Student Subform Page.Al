/// <summary>
/// Page  Student Subform Page (ID 50116).
/// </summary>
page 50116 "Student Subform Page"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Student line Table";
    Caption = 'subform page';
    Description = 'This is a subfrom page ';
    AboutText = 'Subform PAge ';
    AboutTitle = 'This Is a Subform Page ';

    layout
    {
        area(Content)
        {
            repeater(Other)
            {
                Caption = 'other';


                field(StudentNO; rec.studentNo)
                {
                    ApplicationArea = all;
                }
                field(studentSubject; rec.studentsubject)
                {
                    applicationarea = all;
                }
                field(Marks; Rec.Marks)
                {
                    ApplicationArea = All;

                }
                field("Date of birth"; Rec."Date of birth")
                {
                    ApplicationArea = All;

                }



                field(Age; Rec.Age)
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
            action(Save)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('Data saved');
                end;
            }
        }
    }


}