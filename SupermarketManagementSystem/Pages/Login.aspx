<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<script type="text/javascript" src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title></title>
    <style>
        body{
         margin:0px;
         padding:0px;
        }
        .d1{
        position:absolute; 
         left:50px;
         top:50px; 
         width:100%; 
         height:100%;
         z-index:-1;
        }
        .auto-style1 {
            width: 774px;
            height: 589px;
        }
        .auto-style2 {
            margin-left: 0px;
            margin-top: 0px;
        }
        body
        {
            background:url(../Images/5.jpg);
        }
    </style>
</head>
<body>
    <div class="d1"><img src="../Images/4.png" class="auto-style1"/></div>
    <form id="form1" runat="server">
      <div class="div1" style="padding:200px 300px 100px;" >
        <div>
            <asp:Login ID="login" runat="server" DestinationPageUrl="~/Pages/Default.aspx" OnAuthenticate="login_Authenticate" CssClass="auto-style2" Height="238px" Width="253px">
                <InstructionTextStyle BackColor="#FF5050" />
                <LoginButtonStyle BackColor="#FF0066" />
            </asp:Login>
        </div>
      </div>
    </form>
</body>
</html>
