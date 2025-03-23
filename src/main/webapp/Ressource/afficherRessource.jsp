<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Ressources</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            font-family: calibri, sans-serif;
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
            padding: 10px;
        }

        .menu li .link {
            color: rgb(0, 0, 0);
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            padding: 10px;
            display: block;
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
            z-index: 100;
        }

        .submenu li {
            padding: 5px 10px;
        }

        .submenu li a {
            white-space: nowrap;
            display: block;
        }

        ul button {
            background-color: black;
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

        /* Content section styles */
        .content {
            padding: 30px;
        }

        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        h1 {
            color: #333;
            font-size: 28px;
        }

        .add-btn {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
        }

        .add-btn:hover {
            background-color: #0069d9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f8f8;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .btn-edit, .btn-delete {
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-edit {
            background-color: #ffc107;
            color: #212529;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .empty-message {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 5px;
            text-align: center;
            color: #6c757d;
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

<div class="content">
    <div class="content-header">
        <h1>Liste des Ressources</h1>
        <a href="ressource?action=new" class="add-btn">Ajouter une nouvelle ressource</a>
    </div>

    <table>
        <thead>
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
                <td class="actions">
                    <a href="ressource?action=TrouverRessourceParid&id_RESS=${ressource.id_RESS}" class="btn-edit">Modifier</a>
                    <a href="ressource?action=supprimer&id_RESS=${ressource.id_RESS}" class="btn-delete" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette ressource?')">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${empty ressourceList}">
        <div class="empty-message">
            Aucune ressource disponible.
        </div>
    </c:if>
</div>
</body>
</html>