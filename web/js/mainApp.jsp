<%-- 
    Document   : mainApp
    Created on : Dec 12, 2014, 10:29:53 PM
    Author     : giorgosioannidis
--%>

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

        <!-- Bootstrap core CSS -->
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="../js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="../js/validation.js"></script>




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

        <div class="container">



            <div class ="columns" id = "sth">
                <h1 id="title"> University Recommendation System </h1>

                <div style="text-align: center">
                    <h3>Subject:</h3>
                    <select id = "subject"">
                        <option value="selectSubject" >     --- Please Select Subject ---</option>
                        <option value="Accounting & finance">Accounting & finance</option>
                        <option value="Agriculture, forestry & food">Agriculture, forestry & food</option>
                        <option value="American studies">American studies</option>
                        <option value="Anthropology">Anthropology</option>
                        <option value="Architecture">Architecture</option>
                        <option value="Biosciences">Biosciences</option>
                        <option value="Building and town and country planning">Building and town and country planning</option>
                        <option value="Business, management & marketing">Business, management & marketing</option>
                        <option value="Chemistry">Chemistry</option>
                        <option value="Classics & ancient history">Classics & ancient history</option>
                        <option value="Computer science & information systems">Computer science & information systems</option>
                        <option value="Dentistry">Dentistry</option>
                        <option value="Design & crafts">Design & crafts</option>
                        <option value="Drama & dance">Drama & dance</option>
                        <option value="Earth & marine sciences">Earth & marine sciences</option>
                        <option value="Economics">Economics</option>
                        <option value="Education">Education</option>
                        <option value="Engineering: chemical">Engineering: chemical</option>
                        <option value="Engineering: civil">Engineering: civil</option>
                        <option value="Engineering: electronic & electrical">Engineering: electronic & electrical</option>
                        <option value="Engineering: general">Engineering: general</option>
                        <option value="Engineering: materials & mineral">Engineering: materials & mineral</option>
                        <option value="Engineering: mechanical">Engineering: mechanical</option>
                        <option value="English & creative writing">English & creative writing</option>
                        <option value="Fashion & textiles">Fashion & textiles</option>
                        <option value="Film production & photography">Film production & photography</option>
                        <option value="Forensic science & archaeology">Forensic science & archaeology</option>
                        <option value="Geography & environmental studies">Geography & environmental studies</option>
                        <option value="Health professions">Health professions</option>
                        <option value="History">History</option>
                        <option value="History of art">History of art</option>
                        <option value="Hospitality, event management & tourism">Hospitality, event management & tourism</option>
                        <option value="Journalism, publishing & public relations">Journalism, publishing & public relations</option>
                        <option value="Law">Law</option>
                        <option value="Mathematics">Mathematics</option>
                        <option value="Media & film studies">Media & film studies</option>
                        <option value="Medicine">Medicine</option>
                        <option value="Modern languages & linguistics">Modern languages & linguistics</option>
                        <option value="Music">Music</option>
                        <option value="Nursing & midwifery">Nursing & midwifery</option>
                        <option value="Pharmacy & pharmacology">Pharmacy & pharmacology</option>
                        <option value="Philosophy">Philosophy</option>
                        <option value="Physics">Physics</option>
                        <option value="Psychology">Psychology</option>
                        <option value="Religious studies and theology">Religious studies and theology</option>
                        <option value="Social policy & administration">Social policy & administration</option>
                        <option value="Social work">Social work</option>
                        <option value="Sociology">Sociology</option>
                        <option value="Sports science">Sports science</option>
                        <option value="Veterinary science">Veterinary science</option>                              
                    </select>

                </div>
                <br>
                <br>
                <h3 id="choose">  Choose numbers 1-5 to each field. More important 1 least important 5 </h3>

                <div class = "container">
                    <div class ="row">
                        <div class="col-md-6" id = "test2">


                            <h3>Location(within 50 miles from London):</h3>
                            <select id = "location">
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
                            <select id = "teachingSatisfaction">
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
                            <select id = "student">
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
                            <select id = "entryDifficulty">
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
                            <select id = "careerOpportunities">
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
                            <select id = "research">
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
                    <a  href="#" id="example-show" class="button btn-primary btn-lg" onclick="validate();">Proceed</a>
                </div>
            </div>

           

            <footer>
                <p class = "footer_p">&copy; Group 6 2014</p>
            </footer>
        </div>

        <!-- Bootstrap core JavaScript
           ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
