<%-- Including jstl library --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="../../css/style3.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <script src="../../js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!--        import the javascript file which includes the function to validate if the user has correctly inserted amil, password, username, first name and last name-->
        <script src="../../js/validation.js" type="text/javascript"></script>
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
                    <!--        sets the user's username to a variable logged_in-->
                    <c:set var="logged_in" value="<%=session.getAttribute("userid")%>"/>
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
        <!--        div to make the data visible against the background image-->
        <div class="container">
            <div class ="columns" id = "sth">
                <div>
                    <br>
                    <br>

                    <!--                form that sends the values to the registration.jsp page.-->
                    <form method="post" action="../security/registration.jsp" name="myForm" onsubmit="return validateForm();">
                        <center>
                            <table>
                                <thead>
                                    <tr>
                                        <th colspan="2">Enter Information Here</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>First Name</td>
                                        <td><input type="text" name="fname" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Last Name</td>
                                        <td><input type="text" name="lname" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><input type="text" name="email" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>User Name</td>
                                        <td><input type="text" name="uname" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td><input type="password" name="pass" value="" /></td>
                                    </tr>
                                    <tr>
                                        <td>Retype Password</td>
                                        <td><input type="password" name="pass2" value="" /></td>
                                    </tr>                
                                    <tr>
                                        <td><input type="reset" value="Reset" /></td>
                                        <td><input type="submit" value="Submit" /></td>                                      
                                    </tr>

                                </tbody>
                            </table>
                        </center>
                    </form>
                </div>
            </div>
            <!--        footer that shows the group's number at the bottom left of the page-->
            <footer>
                <p class = "footer_p">&copy; Group 6 2014</p>
            </footer>
        </div>
    </body>
</html>