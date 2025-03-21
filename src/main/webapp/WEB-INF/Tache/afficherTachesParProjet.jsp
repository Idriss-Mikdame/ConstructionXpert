<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tâches du Projet: ${projet.nom}</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --accent-color: #e74c3c;
            --light-gray: #f5f5f5;
            --medium-gray: #e0e0e0;
            --dark-gray: #333;
            --text-color: #444;
            --shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            text-decoration: ;
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
        body {
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

        .button-accent {
            background-color: var(--accent-color);
        }

        .button-accent:hover {
            background-color: #c0392b;
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
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="projet?action=new">Projet</a></li>
            <li><a href="tache?action=new">Tache</a></li>
            <li><a href="ressource?action=new">Ressource</a></li>
            <button><a href="logout">Logout</a></button>
        </ul>
    </div>
</nav>
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
</body>
</html>