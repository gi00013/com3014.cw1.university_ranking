<%-- 
    Document   : response
    Created on : Dec 10, 2014, 10:41:24 PM
    Author     : giorgosioannidis
--%>
<jsp:include page="mainApp.html"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:query var="uniInfoRs" maxRows="1" dataSource="jdbc/com3014.cw1.university_ranking">
    SELECT name, guardian_score, course_satisfaction, teaching_satisfaction, feedback_satisfaction, staff_student_ratio, spend_per_student, entry_tariff, value_added, career, location
    FROM Institution 
    WHERE institution_id = ? <sql:param value = "${param.institution_id}" />
</sql:query>
<c:set var="uniInfo" scope="request" value="${uniInfoRs.rows[0]}"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <title>University Ranking</title>

        <!-- Bootstrap core CSS -->
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
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
                    <form class="navbar-form navbar-right" role="form">
                        <div class="form-group">
                            <input type="text" placeholder="Email" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="Password" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success">Sign in</button>
                        <a href="register.html"  role="button" class="btn btn-primary"> Register </a>
                    </form>
                </div><!--/.navbar-collapse -->
            </div>
        
        </div>
        <div class="jumbotron" id = "list">
            <div class="container">
                <h1>${uniInfo.guardian_score}</h1>
        <table>
            <title></title>
            <tr>
            <th colspan="2">${uniInfo.name}</th>
            </tr>
            <tr>
                <td><strong>Description: </strong></td>
                <td><span style="font-size:smaller; font-style:italic;">${uniInfo.name}</span></td>
            </tr>
            <tr>
                <td><strong>Counselor: </strong></td>
                <td><strong>${uniInfo.counselor}</strong>
                    <br><span style="font-size:smaller; font-style:italic;">
                    member since: ${uniInfo.memberSince}</span></td>
            </tr>
            <tr>
                <td><strong>Contact Details: </strong></td>
                <td><strong>email: </strong>
                    <a href="mailto:${uniInfo.email}">${uniInfo.email}</a>
                    <br><strong>phone: </strong>${uniInfo.telephone}</td>
            </tr>
        </table>
           <INPUT Type="button" VALUE="Back" class="button btn-primary btn-lg" onClick="history.go(-1);return true;">
                 </div>
        </div>
    </body>
</html>
