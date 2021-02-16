codeunit 50500 "ACO API Helper"
{
    procedure doApiPOST(Uri: text[1024]; body: JsonObject): JsonObject
    var
        requestTxt: Text;
        JO: jsonObject;
    begin
        body.WriteTo(requestTxt);
        JO.ReadFrom(doApiPOST(Uri, requestTxt));
        exit(JO);
    end;

    procedure doApiPOST(Uri: text[1024]; body: Text): Text
    var
        ApiHttpClient: HttpClient;
        ApiHttpContent: HttpContent;
        ApiHttpResponseMessage: HttpResponseMessage;
        apiHttpRequestMessage: HttpRequestMessage;
        ApiHttpHeaders: HttpHeaders;
        ContentTxt: Text;
    begin
        ApiHttpClient.DefaultRequestHeaders.Add('User-Agent', 'Dynamics 365');
        ApiHttpClient.DefaultRequestHeaders.Add('Accept', '*/*');
        ApiHttpContent.WriteFrom(Body);
        ApiHttpContent.GetHeaders(ApiHttpHeaders);
        ApiHttpHeaders.Clear();
        ApiHttpHeaders.Add('Content-Type', 'application/json; charset=utf-8');
        ApiHttpRequestMessage.Content := ApiHttpContent;
        ApiHttpRequestMessage.SetRequestUri(Uri);
        ApiHttpRequestMessage.Method := 'POST';
        if not ApiHttpClient.Send(apiHttpRequestMessage, ApiHttpResponseMessage) then
            ApiHttpResponseMessage.Content.ReadAs(ContentTxt)
        else
            ApiHttpResponseMessage.Content.ReadAs(ContentTxt);
        exit(ContentTxt);
    end;

    procedure GetValue(JsonObj: JsonObject; JsonKey: Text) retval: JsonValue;
    var
        JToken: JsonToken;
    begin
        if JsonObj.Contains((JsonKey)) then begin
            JsonObj.Get(JsonKey, JToken);
            if JToken.IsValue then
                retval := Jtoken.AsValue();
        end
        else begin
            JToken.ReadFrom('""');
            retval := Jtoken.AsValue();
        end;
    end;
}
