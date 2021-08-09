codeunit 50001 "ACO Single Instance Mgt"
{
    SingleInstance = true;

    procedure SetCustomerNo(NewCustomerNo: Code[20]);
    begin
        if (NewCustomerNo = '') and TemporaryUserSetup.Get(UserId()) then begin
            TemporaryUserSetup.Delete();
            exit;
        end;

        if TemporaryUserSetup.Get(UserId()) then begin
            TemporaryUserSetup."Salespers./Purch. Code" := NewCustomerNo;
            TemporaryUserSetup.Modify();
        end else begin
            TemporaryUserSetup."User ID" := UserId();
            TemporaryUserSetup."Salespers./Purch. Code" := NewCustomerNo;
            TemporaryUserSetup.Insert();
        end;
    end;

    procedure GetCustomerNo(): Code[20];
    begin
        if not TemporaryUserSetup.Get(UserId()) then
            Clear(TemporaryUserSetup);

        exit(TemporaryUserSetup."Salespers./Purch. Code");
    end;

    procedure SetACOProfileCustomerPK(NewACOProfileCustomerProfileCode: Code[30]; NewACOProfileCustomerCustomerNo: Code[20]; NewACOProfileCustomerCustomerItemNo: Code[50]);
    begin
        ACOProfileCustomerProfileCode := NewACOProfileCustomerProfileCode;
        ACOProfileCustomerCustomerNo := NewACOProfileCustomerCustomerNo;
        ACOProfileCustomerCustomerItemNo := NewACOProfileCustomerCustomerItemNo;
    end;

    procedure GetACOProfileCustomerPK(var NewACOProfileCustomerProfileCode: Code[30]; var NewACOProfileCustomerCustomerNo: Code[20]; var NewACOProfileCustomerCustomerItemNo: Code[50])
    begin
        NewACOProfileCustomerProfileCode := ACOProfileCustomerProfileCode;
        NewACOProfileCustomerCustomerNo := ACOProfileCustomerCustomerNo;
        NewACOProfileCustomerCustomerItemNo := ACOProfileCustomerCustomerItemNo;
    end;


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

    procedure SetProfileCustomerPK(NewProfileCustomerPK: Code[100]);
    begin
        ProfileCustomerPK := NewProfileCustomerPK;
    end;

    procedure GetProfileCustomerPK(): Code[100];
    begin
        exit(ProfileCustomerPK);
    end;

    procedure SetPostProductionJournal(NewPostProductionJournal: Boolean);
    begin
        PostProductionJournal := NewPostProductionJournal;
    end;

    procedure GetPostProductionJournal(): Boolean;
    begin
        exit(PostProductionJournal);
    end;

    var
        TemporaryUserSetup: Record "User Setup" temporary;
        SalesLineProfileCode: Code[30];
        SalesLineCustomerItemNo: Code[50];
        ACOProfileCustomerProfileCode: Code[30];
        ACOProfileCustomerCustomerNo: Code[20];
        ACOProfileCustomerCustomerItemNo: Code[50];
        ProfileCustomerPK: Code[100];
        PostProductionJournal: Boolean;
}