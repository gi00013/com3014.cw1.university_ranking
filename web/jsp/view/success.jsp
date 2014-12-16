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
        <!--        div to make the data visible against the background image-->
        <div class="container">
            <br>
            <br>
            <div class ="columns" id = "sth">
                <div>
                    <!--                    checks the userid name. If it is null shows a Please login message with a link to the homepage. If not, show Welcome and the username of the user. the window automatically redirects to the homepage after 1s. -->
                    <%
                        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                    %>
                    You are not logged in<br/>
                    <a href="../../index.htm">Please Login</a>
                    <%} else {
                    %>
                    Welcome <%=session.getAttribute("userid")%>
                    <a href='../security/logout.jsp'>Log out</a>
                    <script>
                        setTimeout(function () {
                            window.location.href = '../../index.htm'
                        }, 1000);
                    </script>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>