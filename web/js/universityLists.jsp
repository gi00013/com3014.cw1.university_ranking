<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : universityList
    Created on : Dec 10, 2014, 11:09:22 PM
    Author     : giorgosioannidis
--%>



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
        <link href="../css/style2.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


        <script src="jquery-latest.js" type="text/javascript"></script>
        <script src="jquery.tablesorter.js" type="text/javascript"></script>
        <script>
            $(function () {
                $("#racetimes").tablesorter({widgets: ['zebra']});
            });
        </script>

        <script
        src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
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
        <a href="../index.html"></a>

        <a href="../index.html"></a>
        <br/><br/>

        <div class="jumbotron">
            <div class="container">

                <h1>University List</h1>


                <h3>To view the additional information about an institution, please select it. </h3>

                <sql:query var="institutions" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT name, guardian_score, course_satisfaction, teaching_satisfaction, feedback_satisfaction, staff_student_ratio, spend_per_student	, entry_tariff, value_added, career, location FROM Institution
                </sql:query>




                <table id="racetimes" class="tablesorter">
                    <thead>
                        <tr id="firstrow">

                            <th  id="th1">NAME</th>
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

                    <iframe src="https://mapsengine.google.com/map/embed?mid=zzeOparcwcI4.kH79Ga9sNLpI" width="640" height="480"></iframe>


            </div>
        </div>





        <footer>
            <p class = "footer_p">&copy; Group 6 2014</p>
        </footer>
    </body>


</html>
