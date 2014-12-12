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

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="${pageContext.request.contextPath}/js/ie-emulation-modes-warning.js"></script>
        
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <script src="${pageContext.request.contextPath}/js/validation.jsp"></script>
   
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


        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron">
            <div class="container">
                <div id="wrap">
                    <!--  <h1>Give It To The Poor</h1> -->
                    <h2>A non-profit web service that allows to donate  Essentail Supplies or money to people who need it more than you. </h2>
                    <br/>
                    <a href="#" id="example-show" class="button btn-primary btn-lg" onclick="showHide('example');
                            return false;">Learn more &raquo;</a></p>
                    <!--               <p id="follow"><a class="btn btn-primary btn-lg" role="button" href="#" id="example-show" class="showLink" onclick="showHide('example');return false;">Learn more &raquo;</a></p>-->
                </div>

                <div id="example" class="more"> 
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Vivamus egestas placerat mollis. Proin fringilla, turpis id blandit imperdiet, ligula massa gravida urna, in fringilla mauris ex posuere metus.
                        Nullam nec ipsum aliquam, accumsan tortor vel, dictum diam. Proin id ligula vestibulum, maximus augue nec, dictum diam. Etiam a libero quis mi ullamcorper iaculis. 
                        In ac molestie dui. Curabitur ut metus nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque diam diam, ut fringilla tortor aliquet a.
                        Nulla venenatis luctus ipsum et iaculis. Sed commodo velit nec suscipit mattis. Praesent porttitor eleifend vulputate.
                    </p>
                    <p><a href="#" id="example-hide" class="button btn-primary btn-lg" onclick="showHide('example');
                            return false;">Hide ^</a></p>
                </div>

            </div>
        </div>



        <div class="columns"> 
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h2>University Recommendation System</h2>
                        <p id = "homeColumns">Fill the fields and see the recommended universities</p>
                        <p id="test"><a class="btn btn-default" href="${pageContext.request.contextPath}/html/mainApp.html" role="button">View details &raquo;</a></p>
                    </div>
                    <div class="col-md-4">
                        <h2>Contact Us</h2>
                        <p id = "homeColumns"> Giorgos Ioannidis   gi00013@surrey.ac.uk<br>
                            Panayiotis Loizides pl00089@surrey.ac.uk<br>
                            Maria Panteli       mm00214@surrey.ac.uk<br>
                            Stelios Savvopoulos ss00434@surrey.ac.uk</p>
                    </div>
                    <div class="col-md-4">
                        <h2>University List</h2>
                        <p id = "homeColumns">A complete list of UK universities with general information .</p>
                        <br/><br/>
                        <p id="test"><a class="btn btn-default" href="${pageContext.request.contextPath}/js/universityLists.jsp" role="button">View details &raquo;</a></p>
                    </div>                   
                </div>
            </div>



        </div> <!-- /container -->

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