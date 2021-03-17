<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master"  CodeBehind="Login1.aspx.cs" Inherits="UcRDAWebApplication.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" >
        <div class ="col-md-4"></div>
        <div class ="col-md-4" style="margin-top:20%;border:0px;box-shadow:0px 10px 10px 0px;">
            <center>
                <asp:Label ID="Label1" runat="server" Text="Login" style="margin-bottom:10px;"></asp:Label><br />
                <asp:TextBox ID="txtUserName" runat="server" class="form-text" style="border-radius:15px; margin-bottom:2%"></asp:TextBox><br />
                <asp:TextBox ID="txtPassword" runat="server" class="form-text" style="border-radius:15px; margin-bottom:2%" TextMode="Password"></asp:TextBox><br />
                <asp:Button ID="submitbtn" runat="server" Text="Login" style="border-radius:25px;border:0px;box-shadow:0px 10px 10px 0px;color:white;padding:10px;width:100px;margin-bottom:10px" CssClass="btn btn-success"/>
            </center>
         </div>
        <div class ="col-md-4" ></div>
    </div>

</asp:Content>
