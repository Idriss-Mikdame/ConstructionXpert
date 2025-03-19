<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Tâches</title>
</head>
<body>
<h1>Liste des Tâches</h1>
<a href="tache?action=new">Ajouter une nouvelle tâche</a>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Projet ID</th>
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
            <td><c:out value="${tache.projet_id}" /></td>
            <td><c:out value="${tache.description}" /></td>
            <td><c:out value="${tache.date_debut}" /></td>
            <td><c:out value="${tache.date_fin}" /></td>
            <td>
                <a href="tache?action=edit&id=${tache.id_TA}">Modifier</a>
                <a href="tache?action=supprimer&id=${tache.id_TA}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>