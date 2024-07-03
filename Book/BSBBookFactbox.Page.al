page 50102 "BSB Book Factbox"
{
    Caption = 'Book Details';
    PageType = CardPart;
    SourceTable = "BSB Book";
    Editable = false;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {

            field("No."; Rec."No.")
            {
                ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                Caption = 'Book No.';

                trigger OnDrillDown()
                begin
                    ShowDetail();
                end;
            }
            field(Description; Rec.Description)
            {
                ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                Caption = 'Book Description';
            }
            field("Date of Publishing"; Rec."Date of Publishing")
            {
                ToolTip = 'Specifies the value of the Date of Publishing field.', Comment = '%';
            }
            field("No. of Pages"; Rec."No. of Pages")
            {
                ToolTip = 'Specifies the value of the No. of Pages field.', Comment = '%';
            }
            field(Author; Rec.Author)
            {
                ToolTip = 'Specifies the value of the Author field.', Comment = '%';
            }
        }
    }


    local procedure ShowDetail()
    begin
        Rec.ShowCard();
    end;
}