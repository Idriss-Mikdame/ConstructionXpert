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
            background-image:  url('../img/img5.jpg');
            background-size: cover ;
        }
        header {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: #f9f9f9;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        h1 {
            color: var(--primary-color);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--medium-gray);
        }

        .project-info {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: var(--shadow);
        }

        .project-info p {
            margin-bottom: 10px;
        }

        .button {
            display: inline-block;
            background-color: var(--primary-color);
            color: white;
            padding: 10px 15px;
            border-radius: 4px;
            text-decoration: none;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: var(--secondary-color);
        }



        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: var(--shadow);
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 30px;
        }

        th {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 15px;
            text-align: left;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid var(--medium-gray);
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:nth-child(even) {
            background-color: var(--light-gray);
        }

        .action-links a {
            margin-right: 10px;
            color: var(--primary-color);
            text-decoration: none;
        }

        .action-links a:hover {
            text-decoration: underline;
        }

        .action-links a.delete {
            color: var(--accent-color);
        }

        .footer-links {
            margin-top: 20px;
            display: flex;
            gap: 15px;
        }

        .footer-links a {
            color: var(--primary-color);
            text-decoration: none;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        /* Form styles */
        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: var(--shadow);
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: var(--secondary-color);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }

            .footer-links {
                flex-direction: column;
                gap: 10px;
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
<h1>Tâches du Projet: ${projet.nom}</h1>

<div class="project-info">
    <p><strong>Description:</strong> ${projet.description}</p>
    <p><strong>Date de Début:</strong> ${projet.date_debut}</p>
    <p><strong>Date de Fin:</strong> ${projet.date_fin}</p>
    <p><strong>Budget:</strong> ${projet.budget}</p>
</div>

<a href="tache?action=new&projet_id=${projet.id_PR}" class="button">Ajouter une nouvelle tâche à ce projet</a>

<table>
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
                <a href="tache?action=edit&id=${tache.id_TA}">Modifier</a>
                <a href="tache?action=supprimer&id=${tache.id_TA}" class="delete">Supprimer</a>
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
</header>
</body>
</html>