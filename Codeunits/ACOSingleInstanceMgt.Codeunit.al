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

    var
        SalesLineProfileCode: Code[30];
}