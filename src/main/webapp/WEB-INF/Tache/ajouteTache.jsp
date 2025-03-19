<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une Tâche</title>
</head>
<body>
<h1>Ajouter une Tâche</h1>
<form action="tache?action=ajouter" method="post">
    <c:if test="${not empty projet_id}">
        <input type="hidden" name="projet_id" value="${projet_id}">
    </c:if>
    <c:if test="${empty projet_id}">
        <label for="projet_id">Projet:</label>
        <select name="projet_id" id="projet_id">
            <c:forEach items="${projets}" var="projet">
                <option value="${projet.id_PR}">${projet.nom}</option>
            </c:forEach>
        </select><br><br>
    </c:if>
    <label for="description">Description:</label>
    <input type="text" id="description" name="description"><br><br>

    <label for="date_debut">Date de Début:</label>
    <input type="date" id="date_debut" name="date_debut"><br><br>

    <label for="date_fin">Date de Fin:</label>
    <input type="date" id="date_fin" name="date_fin"><br><br>

    <input type="submit" value="Ajouter">
</form>
<a href="tache?action=afficher">Retour à la liste des tâches</a>
</body>
</html>