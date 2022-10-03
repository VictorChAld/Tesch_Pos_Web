<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Ordenes.aspx.vb" Inherits="Tesch_Pos_web.Ordenes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="Vendor/css/google.prettify.min.css" />
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        /* CSS */
        .button-17 {
            align-items: center;
            appearance: none;
            background-color: #fff;
            border-radius: 24px;
            border-style: none;
            box-shadow: rgba(0, 0, 0, .2) 0 3px 5px -1px,rgba(0, 0, 0, .14) 0 6px 10px 0,rgba(0, 0, 0, .12) 0 1px 18px 0;
            box-sizing: border-box;
            color: #3c4043;
            cursor: pointer;
            display: inline-flex;
            fill: currentcolor;
            font-family: "Google Sans",Roboto,Arial,sans-serif;
            font-size: 14px;
            font-weight: 500;
            height: 48px;
            justify-content: center;
            letter-spacing: .25px;
            line-height: normal;
            max-width: 100%;
            overflow: visible;
            padding: 2px 24px;
            position: relative;
            text-align: center;
            text-transform: none;
            transition: box-shadow 280ms cubic-bezier(.4, 0, .2, 1),opacity 15ms linear 30ms,transform 270ms cubic-bezier(0, 0, .2, 1) 0ms;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: auto;
            will-change: transform,opacity;
            z-index: 0;
        }

            .button-17:hover {
                background: #F6F9FE;
                color: #174ea6;
            }

            .button-17:active {
                box-shadow: 0 4px 4px 0 rgb(60 64 67 / 30%), 0 8px 12px 6px rgb(60 64 67 / 15%);
                outline: none;
            }

            .button-17:focus {
                outline: none;
                border: 2px solid #4285f4;
            }

            .button-17:not(:disabled) {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }

                .button-17:not(:disabled):hover {
                    box-shadow: rgba(60, 64, 67, .3) 0 2px 3px 0, rgba(60, 64, 67, .15) 0 6px 10px 4px;
                }

                .button-17:not(:disabled):focus {
                    box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
                }

                .button-17:not(:disabled):active {
                    box-shadow: rgba(60, 64, 67, .3) 0 4px 4px 0, rgba(60, 64, 67, .15) 0 8px 12px 6px;
                }

            .button-17:disabled {
                box-shadow: rgba(60, 64, 67, .3) 0 1px 3px 0, rgba(60, 64, 67, .15) 0 4px 8px 3px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel EnableAjaxSkinRendering="true" ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:RadAjaxLoadingPanel>
        <script type="text/javascript">
            //Put your JavaScript code here.
            function IrPOS() {                                
                window.open('POS.aspx?Nuevo=Y', '_blank');
            }
            function IrPOSVenta(ID) {
                window.open('POS.aspx?ID=' + ID, '_blank');
            }
        </script>
        <script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/anchor-js/3.2.0/anchor.js"></script>
        <script src="bootbox.js"></script>
        <script src="Vendor/js/prettify.min.js"></script>
        <script src="Vendor/js/jquery.scrollUp.min.js"></script>
        <script src="js/example.js"></script>
        <script src="js/demos.js"></script>
        <script src="js/index.js"></script>

        <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1" ShowLoadingPanelForPostBackControls="true" runat="server" Height="100%" Width="100%">
            
            <button class="button-17" role="button" onclick="IrPOS();">Nueva venta</button>
            
            <telerik:RadGrid ID="grdCorte" ClientSettings-Virtualization-LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Skin="Bootstrap"
                AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" MasterTableView-CommandItemSettings-ShowAddNewRecordButton="False"
                DataSourceID="SQLVentas" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false" ClientSettings-Selecting-AllowRowSelect="true"
                AllowAutomaticUpdates="true"
                AllowAutomaticInserts="true"
                AllowAutomaticDeletes="true">
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <ClientSettings EnablePostBackOnRowClick="true">
                    <Selecting AllowRowSelect="True" CellSelectionMode="MultiCell" />
                    <ClientEvents OnKeyPress="KeyPress" />
                </ClientSettings>
                <MasterTableView AllowPaging="true" PagerStyle-PageSizes="10" DataSourceID="SQLVentas"
                    CommandItemDisplay="Top">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Ir"
                            FilterControlAltText="Filter Ir column" HeaderText="Ir" ReadOnly="true"
                            UniqueName="Ir" SortExpression="Ir">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ID"
                            FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="true"
                            UniqueName="ID" SortExpression="ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Session"
                            FilterControlAltText="Filter Session column" HeaderText="Session" ReadOnly="true"
                            UniqueName="Session" SortExpression="Session">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="VendorCode"
                            FilterControlAltText="Filter VendorCode column" HeaderText="VendorCode" ReadOnly="true"
                            UniqueName="VendorCode" SortExpression="VendorCode">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <SelectedItemStyle BorderStyle="Groove" />
            </telerik:RadGrid>

        </telerik:RadAjaxPanel>

        <asp:SqlDataSource runat="server" ID="SQLVentas" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
            SelectCommand="exec [TESCH_Ordenes_Activas] @VendorCode">
            <SelectParameters>
                <asp:SessionParameter SessionField="VendorCode" Name="VendorCode" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
