<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="POS.aspx.vb" Inherits="Tesch_Pos_web.POS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css" />    
    <link href="css/bootstrap-social.css" type="text/css" />
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        #footer {
            margin:0 auto;
            width:100%;
            height:auto;
            overflow:hidden;
            position: fixed;
            bottom: 0px;
        }
        .NoBordes {
            border: 0;
            border-block-end: 0;
            border-block-end-color: #ffffff;
            background-color:white;
            color:white;
            border-color:white;
            outline-color:white;
        }
        #grdVenta,#grdPagos,#grdCliente,#grdTotales,#grdMasVendidos, #grdSideCliente {
            border: 0;
            border-block-end: 0;
            border-block-end-color: #ffffff;
        }
            
        
        icon-shape {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            vertical-align: middle;
        }

        .icon-sm {
            width: 2rem;
            height: 2rem;
    
        }
        .form-rounded {
            border-radius: 1rem;
        }
        a { 
            color: inherit; 
            text-decoration: none; /* no underline */
        }
         .btn-circle.btn-xl {
			width: 100px;
			height: 100px;
			padding: 13px 18px;
			border-radius: 60px;
			font-size: 15px;
			text-align: center;
		}
      
        {text-decoration: none !important;}
        #txtEfectivo, #txtDebito {
            font-size:60px;
        }
        #MontoEfectivo, #MontoDebito{
            background-color:white;
            color:white;
            border-color:white;
            outline-color:white;
        }

        .modal.left .modal-dialog {
	    position:fixed;
	    right: 0;
	    margin: auto;
	    width: 25%;
	    height: 100%;
	    -webkit-transform: translate3d(0%, 0, 0);
	    -ms-transform: translate3d(0%, 0, 0);
	    -o-transform: translate3d(0%, 0, 0);
	    transform: translate3d(0%, 0, 0);
    }

    .modal.left .modal-content {
	    height: 100%;
	    overflow-y: auto;
    }

    .modal.right .modal-body {
	    padding: 15px 15px 80px;
    }

    .modal.right.fade .modal-dialog {
	    left: -320px;
	    -webkit-transition: opacity 0.3s linear, left 0.3s ease-out;
	    -moz-transition: opacity 0.3s linear, left 0.3s ease-out;
	    -o-transition: opacity 0.3s linear, left 0.3s ease-out;
	    transition: opacity 0.3s linear, left 0.3s ease-out;
    }

    .modal.right.fade.show .modal-dialog {
	    right: 0;
    }

    /* ----- MODAL STYLE ----- */
    .modal-content {
	    border-radius: 0;
	    border: none;
    }

    .modal-header {
	    border-bottom-color: #eeeeee;
	    background-color: #fafafa;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="Search" defaultfocus="Buscar">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
        
        <telerik:RadAjaxLoadingPanel EnableAjaxSkinRendering="true" ID="RadAjaxLoadingPanel1" runat="server">
        </telerik:RadAjaxLoadingPanel>
        
        <div id="Articulos" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" rol="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Buscar artículos...</h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                    </div>
                    <div class="modal-body">
                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1" ShowLoadingPanelForPostBackControls="true" runat="server" Height="80%" Width="100%">
                            <telerik:RadGrid ID="grdArticulos" ClientSettings-Virtualization-LoadingPanelID="LoadingPrincipal" runat="server" Skin="Bootstrap"
                                AllowPaging="true" MasterTableView-AllowPaging="true" EnableLinqExpressions="true"
                                AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" MasterTableView-CommandItemSettings-ShowAddNewRecordButton="False"
                                DataSourceID="SQLArticulos" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false" ShowHeader="true">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <MasterTableView PageSize="10" CanRetrieveAllData="true" AllowFilteringByColumn="true" DataSourceID="SQLArticulos">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Item" AllowFiltering="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="100%"
                                            FilterControlAltText="Filter Item column" HeaderText="Código" ReadOnly="true"
                                            UniqueName="Item" SortExpression="Item">
                                            </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ItemName" AllowFiltering="true" CurrentFilterFunction="Contains" ShowFilterIcon="false" AutoPostBackOnFilter="true" FilterControlWidth="100%"
                                            FilterControlAltText="Filter ItemName column" HeaderText="Descripción" ReadOnly="true"
                                            UniqueName="ItemName" SortExpression="ItemName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Img" AllowFiltering="false"
                                            FilterControlAltText="Filter Img column" HeaderText="Imagen" ReadOnly="true"
                                            UniqueName="Img" SortExpression="Img">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Precio" AllowFiltering="false"
                                            FilterControlAltText="Filter Precio column" HeaderText="Precio" ReadOnly="true"
                                            UniqueName="Precio" SortExpression="Precio">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <SelectedItemStyle BorderStyle="Groove" />
                            </telerik:RadGrid>

                            <asp:SqlDataSource runat="server" ID="SQLArticulos" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
                            SelectCommand="exec [POS_BuscarArticulos] @ID_Venta,@ArticuloFind">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="ID_Venta" Name="ID_Venta" />
                                    <asp:SessionParameter SessionField="ArticuloFind" Name="ArticuloFind" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </telerik:RadAjaxPanel>
                    </div>
                </div>
            </div>
        </div>

        <div id="Cliente" class="modal left fade" role="dialog">
            <div class="modal-dialog modal-lg" rol="content">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><label id="MostrarCliente" name="MostrarCliente"></label> </h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                    </div>
                    <div class="modal-body">
                        <telerik:RadAjaxPanel ID="pnlSideCliente" LoadingPanelID="RadAjaxLoadingPanel1" ShowLoadingPanelForPostBackControls="true" runat="server" Width="100%">
                            <telerik:RadGrid ID="grdSideCliente" ClientSettings-Virtualization-LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Skin="Bootstrap"
                                AllowPaging="false" MasterTableView-AllowPaging="false" EnableLinqExpressions="true"
                                AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" MasterTableView-CommandItemSettings-ShowAddNewRecordButton="False"
                                DataSourceID="SQLSideCliente" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false" ShowHeader="false">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <MasterTableView CanRetrieveAllData="true" AllowFilteringByColumn="true" DataSourceID="SQLSideCliente">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Item" 
                                            FilterControlAltText="Filter Item column" HeaderText="Código" ReadOnly="true"
                                            UniqueName="Item" SortExpression="Item">
                                            </telerik:GridBoundColumn>                                       
                                    </Columns>
                                </MasterTableView>
                                <SelectedItemStyle BorderStyle="Groove" />
                            </telerik:RadGrid>

                            <asp:SqlDataSource runat="server" ID="SQLSideCliente" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
                            SelectCommand="exec [POS_SideCliente] @ID_Venta">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="ID_Venta" Name="ID_Venta" />                                    
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </telerik:RadAjaxPanel>
                    </div>
                </div>
            </div>
        </div>

        <div id="PagoEfectivo" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" rol="content">
                <div id="PagoEfectivoModal" class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><font color="gray">Efectivo</font></h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="EfectivoForm" action="POS.aspx?ref=EfectivoForm" defaultfocus="txtEfectivo" method="post">
                            <div class="row col-md-12">
                                <div class="col-md-6">
                                    <input type="number" id="txtEfectivo" name="txtEfectivo" class="form-control" step="0.01" runat="server" />
                                </div>
                                <div class="col-md-6">
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('7');">
                                                <h1>7</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('8')">
                                                <h1>8</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('9')">
                                                <h1>9</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('4')">
                                                <h1>4</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('5')">
                                                <h1>5</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('6')">
                                                <h1>6</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('1')">
                                                <h1>1</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('2')">
                                                <h1>2</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('3')">
                                                <h1>3</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('0')">
                                                <h1>0</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button id="EfectivoDot" type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionEfectivo('.')">
                                                <h1>.</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-danger btn-circle btn-xl" onclick="FuncionEfectivo('d')">
                                                <h1><i class="fa fa-undo"></i></h1>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                            </div>
                            <div class="row col-md-12">
                                <div class="col-9 col-md-9">
                                    <button style="width: 200px" class="btn btn-outline-primary rounded">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                                            <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                                            <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                                            <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                                        </svg>
                                        Aplicar<br /></button>
                                    <button type="cancel" style="width: 200px" onclick="window.location='POS.aspx';return false;" class="btn btn-outline-danger rounded"><i class="fa fa-close"></i>Cancelar<br /></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="PagoDebito" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg" rol="content">
                <div id="PagoDebitoModal" class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><font color="gray">Tarjeta de débito</font></h4>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                    </div>
                    <div class="modal-body">
                        <form name="DebitoForm" action="POS.aspx?ref=DebitoForm" defaultfocus="txtDebito" method="post">
                            <div class="row col-md-12">
                                <div class="col col-md-6">
                                    <input type="number" id="txtDebito" name="txtDebito" class="form-control" step="0.01" runat="server" />
                                    <br />
                                    <label id="lblMontoDebito" name="lblMontoDebito" for="txtNumTarjetaDebito">Num. tarjeta</label>
                                    <input type="text" id="txtNumTarjetaDebito" name="txtNumTarjetaDebito" class="form-control" runat="server" />
                                    <br />
                                    
                                    <h3>
                                        <select id="txtMesVenceDebito" style="width: 100%" name="txtMesVenceDebito" runat="server">
                                            <option value="01" label="Enero"></option>
                                            <option value="01" label="Enero"></option>
                                            <option value="02" label="Febrero"></option>
                                            <option value="03" label="Marzo"></option>
                                            <option value="04" label="Abril"></option>
                                            <option value="05" label="Mayo"></option>
                                            <option value="06" label="Junio"></option>
                                            <option value="07" label="Julio"></option>
                                            <option value="08" label="Agosto"></option>
                                            <option value="09" label="Septiembre"></option>
                                            <option value="10" label="Octubre"></option>
                                            <option value="11" label="Noviembre"></option>
                                            <option value="12" label="Diciembre"></option>
                                        </select></h3>
                                    <h5>
                                        <label id="lblMesVenceDebito" name="lblMesVenceDebito" for="txtMesVenceDebito">Mes vencimiento</label></h5>
                                    
                                    <h3>
                                        <select id="txtAnioVenceDebito" style="width: 100%" name="txtAnioVenceDebito" runat="server">
                                            <option value="2022" label="2022"></option>
                                            <option value="2023" label="2023"></option>
                                            <option value="2024" label="2024"></option>
                                            <option value="2025" label="2025"></option>
                                            <option value="2026" label="2026"></option>
                                            <option value="2027" label="2027"></option>
                                            <option value="2028" label="2028"></option>
                                            <option value="2029" label="2029"></option>
                                            <option value="2030" label="2030"></option>
                                            <option value="2031" label="2031"></option>
                                            <option value="2032" label="2032"></option>
                                        </select></h3>
                                    <h5>
                                        <label id="lblAnioVenceDebito" name="lblAnioVenceDebito" for="txtAnioVenceDebito">Año vencimiento</label></h5>
                                </div>
                                <div class="col-md-6">
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('7');">
                                                <h1>7</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('8')">
                                                <h1>8</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('9')">
                                                <h1>9</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('4')">
                                                <h1>4</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('5')">
                                                <h1>5</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('6')">
                                                <h1>6</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('1')">
                                                <h1>1</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('2')">
                                                <h1>2</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('3')">
                                                <h1>3</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">&nbsp;</div>
                                    </div>
                                    <div class="row col-md-12">
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('0')">
                                                <h1>0</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button id="DebitoDot" type="button" class="btn btn-primary btn-circle btn-xl" onclick="FuncionDebito('.')">
                                                <h1>.</h1>
                                            </button>
                                        </div>
                                        <div class="col-md-4">
                                            <button type="button" class="btn btn-danger btn-circle btn-xl" onclick="FuncionDebito('d')">
                                                <h1><i class="fa fa-undo"></i></h1>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                            </div>
                            <div class="row col-md-12">
                                <div class="col-9 col-md-9">
                                    <button style="width: 200px" class="btn btn-outline-primary rounded">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cash-coin" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
                                            <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
                                            <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
                                            <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
                                        </svg>
                                        Aplicar<br />
                                    </button>
                                    <button type="cancel" style="width: 200px" onclick="window.location='POS.aspx';return false;" class="btn btn-outline-danger rounded"><i class="fa fa-close"></i>Cancelar<br />
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
            <div class="toast" data-delay="5000">
                <div class="toast-header bg-danger text-light" role="alert" aria-live="assertive" aria-atomic="true">
                    <strong class="me-auto">Advertencia</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
                </div>
                <div class="toast-body">
                    <label id="MensajeAlert"></label>
                </div>
            </div>
        </div>

        <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
            <div class="toast" data-delay="5000">
                <div class="toast-header bg-success text-light" role="alert" aria-live="assertive" aria-atomic="true">
                    <strong class="me-auto">Éxito</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
                </div>
                <div class="toast-body">
                    <label id="MensajeExito"></label>
                </div>
            </div>
        </div>

        <telerik:RadAjaxPanel ID="pnlPrincipal" LoadingPanelID="RadAjaxLoadingPanel1" ShowLoadingPanelForPostBackControls="true" runat="server" Height="100%" Width="100%">

            <telerik:RadGrid ID="grdCabecera" ClientSettings-Virtualization-LoadingPanelID="LoadingPrincipal" runat="server" Skin="Black"
                AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" MasterTableView-CommandItemSettings-ShowAddNewRecordButton="False"
                DataSourceID="SQLCabecera" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false" ShowHeader="false">
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <MasterTableView CanRetrieveAllData="true" DataSourceID="SQLCabecera">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Item"
                            FilterControlAltText="Filter Item column" HeaderText="Item" ReadOnly="true"
                            UniqueName="Item" SortExpression="Item">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <SelectedItemStyle BorderStyle="Groove" />
            </telerik:RadGrid>

            <br />
            <h3>
                <input class="form-rounded" type="text" placeholder="Buscar artículos..." style="width: 300px" id="Buscar" name="Buscar" runat="server" onkeypress="handle(event)" />
                <i class="fa fa-search" aria-hidden="true">                    
                    <asp:Button ID="Search" runat="server" OnClientClick="BuscarArt()"  Height="0px" Visible="false" Width="100%" BorderStyle="None" />
                </i></h3>
            <asp:SqlDataSource runat="server" ID="SQLCabecera" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
                SelectCommand="exec [CabeceraVenta] @ID_Venta">
                <SelectParameters>
                    <asp:SessionParameter SessionField="ID_Venta" Name="ID_Venta" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />            
                 <div class="row">
                    <div class="col col-lg-9">
                        <telerik:RadAjaxLoadingPanel EnableAjaxSkinRendering="true" ID="LoadingPrincipal" runat="server">
                        </telerik:RadAjaxLoadingPanel>
                        <telerik:RadAjaxPanel ID="pnlVenta" LoadingPanelID="LoadingPrincipal" ShowLoadingPanelForPostBackControls="true" runat="server" Height="100%" Width="100%">

                            <telerik:RadGrid ID="grdVenta" ClientSettings-Virtualization-LoadingPanelID="LoadingPrincipal" runat="server" Skin="Bootstrap"
                                AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" MasterTableView-CommandItemSettings-ShowAddNewRecordButton="False"
                                DataSourceID="SQLItems" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false" ShowHeader="false">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <MasterTableView CanRetrieveAllData="true" DataSourceID="SQLItems">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Item"
                                            FilterControlAltText="Filter Item column" HeaderText="Item" ReadOnly="true"
                                            UniqueName="Item" SortExpression="Item">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <SelectedItemStyle BorderStyle="Groove" />
                            </telerik:RadGrid>

                        </telerik:RadAjaxPanel>

                        <asp:SqlDataSource runat="server" ID="SQLItems" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
                            SelectCommand="exec [Items_Venta] @Corde_ID,@ID_Venta">
                            <SelectParameters>
                                <asp:SessionParameter SessionField="Corte_ID" Name="Corde_ID" />
                                <asp:SessionParameter SessionField="ID_Venta" Name="ID_Venta" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div class="col col-lg-3">
                        <telerik:RadAjaxLoadingPanel EnableAjaxSkinRendering="true" ID="LoadingItems" runat="server">
                        </telerik:RadAjaxLoadingPanel>
                        <telerik:RadAjaxPanel ID="pnlPagos" LoadingPanelID="LoadingItems" ShowLoadingPanelForPostBackControls="true" runat="server" Height="100%" Width="100%">
                            <div align="right">
                                <h5>
                                    
                                    <i class="fa fa-search" aria-hidden="true">                    
                                        <asp:Button ID="SearchClient" runat="server" OnClientClick="BuscarClient()"  Height="0px" Visible="false" Width="100%" BorderStyle="None" />
                                    </i>
                                <input class="form-rounded" type="text" placeholder="Buscar clientes..." style="width: 300px" id="BuscarCliente" name="Buscar" runat="server" onkeypress="handle(event)" />
                                </h5>
                            </div>
                            <br />                            
                            <telerik:RadGrid ID="grdCliente" ClientSettings-Virtualization-LoadingPanelID="LoadingPrincipal" runat="server" Skin="Bootstrap"
                                AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" MasterTableView-CommandItemSettings-ShowAddNewRecordButton="False"
                                DataSourceID="SQLCliente" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false" ShowHeader="false">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <MasterTableView CanRetrieveAllData="true" DataSourceID="SQLCliente">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Item"
                                            FilterControlAltText="Filter Item column" HeaderText="Item" ReadOnly="true"
                                            UniqueName="Item" SortExpression="Item">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <SelectedItemStyle BorderStyle="Groove" />
                            </telerik:RadGrid>

                            <asp:SqlDataSource runat="server" ID="SQLCliente" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
                                SelectCommand="exec [POS_Cliente_Activo] @ID_Venta">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="ID_Venta" Name="ID_Venta" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <br />
                            <telerik:RadGrid ID="grdPagos" ClientSettings-Virtualization-LoadingPanelID="LoadingItems" runat="server" Skin="Bootstrap"
                                AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small"
                                DataSourceID="SQLPagos" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false" ShowHeader="false">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <MasterTableView CanRetrieveAllData="true" AllowPaging="true" PagerStyle-PageSizes="10" DataSourceID="SQLPagos">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Item"
                                            FilterControlAltText="Filter Item column" HeaderText="Item" ReadOnly="true"
                                            UniqueName="Item" SortExpression="Item">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <SelectedItemStyle BorderStyle="Groove" />
                            </telerik:RadGrid>

                            <asp:SqlDataSource runat="server" ID="SQLPagos" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
                                SelectCommand="exec [POS_Venta_Activa] @ID_Venta">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="ID_Venta" Name="ID_Venta" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </telerik:RadAjaxPanel>
                    </div>
                </div>
            
        </telerik:RadAjaxPanel>

        <div id="footer">           
                <div class="row">
                    <div class="col col-lg-9 d-flex align-items-center">
                        
                        <telerik:RadAjaxPanel ID="pnlMasVendidos" LoadingPanelID="RadAjaxLoadingPanel1" ShowLoadingPanelForPostBackControls="true" runat="server" Height="20%" Width="100%">
                
                                        <telerik:RadGrid ID="grdMasVendidos" ClientSettings-Virtualization-LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Skin="Bootstrap"
                                            AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" ShowHeader="False"
                                            DataSourceID="SQLMasVendidos" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <MasterTableView CanRetrieveAllData="true" DataSourceID="SQLMasVendidos">
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="Item"
                                                        FilterControlAltText="Filter Item column" HeaderText="" ReadOnly="true"
                                                        UniqueName="Item" SortExpression="Item">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <SelectedItemStyle BorderStyle="Groove" />
                                        </telerik:RadGrid>
                                 
                            <asp:SqlDataSource runat="server" ID="SQLMasVendidos" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
                                SelectCommand="exec [POS_MasVendidos] @ID_Venta">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="ID_Venta" Name="ID_Venta" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </telerik:RadAjaxPanel>

                    </div>
                
                
                    <div class="col col-lg-3">
                        
                        <telerik:RadAjaxPanel ID="pnlBanner" LoadingPanelID="RadAjaxLoadingPanel1" ShowLoadingPanelForPostBackControls="true" runat="server" Height="20%" Width="100%">
                
                    
                                        <telerik:RadGrid ID="grdTotales" ClientSettings-Virtualization-LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Skin="Bootstrap"
                                            AutoGenerateColumns="False" Culture="es-ES" Font-Size="Small" ShowHeader="False"
                                            DataSourceID="SQLTotales" IsExporting="False" AutoGenerateDeleteColumn="false" AutoGenerateEditColumn="false">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                            <MasterTableView CanRetrieveAllData="true" DataSourceID="SQLTotales">
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="Item"
                                                        FilterControlAltText="Filter Item column" HeaderText="" ReadOnly="true"
                                                        UniqueName="Item" SortExpression="Item">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <SelectedItemStyle BorderStyle="Groove" />
                                        </telerik:RadGrid>                       
                
                            <asp:SqlDataSource runat="server" ID="SQLTotales" ConnectionString='<%$ ConnectionStrings:TESCH_POS %>'
                                SelectCommand="exec [POS_Totales] @ID_Venta">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="ID_Venta" Name="ID_Venta" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </telerik:RadAjaxPanel>

                    </div>
                </div>
            
        </div>
        <input type="text" id="MontoEfectivo" class="NoBordes" runat="server" width="0px" height="0px"/>
        <input type="text" id="MontoDebito" class="NoBordes" runat="server" width="0px" height="0px"/>
        <input type="text" id="NumTarjetaDebito" class="NoBordes" runat="server" width="0px" height="0px"/>
        <input type="text" id="MesVenceDebito" class="NoBordes" runat="server" width="0px" height="0px"/>
        <input type="text" id="AnioVenceDebito" class="NoBordes" runat="server" width="0px" height="0px"/>
        <input type="text" id="NombreCliente" class="NoBordes" runat="server" width="0px" height="0px"/>

        <script>
            function handle(e) {
                
                if (e.keyCode == 13) {
                    var ItemBuscar = document.getElementById("Buscar").value;

                    if (ItemBuscar != "") {
                        window.open('POS.aspx?Buscar=' + ItemBuscar, '_self');
                    }                    
                }
            }            

            function BuscarArt() {
                var ItemBuscar = document.getElementById("Buscar").value;

                window.open('POS.aspx?Buscar=' + ItemBuscar, '_self');
            }

            function MensajeToastAlerta(Mensaje) {

                window.history.replaceState({}, document.title, '/' + 'POS.aspx');

                var toastElList = [].slice.call(document.querySelectorAll('.toast'))
                var toastList = toastElList.map(function (toastEl) {
                    return new bootstrap.Toast(toastEl)
                })
                document.getElementById('MensajeAlert').innerHTML = Mensaje;

                toastList.forEach(toast => toast.show())
            }

            function MensajeToastExito(Mensaje) {

                window.history.replaceState({}, document.title, '/' + 'POS.aspx');

                var toastElList = [].slice.call(document.querySelectorAll('.toast'))
                var toastList = toastElList.map(function (toastEl) {
                    return new bootstrap.Toast(toastEl)
                })
                document.getElementById('MensajeExito').innerHTML = Mensaje;

                toastList[1].show();
                //toastList.forEach(toast => toast.show())
            }

            function Incrementar(LineNum, Cantidad) {
                window.open('POS.aspx?AddQuantity=Y&LineNum=' + LineNum + '&Cantidad=' + Cantidad, '_self');
            }

            function RemoverFila(LineNum) {
                window.open('POS.aspx?RemoverFila=Y&LineNum=' + LineNum, '_self');
            }

            function OpenModal_Items() {
                window.history.replaceState({}, document.title, '/' + 'POS.aspx');
                $('#Articulos').modal('show');                
            }

            function OpenModal_Efectivo() {
                
                $('#PagoEfectivo').modal('show');                
                document.getElementById("txtEfectivo").value = document.getElementById("MontoEfectivo").value;
            }

            function OpenModal_Debito() {

                $('#PagoDebito').modal('show');
                document.getElementById("txtDebito").value = document.getElementById("MontoDebito").value;
                document.getElementById("txtNumTarjetaDebito").value = document.getElementById("NumTarjetaDebito").value;
                document.getElementById("txtMesVenceDebito").value = document.getElementById("MesVenceDebito").value;
                document.getElementById("txtAnioVenceDebito").value = document.getElementById("AnioVenceDebito").value;

            }

            function OpenModal_Cliente() {

                $('#Cliente').modal('show');
             
                document.getElementById("MostrarCliente").innerHTML = document.getElementById("NombreCliente").value;
            }

            function FuncionEfectivo(Num) {

                if (Num == ".") {                    
                   // document.getElementById("EfectivoDot").style.border = "3px inset rgb(254, 255, 208)";
                   // alert(document.getElementById("EfectivoDot").className);

                    if (document.getElementById("EfectivoDot").className == "btn btn-dark btn-circle btn-xl") {
                        document.getElementById("EfectivoDot").className = "btn btn-primary btn-circle btn-xl";
                    }
                    else {
                        document.getElementById("EfectivoDot").className = "btn btn-dark btn-circle btn-xl";
                    }
                                        
                }
                if (Num == "d") {                    
                    document.getElementById("txtEfectivo").value = "0.00";
                    document.getElementById("EfectivoDot").className == "btn btn-dark btn-circle btn-xl";
                }
                if (Num != "." && Num != "d") {

                    if (document.getElementById("EfectivoDot").className == "btn btn-dark btn-circle btn-xl") {

                        var Monto = parseFloat(document.getElementById("txtEfectivo").value);
                        var MontoEntero = parseInt(Monto);
                        var Decimas = parseFloat(Monto - parseFloat(MontoEntero)).toFixed(1);

                        var MontoString = MontoEntero.toString();

                        var NumInt = parseFloat(Num) / 10;
                        
                        if (Decimas == 0.00) {
                            document.getElementById("txtEfectivo").value = MontoEntero.toString() + '.' + Num + '0';
                        }
                        else {
                            var MontoFinal = parseFloat(MontoEntero) + (parseFloat(Decimas.toString() + Num));
                            document.getElementById("txtEfectivo").value = MontoFinal.toString();
                        }
                        
                                                              
                    }
                                        
                    else {
                        var Monto = parseFloat(document.getElementById("txtEfectivo").value);
                        var MontoEntero = parseInt(Monto);
                        var Decimas = parseFloat(parseFloat(Monto) - parseFloat(parseInt(Monto))).toFixed(2);;

                        var MontoString = MontoEntero.toString();

                        document.getElementById("txtEfectivo").value = parseFloat(MontoString + Num) + parseFloat(Decimas);
                    }

                   
                }
                
            }

            function FuncionDebito(Num) {

                if (Num == ".") {
                    // document.getElementById("EfectivoDot").style.border = "3px inset rgb(254, 255, 208)";
                    // alert(document.getElementById("EfectivoDot").className);

                    if (document.getElementById("DebitoDot").className == "btn btn-dark btn-circle btn-xl") {
                        document.getElementById("DebitoDot").className = "btn btn-primary btn-circle btn-xl";
                    }
                    else {
                        document.getElementById("DebitoDot").className = "btn btn-dark btn-circle btn-xl";
                    }

                }
                if (Num == "d") {
                    document.getElementById("txtDebito").value = "0.00";
                    document.getElementById("DebitoDot").className == "btn btn-dark btn-circle btn-xl";
                }
                if (Num != "." && Num != "d") {

                    if (document.getElementById("DebitoDot").className == "btn btn-dark btn-circle btn-xl") {

                        var Monto = parseFloat(document.getElementById("txtDebito").value);
                        var MontoEntero = parseInt(Monto);
                        var Decimas = parseFloat(Monto - parseFloat(MontoEntero)).toFixed(1);

                        var MontoString = MontoEntero.toString();

                        var NumInt = parseFloat(Num) / 10;

                        if (Decimas == 0.00) {
                            document.getElementById("txtDebito").value = MontoEntero.toString() + '.' + Num + '0';
                        }
                        else {
                            var MontoFinal = parseFloat(MontoEntero) + (parseFloat(Decimas.toString() + Num));
                            document.getElementById("txtDebito").value = MontoFinal.toString();
                        }


                    }

                    else {
                        var Monto = parseFloat(document.getElementById("txtDebito").value);
                        var MontoEntero = parseInt(Monto);
                        var Decimas = parseFloat(parseFloat(Monto) - parseFloat(parseInt(Monto))).toFixed(2);;

                        var MontoString = MontoEntero.toString();

                        document.getElementById("txtDebito").value = parseFloat(MontoString + Num) + parseFloat(Decimas);
                    }


                }

            }
       
        </script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- <script src="node_modules/popper.js/dist/umd/popper.min.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
        <!-- <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script> -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
