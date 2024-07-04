namespace GUA.Bookstore.Book;

enum 50100 "BSB Book Type" implements "BSB Book Type Process"
{
    Extensible = true;
    DefaultImplementation = "BSB Book Type Process" = "BSB Default Impl.";

    value(0; " ")
    {
        Caption = 'None';
        // Implementation = "BSB Book Type Process" = "BSB Default Impl.";
    }
    value(1; Hardcover)
    {
        Caption = 'Hardcover';
        Implementation = "BSB Book Type Process" = "BSB Hardcover Impl.";
    }
    value(2; Paperback)
    {
        Caption = 'Paperback';
        Implementation = "BSB Book Type Process" = "BSB Paperback Impl.";
    }
}