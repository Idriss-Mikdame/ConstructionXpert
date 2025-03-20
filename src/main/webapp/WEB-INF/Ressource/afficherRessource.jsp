<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Ressources</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 30px;
        }
        .action-buttons {
            display: flex;
            gap: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4">Liste des Ressources</h1>

    <div class="mb-3">
        <a href="ressource?action=new" class="btn btn-primary">Ajouter une nouvelle ressource</a>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Type</th>
            <th>Quantité</th>
            <th>Fournisseur</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ressource" items="${ressourceList}">
            <tr>
                <td>${ressource.id_RESS}</td>
                <td>${ressource.nom}</td>
                <td>${ressource.types}</td>
                <td>${ressource.quantite}</td>
                <td>${ressource.fournisseur}</td>
                <td class="action-buttons">
                    <a href="ressource?action=TrouverRessourceParid&id_RESS=${ressource.id_RESS}" class="btn btn-warning btn-sm">Modifier</a>
                    <a href="ressource?action=supprimer&id_RESS=${ressource.id_RESS}" class="btn btn-danger btn-sm" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource?')">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty ressourceList}">
        <div class="alert alert-info">
            Aucune ressource disponible.
        </div>
    </c:if>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>