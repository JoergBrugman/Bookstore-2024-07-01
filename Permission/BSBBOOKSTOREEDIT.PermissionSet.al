permissionset 50100 "BSB BOOKSTORE, EDIT"
{
    Caption = 'Edit and create books etc.';
    // Assignable = false;
    Permissions =
        tabledata "BSB Book" = RIMD,
        table "BSB Book" = X;
}