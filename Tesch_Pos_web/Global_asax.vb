Imports System.Web
Public Class Global_asax
    Implements IHttpModule

    Private WithEvents _context As HttpApplication
    Public Shared Servidor As String
    Public Shared Sucursal_Select As String
    Public Shared Usuario As String
    Public Shared User_ID As String
    Public Shared Session As String
    Public Shared BD As String
    Public Shared Nombre As String
    Public Shared VendorCode As String
    Public Shared TipoUsuario As String
    Public Shared WhsDefault As String
    Public Shared Corte_ID As String


    ''' <summary>
    '''  Deberá configurar este módulo en el archivo web.config de su
    '''  web y registrarlo en IIS para poder usarlo. Para obtener más información
    '''  consulte el vínculo siguiente: https://go.microsoft.com/?linkid=8101007
    ''' </summary>
#Region "Miembros de IHttpModule"

    Public Sub Dispose() Implements IHttpModule.Dispose

        ' Ponga aquí el código de limpieza

    End Sub

    Public Sub Init(ByVal context As HttpApplication) Implements IHttpModule.Init
        _context = context
    End Sub

#End Region

    Public Sub OnLogRequest(ByVal source As Object, ByVal e As EventArgs) Handles _context.LogRequest

        ' Controla el evento LogRequest para proporcionar una implementación de 
        ' registro personalizado para él

    End Sub
End Class
