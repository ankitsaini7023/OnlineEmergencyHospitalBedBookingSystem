<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
<link rel="shortcut icon" type="image/x-icon" href="Images/favicon.png" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="Boot/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="contact.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script >
    function alphaOnly(event) {
  var key = event.keyCode;
  return ((key >= 65 && key <= 90) || key == 8 || key == 32);
};
  </script>

<style >
    body{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}
  .contact-form {
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
    border-top-right-radius: 10% 50%;
    border-bottom-right-radius: 10% 50%;
}
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" >
    <div class="container">

    
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
         


          <li class="nav-item">
            <!--<a class="nav-link js-scroll-trigger" href="contact.jsp" style="color: white;font-family: 'IBM Plex Sans', sans-serif;"><h6>CONTACT</h6></a>-->
          </li>
        </ul>
      </div>
    </div>
  </nav>








    <div class="container contact-form" style="font-family: 'IBM Plex Sans', sans-serif;">
            <div class="contact-image">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>
            <form method="post" action="contact.jsp">
                <h3>Drop Us a Message</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" name="txtName" class="form-control" placeholder="Your Name *" value="" onkeydown="return alphaOnly(event);" required/>
                        </div>
                        <div class="form-group">
                            <input type="email" name="txtEmail" class="form-control" placeholder="Your Email *" value="" required />
                        </div>
                        <div class="form-group">
                            <input type="tel" name="txtPhone" class="form-control" placeholder="Your Phone Number *" value="" minlength="10" maxlength="10" required />
                        </div>
                        <div class="form-group" >
                            <input type="submit" name="btnSubmit" class="btnContact"   value="Send Message" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" >
                            <textarea name="txtMsg" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;" required></textarea>
                        </div>
                    </div>
                </div>
            </form>
</div>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%
String url = "jdbc:mysql:///hospitaldb?useSSL=false";
String username = "root";
String password = "root";
Connection conn = null;
String name = request.getParameter("txtName");
String email = request.getParameter("txtEmail");
String contact = request.getParameter("txtPhone");
String message = request.getParameter("txtMsg");

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, password);
    String query = "INSERT INTO contact(name, email, contact, message) VALUES (?, ?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setString(1, name);
    pstmt.setString(2, email);
    pstmt.setString(3, contact);
    pstmt.setString(4, message);
    int result = pstmt.executeUpdate();
    if (result > 0) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Message sent successfully!');");
        out.println("window.location.href = 'contact.jsp';");
        out.println("</script>");
    }
} catch (ClassNotFoundException ex) {
    out.println("Could not find database driver class: " + ex.getMessage());
} catch (SQLException ex) {
    //out.println("An error occurred while connecting to the database: " + ex.getMessage());
} finally {
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException ex) {
            out.println("An error occurred while closing the database connection: " + ex.getMessage());
        }
    }
}
%>


</body>
</html>



