<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UcRDAWebApplication.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <link href="Content/bootstrap.css" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet"/>
    
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
                <asp:TextBox ID="txtUserName" runat="server" class="form-text" style="border-radius:15px; margin-bottom:2%" OnTextChanged="txtUserName_TextChanged" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="*Required" Font-Bold="True" ForeColor="Red" ToolTip="To Login Username Is required"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtPassword" runat="server" class="form-text" style="border-radius:15px; margin-bottom:2%" TextMode="Password" OnTextChanged="txtPassword_TextChanged"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Required" Font-Bold="True" ForeColor="Red" ToolTip="To Login Password Is required"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="submitbtn" runat="server" Text="Login" style="border-radius:25px;border:0px;box-shadow:0px 10px 10px 0px;color:white;padding:10px;width:100px;margin-bottom:10px;background-color:purple;" CssClass="btn" OnClick="submitbtn_Click"/>
            </center>
         </div>
    </div>
    </form>
</body>
</html>
