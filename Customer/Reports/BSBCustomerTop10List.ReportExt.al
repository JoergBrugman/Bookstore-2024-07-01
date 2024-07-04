namespace GUA.Bookstore.Customer.Reports;
using Microsoft.Sales.Reports;


reportextension 50100 "BSB Customer - Top 10 List" extends "Customer - Top 10 List"
{
    dataset
    {
        add(Integer)
        {

            column(BSBCountryRegionCode_Customer; Customer."Country/Region Code")
            {
                IncludeCaption = true;
            }
        }
        modify(Customer)
        {
            RequestFilterFields = "Country/Region Code";
        }
    }

    rendering
    {
        layout("CR-Code")
        {
            Type = RDLC;
            Caption = 'Caption CR-Code';
            Summary = 'Summary CR-Code';
            LayoutFile = './Customer/Reports/BSBCustomerTop10List.ReportExt.rdlc';
        }
    }

}