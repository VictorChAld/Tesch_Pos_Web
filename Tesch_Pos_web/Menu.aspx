<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Menu.aspx.vb" Inherits="Tesch_Pos_web.Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="Vendor/css/google.prettify.min.css" />
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
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
    <script type="text/javascript">
        //Put your JavaScript code here.
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Height="100%" Width="100%">
            
            <telerik:RadGrid ID="grdMenu" runat="server" Skin="Bootstrap"
                    AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" DataSourceID="SQLMenu" IsExporting="False" AllowAutomaticUpdates="False" AutoGenerateEditColumn="False">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                    <ClientSettings EnablePostBackOnRowClick="true">
                        <Selecting AllowRowSelect="True" CellSelectionMode="MultiCell" />
                        <ClientEvents OnKeyPress="KeyPress" />
                    </ClientSettings>
                    <MasterTableView CanRetrieveAllData="true" DataSourceID="SQLMenu">
                        <EditItemTemplate>
                            Edit
                        </EditItemTemplate>
                        <Columns>
                            <telerik:GridBoundColumn DataField="Link"
                                FilterControlAltText="Filter Link column" HeaderText="" ReadOnly="true"
                                UniqueName="Link" SortExpression="Link">
                            </telerik:GridBoundColumn>                                                
                        </Columns>                        
                    </MasterTableView>
                    <SelectedItemStyle BorderStyle="Groove" />
                </telerik:RadGrid>
           
            <asp:SqlDataSource runat="server" ID="SQLMenu" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>' SelectCommand="select Nombre,Link from Tesch_POS_Panel">                                          
            </asp:SqlDataSource>

        </telerik:RadAjaxPanel>
    </form>
</body>
</html>
