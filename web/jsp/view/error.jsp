<%-- 
    Document   : mainApp.jsp
    Created on : Dec 15, 2014, 12:27:16 AM
    Author     : giorgosioannidis
--%>
<%-- Including jstl libraries --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">

        <title>University Recommendation System</title>

        <!--       custom css file for styling-->
        <link href="../../css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <script src="../../js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <!--        navbar where includes a link for the home-page. In addition it checks 
              if the user is logged in then show the log out button. If not, how the login and register buttons. Also, the navbar collapses for smaller screens.-->
        <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="../../index.htm">University Recommendation System</a>
                </div>
                <div class="navbar-collapse collapse">
                    <c:set var="logged_in" value="<%=session.getAttribute("userid")%>"/>
                    <c:choose>
                        <c:when test="${logged_in==null}">
                            <form class="navbar-form navbar-right" role="form" method="post" action="../security/login.jsp">
                                <div class="form-group">
                                    <input type="text" placeholder="User Name" class="form-control" name="uname" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="Password" class="form-control" name="pass" value="">
                                </div>
                                <button type="submit" class="btn btn-success">Sign in</button>
                                <a href="../view/reg.jsp"  role="button" class="btn btn-primary"> Register </a>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <form class="navbar-form navbar-right" role="form" method="post" action="../security/logout.jsp">
                                <a href="../security/logout.jsp"  role="button" class="btn btn-primary"> Logout </a>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div><!--/.navbar-collapse -->
            </div>
        </div>

        <!--        div to make the data visible against the background image-->
        <div class="container">
            <div class ="columns" id = "sth">
                <br>
                <br>
                <h1 id="title"> Please Sign in or Register </h1>          
            </div>
            <!--        footer that shows the group's number at the bottom left of the page-->
            <footer>
                <p class = "footer_p">&copy; Group 6 2014</p>
            </footer>
        </div>

        <!-- Bootstrap core JavaScript
           ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>