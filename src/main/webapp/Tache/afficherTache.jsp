<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Tâches</title>
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
            background-image: url('https://karidesignbuild.com/wp-content/uploads/2024/01/project_scope.jpg');
            background-size: cover;
        }

        .container {
            width: 100%;
            height: 100vh;
            padding: 20px;
            border-radius: 10px;
            overflow: hidden;
            background: rgba(0, 0, 0, 0.2);
            box-shadow: 0 15px 20px rgba(0, 0, 0, 0.6);

        }

        h1 {
            color: #ffffff;
            margin-top: 0;
            margin-bottom: 20px;
        }

        .project-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .project-table th {
            background-color: #000;
            color: white;
            text-align: left;
            padding: 12px 15px;
        }

        .project-table td {
            padding: 12px 15px;
            border-bottom: 5px solid #040202;
            color: white;
            font-weight: 600
        }



        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 12px;
        }
        .add-project{
            display: flex;
            justify-content: end;
        }
        .btn-primary {
            background-color: #0666f7;
            color: rgb(255, 255, 255);
        }

        .btn-danger {
            background-color: #e74c3c;
            color: white;
        }

        .btn-primary:hover {
            background-color: #357abd;
        }

        .btn-danger:hover {
            background-color: #c0392b;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .add-project {
            margin-bottom: 20px;
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
        <h1>Liste des Tâches</h1>


        <div class="add-project">
            <button class="btn btn-primary"><a href="tache?action=new" class="button">+ Ajouter une nouvelle tâche</a></button>
        </div>

        <table class="project-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Description</th>
                <th>Date Début</th>
                <th>Date Fin</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${taches}" var="tache">
                <tr>
                    <<td><c:out value="${tache.id_TA}" /></td>
                    <td><c:out value="${tache.description}" /></td>
                    <td><c:out value="${tache.date_debut}" /></td>
                    <td><c:out value="${tache.date_fin}" /></td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-primary"><a href="tache?action=edit&id=${tache.id_TA}">Modifier</a></button>
                            <button class="btn btn-danger"><a href="tache?action=supprimer&id=${tache.id_TA}" class="delete">Supprimer</a></button>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</header>
</body>
</html>