<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!--        include custom css file for styling-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />

        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="${pageContext.request.contextPath}/js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!--        calling javascript fot the show/hide button-->
        <script src="${pageContext.request.contextPath}/js/validation.js"></script>




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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.htm">University Recommendation System</a>
                </div>
                <div class="navbar-collapse collapse">
                    <!--                    sets the variable logged_in as the user's username. If the username = null then the user is not logged in-->
                    <c:set var="logged_in" value="<%=session.getAttribute("userid")%>"/>
                    <c:choose>
                        <c:when test="${logged_in==null}">
                            <form class="navbar-form navbar-right" role="form" method="post" action="jsp/security/login.jsp">
                                <div class="form-group">
                                    <input type="text" placeholder="User Name" class="form-control" name="uname" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" placeholder="Password" class="form-control" name="pass" value="">
                                </div>
                                <button type="submit" class="btn btn-success">Sign in</button>
                                <a href="${pageContext.request.contextPath}/jsp/view/reg.jsp"  role="button" class="btn btn-primary"> Register </a>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <form class="navbar-form navbar-right" role="form" method="post" action="jsp/security/logout.jsp">
                                <a href="${pageContext.request.contextPath}/jsp/security/logout.jsp"  role="button" class="btn btn-primary"> Logout </a>
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div><!--/.navbar-collapse -->
            </div>
        </div>


        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron">
            <div class="container">
                <br>
                <!--  <h1>Give It To The Poor</h1> -->
                <h2>This is the Group's 6 project for COM3014 cw1. </h2>
                <br/>
                <!--                button to show or hide the div below.-->
                <a href="#" id="example-show" class="button btn-primary btn-lg" onclick="showHide('example');
                        return false;">Learn more &raquo;</a>
                <!--               <p id="follow"><a class="btn btn-primary btn-lg" role="button" href="#" id="example-show" class="showLink" onclick="showHide('example');return false;">Learn more &raquo;</a></p>-->
                <!--                hidden div which is being shown if the user press the above button-->
                <div id="example" class="more"> 

                    <p>
                        Your University, your choice!!!
                        The University recommendation system, takes into account your preferred choices. That means that the order in which you select what interests you more, 
                        when looking for a university, matters! For instance if you select Location as your 1st option and student satisfaction as your 2nd because you want to have a 
                        good time while studying at the university,
                        then the system takes your preferences into account and produces a list of results based on your needs! All fields are rescaled to the same range so there are no deviations. 
                        Each field gets multiplied by a factor depending on the order that you select them, and the result derives from another operation (Secret). Don’t panic if you see  
                        negative results in the recommendation list. That happens when the location is important to you and the system tells you that you should stay
                        away from that University. Other than that enjoy the website!!
                    </p>
                    <p><a href="#" id="example-hide" class="button btn-primary btn-lg" onclick="showHide('example');
                            return false;">Hide ^</a></p>
                </div>

            </div>
        </div>


        <!--        div that splits the screen to three columns-->
        <div class="columns"> 
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h2>University Recommendation System</h2>
                        <p id = "homeColumns">Fill the fields and see the recommended universities</p>
                        <!--   checks if the user is loggedin and if correct return the mainApp page. If not return the error page-->
                        <c:choose>
                            <c:when test="${logged_in==null}">
                                <p id="test"><a class="btn btn-default" href="${pageContext.request.contextPath}/jsp/view/error.jsp" role="button">View details &raquo;</a></p>
                            </c:when>
                            <c:otherwise>
                                <p id="test"><a class="btn btn-default" href="${pageContext.request.contextPath}/jsp/view/mainApp.jsp" role="button">View details &raquo;</a></p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-4">
                        <h2>Contact Us</h2>
                        <p id = "homeColumns"> Giorgos Ioannidis   gi00013@surrey.ac.uk<br>
                            Panayiotis Loizides pl00089@surrey.ac.uk<br>
                            Maria Panteli       mp00214@surrey.ac.uk<br>
                            Stelios Savvopoulos ss00434@surrey.ac.uk</p>
                    </div>
                    <div class="col-md-4">
                        <h2>University List</h2>
                        <p id = "homeColumns">A complete list of UK universities with general information .</p>
                        <br/><br/>
                        <!--                        button to return the universityLists page-->
                        <p id="test"><a class="btn btn-default" href="${pageContext.request.contextPath}/jsp/database/universityLists.jsp" role="button">View details &raquo;</a></p>
                    </div>                   
                </div>
            </div>



        </div> <!-- /container -->
        <!--        footer that shows the group's number at the bottom left of the page-->
        <footer>
            <p class = "footer_p">&copy; Group 6 2014</p>
        </footer>



        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="${pageContext.request.contextPath}/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>