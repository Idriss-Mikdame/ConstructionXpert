<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier une Tâche</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .navbar {
            background: white;
            font-family: calibri;
            padding-right: 15px;
            padding-left: 15px;
        }

        .navdiv {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 35px;
            font-weight: 600;
        }

        .logo a {
            color: rgb(0, 0, 0);
            text-decoration: none;
        }

        .menu {
            list-style: none;
            display: flex;
        }

        .menu li {
            position: relative;
            padding: 10px; /* Keep the padding */
        }

        .menu li .link  {
            color: rgb(0, 0, 0);
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            padding: 10px;
            display: block; /* Make the link fill the li */
        }

        .menu li:hover .submenu {
            display: block;
        }

        .submenu {
            display: none;
            position: absolute;
            background: white;
            list-style: none;
            padding: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            z-index: 1; /* Ensure submenu appears on top */
        }

        .submenu li {
            padding: 5px 10px;
        }

        .submenu li a {
            white-space: nowrap;
            display: block; /* Ensure link fills the list item */
        }

        ul button {
            background-color: rgb(0, 0, 0);
            margin-left: 30px;
            margin-top: 8px;
            border-radius: 10px;
            padding: 5px;
            width: 140px;
            border: none;

        }

        button a {
            text-decoration: none;
            color: white;
            font-weight: 600;
            font-size: 15px;
        }

        header{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 92vh;
            background-image:  url('https://www.ie.edu/insights/wp-content/uploads/2020/11/VanSchendel-Construction.jpg');
            background-size: cover ;
        }
        .container{

            max-width: 650px;
            padding: 20px;
            margin: 0px 28px;
            border-radius: 10px;
            overflow: hidden;
            background: rgba(0, 0,0, 0.2);
            box-shadow: 0 15px 20px rgba(0, 0,0, 0.6);
        }
        h2{
            font-size: 26px;
            font-weight: bold;
            text-align: center;
            color: #fff;
            padding-bottom: 10px;
            border-bottom: 3px solid rgb(255, 255, 255);
            text-transform: uppercase;
            font-family: initial;
        }
        .content{
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 20px 0;
        }
        .input-box{
            display: flex;
            flex-wrap: wrap;
            width: 50%;
            padding-bottom: 15px;
        }

        .input-box label{
            width: 95%;
            color: #fff;
            font-weight: bold;
            margin: 5px 0px;
        }
        select#projet_id {
            height: 40px;
            width: 95%;
            padding: 0 10px;
            border-radius: 8px;
            border: 1px solid #fff;
            outline: none;
        }
        .input-box input{
            height: 40px;
            width: 95%;
            padding: 0 10px;
            border-radius: 8px;
            border: 1px solid #fff;
            outline: none;
        }
        .input-box input:is(:focus,:valid){
            box-shadow: 0 3px 5px rgba(0, 0,0, 0.2)  ;
        }
        .button-container{
            width: 50%;
            display: flex;
            align-items: center;
            justify-content: center;


        }
        .button-container button{
            margin-top: 10px;
            background-color: black;
            color: white;
            font-weight: bold;
            font-size: 16px;
            border: none;
            padding:  8px  27px;;
            border-radius: 30px;
            cursor: pointer;
            text-transform: uppercase;
            transition: 1s;
            margin-left: 300px;
        }
        .button-container button:hover{
            background-color: rgb(255, 255, 255);
            color: rgb(0, 0, 0)
        }
        .footer-link {
            text-decoration: none;
            color: black;
        }
        a.footer-link:hover {
            color: rgb(248, 0, 0);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            body {
                padding: 20px;
                margin: 0 10px;
            }

            body {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<nav class="navbar">
    <div class="navdiv">
        <div class="logo"><a href="index.jsp">ConstructionXpert</a></div>
        <ul class="menu">
            <li>
                <a class="link" href="index.jsp">Home</a>
            </li>
            <li>
                <a class="link" href="projet?action=new">Projet</a>
                <ul class="submenu">
                    <li><a class="link" href="projet?action=new">Ajouter</a></li>
                    <li><a class="link" href="projet?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <a class="link" href="tache?action=new">Tache</a>
                <ul class="submenu">
                    <li><a class="link" href="tache?action=new">Ajouter</a></li>
                    <li><a class="link" href="tache?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <a class="link" href="ressource?action=new">Ressource</a>
                <ul class="submenu">
                    <li><a class="link" href="ressource?action=new">Ajouter</a></li>
                    <li><a class="link" href="ressource?action=afficher">Afficher</a></li>
                </ul>
            </li>
            <li>
                <button><a href="logout">Logout</a></button>
            </li>
        </ul>
    </div>
</nav>
<header>
    <div class="container">

        <h2>Modifier une Tâche</h2>
<form action="tache?action=modifier" method="post">
    <div class="content">

    <input type="hidden" name="id_TA" value="${tache.id_TA}">

    <div class="input-box">
        <label for="projet_id">Projet:</label>
        <select name="projet_id" id="projet_id">
            <c:forEach items="${projets}" var="projet">
                <option value="${projet.id_PR}" ${projet.id_PR == tache.projet_id ? 'selected' : ''}>${projet.nom}</option>
            </c:forEach>
        </select>
    </div>
    <div class="input-box">
        <label for="description">Description:</label>
        <input type="text" id="description" name="description" value="${tache.description}" required>
    </div>
    <div class="input-box">
        <label for="date_debut">Date de Début:</label>
        <input type="date" id="date_debut" name="date_debut" value="${tache.date_debut}" required>
    </div>
    <div class="input-box">
        <label for="date_fin">Date de Fin:</label>
        <input type="date" id="date_fin" name="date_fin" value="${tache.date_fin}" required>
    </div>
    <div class="button-container">
        <button type="submit">Ajouter</button>
    </div>
    </div>
</form>

        <a href="tache?action=afficher" class="footer-link">
            <i class="fas fa-arrow-left"></i> Retour à la liste des tâches
        </a>        </div>
</header>
</body>
</html>