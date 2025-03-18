<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            color: #4CAF50;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Liste des Projets</h1>
    <a href="projet?action=new">Ajouter un nouveau projet</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Description</th>
            <th>Date de début</th>
            <th>Date de fin</th>
            <th>Budget</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="projet" items="${projets}">
            <tr>
                <td>${projet.id_PR}</td>
                <td>${projet.nom}</td>
                <td>${projet.description}</td>
                <td>${projet.date_debut}</td>
                <td>${projet.date_fin}</td>
                <td>${projet.budget}</td>
                <td>
                    <a href="projet?action=trouverParid&id=${projet.id_PR}">Modifier</a>
                    <a href="projet?action=supprimer&id_PR=${projet.id_PR}">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
