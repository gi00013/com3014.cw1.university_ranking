<!--sets the value of userid to null and redirects to the homepage-->
<%
    session.setAttribute("userid", null);
    session.invalidate();
    response.sendRedirect("../../index.htm");
%>