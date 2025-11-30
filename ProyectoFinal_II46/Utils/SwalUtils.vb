Namespace Utils
    Public Module SwalUtils
        Public Sub ShowSwalMessage(page As System.Web.UI.Page, title As String, message As String, icon As String)
            title = title.Replace("'", "")
            message = message.Replace("'", "")
            ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString, ShowSwalScript(title, message, icon), True)
        End Sub
        Public Function ShowSwalScript(title As String, message As String, icon As String) As String
            title = title.Replace("'", "")
            message = message.Replace("'", "")
            Return $"Swal.fire({{icon:'{icon}',title: '{title}',text: '{message}'}});"
        End Function
        Public Sub ShowErrorMessage(page As System.Web.UI.Page, title As String, message As String)
            ShowSwalMessage(page, title, message, "error")
        End Sub
        Public Sub ShowSuccessMessage(page As System.Web.UI.Page, title As String, message As String)
            ShowSwalMessage(page, title, message, "success")
        End Sub
        Public Sub ShowDeleteMessage(page As System.Web.UI.Page, title As String, message As String, Optional icon As String = "info")
            ShowSwalMessage(page, title, message, icon)
        End Sub
        Public Sub ShowUpdateMessage(page As System.Web.UI.Page, title As String, message As String, Optional icon As String = "success")
            ShowSwalMessage(page, title, message, icon)
        End Sub
    End Module
End Namespace