<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tâches du Projet: ${projet.nom}</title>
</head>
<body>
<h1>Tâches du Projet: ${projet.nom}</h1>
<p><strong>Description:</strong> ${projet.description}</p>
<p><strong>Date de Début:</strong> ${projet.date_debut}</p>
<p><strong>Date de Fin:</strong> ${projet.date_fin}</p>
<p><strong>Budget:</strong> ${projet.budget}</p>

<a href="tache?action=new&projet_id=${projet.id_PR}">Ajouter une nouvelle tâche à ce projet</a>

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
            <td>
                <a href="tache?action=edit&id=${tache.id_TA}">Modifier</a>
                <a href="tache?action=supprimer&id=${tache.id_TA}">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="projet?action=afficher">Retour à la liste des projets</a>
</body>
</html>