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

        <title>University Recommendation System</title>

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
    </head>

    <body>
        <div class="container">
            <br>
            <br>
            <!--        div to make the data visible against the background image-->
            <div class ="columns" id = "sth">
                <div>
                    <h1>You have been successfully registered!! You are now being redirected to the homepage to log in!!</h1>
                    <!--                    script to automatically redirect to the homege after 4s.-->
                    <script>
                        setTimeout(function () {
                            window.location.href = '../../index.htm'
                        }, 4000);
                    </script>
                </div>
            </div>
        </div>
    </body>
</html>