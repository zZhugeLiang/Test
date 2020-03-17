// report 50003 "ACO Process Import Sales Lines"
// {
//     ProcessingOnly = true;
//     dataset
//     {
//         dataitem("ACO Imported Sales Order Line"; "ACO Imported Sales Order Line")
//         {
//             trigger OnAfterGetRecord()
//             begin
//                 ProcessLine("ACO Imported Sales Order Line");
//             end;
//         }
//     }

//     local procedure ProcessLine(ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line")
//     var
//         SalesHeader: Record "Sales Header";
//         SalesLine: Record "Sales Line";
//     begin
//         SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;


//         if SalesLine.Insert(true) then
//             ACOImportedSalesOrderLine."Quote No." := SalesHeader."No.";
//     end;

//     local procedure CheckLine(ACOImportedSalesOrderLine: Record "ACO Imported Sales Order Line")
//     var
//         SalesHeader: Record "Sales Header";
//         SalesLine: Record "Sales Line";
//         Customer: Record Customer;
//     begin
//         SalesHeader."Document Type" := SalesHeader."Document Type"::Quote;
//         Customer.Get(ACOImportedSalesOrderLine."Sell-to Customer No.");

//         if SalesLine.Insert(true) then
//             ACOImportedSalesOrderLine."Quote No." := SalesHeader."No.";
//     end;
// }