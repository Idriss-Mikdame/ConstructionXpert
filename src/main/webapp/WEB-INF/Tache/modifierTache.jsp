<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier une Tâche</title>
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
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: #f9f9f9;
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }

        h1 {
            color: var(--primary-color);
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--medium-gray);
        }

        form {
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: var(--shadow);
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark-gray);
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23333' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 16px;
            padding-right: 40px;
        }

        input[type="submit"] {
            background-color: var(--primary-color);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s, transform 0.1s;
        }

        input[type="submit"]:hover {
            background-color: var(--secondary-color);
        }

        input[type="submit"]:active {
            transform: translateY(1px);
        }

        a {
            display: inline-block;
            color: var(--primary-color);
            text-decoration: none;
            margin-top: 10px;
            font-weight: 500;
            transition: color 0.3s;
        }

        a:hover {
            color: var(--secondary-color);
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h1>Modifier une Tâche</h1>

<form action="tache?action=modifier" method="post">
    <input type="hidden" name="id_TA" value="${tache.id_TA}">

    <div class="form-group">
        <label for="projet_id">Projet:</label>
        <select name="projet_id" id="projet_id">
            <c:forEach items="${projets}" var="projet">
                <option value="${projet.id_PR}" ${projet.id_PR == tache.projet_id ? 'selected' : ''}>${projet.nom}</option>
            </c:forEach>
        </select>
    </div>

    <div class="form-group">
        <label for="description">Description:</label>
        <input type="text" id="description" name="description" value="${tache.description}" required>
    </div>

    <div class="form-group">
        <label for="date_debut">Date de Début:</label>
        <input type="date" id="date_debut" name="date_debut" value="${tache.date_debut}" required>
    </div>

    <div class="form-group">
        <label for="date_fin">Date de Fin:</label>
        <input type="date" id="date_fin" name="date_fin" value="${tache.date_fin}" required>
    </div>

    <input type="submit" value="Enregistrer les modifications">
</form>

<a href="tache?action=afficher">Retour à la liste des tâches</a>
</body>
</html>