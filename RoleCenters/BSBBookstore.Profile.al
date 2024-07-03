namespace GUA.Bookstore.RoleCenters;
using Microsoft.Sales.RoleCenters;

profile "BSB Bookstore"
{
    Caption = 'Profile to work with Bookstore';
    RoleCenter = "Order Processor Role Center";
    Customizations = "BSB Customer Card", "BSB Customer List";
}