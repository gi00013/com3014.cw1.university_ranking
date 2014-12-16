<%-- 
    Document   : showResult
    Created on : Dec 12, 2014, 8:42:24 PM
    Author     : giorgosioannidis
--%>

<%-- Including jstl libraries --%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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

        <!--        custom css file for styling-->
        <link href="../../css/style2.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <script src="../../js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script src="../../js/jquery-latest.js" type="text/javascript"></script>
        <script src="../../js/jquery.tablesorter.js" type="text/javascript"></script>

        <!--        script to sort the table via JQuery-->
        <script>
            $(function () {
                $("#racetimes").tablesorter({widgets: ['zebra']});
            });
        </script>
        <!--    method to delete the showResults2 table    -->
        <script>
            function deleteDb()
            {
            <sql:update var="newtable" dataSource="jdbc/com3014.cw1.university_ranking">

                DROP TABLE ShowResults2
            </sql:update>
            }
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
                    <a class="navbar-brand" href="../../index.htm">University Ranking</a>
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
                                <a href="../jsp/view/reg.jsp"  role="button" class="btn btn-primary"> Register </a>
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

        <!--         gets the values from the mainApp.jsp form and assign them to some variables-->
        <c:set var="e" scope="session" value="<%= request.getParameter("subjectS")%>"/>
        <c:set var="f" scope="session" value="<%= request.getParameter("locationS")%>"/>
        <c:set var="g" scope="session" value="<%= request.getParameter("teachingSatisfactionS")%>"/>
        <c:set var="h" scope="session" value="<%= request.getParameter("studentS")%>"/>
        <c:set var="i" scope="session" value="<%= request.getParameter("entryDifficultyS")%>"/>
        <c:set var="j" scope="session" value="<%= request.getParameter("careerOpportunitiesS")%>"/>
        <c:set var="k" scope="session" value="<%= request.getParameter("researchS")%>"/>
        <!--           Assign the value of  e(subject selection) to the dummy variable-->
        <c:choose>
            <c:when test="${e=='Accounting & finance'}">
                <c:set var = "dummy" value = "AccountingAndFinance" />
            </c:when>
            <c:when test="${e=='American studies'}">
                <c:set var = "dummy" value = "AmericanStudies" />
            </c:when>
            <c:when test="${e=='Anatomy & Physiology'}">
                <c:set var = "dummy" value = "AnatomyAndPhysiology" />
            </c:when>
            <c:when test="${e=='Anthropology'}">
                <c:set var = "dummy" value = "Anthropology" />
            </c:when>
            <c:when test="${e=='Architecture'}">
                <c:set var = "dummy" value = "Architecture" />
            </c:when>
            <c:when test="${e=='Art'}">
                <c:set var = "dummy" value = "Art" />
            </c:when>
            <c:when test="${e=='Biosciences'}">
                <c:set var = "dummy" value = "Biosciences" />
            </c:when>
            <c:when test="${e=='Computer science & information systems'}">
                <c:set var = "dummy" value = "ComputerScience" />
            </c:when>
            <c:when test="${e=='Dentistry'}">
                <c:set var = "dummy" value = "Dentistry" />
            </c:when>
            <c:when test="${e=='Economics'}">
                <c:set var = "dummy" value = "Economics" />
            </c:when>
            <c:when test="${e=='Education'}">
                <c:set var = "dummy" value = "Education" />
            </c:when>
            <c:when test="${e=='Geography & environmental studies'}">
                <c:set var = "dummy" value = "GeographyAndenvironmental_studies" />
            </c:when>
            <c:when test="${e=='History'}">
                <c:set var = "dummy" value = "History" />
            </c:when>
            <c:when test="${e=='History of art'}">
                <c:set var = "dummy" value = "HistoryOfArt" />
            </c:when>
            <c:when test="${e=='Law'}">
                <c:set var = "dummy" value = "Law" />
            </c:when>
            <c:when test="${e=='Mathematics'}">
                <c:set var = "dummy" value = "Mathematics" />
            </c:when>
            <c:when test="${e=='Medicine'}">
                <c:set var = "dummy" value = "Medicine" />
            </c:when>
            <c:when test="${e=='Music'}">
                <c:set var = "dummy" value = "Music" />
            </c:when>
            <c:when test="${e=='Nursing & midwifery'}">
                <c:set var = "dummy" value = "Nursing" />
            </c:when>
            <c:when test="${e=='Pharmacy & pharmacology'}">
                <c:set var = "dummy" value = "PharmacyAndPharmacology" />
            </c:when>
            <c:when test="${e=='Philosophy'}">
                <c:set var = "dummy" value = "Philosophy" />
            </c:when>
            <c:when test="${e=='Physics'}">
                <c:set var = "dummy" value = "Physics" />
            </c:when>
            <c:when test="${e=='Politics'}">
                <c:set var = "dummy" value = "Politics" />
            </c:when>
            <c:when test="${e=='Psychology'}">
                <c:set var = "dummy" value = "Psychology" />
            </c:when>
            <c:when test="${e=='Social policy & administration'}">
                <c:set var = "dummy" value = "SocialPolicy" />
            </c:when>
            <c:when test="${e=='Social work'}">
                <c:set var = "dummy" value = "SocialWork" />
            </c:when>
            <c:when test="${e=='Sociology'}">
                <c:set var = "dummy" value = "Sociology" />
            </c:when>
            <c:when test="${e=='Sports science'}">
                <c:set var = "dummy" value = "SportsScience" />
            </c:when>
            <c:when test="${e=='Veterinary science'}">
                <c:set var = "dummy" value = "VeterinaryScience" /> 
            </c:when>
        </c:choose>
        <!--        creates connection with the database and clones an existing table regarding the subject a user has chosen, and names it ShowResults2 . 
        It decides the table to clone by the dummy variable   -->
        <sql:update var="newtable" dataSource="jdbc/com3014.cw1.university_ranking">

            CREATE TABLE ShowResults2 SELECT * FROM <c:out value = "${dummy}" />
        </sql:update>

        <!--         gets the value of the location field by the variable f. Depending the value of if, the distance_from_London is being divided.-->
        <c:choose>
            <c:when test="${f=='1'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET distance_from_London = (distance_from_London / 1)
                </sql:update>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${f=='2'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET distance_from_London = (distance_from_London / 2)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>       
            <c:when test="${f=='3'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET distance_from_London = (distance_from_London / 3)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${f=='4'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET distance_from_London = (distance_from_London / 4)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${f=='5'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET distance_from_London = (distance_from_London / 5)
                </sql:update>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${f=='6'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET distance_from_London = (distance_from_London / 6)
                </sql:update>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${g=='1'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET teaching_satisfaction = (teaching_satisfaction * 1.5 )
                </sql:update> 
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${g=='2'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET teaching_satisfaction = (teaching_satisfaction * 1.25)
                </sql:update>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${g=='3'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET teaching_satisfaction = (teaching_satisfaction * 1)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${g=='4'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET teaching_satisfaction = (teaching_satisfaction * 0.75)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${g=='5'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET teaching_satisfaction = (teaching_satisfaction * 0.5)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${g=='6'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET teaching_satisfaction = (teaching_satisfaction * 0.25)
                </sql:update>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${h=='1'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET student_satisfaction = (student_satisfaction * 1.5)

                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${h=='2'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET student_satisfaction = (student_satisfaction * 1.25)

                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${h=='3'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET student_satisfaction = (student_satisfaction * 1)

                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${h=='4'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET student_satisfaction = (student_satisfaction * 0.75)

                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${h=='5'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET student_satisfaction = (student_satisfaction * 0.5)

                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${h=='6'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET student_satisfaction = (student_satisfaction * 0.25)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${i=='1'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET entry_standards = (entry_standards * 1.5)

                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${i=='2'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET entry_standards = (entry_standards * 1.25)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${i=='3'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET entry_standards = (entry_standards * 1)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${i=='4'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET entry_standards = (entry_standards * 0.75)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${i=='5'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET entry_standards = (entry_standards * 0.5)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${i=='6'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET entry_standards = (entry_standards * 0.25)
                </sql:update>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${j=='1'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET carrer_opportunities = (carrer_opportunities * 1.5)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${j=='2'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET carrer_opportunities = (carrer_opportunities * 1.25)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${j=='3'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET carrer_opportunities = (carrer_opportunities * 1)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${j=='4'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET carrer_opportunities = (carrer_opportunities * 0.75)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${j=='5'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET carrer_opportunities = (carrer_opportunities * 0.5)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${j=='6'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET carrer_opportunities = (carrer_opportunities * 0.25)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${k=='1'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET research_assessment = (research_assessment * 1.5)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${k=='2'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET research_assessment = (research_assessment * 1.25)
                </sql:update>
            </c:when>
        </c:choose>
        <c:choose>
            <c:when test="${k=='3'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET research_assessment = (research_assessment * 1)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${k=='4'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET research_assessment = (research_assessment * 0.75)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${k=='5'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET research_assessment = (research_assessment * 0.5)
                </sql:update>
            </c:when> 
        </c:choose>
        <c:choose>
            <c:when test="${k=='6'}" >
                <sql:update var="newtable2" dataSource="jdbc/com3014.cw1.university_ranking">
                    UPDATE ShowResults2
                    SET research_assessment = (research_assessment * 0.25)
                </sql:update>
            </c:when>
        </c:choose>
        <!--         Creates a connection with the database and retireve data from it. In addition, it creates a new column Result. Then it sorts the data by the result.-->
        <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
            SELECT name, teaching_satisfaction, student_satisfaction,entry_standards,carrer_opportunities,research_assessment,distance_from_London, (teaching_satisfaction + (student_satisfaction * 20) + (entry_standards / 8) + carrer_opportunities + (research_assessment * 25) - distance_from_London) AS Result
            FROM ShowResults2 ORDER BY Result DESC
        </sql:query>
        <br/>
        <br/>
        <!--        div to make the data visible against the background image-->
        <div class="jumbotron">
            <div class="container">
                <h1> Recommended Institution for <%= request.getParameter("subjectS")%></h1>

                <br/>
                <br/>

                <!--                table to show the retrieved data from the database. It uses the tablesorter class to make the values reorder via JQuery-->
                <table id="racetimes" class="tablesorter">
                    <thead>
                        <tr id="firstrow">
                            <th  id="th1">NAME</th>
                            <th id="th1">Teaching Satisfaction</th>
                            <th id="th1">Student Satisfaction</th>
                            <th id="th1">Entry Standards</th>
                            <th id="th1">Career Opportunities</th>
                            <th id="th1">Research Assessment</th>
                            <th id="th1">Distance from London</th>
                            <th id="th1">Result</th>

                        </tr>
                    </thead>
                    <!--                    it creates a for loop to display all the dta from the database-->
                    <tbody>
                        <!-- column data -->
                        <c:forEach var="row" items="${results.rowsByIndex}">
                            <tr id="tr1">
                                <c:forEach var="column" items="${row}">
                                    <td id="td1"><c:out value="${column}"/></td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!--                button to return the mainApp page-->
                <p><a href="../view/mainApp.jsp"  class="button btn-primary btn-lg" />Back</a></p>
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