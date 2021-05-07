﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UcRDAWebApplication.Login1" %>

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
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css" />
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css" />
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="limiter">
		<div class="container-login100" style="background-image: url('Image/front.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
                    <img src="Image/finalise design.png" style="" /><br/>
					Account Login
				</span>
				<form class="login100-form validate-form p-b-33 p-t-5">

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
                        <asp:TextBox ID="txtUserName" runat="server" class="input100" OnTextChanged="txtUserName_TextChanged" style="color:white;" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="*Required" Font-Bold="True" ForeColor="Red" ToolTip="To Login Username Is required"></asp:RequiredFieldValidator>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
                        <asp:TextBox ID="txtPassword" runat="server" class="input100" TextMode="Password" style="color:white;" OnTextChanged="txtPassword_TextChanged"></asp:TextBox>
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*Required" Font-Bold="True" ForeColor="Red" ToolTip="To Login Password Is required"></asp:RequiredFieldValidator>
					</div>

					<div class="container-login100-form-btn m-t-32">
						
                        <asp:Button ID="submitbtn" runat="server" Text="Login" CssClass="login100-form-btn" OnClick="submitbtn_Click"/>
					</div>

				</form>
			</div>
		</div>
	</div>
        
    </form>
</body>
</html>
