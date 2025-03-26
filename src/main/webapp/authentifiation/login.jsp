<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
</head>
<style>
  *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins",sans-serif;
  }
  body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: url('https://i.pinimg.com/736x/e3/84/49/e38449e406a7fb6e092b948e9827b9ec.jpg') no-repeat ;
    background-size: cover;
    background-position: center;
  }
  .wrapper{
    width: 420px;
    color: aliceblue;
    border-radius: 10px;
    padding: 30px 40px;
    border: 2px solid rgba(255, 255, 255, .2);
    backdrop-filter: blur(3px);
    box-shadow: 0 0 10px rgba(0,0, 0, .2);
    background-color: rgba(255, 255, 255, 0.2)
  }
  .wrapper h1{
    font-size: 27px;
    text-align: center;
    color: #080606;
  }
  .wrapper .input-box{
    position: relative;
    width: 100%;
    height: 50px;
    background-color: rgb(236, 236, 236);
    margin: 30px 0;
    border-radius: 40px;
  }
  .input-box input{
    width: 100%;
    height: 100%;
    background: transparent;
    border:none ;
    outline: none;
    border: 2px solid rgba(255, 255, 244, .2);
    border-radius: 40px;
    font-size: 16px;
    color: #080606;
    padding: 20px 45px 20px 20px;
  }
  .input-box input::placeholder{
    color: #000000;
  }
  .input-box i {
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 20px;
    color: #000000;
  }
  .wrapper .btn{
    width: 100%;
    height: 45px;
    background: #000000;
    border: none;
    outline: none;
    border-radius: 40px;
    box-shadow: 0 0 10px rgba(0,0, 0, .1);
    cursor: pointer;
    font-size: 16px;
    color: #ece9e9;
    font-weight: 600;

  }

</style>
<body>
<div class="wrapper">

  <%
    if (session.getAttribute("admin") != null) {
      response.sendRedirect("index.jsp");
      response.sendRedirect("projet?action=new");
      response.sendRedirect("tache?action=new");
      response.sendRedirect("ressource?action=new");
    } else {
  %>
  <form action="login" method="post">
    <h1>Login</h1>
    <div class="input-box">
      <input type="text" placeholder="username"  name="username" required>
      <i class='bx bxs-user'></i>
    </div>
    <div class="input-box">
      <input type="password" placeholder="password" name="password" required>
      <i class='bx bxs-lock-alt' ></i>
    </div>

    <button type="submit" class="btn">Login</button>

  </form>
</div>


</form>
<%
  }
%>


</body>
</html>