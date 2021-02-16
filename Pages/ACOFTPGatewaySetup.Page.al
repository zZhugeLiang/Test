page 50500 "ACO FTP Gateway Setup"
{

    Caption = 'FTP Gateway Setup';
    PageType = Card;
    SourceTable = "ACO FTP Gateway Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    InsertAllowed = false;
    DeleteAllowed = false;
    Editable = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(HostName; Rec.HostName)
                {
                    ToolTip = 'Specifies the Hostname of the RestFTP gateway (not the FTP server!)';
                    ApplicationArea = All;
                }
                field(Anonymous; Rec.Anonymous)
                {
                    ToolTip = 'If Checked no username and/or password will be used.';
                    ApplicationArea = All;
                }
                field(Username; Rec.Username)
                {
                    Tooltip = 'Specifies the Username for the ABC RestFTP if required';
                    ApplicationArea = All;
                    Enabled = not Rec.Anonymous;
                }
                field(Password; Rec.Password)
                {
                    Tooltip = 'Specifies the Password for the ABC RestFTP if required';
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                    Enabled = not Rec.Anonymous;
                }
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(testGateway)
            {
                ApplicationArea = All;
                Caption = 'test Gateway';
                Image = TestFile;
                ToolTip = 'Tests if the FTP gateway can be reached using the specified data';
                trigger OnAction()
                var
                    ACOFTPConnector: CodeUnit "ACO FTP Connector";
                    ACOAPIHelper: Codeunit "ACO API Helper";
                    JsonObject: JsonObject;
                begin
                    JsonObject := ACOFTPConnector.executeFTPCommand('Ping', '', '', 0, '', '', JsonObject);
                    if JsonObject.Contains('Result') then
                        Message(ACOAPIHelper.GetValue(JsonObject, 'Result').AsText());

                end;
            }
        }
    }
    trigger OnInit()
    begin
        if not Rec.Get() then begin
            rec.Init();
            rec.Insert();
        end;
    end;



}
