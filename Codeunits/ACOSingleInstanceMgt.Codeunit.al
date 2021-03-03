codeunit 50001 "ACO Single Instance Mgt"
{
    SingleInstance = true;

    procedure SetSalesLineProfileCode(NewSalesLineProfileCode: Code[30]);
    begin
        SalesLineProfileCode := NewSalesLineProfileCode;
    end;

    procedure GetSalesLineProfileCode(): Code[30];
    begin
        exit(SalesLineProfileCode);
    end;

    procedure SetSalesLineCustomerItemNo(NewSalesLineCustomerItemNo: Code[50]);
    begin
        SalesLineCustomerItemNo := NewSalesLineCustomerItemNo;
    end;

    procedure GetSalesLineCustomerItemNo(): Code[50];
    begin
        exit(SalesLineCustomerItemNo);
    end;

    var
        SalesLineProfileCode: Code[30];
        SalesLineCustomerItemNo: Code[50];
}