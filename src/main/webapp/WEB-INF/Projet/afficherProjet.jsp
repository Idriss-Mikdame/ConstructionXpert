<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
</head>
<body>
<h1>Liste des Projets</h1>


<a href="projet?action=new">Ajouter un nouveau projet</a>

<table border="1">
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
                <a href="tache?action=parProjet&projet_id=${projet.id_PR}">afiche</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
