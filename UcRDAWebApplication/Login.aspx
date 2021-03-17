<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master"  CodeBehind="Login.aspx.cs" Inherits="UcRDAWebApplication.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class ="col-md-3"></div>
        <div class ="col-md-3">
            <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label><br />
            <asp:TextBox ID="TextBox1" runat="server" class="form-text" style="border-radius:15px; margin-bottom:2%"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" class="form-text" style="border-radius:15px; margin-bottom:2%"></asp:TextBox><br />
            <asp:Button ID="submitbtn" runat="server" Text="Login" style="border-radius:25px;border:0px;box-shadow:0px 10px 10px 0px;color:white;padding:10px;width:100px;" CssClass="btn btn-success"/>
        </div>
        <div class ="col-md-3" ></div>
    </div>
</asp:Content>
