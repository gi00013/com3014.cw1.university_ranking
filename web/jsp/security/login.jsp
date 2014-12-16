
<%-- Including sql libraries --%>
<%@ page import ="java.sql.*" %>
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

        <title>University Ranking</title>


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

    <!--        div to make the data visible against the background image-->
    <div class="container">
        <br>
        <br>
        <div class ="columns" id = "sth">
            <div>
                <br>
                <br>

                <!--                    assigns the value of the uname field to the userid varialble and the value of the pass field to the pwd variable. 
                Then creates a connection with the database. Then checks if a user with the specific username and password exists. If it exists, reidrect to success.jsp page. 
                If not show invalid password and a link to the homepage  -->
                <%
                    String userid = request.getParameter("uname");
                    String pwd = request.getParameter("pass");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNIVERSITIES",
                            "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs;
                    rs = st.executeQuery("select * from Members where uname='" + userid + "' and pass='" + pwd + "'");
                    if (rs.next()) {
                        session.setAttribute("userid", userid);
                        //out.println("welcome " + userid);
                        //out.println("<a href='logout.jsp'>Log out</a>");
                        response.sendRedirect("../view/success.jsp");
                    } else {

                        out.println("Invalid password <a href='../../index.htm'>try again</a>");
                    }
                %>
            </div>
        </div>
    </div>
