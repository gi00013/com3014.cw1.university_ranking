
<%-- 
    Document   : universityList
    Created on : Dec 10, 2014, 11:09:22 PM
    Author     : giorgosioannidis
--%>

<%-- Including jstl libraries --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
        <title>University Recommendation System</title>

        <!--       custom css file for styling-->
        <link href="../../css/style2.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <script src="../../js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!--        including the JQuery libraries for sorting table-->
        <script src="../../js/jquery-latest.js" type="text/javascript"></script>
        <script src="../../js/jquery.tablesorter.js" type="text/javascript"></script>

        <!--        function to sort table via JQuery-->
        <script>
            $(function () {
                $("#racetimes").tablesorter({widgets: ['zebra']});
            });
        </script>

        <!--        Adding the googleMaps api-->
        <script
            src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false">
        </script>
    </head>
    <body>
        <!--        sets the user's username to a variable logged_in-->
        <c:set var="logged_in" value="<%=session.getAttribute("userid")%>"/>

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
                    <!--                    sets the variable logged_in as the user's username. If the username = null then the user is not logged in-->
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

        <br/>
        <br/>

        <!--        div to make the data visible against the background image-->
        <div class="jumbotron">
            <div class="container">
                <h1>University List</h1>
                <h2>This is the overall University Ranking Table: </h2>

                <!--                creates connection with the database and retrieving data from it-->
                <sql:query var="institutions" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT name, guardian_score, course_satisfaction, teaching_satisfaction, feedback_satisfaction, staff_student_ratio, spend_per_student	, entry_tariff, value_added, career, location FROM Institution
                </sql:query>

                <!--                table to show the retrieved data from the database. It uses the tablesorter class to make the values reorder via JQuery-->
                <table id="racetimes" class="tablesorter">
                    <thead>
                        <tr id="firstrow">
                            <th id="th1">NAME</th>
                            <th id="th1">Guardian score</th>
                            <th id="th1">course Satisfaction</th>
                            <th id="th1">Teaching Satisfaction</th>
                            <th id="th1">Feedback Satisfaction</th>
                            <th id="th1">Staff/Student ratio</th>
                            <th id="th1">Spend per Student</th>
                            <th id="th1">Entry Tariff</th>
                            <th id="th1">Value Added</th>
                            <th id="th1">Career Opportunities</th>
                            <th id="th1">Location</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="row" items="${institutions.rowsByIndex}">
                            <tr id="tr1">
                                <c:forEach var="column" items="${row}">
                                    <td id="td1"><c:out value="${column}"/></td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!--                    adding the map to the page-->
                
                <iframe src="https://mapsengine.google.com/map/embed?mid=zzeOparcwcI4.kH79Ga9sNLpI" width="640" height="480"></iframe>
               
            </div>
        </div>
        <!--        footer that shows the group's number at the bottom left of the page-->
        <footer>
            <p class = "footer_p">&copy; Group 6 2014</p>
        </footer>

        <!-- Bootstrap core JavaScript
           ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="../../js/bootstrap.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
