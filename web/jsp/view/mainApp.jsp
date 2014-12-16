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

        <title>University Ranking</title>

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

        <!--        import the javascript file which includes the function to validate if the user has chosen all the fields or if a number is used more than once-->
        <script src="../../js/validation.js"></script>
    </head>

    <body>
        <!--        sets the user's username to a variable logged_in-->
        <c:set var="logged_in" value="<%=session.getAttribute("userid")%>"/>

        <!--        if the user is not logged-in, the page is not visible and redirects to the error.jsp page -->
        <c:choose>
            <c:when test="${logged_in==null}">
                <script>
                    setTimeout(function () {
                        window.location.href = '../view/error.jsp'
                    }, 0000);
                </script>
            </c:when>
            <c:otherwise>

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


                <!--                form that sends the values to the showResult.jsp page.-->
                <form action="../database/showResult.jsp" method ="POST" >
                    <div class="container">

                        <div class ="columns" id = "sth">
                            <h1 id="title"> University Recommendation System </h1>
                            <div style="text-align: center">
                                <h3>Subject:</h3>
                                <select name ="subjectS" id="subject" >
                                    <option value="selectSubject" >     --- Please Select Subject ---</option>
                                    <option value="Accounting & finance">Accounting & finance</option>
                                    <option value="American studies">American studies</option>
                                    <option value="Anatomy & Physiology">Anatomy & Physiology</option>
                                    <option value="Anthropology">Anthropology</option>
                                    <option value="Architecture">Architecture</option>
                                    <option value="Art">Art</option>
                                    <option value="Biosciences">Biosciences</option>
                                    <option value="Computer science & information systems">Computer science & information systems</option>
                                    <option value="Dentistry">Dentistry</option>
                                    <option value="Economics">Economics</option>
                                    <option value="Education">Education</option>
                                    <option value="Geography & environmental studies">Geography & environmental studies</option>
                                    <option value="History">History</option>
                                    <option value="History of art">History of art</option>
                                    <option value="Law">Law</option>
                                    <option value="Mathematics">Mathematics</option>
                                    <option value="Medicine">Medicine</option>
                                    <option value="Music">Music</option>
                                    <option value="Nursing & midwifery">Nursing & midwifery</option>
                                    <option value="Pharmacy & pharmacology">Pharmacy & pharmacology</option>
                                    <option value="Philosophy">Philosophy</option>
                                    <option value="Physics">Physics</option>
                                    <option value="Politics">Politics</option>
                                    <option value="Psychology">Psychology</option>
                                    <option value="Social policy & administration">Social policy & administration</option>
                                    <option value="Social work">Social work</option>
                                    <option value="Sociology">Sociology</option>
                                    <option value="Sports science">Sports science</option>
                                    <option value="Veterinary science">Veterinary science</option>                              
                                </select>
                            </div>
                            <br>
                            <br>
                            <h3 id="choose">  Choose numbers 1-6 to each field. More important 1 least important 6 </h3>

                            <div class = "container">
                                <div class ="row">
                                    <div class="col-md-6" id = "test2">
                                        <h3>Location(within 50 miles from London):</h3>
                                        <select name = "locationS" id = "location" >
                                            <option value="selectLocation">--- Please Select Location ---</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>

                                        <br/>

                                        <h3>Teaching satisfaction:</h3>
                                        <select name ="teachingSatisfactionS" id = "teachingSatisfaction">
                                            <option value="selectTeaching">--- Please Select Teaching Satisfaction ---</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>

                                        <br/>

                                        <h3>Student Satisfaction</h3>
                                        <select name ="studentS" id = "student">
                                            <option value="selectStudent">--- Please Select Student Satisfaction ---</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6" id = "test2">

                                        <h3>Entry difficulty:</h3>
                                        <select name ="entryDifficultyS" id = "entryDifficulty">
                                            <option value="selectDifficulty">--- Please Select Entry Difficulty ---</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>

                                        <br/>

                                        <h3>Career Opportunities:</h3>
                                        <select name ="careerOpportunitiesS" id = "careerOpportunities">
                                            <option value="selectCareer">--- Please Select Career Opportunities---</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>

                                        <br/>

                                        <h3>Research:</h3>
                                        <select name ="researchS" id = "research">
                                            <option value="selectResearch">--- Please Select Research ---</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <br/>
                            <br/>

                            <div class ="wrapper">
                                <!--                                button which submits the form. In addition call the validate() function to check i a number is used more than once or a field is not filled properly.-->
                                <input type="submit" value="Proceed" id="example-show" class="button btn-primary btn-lg" onclick="return validate();">
                            </div>
                        </div>
                        <!--        footer that shows the group's number at the bottom left of the page-->
                        <footer>
                            <p class = "footer_p">&copy; Group 6 2014</p>
                        </footer>
                    </div>
                </form>

                <!-- Bootstrap core JavaScript
                   ================================================== -->
                <!-- Placed at the end of the document so the pages load faster -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                <script src="../../js/bootstrap.min.js"></script>
                <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
                <script src="../../js/ie10-viewport-bug-workaround.js"></script>
            </c:otherwise>
        </c:choose>
    </body>
</html>