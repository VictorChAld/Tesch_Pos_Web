Imports Telerik.Web.UI

Partial Class Principal
    Inherits System.Web.UI.Page

    Private Sub Principal_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack = False Then

            Try
                If HttpContext.Current.Session("SessionTeschPanel") <> "Afirmativo" Then

                    ClientScript.RegisterStartupScript(GetType(String()), "", "window.open('Login.aspx','_parent');", True)
                    Exit Sub

                End If
            Catch ex As Exception
                ClientScript.RegisterStartupScript(GetType(String()), "", "window.open('Login.aspx','_parent');", True)
                Exit Sub
            End Try

        End If
    End Sub
End Class
