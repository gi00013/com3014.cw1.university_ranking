<%-- Including sql libraries --%>
<%@ page import ="java.sql.*" %>

<!--sets the values of reg.jsp and reg2.jsp forms to the variables. Then creates connection with the database and inserts new data to the Members table. 
If the registration is successful then rediarect to the welcome.jsp page. 
If not redirect to the homepage. If there is already an email or a username then redirect to the reg2.jsp page.-->
<%
    String user = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNIVERSITIES",
            "root", "");
    try {
        Statement st = con.createStatement();
        //ResultSet rs;
        int i = st.executeUpdate("insert into Members(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', CURDATE())");

        if (i > 0) {
            //session.setAttribute("userid", user);
            response.sendRedirect("../view/welcome.jsp");
        } else {
            response.sendRedirect("../../index.htm");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("../view/reg2.jsp");
    }
%>