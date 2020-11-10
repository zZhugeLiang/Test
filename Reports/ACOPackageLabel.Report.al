report 50001 "ACO Package Label"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOPackageLabel.rdl';
    dataset
    {
        dataitem(ACOPackageHeader; "ACO Package Header")
        {
            column(CompanyName; CompanyInfo.Name) { }
            column(CompanyAddress; CompanyInfo.Address) { }
            column(CompanyCity; CompanyInfo.City) { }
            column(CompanyCountry_Region_Code; CompanyInfo."Country/Region Code") { }
            column(CompanyPost_Code; CompanyInfo."Post Code") { }

            column(No; "No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(ResourceNo; "Resource No.")
            {
            }
            column(Name_Resource; Resource.Name)
            {
            }
            column(AmountLbl; AmountLbl)
            {
            }
            column(ItemLbl; ItemLbl)
            {
            }
            column(LengthLbl; LengthLbl)
            {
            }
            column(ReferenceLbl; ReferenceLbl)
            {
            }
            column(TreatmentLbl; TreatmentLbl)
            {
            }
            dataitem(ACOPackageLine; "ACO Package Line")
            {
                DataItemLinkReference = ACOPackageHeader;
                DataItemLink = "Package No." = field("No.");

                column(Profile_no_; "Profile no.") { }
                column(Profile_description; "Profile description") { }
                column(CustomerItemNo_ACOProfileCustomer; ACOProfileCustomer."Customer Item No.") { }
                column(ProfileDescription_ACOProfileCustomer; ACOProfileCustomer."Profile Description") { }
                column(Quantity; Quantity) { }
                column(Length; Length) { }
                column(External_Document_No_; "External Document No.") { }
                column(Your_Reference; "Your Reference") { }
                column(Treatment_Description; "Treatment Description") { }
            }

            trigger OnAfterGetRecord()
            begin
                if not Resource.Get("Resource No.") then
                    Clear(Resource);

                ACOProfileCustomer.Reset();
                ACOProfileCustomer.SetRange("Profile Code", ACOPackageLine."Profile no.");
                ACOProfileCustomer.SetRange("Customer No.", ACOPackageHeader."Customer No.");
                if not ACOProfileCustomer.FindFirst() then
                    Clear(ACOProfileCustomer);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {

                group(Options)
                {

                    field("Resource No."; "Generating Resource"."No.")
                    {
                        ApplicationArea = All;
                        Caption = 'Resource';

                    }
                    field("Package Type"; "filter Package Type")
                    {
                        ApplicationArea = All;
                        Caption = 'Package Type';
                    }
                    field("RackNumber"; "Rack Number")
                    {
                        ApplicationArea = All;
                        Caption = 'Rack Number';
                    }
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnInitReport()
    begin
        CompanyInfo.Get();
    end;


    var
        CompanyInfo: Record "Company Information";
        "Generating Resource": record Resource;
        ACOProfileCustomer: Record "ACO Profile Customer";
        Resource: Record Resource;
        ItemLbl: Label 'Item';
        AmountLbl: Label 'Amount';
        LengthLbl: Label 'Length';
        ReferenceLbl: Label 'Reference';
        TreatmentLbl: Label 'Treatment';

        "filter Package Type": Option Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack;
        "Rack Number": Integer;
}
