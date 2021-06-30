Page 50025 "ACO Selection Bath Sheet List"
{
    Caption = 'Selection Bath Sheet List';
    PageType = List;
    SourceTable = "Prod. Order Line";
    SourceTableView = where(Status = const(Released));
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Prod. Order No."; "Prod. Order No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the related production order.';
                    Editable = false;
                }

                field("ACO Source No."; "ACO Source No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("ACO Source Line No."; "ACO Source Line No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("ACO Production Line"; "ACO Production Line")
                {
                    ApplicationArea = All;
                }

                field("Item No."; "Item No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the item that is to be produced.';
                    Editable = false;
                }

                field("ACO Profile Code"; "ACO Profile Code")
                {
                    ApplicationArea = All;
                }
                field("Variant Code"; "Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the value of the Description field on the item card. If you enter a variant code, the variant description is copied to this field instead.';
                    Editable = false;
                }
                field("Description 2"; "Description 2")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies an additional description.';
                    Visible = false;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Visible = false;
                    Editable = false;
                }
                field("ShortcutDimCode[3]"; ShortcutDimCode[3])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,3';
                    ShowCaption = false;
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = false;
                    Editable = false;
                }
                field("ShortcutDimCode[4]"; ShortcutDimCode[4])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,4';
                    ShowCaption = false;
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = false;
                    Editable = false;
                }
                field("ShortcutDimCode[5]"; ShortcutDimCode[5])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,5';
                    ShowCaption = false;
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = false;
                    Editable = false;
                }
                field("ShortcutDimCode[6]"; ShortcutDimCode[6])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,6';
                    ShowCaption = false;
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = false;
                    Editable = false;
                }
                field("ShortcutDimCode[7]"; ShortcutDimCode[7])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,7';
                    ShowCaption = false;
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = false;
                    Editable = false;
                }
                field("ShortcutDimCode[8]"; ShortcutDimCode[8])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,8';
                    ShowCaption = false;
                    TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8),
                                                                  "Dimension Value Type" = const(Standard),
                                                                  Blocked = const(false));
                    Visible = false;
                    Editable = false;
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the location code, if the produced items should be stored in a specific location.';
                    Visible = true;
                    Editable = false;
                }
                field("ACO Charge No."; "ACO Charge No.")
                {
                    Editable = true;
                    ApplicationArea = Manufacturing;
                }
                field("ACO Quantity Charges"; "ACO Quantity Charges")
                {
                    ApplicationArea = Manufacturing;
                }
                field("ACO Charges per Bath Profile"; "ACO Charges per Bath Profile")
                {
                    ApplicationArea = Manufacturing;
                }
                field("ACO Number of Units"; "ACO Number of Units")
                {
                    ApplicationArea = Manufacturing;
                }
                field("ACO Remaining Quantity"; "ACO Remaining Quantity")
                {
                    ApplicationArea = Manufacturing;
                }
                field("ACO Quantity to Bath Sheet"; "ACO Quantity to Bath Sheet")
                {
                    Editable = true;
                    ApplicationArea = Manufacturing;
                }
                field("ACO Bath Sheet Qty."; "ACO Bath Sheet Qty.")
                {
                    ApplicationArea = Manufacturing;
                }
                field("Finished Quantity"; "Finished Quantity")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies how much of the quantity on this line has been produced.';
                    Editable = false;
                }
                field("Remaining Quantity"; "Remaining Quantity")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the difference between the finished and planned quantities, or zero if the finished quantity is greater than the remaining quantity.';
                }
                field("Scrap %"; "Scrap %")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the percentage of the item that you expect to be scrapped in the production process.';
                    Visible = false;
                    Editable = false;
                }
                field("Due Date"; "Due Date")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the date when the produced item must be available. The date is copied from the header of the production order.';
                    Editable = false;
                }
                field("Starting Date"; "Starting Date")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the entry''s starting date, which is retrieved from the production order routing.';
                    Editable = false;
                }
                field("Starting Time"; "Starting Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the entry''s starting time, which is retrieved from the production order routing.';
                    Visible = false;
                    Editable = false;
                }
                field("Ending Date"; "Ending Date")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the entry''s ending date, which is retrieved from the production order routing.';
                    Editable = false;
                }
                field("Ending Time"; "Ending Time")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the entry''s ending time, which is retrieved from the production order routing.';
                    Visible = false;
                    Editable = false;
                }
                field("Production BOM No."; "Production BOM No.")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the number of the production BOM that is the basis for creating the Prod. Order Component list for this line.';
                    Editable = false;
                }
                field("Unit Cost"; "Unit Cost")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                    Editable = false;
                }
                field("Cost Amount"; "Cost Amount")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = 'Specifies the total cost on the line by multiplying the unit cost by the quantity.';
                    Editable = false;
                }
                field("ACO Rerun"; "ACO Rerun")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = ' ';
                    Editable = true;
                }
                field("ACO Rerun Reason"; "ACO Rerun Reason")
                {
                    ApplicationArea = Manufacturing;
                    ToolTip = ' ';
                    Editable = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {

        area(Processing)
        {
            action(CreateBathSheet)
            {
                ApplicationArea = All;
                Caption = 'Create Bath Sheet';
                Image = ShowSelected;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Create Bath Sheet';
                trigger OnAction()
                var
                    ProdOrderLine: Record "Prod. Order Line";
                    ProdOrderLineFilters: Record "Prod. Order Line";
                    Resource: Record Resource;
                    ACOBathSheetMgt: Codeunit "ACO Bath Sheet Mgt.";
                    ACOSelectionResources: Page "ACO Selection Resources";
                begin
                    ACOSelectionResources.LookupMode(true);
                    //ACOSelectionResources.SetTableView(ACOProfileCustomer);

                    if ACOSelectionResources.RunModal() = Action::LookupOK then begin
                        ProdOrderLine := Rec;
                        CurrPage.SetSelectionFilter(ProdOrderLine);
                        ACOSelectionResources.SetSelectionFilter(Resource);
                        ProdOrderLineFilters.CopyFilters(Rec);
                        // SetRange("ACO Included", true);
                        ACOBathSheetMgt.CreateBathSheet(ProdOrderLine, Resource);

                        CopyFilters(ProdOrderLineFilters);
                        CurrPage.Update(false);
                    end;
                end;
            }

            action(CreateRejectionOBRLabel)
            {
                ApplicationArea = All;
                Caption = 'Generate OBR Rejection Label';
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Generate OBR Rejection Label';
                trigger OnAction()
                var
                    BathSheetLine: Record "ACO Bath Sheet Line";
                    ACORejLabelSelectLines: Page "ACO Rej. Label Select Lines";
                    Only1LineErr: Label 'Only 1 line can be processed at a time.';
                begin
                    CurrPage.SetSelectionFilter(BathSheetLine);

                    if BathSheetLine.Count() > 1 then
                        Error(Only1LineErr);

                    ACORejLabelSelectLines.SetProdOrderLine(Rec);
                    ACORejLabelSelectLines.RunModal();
                end;
            }
        }

        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action(ShowDocument)
                {
                    ApplicationArea = Manufacturing;
                    Caption = 'Show Document';
                    Image = View;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+F7';
                    ToolTip = 'Open the document that the selected line exists on.';

                    trigger OnAction()
                    var
                        ProdOrder: Record "Production Order";
                    begin
                        ProdOrder.Get(Status, "Prod. Order No.");
                        case Status of
                            Status::Planned:
                                Page.Run(Page::"Planned Production Order", ProdOrder);
                            Status::"Firm Planned":
                                Page.Run(Page::"Firm Planned Prod. Order", ProdOrder);
                            Status::Released:
                                Page.Run(Page::"Released Production Order", ProdOrder);
                        end;

                        OnAfterShowDocument(Rec, ProdOrder);
                    end;
                }
                action(ShowReservEntries)
                {
                    AccessByPermission = TableData Item = R;
                    ApplicationArea = Reservation;
                    Caption = 'Reservation Entries';
                    Image = ReservationLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'View the entries for every reservation that is made, either manually or automatically.';

                    trigger OnAction()
                    begin
                        ShowReservationEntries(true);
                    end;
                }
                action(ShowTrackingLines)
                {
                    ApplicationArea = ItemTracking;
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+Ctrl+I';
                    ToolTip = 'View or edit serial numbers and lot numbers that are assigned to the item on the document or journal line.';

                    trigger OnAction()
                    begin
                        OpenItemTrackingLines();
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetFilter("ACO Source No.", '<>%1', '');
        SetFilter("Item No.", '<>%1', '');
        SetFilter("ACO Profile Code", '<>%1', '');
    end;

    trigger OnAfterGetRecord()
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Clear(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowDocument(var ProdOrderLine: Record "Prod. Order Line"; ProdOrder: Record "Production Order")
    begin
    end;
}

