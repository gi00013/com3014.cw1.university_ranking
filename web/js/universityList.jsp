<%-- 
    Document   : universityList
    Created on : Dec 10, 2014, 11:09:22 PM
    Author     : giorgosioannidis
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:query var="institutions" dataSource="jdbc/com3014.cw1.university_ranking">
    SELECT institution_id as id, name FROM Institution
</sql:query>

    
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
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        
           
          
    </head>
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
  </div>
        <a href="../index.html"></a>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
         <div class="jumbotron">
            <div class="container">
                <div id="wrap">
                <h1>University List</h1>
    
                <h2>A complete list of all the UK Universities.</h2>
           
                <h3>To view the additional information about an institution, please select it. </h3>
               <br/>
                    <form action="response.jsp">
                        <strong>Select an Institution:</strong>
                        <select name="institution_id">
                         <c:forEach var="institution" items="${institutions.rows}">
                         <option value="${institution.id}">${institution.name}</option>
                         </c:forEach>
                        </select>
                        <input type="submit" value="submit" name="submit" class="button btn-primary btn-lg"/>
                    </form>
              </div>
            </div>
         </div>
         <footer>
            <p class = "footer_p">&copy; Group 6 2014</p>
        </footer>
</body>


</html>
