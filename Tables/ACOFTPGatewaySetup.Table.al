table 50500 "ACO FTP Gateway Setup"
{
    Caption = 'FTP Gateway Setup';
    DataClassification = OrganizationIdentifiableInformation;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }
        field(2; HostName; Text[1024])
        {
            Caption = 'HostName';
            DataClassification = OrganizationIdentifiableInformation;
            trigger OnValidate()
            begin
                if HostName.EndsWith('/') then
                    Hostname := Hostname.Substring(1, StrLen(Hostname) - 1).Substring(1, 1024);
                Rec.Modify();
            end;

        }
        field(3; Anonymous; Boolean)
        {
            Caption = 'Anonymous';
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(4; Username; Text[1024])
        {
            Caption = 'Username';
            DataClassification = OrganizationIdentifiableInformation;
        }
        field(5; Password; Text[1024])
        {
            Caption = 'Password';
            DataClassification = OrganizationIdentifiableInformation;
        }

    }
    keys
    {
        key("Primary Key"; "Primary Key")
        {
            Clustered = true;
        }
    }

}
