report 50000 "ACO Generate Bath Sheet"
{
    ProcessingOnly = true;
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field(FilterString; FilterString)
                    {
                        ApplicationArea = All;
                        trigger OnValidate()
                        var
                            Resource: Record Resource;
                            ACOSheetResource: Record "ACO Bath Sheet Resource";
                        begin
                            Resource.SetFilter("No.", FilterString);
                            if Resource.FindSet() then
                                repeat
                                    ACOSheetResource."Bath Sheet No." := BathSheetNo;
                                    ACOSheetResource."Resource No." := Resource."No.";
                                    ACOSheetResource.Insert();
                                until Resource.Next() = 0;
                        end;
                    }
                }
            }
        }
    }

    trigger OnPostReport()
    var
        myInt: Integer;
    begin

    end;

    var
        Resource: Record Resource;
        BathSheetNo: Code[20];
        FilterString: Text;
}
