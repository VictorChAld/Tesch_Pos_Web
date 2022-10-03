<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="Tesch_Pos_web.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.1/animate.min.css" />    
    <style type="text/css">
    	/*.style1*/
        body {
            background-image: url('BlueBackGround.jpg');
            background-size: cover;
        }
    	.navbar .navbar-brand {
    		padding-left: 0;
    		font-size: 20px;
    		padding-right: 50px;
    	}

    	.navbar-dark {
    		background-color: #1a1a1a;
    	}

    	.navbar-nav {
    		margin-left: auto;
    	}

    	.navbar .dropdown-menu {
    		color: #999;
    		font-weight: normal;
    		border-radius: 1px;
    		border-color: #e5e5e5;
    		box-shadow: 0 2px 8px rgba(0,0,0,.05);
    	}

    	.navbar .action-form a {
    		color: #33cabb;
    		padding: 0 !important;
    		font-size: 14px;
    	}

    	.navbar .navbar-form {
    		border: none;
    	}

    	.navbar .form-inline {
    		display: inline-block;
    	}

    	.navbar .action-form {
    		width: 280px;
    		padding: 20px;
    		left: auto;
    		right: 0;
    		font-size: 14px;
    	}

    	.form-control {
    		box-shadow: none;
    		font-weight: normal;
    		font-size: 13px;
    	}

    	.navbar .action-form a {
    		color: #33cabb;
    		padding: 0 !important;
    		font-size: 14px;
    	}

    	.navbar .action-form .hint-text {
    		text-align: center;
    		margin-bottom: 15px;
    		font-size: 13px;
    	}

    
    	.navbar .social-btn .btn, .navbar .social-btn .btn:hover {
    		color: #fff;
    		margin: 0;
    		padding: 0 !important;
    		font-size: 13px;
    		border: none;
    		transition: all 0.4s;
    		text-align: center;
    		line-height: 34px;
    		width: 47%;
    		text-decoration: none;
    	}

    	.navbar .action-buttons .dropdown-toggle::after {
    		display: none;
    	}

    	.form-check-label input {
    		position: relative;
    		top: 1px;
    	}
    </style>
</head>
<body style="background-color: White;" >
    <form id="form1" >
  
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <a href="#" class="navbar-brand">Tesch Consulting <b>Punto de venta</b></a>  	
		<div class="navbar-nav">
                <div class="nav-item dropdown">
                    <a data-toggle="dropdown" class="nav-link dropdown-toggle mr-4">
                        <span class="fa fa-sign-in"></span> Login
                    </a>
                    <div class="dropdown-menu action-form">
                        <form id="LogginForm" runat="server" action="Login.aspx" method="post">						
						<div class="form-group">
							<input id="UserName" type="text" runat="server" class="form-control" placeholder="Username" required="required">
						</div>
						<div class="form-group">
							<input id="Password" type="password" runat="server" class="form-control" placeholder="Password" required="required">
						</div>
						<input id="LogginBtn" type="submit" runat="server" class="btn btn-primary btn-block" value="Login">						
					</form>
                    </div>
                </div>			
		</div>
	</nav>

        <div>

                        
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- <script src="node_modules/popper.js/dist/umd/popper.min.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
        <!-- <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script> -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
