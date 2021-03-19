<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UcRDAWebApplication.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .hero-image {
              background-image: url("Image/front.jpg"); /* The image used */
              background-color: #cccccc; /* Used if the image is unavailable */
              height:1022px; /* You must set a specified height */
              background-repeat: no-repeat; /* Do not repeat the image */
              background-size: cover; /* Resize the background image to cover the entire container */
              opacity:80%;
        }
        .btn :hover {
            background-color:#9b30ff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row" >
        <div class ="col-md-9 hero-image">
            
        </div>
        <div class ="col-md-3">
            <center>
                <img src="Image/finalise design.png" style="" /><br/>
                <asp:Label ID="Label1" runat="server" Text="Login" style="margin-bottom:10px;"></asp:Label><br />
                <asp:TextBox ID="txtUserName" runat="server" class="form-text" style="border-radius:15px; margin-bottom:2%" OnTextChanged="txtUserName_TextChanged" CausesValidation="True"></asp:TextBox><br />
                <asp:TextBox ID="txtPassword" runat="server" class="form-text" style="border-radius:15px; margin-bottom:2%" TextMode="Password" OnTextChanged="txtPassword_TextChanged"></asp:TextBox><br />
                <asp:Button ID="submitbtn" runat="server" Text="Login" style="border-radius:25px;border:0px;box-shadow:0px 10px 10px 0px;color:white;padding:10px;width:100px;margin-bottom:10px;background-color:purple;" CssClass="btn" OnClick="submitbtn_Click"/>
            </center>
         </div>
    </div>
    </form>
</body>
</html>
