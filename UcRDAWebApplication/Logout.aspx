<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="UcRDAWebApplication.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logout</title>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
       <%
           Session["type"] = null;
           Session["username"] = null;
           Response.Redirect("Login.aspx");
           %>
    </form>
</body>
</html>
