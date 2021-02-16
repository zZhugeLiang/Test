codeunit 50501 "ACO FTP Connector"
{
    procedure listFolder(path: Text; Hostname: Text; Port: Integer; username: Text; Password: Text; var tmpTable: record "ACO FTP FolderList")
    var
        JsonRequestBody: JsonObject;
        JsonReturnBody: JsonObject;
        JsonFileToken: JsonToken;

    begin
        JsonReturnBody := executeFTPCommand('ListFolder', path, Hostname, Port, username, Password, JsonRequestBody);
        If JsonReturnBody.AsToken().IsArray() then
            foreach JsonFileToken in JsonReturnBody.AsToken().AsArray() do begin
                tmpTable.Init();
                tmpTable.Name := ACOAPIHelper.GetValue(JsonFileToken.AsObject(), 'name').AsText().Substring(1, 2048);
                tmpTable.Size := ACOAPIHelper.GetValue(JsonFileToken.AsObject(), 'size').AsBigInteger();
                tmpTable.Chmod := ACOAPIHelper.GetValue(JsonFileToken.AsObject(), 'chmod').AsInteger();
                tmpTable.Created := ACOAPIHelper.GetValue(JsonFileToken.AsObject(), 'created').AsDateTime();
                tmpTable.Modified := ACOAPIHelper.GetValue(JsonFileToken.AsObject(), 'modified').AsDateTime();
                tmpTable.Type := ACOAPIHelper.GetValue(JsonFileToken.AsObject(), 'type').AsInteger();
                tmpTable.Insert();
            end;
        // end if          
    end;

    procedure createFolder(path: Text; Hostname: Text; Port: Integer; username: Text; Password: Text)
    var
        JsonRequestBody: JsonObject;
        JsonReturnBody: JsonObject;
    begin
        JsonReturnBody := executeFTPCommand('CreateFolder', path, Hostname, Port, username, Password, JsonRequestBody);
    end;

    procedure downloadFile(path: Text; Hostname: Text; Port: Integer; username: Text; Password: Text): Text
    var
        JsonRequestBody: JsonObject;
        JsonReturnBody: JsonObject;
    begin
        JsonReturnBody := executeFTPCommand('DownloadFile', path, Hostname, Port, username, Password, JsonRequestBody);
        if JsonReturnBody.Contains('Content') then
            exit(Base64Convert.FromBase64(ACOAPIHelper.GetValue(JsonReturnBody, 'Content').AsText()))
        else
            exit('');
    end;

    procedure uploadFile(path: Text; Hostname: Text; Port: Integer; username: Text; Password: Text; FileContent: Text)
    var
        JsonRequestBody: JsonObject;
        JsonReturnBody: JsonObject;
    begin
        JsonRequestBody.Add('Content', FileContent);
        JsonReturnBody := executeFTPCommand('UploadFile', path, Hostname, Port, username, Password, JsonRequestBody);
    end;

    procedure delete(path: Text; Hostname: Text; Port: Integer; username: Text; Password: Text)
    var
        JsonRequestBody: JsonObject;
        JsonReturnBody: JsonObject;
    begin
        JsonReturnBody := executeFTPCommand('Delete', path, Hostname, Port, username, Password, JsonRequestBody);
    end;

    procedure executeFTPCommand(command: Text; path: Text; HostName: Text; Port: Integer; username: Text; Password: Text; Body: JsonObject): JsonObject
    var
        ACOFTPGatewaySetup: Record "ACO FTP Gateway Setup";
        JsonRequestBody: JsonObject;
        JsonReturnBody: JsonObject;
        keyName: Text;
        JT: JsonToken;
    begin
        if (not ACOFTPGatewaySetup.Get()) or (ACOFTPGatewaySetup.HostName = '') then
            error(noGatewaySetupErr);
        if (command <> 'Ping') then begin
            JsonRequestBody.Add('HostName', Hostname);
            JsonRequestBody.Add('Port', Port);
            JsonRequestBody.Add('Username', username);
            JsonRequestBody.Add('Password', Password);
            JsonRequestBody.Add('Path', path);
            JsonRequestBody.Add('FtpMode', 0);
            JsonRequestBody.Add('PassiveMode', false);
            Foreach keyName in Body.Keys() do begin
                Body.Get(keyName, JT);
                JsonRequestBody.Add(keyName, JT);
            end;
        end;

        JsonReturnBody := ACOAPIHelper.doApiPOST(ACOFTPGatewaySetup.HostName + '/' + command, JsonRequestBody);
        Exit(JsonReturnBody)
    end;

    var

        Base64Convert: Codeunit "Base64 Convert";
        ACOAPIHelper: Codeunit "ACO API Helper";

        noGatewaySetupErr: Label 'No FTP Gatway has been setup';
}
