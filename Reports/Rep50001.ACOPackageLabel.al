report 50001 "ACO Package Label"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'RDL Layouts\ACOPackageLabel.rdl';
    dataset
    {
        dataitem(ACOPackageHeader; "ACO Package Header")
        {
            column(No; "No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(ResourceNo; "Resource No.")
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
                DataItemLink = "Package No." = FIELD("No.");

                column(Profile_no_; "Profile no.") { }
                column(Profile_description; "Profile description") { }
                column(Quantity; Quantity) { }
                column(Length; Length) { }
                column(External_Document_No_; "External Document No.") { }
                column(Your_Reference; "Your Reference") { }
                column(Treatment_Description; "Treatment Description") { }
            }
        }
        dataitem("Company Information"; "Company Information")
        {
            column(CompanyName; Name) { }
            column(CompanyAddress; Address) { }
            column(CompanyCity; City) { }
            column(CompanyCountry_Region_Code; "Country/Region Code") { }
            column(CompanyPost_Code; "Post Code") { }
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
                        // Enabled = Customer."ACO Rack no. Mandatory on Pckg";
                        // Visible = Customer."ACO Rack no. Mandatory on Pckg";
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
    end;


    var

        "Generating Resource": record Resource;

        ItemLbl: Label 'Item';
        AmountLbl: Label 'Amount';
        LengthLbl: Label 'Length';
        ReferenceLbl: Label 'Reference';
        TreatmentLbl: Label 'Treatment';

        "filter Package Type": Option Box,Bundle,Carton,Cart,Chest,Tube,"Empty racks",Pack,Pallet,Rack;
        "Rack Number": Integer;
}
