<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
</head>
<body>

<div class="wrapper">
  <form>
    <h1>Login</h1>
    <div class="login-box">

    </div>
    <div>

    </div>
  </form>
</div>

































<%
  if (session.getAttribute("admin") != null) {
    response.sendRedirect("index.jsp");// Redirect if already logged in
    response.sendRedirect("projet?action=new");
    response.sendRedirect("tache?action=new");
    response.sendRedirect("ressource?action=new");
  } else {
%>
<form action="login" method="post">
  Username : <input type="text" name="username"><br><br>
  Password : <input type="password" name="password"><br><br>
  <input type="submit" value="Envoyer">
</form>
<%
  }
%>

<b style="color: red">
  <%
    String msg = (String) request.getAttribute("msg");
    if (msg != null) {
  %>
  <%= msg %>
  <%
    }
  %>
</b>

</body>
</html>