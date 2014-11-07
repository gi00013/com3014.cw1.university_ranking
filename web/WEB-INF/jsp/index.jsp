<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="../../favicon.ico">

        <title>Give it to the poor</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="js/ie-emulation-modes-warning.js"></script>

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
                    <a class="navbar-brand" href="index.html">Give it to the poor</a>
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

        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron">
            <div class="container">
                <!--  <h1>Give It To The Poor</h1> -->
                <h2>A non-profit web service that allows to donate  Essentail Supplies or money to people who need it more than you. </h2>
                <p id="follow"><a class="btn btn-primary btn-lg" role="button">Learn more &raquo;</a></p>
            </div>
        </div>

        <div class="columns"> 
            <div class="container">
                <!-- Example row of columns -->
                <div class="row">
                    <div class="col-md-4">
                        <h2>Essential Supplies</h2>
                        <p>You are welcome to donate any dry food (rice, beans, canned food), cleaning equipments or unwanted clothes </p>
                        <p id="test"><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
                    </div>
                    <div class="col-md-4">
                        <h2>Money</h2>
                        <p>You are welcome to donate money. </p>
                        <p id="test"><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
                    </div>
                    <div class="col-md-4">
                        <h2>Volunteering Work</h2>
                        <p>You are welcome to be an active member of the service by helping transfering the items from the storage to the people.</p>
                        <p id="test"><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
                    </div>

                </div>
            </div>
            <hr>
        </div> <!-- /container -->

        <footer>
            <p class = "footer_p">&copy; Company 2014</p>
        </footer>



        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>