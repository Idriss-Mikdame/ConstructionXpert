<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tâches du Projet: ${projet.nom}</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        /* Navigation Bar */
        .navbar {
            background-color: white;
            padding: 10px 20px;
            border-bottom: 1px solid #ddd;
        }

        .navdiv {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 22px;
            font-weight: 600;
        }

        .logo a {
            color: #000;
            text-decoration: none;
        }

        .menu {
            list-style: none;
            display: flex;
            align-items: center;
        }

        .menu li {
            position: relative;
            margin: 0 5px;
        }

        .menu li a.link {
            color: #000;
            font-size: 14px;
            text-decoration: none;
            padding: 10px;
            display: block;
        }

        .menu li:hover .submenu {
            display: block;
        }

        .submenu {
            display: none;
            position: absolute;
            background: white;
            list-style: none;
            min-width: 150px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .submenu li {
            margin: 0;
        }

        .submenu li a {
            padding: 8px 15px;
            font-size: 14px;
            text-decoration: none;
            color: #000;
            display: block;
        }

        ul button {
            background-color: #000;
            border: none;
            border-radius: 4px;
            padding: 8px 15px;
            margin-left: 10px;
        }

        button a {
            text-decoration: none;
            color: white;
            font-weight: 600;
            font-size: 14px;
        }

        /* Content Container */
        .container {
            width: 100%;
            height: 100vh;

            padding: 0 20px;
            background-image: url('https://karidesignbuild.com/wp-content/uploads/2024/01/project_scope.jpg');
            background-size: cover;
        }

        .project-details {
            overflow: hidden;
            background: rgba(0, 0, 0, 0.2);
            padding: 20px;

            margin-bottom: 20px;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(255, 35, 35, 0.1);
        }

        .project-details h1 {
            margin-bottom: 15px;
            color: #ffffff;
            font-size: 24px;
            font-weight: 800;
            font-family:   'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        .project-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
            font-style:italic;
            color: #ffffff;
            font-weight: bolder;
        }

        .project-info p {
            margin-bottom: 5px;
        }

        /* Task Table */
        .task-table {
            background: rgba(0, 0, 0, 0.2);
            width: 100%;
            border-collapse: collapse;
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .task-table th {
            background-color: #000;
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 500;
        }

        .task-table td {
            font-weight: 700;
            color: white;
            padding: 12px 15px;
        }

        .task-table tr:last-child td {
            border-bottom: none;
        }

        .task-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Buttons and Actions */
        .btn {
            display: inline-block;
            padding: 8px 15px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            margin-bottom: 20px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #008bec;
            color: white;
        }

        .btn-primary:hover {
            opacity: 0.9;
        }

        .action-links a {
            display: inline-block;
            padding: 6px 12px;
            margin-right: 5px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
        }

        .action-edit {
            background-color: #f39c12;
            color: white;
        }

        .action-delete {
            background-color: #e74c3c;
            color: white;
        }


        .footer-links {
            margin-top: 20px;
            display: flex;
            gap: 15px;
        }

        .footer-links a {
            padding: 10px;
            background-color: black;
            color: #eaecec;
            text-decoration: none;
            border-radius: 15px;
            text-decoration: none;
            transition: 1s;
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
<div class="container">
<div class="project-details">
    <h1>Tâches du Projet: ${projet.nom}</h1>
    <div class="project-info">
        <p><strong>Description:</strong> ${projet.description}</p>
        <p><strong>Budget:</strong> ${projet.budget} DH</p>
        <p><strong>Date de Début:</strong> ${projet.date_debut}</p>
        <p><strong>Date de Fin:</strong> ${projet.date_fin}</p>
    </div>
</div>
<a href="tache?action=new&projet_id=${projet.id_PR}" class="btn btn-primary">Ajouter une nouvelle tâche à ce projet</a>

<table class="task-table">
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
            <td><c:out value="${tache.id_TA}" /></td>
            <td><c:out value="${tache.description}" /></td>
            <td><c:out value="${tache.date_debut}" /></td>
            <td><c:out value="${tache.date_fin}" /></td>
            <td class="action-links">
                <a href="tache?action=edit&id=${tache.id_TA}" class="action-edit">Modifier</a>
                <a href="tache?action=supprimer&id=${tache.id_TA}" class="action-delete">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="footer-links">
    <a href="projet?action=afficher">Retour à la liste des projets</a>
    <a href="tache?action=afficher">Afficher toutes les tâches</a>
    <a href="tache?action=new">Ajouter un nouvelle tâches</a>
</div>
</div>
</body>
</html>