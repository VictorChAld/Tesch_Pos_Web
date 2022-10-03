Imports Telerik.Web.UI
Imports System.Xml
Imports System.Data.SqlClient
Imports System.Net
Imports System.IO

Partial Class Login
    Inherits System.Web.UI.Page

    Private Sub Login_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack = False Then
            HttpContext.Current.Session("SessionTeschPanel") = ""
            Try
                If HttpContext.Current.Session("Servidor") = "" Then

                    Dim ruta As String = HttpContext.Current.Request.PhysicalApplicationPath
                    If File.Exists(Path.Combine(ruta, "Config.xml")) = False Then
                        If Request.QueryString("Servidor") IsNot Nothing Then
                            If Request.QueryString("Servidor") <> "" Then
                                Dim estructura As String = "<?xml version='1.0' encoding='utf-8'?>" & vbCrLf &
                                    "<Servidor><Direccion>" & Request.QueryString("Servidor") & "</Direccion></Servidor>"

                                Dim xmldoc As New XmlDocument
                                xmldoc.LoadXml(estructura)
                                xmldoc.Save(Path.Combine(ruta, "Config.xml"))
                                ClientScript.RegisterStartupScript(GetType(String()), "", "window.location.href = 'Principal.aspx';", True)
                                Exit Sub
                            End If
                        End If
                        ClientScript.RegisterStartupScript(GetType(String()), "", "NuevoConfig();", True)
                        Exit Sub
                    Else
                        Dim xmldoc As New XmlDocument
                        xmldoc.Load(Path.Combine(ruta, "Config.xml"))

                        Dim Servidor As XmlNodeList = xmldoc.GetElementsByTagName("Direccion")
                        HttpContext.Current.Session("Servidor") = Servidor.Item(0).InnerText
                        Global_asax.Servidor = HttpContext.Current.Session("Servidor")

                    End If

                End If

                Dim Loggeo As NameValueCollection = Request.Form
                If Loggeo IsNot Nothing Then

                End If

            Catch ex As Exception
                ClientScript.RegisterStartupScript(GetType(String()), "", "alert('" & ex.Message.Replace("'", "") & "');", True)
                Exit Sub
            End Try

        End If
    End Sub

    Private Sub LogginAction(ByVal Usuario As String, ByVal Pass As String)
        Try
            Dim HostName As String = System.Net.Dns.GetHostName
            Dim IPs As IPHostEntry = Dns.GetHostEntry(HostName)
            Global_asax.Sucursal_Select = "FE45CF61-B6C4-4F0D-829A-6E6F571F0277"

            Dim Estructura As String = Pass & "_TCO140617JV9" 'La llave para el encriptado
            Dim Sign As String = Convert.ToBase64String(System.Text.Encoding.Unicode.GetBytes(Estructura))
            Dim Password As String = Sign

            Dim cnn2 As New SqlConnection("Data Source=" & Global_asax.Servidor & ";Initial Catalog=TESCH_POS;User=TESCH;Password=B1Admin")
            Dim querys As String = "exec Access '" & Usuario & "','" & Password & "','PROESA','" & IPs.AddressList(0).ToString & "','" & Global_asax.Sucursal_Select & "'"
            Dim da As New SqlDataAdapter(querys, cnn2)
            Dim ds As New DataSet
            da.Fill(ds)

            If ds Is Nothing Then
                MsgBox("No se encontró al usuario")
                Exit Sub
            ElseIf ds.Tables.Count = 0 Then
                MsgBox("No se encontró al usuario")
                Exit Sub
            ElseIf ds.Tables(0).Rows.Count = 0 Then
                MsgBox("No se encontró al usuario")
                Exit Sub
            ElseIf ds.Tables(0).Rows(0)("Result").ToString.Trim <> "1" Then
                MsgBox(ds.Tables(0).Rows(0)("Mensaje").ToString.Trim)
                Exit Sub
            Else
                Global_asax.Usuario = ds.Tables(0).Rows(0)("Usuario").ToString.Trim
                Global_asax.User_ID = ds.Tables(0).Rows(0)("ID_User").ToString.Trim
                Global_asax.Session = ds.Tables(0).Rows(0)("UID").ToString.Trim
                Global_asax.BD = "PROESA"
                Global_asax.Nombre = ds.Tables(0).Rows(0)("Nombre").ToString.Trim
                Global_asax.VendorCode = ds.Tables(0).Rows(0)("VendorCode").ToString.Trim
                Global_asax.TipoUsuario = ds.Tables(0).Rows(0)("TipoUsuario").ToString.Trim
                HttpContext.Current.Session("SessionTeschPanel") = "Afirmativo"
                HttpContext.Current.Session("Session") = Global_asax.Session
                HttpContext.Current.Session("VendorCode") = Global_asax.VendorCode
                HttpContext.Current.Session("BD") = Global_asax.BD
                Global_asax.WhsDefault = "APTE-AC"

                If ds.Tables.Count > 1 Then
                    Global_asax.Corte_ID = ds.Tables(1).Rows(0)("ID Corte").ToString.Trim
                    HttpContext.Current.Session("Corte_ID") = Global_asax.Corte_ID
                End If

                ClientScript.RegisterStartupScript(GetType(String()), "", "window.open('Index.html','_self');", True)
                Exit Sub

            End If

        Catch ex As Exception
            ClientScript.RegisterStartupScript(GetType(String()), "", "alert('" & ex.Message.Replace("'", "") & "');", True)
            Exit Sub
        End Try
    End Sub

    Private Sub Loggin_ServerClick(sender As Object, e As EventArgs) Handles LogginBtn.ServerClick
        Try
            LogginAction(UserName.Value, Password.Value)
        Catch ex As Exception
            ClientScript.RegisterStartupScript(GetType(String()), "", "alert('" & ex.Message.Replace("'", "") & "');", True)
        End Try
    End Sub
End Class
