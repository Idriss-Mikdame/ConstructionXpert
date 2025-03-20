<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modifier une Ressource</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 30px;
            max-width: 600px;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4">Modifier une Ressource</h1>

    <form action="ressource" method="post">
        <input type="hidden" name="action" value="modifier">
        <input type="hidden" name="id_RESS" value="${ressource.id_RESS}">

        <div class="form-group">
            <label for="nom">Nom:</label>
            <input type="text" class="form-control" id="nom" name="nom" value="${ressource.nom}" required>
        </div>

        <div class="form-group">
            <label for="type">Type:</label>
            <input type="text" class="form-control" id="type" name="types" value="${ressource.types}" required>
        </div>

        <div class="form-group">
            <label for="quantite">Quantité:</label>
            <input type="number" step="0.01" class="form-control" id="quantite" name="quantite" value="${ressource.quantite}" required>
        </div>

        <div class="form-group">
            <label for="fournisseur">Fournisseur:</label>
            <input type="text" class="form-control" id="fournisseur" name="fournisseur" value="${ressource.fournisseur}" required>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Enregistrer les modifications</button>
            <a href="ressource?action=afficher" class="btn btn-secondary">Annuler</a>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>