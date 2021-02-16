table 50501 "ACO FTP FolderList"
{
    Caption = 'FolderList';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Integer)
        {
            Caption = 'PK';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[2048])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; Type; Integer)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(4; Size; Integer)
        {
            Caption = 'Size';
            DataClassification = ToBeClassified;
        }
        field(5; chmod; Integer)
        {
            Caption = 'chmod';
            DataClassification = ToBeClassified;
        }
        field(6; Created; DateTime)
        {
            Caption = 'Created';
            DataClassification = ToBeClassified;
        }
        field(7; Modified; DateTime)
        {
            Caption = 'Modified';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if not rec.IsTemporary() then error(OnlyTemporaryErr);
    end;

    trigger OnModify()
    begin
        if not rec.IsTemporary() then error(OnlyTemporaryErr);
    end;

    trigger OnDelete()
    begin
        if not rec.IsTemporary() then error(OnlyTemporaryErr);
    end;

    trigger OnRename()
    begin
        if not rec.IsTemporary() then error(OnlyTemporaryErr);
    end;



    var
        onlyTemporaryErr: Label 'This table can only be used as a temporary table';

}
