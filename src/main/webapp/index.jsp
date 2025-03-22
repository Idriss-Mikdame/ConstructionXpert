<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<style>
    *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }
    header{
        width: 100%;
        height: 100vh;
        background:   url('img2.jpg') no-repeat;
        background-size: cover;
        font-family: sans-serif;
    }
    nav{
        width: 100%;
        height: 100px;
        color: #e1d6d6;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }
    .logo a{
        font-size: 2em;
        letter-spacing: 2px;
        color: #e1d6d6;
        text-decoration: none;
        font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    }
    .menu a {
        text-decoration: none;
        color: #e1d6d6;
        padding:  39px;
        font-size: 15px;
        font-weight: 600;
        position: relative;

        transition-duration: 1s;

    }


    .menu a:hover{
        color: #292727;;
    }
    .logout a{
        text-decoration: none;
        color: #e1d6d6;
        padding: 10px 20px;
        font-size: 20px;
        background: rgb(18, 7, 7);
        border-radius: 20px;
        transition-duration: 1s;

    }
    .logout a:hover{
        background-color: azure;
        color: black;
    }
    .text{
        max-width: 650px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        color: white;
    }
    .text span{
        letter-spacing: 5px;
    }
    .text h1{
        font-size: 3.5em;
    }
    .text a{
        text-decoration: none;
        background: rgb(0, 0, 0);
        padding: 10px 50px;
        letter-spacing: 5px;
        color: white;
        transition-duration: 1s;

    }
    .text a:hover{
        background-color: azure;
        color: black;
    }
</style>
<body>
<header>
    <nav>
        <div class="logo"><a href="">ConstructionXpert</a></div>
        <div class="menu">
            <a href="index.jsp">Home</a>
            <a href="projet?action=new">Projet</a>
            <a href="tache?action=new">Tache</a>
            <a href="ressource?action=new">Ressource</a>

        </div>
        <div class="logout">
            <a href="logout">Logout</a>
        </div>
    </nav>
    <SEction class="text">
        <span>Bienvenue</span>
        <h1>construction de votre maison</h1><br>
        <a href="projet?action=afficher">Projet</a>
        <a href="tache?action=afficher">Tache</a>
        <a href="ressource?action=afficher">Ressource</a><
    </SEction>
</header>

</body>
</html>