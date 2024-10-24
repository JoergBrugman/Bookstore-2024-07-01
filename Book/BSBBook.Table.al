namespace GUA.Bookstore.Book;


/// <summary>
/// Table BSB Book (ID 50100).
/// </summary>
table 50100 "BSB Book"
{
    Caption = 'Book';
    DataClassification = ToBeClassified;
    DataCaptionFields = "No.", Description;
    LookupPageId = "BSB Book List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
            ToolTip = 'Specifies the value of the No. field.', Comment = '%';

        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                if ("Search Description" = UpperCase(xRec.Description)) or ("Search Description" = '') then
                    "Search Description" := CopyStr(Description, 1, MaxStrLen("Search Description"));
            end;
        }
        field(3; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(5; Type; Enum "BSB Book Type")
        {
            Caption = 'Type';
            // OptionMembers = " ",Hardcover,Paperback;
            // OptionCaption = ' ,Hardcover,Paperback';
        }
        field(7; Created; Date)
        {
            Caption = 'Created';
            Editable = false;
            //[x] Automatisch setzen
        }
        field(8; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            //[x] Automatisch setzen
        }
        field(10; Author; Text[50])
        {
            Caption = 'Author';
        }
        field(11; "Author Provision %"; Decimal)
        {
            Caption = 'Author Provision %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }
        field(15; ISBN; Code[20])
        {
            Caption = 'ISBN';
        }
        field(16; "No. of Pages"; Integer)
        {
            Caption = 'No. of Pages';
        }
        field(17; "Edition No."; Integer)
        {
            Caption = 'Edition No.';
            MinValue = 0;
        }
        field(18; "Date of Publishing"; Date)
        {
            Caption = 'Date of Publishing';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    var
        OnDeleteBookErr: Label 'A book cannot be deleted';

    trigger OnInsert()
    begin
        Created := Today;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete()
    var
        IsHandled: Boolean;
    begin
        // Handled-Event-Pattern: 
        // ----------------------
        // Wird immer dann genutzt, wenn nachfolgender Code ganz oder teilweise 
        // nicht ausgeführt werden soll.
        OnBeforeOnDelete(Rec, xRec, IsHandled);
        if IsHandled then
            exit;

        Error(OnDeleteBookErr);
    end;

    //[x] Bücher dürfen nicht gelöscht
    //TODO Neue Funktion "TestBlocked()"

    procedure TestBlocked()
    begin
        TestField(Blocked, false);
    end;

    procedure ShowCard()
    begin
        // Page.RunModal(Page::"BSB Book Card", Rec);
        ShowCard(Rec);
    end;

    local procedure ShowCard(BSBBook: Record "BSB Book")
    begin
        Page.RunModal(Page::"BSB Book Card", BSBBook);
    end;

    procedure ShowCard(BookNo: Code[20])
    var
        BSBBook: Record "BSB Book";
    begin
        if BookNo = '' then
            exit;

        BSBBook.Get(BookNo);
        // Page.RunModal(Page::"BSB Book Card",BSBBook);
        ShowCard(BSBBook);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeOnDelete(var Rec: Record "BSB Book"; var xRec: Record "BSB Book"; var IsHandled: Boolean)
    begin
    end;
}
