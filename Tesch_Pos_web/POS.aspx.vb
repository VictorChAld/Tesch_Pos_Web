Imports System.Data.SqlClient
Imports Telerik.Web.UI

Partial Class POS
    Inherits System.Web.UI.Page

    Private Sub POS_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try

            If IsPostBack = False Then



                If Request.QueryString("Nuevo") = "Y" Then

                    Dim cnn2 As New SqlConnection("Data Source=" & HttpContext.Current.Session("Servidor") & ";Initial Catalog=TESCH_POS;User=TESCH;Password=B1Admin")
                    Dim querys2 As String = "exec POS_NuevaVenta '" & HttpContext.Current.Session("Session") & "','" & HttpContext.Current.Session("Corte_ID") & "'"
                    Dim da2 As New SqlDataAdapter(querys2, cnn2)
                    Dim ds2 As New DataSet
                    da2.Fill(ds2)

                    If ds2.Tables.Count > 0 Then
                        If ds2.Tables(0).Rows.Count > 0 Then
                            'ClientScript.RegisterStartupScript(GetType(String()), "", "alert('" & ds2.Tables(0).Rows(0)(0).ToString.Trim.Replace("'", "") & "');", True)
                            ClientScript.RegisterStartupScript(GetType(String()), "", "MensajeToastAlerta('" & ds2.Tables(0).Rows(0)(0).ToString.Trim.Replace("'", "") & "');", True)
                            Exit Sub
                        End If
                    End If

                End If

                If Request.QueryString("Buscar") <> "" Then

                    Dim cnn2 As New SqlConnection("Data Source=" & HttpContext.Current.Session("Servidor") & ";Initial Catalog=TESCH_POS;User=TESCH;Password=B1Admin")
                    Dim querys2 As String = "exec POS_BuscarItem '" & HttpContext.Current.Session("Session") & "','" & Request.QueryString("Buscar") & "','" & Global_asax.WhsDefault & "'"
                    Dim da2 As New SqlDataAdapter(querys2, cnn2)
                    Dim ds2 As New DataSet
                    da2.Fill(ds2)
                    If ds2.Tables(0).Rows.Count = 0 Then
                        ClientScript.RegisterStartupScript(GetType(String()), "", "MensajeToastAlerta('No se encontró el producto');", True)

                        Exit Sub
                    End If
                    If ds2.Tables(0).Rows.Count = 1 Then

                        Dim querysInsert As String = "exec POR_Nueva_Venta_Item '" & HttpContext.Current.Session("Corte_ID") & "'," & HttpContext.Current.Session("ID_Venta") & ",'" & ds2.Tables(0).Rows(0)(0).ToString.Trim.Replace("'", "") & "',1,'" & Global_asax.WhsDefault & "'"
                        Dim daI As New SqlDataAdapter(querysInsert, cnn2)
                        Dim dsI As New DataSet
                        daI.Fill(dsI)

                        If dsI.Tables.Count > 0 Then
                            ClientScript.RegisterStartupScript(GetType(String()), "", "MensajeToastAlerta('" & dsI.Tables(0).Rows(0)(0).ToString.Trim.Replace("'", "") & "');", True)
                            Exit Sub
                        Else
                            SQLItems.DataBind()
                            ClientScript.RegisterStartupScript(GetType(String()), "", "window.history.replaceState({}, document.title, '/' + 'POS.aspx');", True)
                        End If

                    ElseIf ds2.Tables(0).Rows.Count > 1 Then
                        HttpContext.Current.Session("ArticuloFind") = Request.QueryString("Buscar")
                        SQLArticulos.DataBind()
                        ClientScript.RegisterStartupScript(GetType(String()), "", "OpenModal_Items();", True)


                    End If

                End If

                If Request.QueryString("ID") <> "" Then
                    HttpContext.Current.Session("ID_Venta") = Request.QueryString("ID")
                    SQLPagos.DataBind()
                    ClientScript.RegisterStartupScript(GetType(String()), "", "window.history.replaceState({}, document.title, '/' + 'POS.aspx');", True)
                End If

                If Request.QueryString("AddQuantity") = "Y" Then
                    Dim cnn2 As New SqlConnection("Data Source=" & HttpContext.Current.Session("Servidor") & ";Initial Catalog=TESCH_POS;User=TESCH;Password=B1Admin")
                    Dim querys2 As String = "exec POS_AddQuantity " & HttpContext.Current.Session("ID_Venta") & "," & Request.QueryString("LineNum") & "," & Request.QueryString("Cantidad")
                    Dim da2 As New SqlDataAdapter(querys2, cnn2)
                    Dim ds2 As New DataSet
                    da2.Fill(ds2)
                    SQLPagos.DataBind()

                    ClientScript.RegisterStartupScript(GetType(String()), "", "window.history.replaceState({}, document.title, '/' + 'POS.aspx');", True)
                End If

                If Request.QueryString("RemoverFila") = "Y" Then
                    Dim cnn2 As New SqlConnection("Data Source=" & HttpContext.Current.Session("Servidor") & ";Initial Catalog=TESCH_POS;User=TESCH;Password=B1Admin")
                    Dim querys2 As String = "exec POS_RemoverFila " & HttpContext.Current.Session("ID_Venta") & "," & Request.QueryString("LineNum")
                    Dim da2 As New SqlDataAdapter(querys2, cnn2)
                    Dim ds2 As New DataSet
                    da2.Fill(ds2)
                    SQLPagos.DataBind()

                    ClientScript.RegisterStartupScript(GetType(String()), "", "window.history.replaceState({}, document.title, '/' + 'POS.aspx');", True)
                End If

                Dim ConV As New SqlConnection("Data Source=" & HttpContext.Current.Session("Servidor") & ";Initial Catalog=TESCH_POS;User=TESCH;Password=B1Admin")
                Dim querysV As String = "exec POS_Venta " & HttpContext.Current.Session("ID_Venta")
                Dim daV As New SqlDataAdapter(querysV, ConV)
                Dim dsV As New DataSet
                daV.Fill(dsV)

                If dsV.Tables.Count > 0 Then
                    If dsV.Tables(0).Rows.Count > 0 Then
                        NombreCliente.Value = dsV.Tables(0).Rows(0)("CardName").ToString
                    End If
                End If

                If dsV.Tables.Count > 1 Then
                    If dsV.Tables(1).Rows.Count > 0 Then
                        MontoEfectivo.Value = dsV.Tables(1).Rows(0)("MontoEfectivo").ToString
                    End If
                End If

                If dsV.Tables.Count > 2 Then
                    If dsV.Tables(2).Rows.Count > 0 Then
                        MontoDebito.Value = dsV.Tables(2).Rows(0)("MontoDebito").ToString
                        NumTarjetaDebito.Value = dsV.Tables(2).Rows(0)("NumTarjeta").ToString
                        MesVenceDebito.Value = dsV.Tables(2).Rows(0)("MesVence").ToString
                        AnioVenceDebito.Value = dsV.Tables(2).Rows(0)("AnioVence").ToString
                    End If
                End If

            End If

            If Request.Form("txtEfectivo") IsNot Nothing Then

                If Request.Form("txtEfectivo") <> "" Then
                    MontoEfectivo.Value = Request.Form("txtEfectivo")
                    Try
                        Dim cnn2 As New SqlConnection("Data Source=" & HttpContext.Current.Session("Servidor") & ";Initial Catalog=TESCH_POS;User=TESCH;Password=B1Admin")
                        Dim querys2 As String = "exec POS_PagoEfectivo " & HttpContext.Current.Session("ID_Venta") & "," & Request.Form("txtEfectivo")
                        Dim da2 As New SqlDataAdapter(querys2, cnn2)
                        Dim ds2 As New DataSet
                        da2.Fill(ds2)

                        SQLTotales.DataBind()
                        SQLPagos.DataBind()
                        grdPagos.DataBind()
                        grdTotales.DataBind()
                        ClientScript.RegisterStartupScript(GetType(String()), "", "MensajeToastExito('Pago aplicado');", True)
                    Catch ex As Exception
                        ClientScript.RegisterStartupScript(GetType(String()), "", "MensajeToastAlerta('" & ex.Message.Trim.Replace("'", "") & "');", True)
                    End Try


                End If

            End If

            If Request.Form("txtDebito") IsNot Nothing Then

                If Request.Form("txtDebito") <> "" Then
                    MontoEfectivo.Value = Request.Form("txtDebito")
                    Try
                        Dim cnn2 As New SqlConnection("Data Source=" & HttpContext.Current.Session("Servidor") & ";Initial Catalog=TESCH_POS;User=TESCH;Password=B1Admin")
                        Dim querys2 As String = "exec POS_PagoDebito " & HttpContext.Current.Session("ID_Venta") & "," & Request.Form("txtDebito") & ",'" & Request.Form("txtNumTarjetaDebito") & "','" & Request.Form("txtMesVenceDebito") & "'," & Request.Form("txtAnioVenceDebito")
                        Dim da2 As New SqlDataAdapter(querys2, cnn2)
                        Dim ds2 As New DataSet
                        da2.Fill(ds2)

                        SQLTotales.DataBind()
                        SQLPagos.DataBind()
                        grdPagos.DataBind()
                        grdTotales.DataBind()
                        ClientScript.RegisterStartupScript(GetType(String()), "", "MensajeToastExito('Pago aplicado');", True)
                    Catch ex As Exception
                        ClientScript.RegisterStartupScript(GetType(String()), "", "MensajeToastAlerta('" & ex.Message.Trim.Replace("'", "") & "');", True)
                    End Try


                End If

            End If

        Catch ex As Exception
            ClientScript.RegisterStartupScript(GetType(String()), "", "alert('" & ex.Message.Replace("'", "") & "');", True)
        End Try
    End Sub

    Private Sub Search_Click(sender As Object, e As EventArgs) Handles Search.Click
        Try
            If Buscar.Value <> "" Then
                Response.Redirect("POS.aspx?Buscar=" & Buscar.Value.Replace("'", "".Replace("&", "").Replace("?", "")))
            End If
        Catch ex As Exception

        End Try
    End Sub


End Class
