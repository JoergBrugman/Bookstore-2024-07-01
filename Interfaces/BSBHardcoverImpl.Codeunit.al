codeunit 50112 "BSB Hardcover Impl." implements "BSB Book Type Process"
{
    procedure StartDeployBook()
    begin
        Message('Aus dem Lager entnehmen');
    end;

    procedure StartDeliverBook()
    begin
        Message('Mit UPS Premium versenden');
    end;
}