namespace GUA.Bookstore.Book;

page 50101 "BSB Book List"
{
    Caption = 'Books';
    PageType = List;
    SourceTable = "BSB Book";
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "BSB Book Card";

    layout
    {
        area(Content)
        {
            repeater(Books)
            {

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(ISBN; Rec.ISBN)
                {
                    ToolTip = 'Specifies the value of the ISBN field.', Comment = '%';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.', Comment = '%';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    ToolTip = 'Specifies the value of the No. of Pages field.', Comment = '%';
                    Visible = false;
                }
            }

        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = Notes; }
        }
    }

    actions
    {
        area(Promoted)
        {
            actionref(CreateDemoBooks_Ref; CreateDemoBooks) { }
        }
        area(Processing)
        {
            action(CreateDemoBooks)
            {
                Caption = 'Create Books';
                Image = CreateDocuments;
                RunObject = codeunit "BSB Create Books";
            }
            action(DeleteDemoBooks)
            {
                Caption = 'Delete Books';
                Image = Delete;

                trigger OnAction()
                var
                    BSBBook: Record "BSB Book";
                begin
                    CurrPage.SetSelectionFilter(BSBBook);
                    BSBBook.DeleteAll();
                end;
            }
        }
    }
}
