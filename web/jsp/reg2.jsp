<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">
        <title>University Ranking</title>

        <!-- Bootstrap core CSS -->
        <link href="../css/style3.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="../js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


        <script src="../js/validation.js" type="text/javascript"></script>
<!--        <script>
            var map;
            function initialize() {
                var mapOptions = {
                    zoom: 15,
                    center: new google.maps.LatLng(52.204262, 0.114927)
                };
                map = new google.maps.Map(document.getElementById('map-canvas'),
                        mapOptions);
            }

            google.maps.event.addDomListener(window, 'load', initialize);
        </script>-->

    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="../index.htm">University Ranking</a>
                </div>
                <div class="navbar-collapse collapse">
                     <c:set var="logged_in" value="<%=session.getAttribute("userid")%>"/>
                    <c:choose>
                        <c:when test="${logged_in==null}">
                    <form class="navbar-form navbar-right" role="form" method="post" action="../jsp/login.jsp">
                        <div class="form-group">
                            <input type="text" placeholder="Email" class="form-control" name="uname" value="">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="Password" class="form-control" name="pass" value="">
                        </div>
                        
                        <button type="submit" class="btn btn-success">Sign in</button>
                        <a href="../jsp/reg.jsp"  role="button" class="btn btn-primary"> Register </a>
                    </form>
                        </c:when>
                    <c:otherwise>
                         <form class="navbar-form navbar-right" role="form" method="post" action="jsp/logout.jsp">
                        <a href="logout.jsp"  role="button" class="btn btn-primary"> Logout </a>
                    </form>
                    </c:otherwise>
                        </c:choose>
                </div><!--/.navbar-collapse -->
            </div>

        </div>
                     <div class="container">

            <div class ="columns" id = "sth">
                
                <div style="text-align: center">
                    <br><br>
        <form method="post" action="registration.jsp" name="myForm" onsubmit="return validateForm();">
            <center>
                <h1>Username or Email address already exist</h1>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td>Retype Password</td>
                        <td><input type="password" name="pass2" value="" /></td>
                    </tr>                
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                   
                </tbody>
            </table>
            </center>
        </form>
                </div>
            </div>
                          <footer>
            <p class = "footer_p">&copy; Group 6 2014</p>
        </footer>
                     </div>
    </body>
</html>