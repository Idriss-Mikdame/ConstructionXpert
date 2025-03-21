<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<style type="text/css">
*{
    text-decoration: none;
}
.navbar{
    background: crimson;font-family: calibri;padding-right: 15px;padding-left: 15px; ;
}
.navdiv{
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.logo{
    font-size: 35px;
    font-weight: 600;
}
.logo a{
    color: white;
}
li{
    list-style: none;
    display:inline-block;
}
li a{
    color: white;
    font-size: 15px;
    font-weight: 600;
    margin-right: 25px;
}
button{
    background-color: black;
    margin-left: 10px;
    border-radius: 10px;
    padding: 10px;
    width: 90px;
}
button a{
    color: white;
    font-weight: 600;
    font-size: 15px;
}
</style>
<body>
<nav class="navbar">
    <div class="navdiv">
        <div class="logo"><a href="index.jsp">ConstructionXpert</a></div>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="projet?action=new">Projet</a></li>
            <li><a href="tache?action=new">Tache</a></li>
            <li><a href="ressource?action=new">Ressource</a></li>
            <button><a href="logout">Logout</a></button>
        </ul>
    </div>
</nav>





</body>
</html>