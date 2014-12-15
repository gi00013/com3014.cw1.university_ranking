<%@ page import ="java.security.InvalidKeyException"%>
<%@ page import ="java.security.NoSuchAlgorithmException" %>

<%@ page import ="javax.crypto.BadPaddingException" %>
<%@ page import ="javax.crypto.Cipher" %>
<%@ page import ="javax.crypto.IllegalBlockSizeException" %>
<%@ page import ="javax.crypto.KeyGenerator" %>
<%@ page import ="javax.crypto.NoSuchPaddingException" %>
<%@ page import ="javax.crypto.SecretKey" %>

<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/UNIVERSITIES",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    
    KeyGenerator keygenerator = KeyGenerator.getInstance("DES");
		    SecretKey myDesKey = keygenerator.generateKey();
 
		    Cipher desCipher;
 
		    // Create the cipher 
		    desCipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
 
		    // Initialize the cipher for encryption
		    desCipher.init(Cipher.ENCRYPT_MODE, myDesKey);
 
		    //sensitive information
		    byte[] text = request.getParameter("pass").getBytes();

 
		    // Encrypt the text
		    byte[] passEncrypted = desCipher.doFinal(text);
    
    
    rs = st.executeQuery("select * from Members where uname='" + userid + "' and pass='" + passEncrypted + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='../index.htm'>try again</a>");
    }
%>