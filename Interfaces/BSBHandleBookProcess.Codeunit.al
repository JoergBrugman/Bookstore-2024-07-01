codeunit 50120 "BSB Handle Book Process"
{
    procedure HandleBookProcess(BSBBook: Record "BSB Book")
    var
        // BSBHardcoverImpl: Codeunit "BSB Hardcover Impl.";
        // BSBPaperbackImpl: Codeunit "BSB Paperback Impl.";
        BSBBookTypeProcessInterface: Interface "BSB Book Type Process";
    begin
        if BSBBook.Type = BSBBook.Type::" " then
            exit;

        // if BSBBook.Type = BSBBook.Type::Hardcover then begin
        //     BSBHardcoverImpl.StartDeployBook();
        //     BSBHardcoverImpl.StartDeliverBook();
        // end else
        //     if BSBBook.Type = BSBBook.Type::Paperback then begin
        //         BSBPaperbackImpl.StartDeployBook();
        //         BSBPaperbackImpl.StartDeliverBook();
        //     end;

        // if BSBBook.Type = BSBBook.Type::Hardcover then
        //     BSBBookTypeProcessInterface := BSBHardcoverImpl
        // else
        //     BSBBookTypeProcessInterface := BSBPaperbackImpl;

        BSBBookTypeProcessInterface := BSBBook.Type;
        BSBBookTypeProcessInterface.StartDeployBook();
        BSBBookTypeProcessInterface.StartDeliverBook();



    end;
}