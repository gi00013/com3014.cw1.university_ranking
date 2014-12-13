<%-- 
    Document   : showResult
    Created on : Dec 12, 2014, 8:42:24 PM
    Author     : giorgosioannidis
--%>
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


        <link href="http://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-1.11.1.js"></script>
        <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>

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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.htm">University Ranking</a>
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
                        <a href="#"  role="button" class="btn btn-primary"> Register </a>
                    </form>
                </div><!--/.navbar-collapse -->
            </div>
        </div>

        <c:set var="e" scope="session" value="<%= request.getParameter("subjectS")%>"/>
        <c:set var="f" scope="session" value="<%= request.getParameter("location")%>"/>
        <c:set var="g" scope="session" value="<%= request.getParameter("teachingSatisfaction")%>"/>
        <c:set var="h" scope="session" value="<%= request.getParameter("student")%>"/>
        <c:set var="i" scope="session" value="<%= request.getParameter("entryDifficulty")%>"/>
        <c:set var="j" scope="session" value="<%= request.getParameter("careerOpportunities")%>"/>
        <c:set var="k" scope="session" value="<%= request.getParameter("research")%>"/>

        <!--           choosing database considering the subject the user has chosen-->
        <c:choose>
            <c:when test="${e=='Accounting & finance'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM AccountingAndFinance
                </sql:query>
            </c:when>
            <c:when test="${e=='American studies'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM AmericanStudies
                </sql:query>
            </c:when>
            <c:when test="${e=='Anatomy & Physiology'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM AnatomyAndPhysiology
                </sql:query>
            </c:when>
            <c:when test="${e=='Anthropology'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Anthropology
                </sql:query>
            </c:when>
            <c:when test="${e=='Architecture'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Architecture
                </sql:query>
            </c:when>
            <c:when test="${e=='Art'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Art
                </sql:query>
            </c:when>
            <c:when test="${e=='Biosciences'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Biosciences
                </sql:query>
            </c:when>
            <c:when test="${e=='Computer science & information systems'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM ComputerScience
                </sql:query>
            </c:when>
            <c:when test="${e=='Dentistry'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Dentistry
                </sql:query>
            </c:when>
            <c:when test="${e=='Economics'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Economics
                </sql:query>
            </c:when>
            <c:when test="${e=='Education'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Education
                </sql:query>
            </c:when>
            <c:when test="${e=='Geography & environmental studies'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM GeographyAndenvironmental_studies
                </sql:query>
            </c:when>
            <c:when test="${e=='History'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM History
                </sql:query>
            </c:when>
            <c:when test="${e=='History of art'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM HistoryOfArt
                </sql:query>
            </c:when>
            <c:when test="${e=='Law'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Law
                </sql:query>
            </c:when>
            <c:when test="${e=='Mathematics'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Mathematics
                </sql:query>
            </c:when>
            <c:when test="${e=='Medicine'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Medicine
                </sql:query>
            </c:when>
            <c:when test="${e=='Music'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Music
                </sql:query>
            </c:when>
            <c:when test="${e=='Nursing & midwifery'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Nursing
                </sql:query>
            </c:when>
            <c:when test="${e=='Pharmacy & pharmacology'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM PharmacyAndPharmacology
                </sql:query>
            </c:when>
            <c:when test="${e=='Philosophy'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Philosophy
                </sql:query>
            </c:when>
            <c:when test="${e=='Physics'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Physics
                </sql:query>
            </c:when>
            <c:when test="${e=='Politics'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Politics
                </sql:query>
            </c:when>
            <c:when test="${e=='Psychology'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Psychology
                </sql:query>
            </c:when>
            <c:when test="${e=='Social policy & administration'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM SocialPolicy
                </sql:query>
            </c:when>
            <c:when test="${e=='Social work'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM SocialWork
                </sql:query>
            </c:when>
            <c:when test="${e=='Sociology'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM Sociology
                </sql:query>
            </c:when>
            <c:when test="${e=='Sports science'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM SportsScience
                </sql:query>
            </c:when>
            <c:when test="${e=='Veterinary science'}">
                <sql:query var="results" dataSource="jdbc/com3014.cw1.university_ranking">
                    SELECT * FROM VeterinaryScience
                </sql:query>
            </c:when>
        </c:choose>








        <br/><br/>

        <div class="jumbotron">
            <div class="container">
                <h1> Recommended Institution for <%= request.getParameter("subjectS")%></h1>

                <br/><br/>
                <table id="racetimes">
                    <tbody>
                        <tr id="firstrow">
                            <c:forEach var="columnName" items="${results.columnNames}">
                                <th id="th1"><c:out value="${columnName}"/></th>
                                </c:forEach>
                        </tr>
                        <!-- column data -->
                        <c:forEach var="row" items="${results.rowsByIndex}">
                            <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <script>
                    $('tbody').sortable();
                </script>
            </div>
        </div>
        <footer>
            <p class = "footer_p">&copy; Group 6 2014</p>
        </footer>

    </body>

</html>
