<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une Tâche</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4a6de5;
            --secondary-color: #6c757d;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --border-radius: 8px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        h1 {
            color: var(--primary-color);
            margin-bottom: 25px;
            text-align: center;
            font-size: 2.2rem;
            border-bottom: 2px solid #eee;
            padding-bottom: 15px;
        }

        form {
            display: grid;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--dark-color);
        }

        input, select, textarea {
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: var(--transition);
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(74, 109, 229, 0.2);
        }

        select {
            cursor: pointer;
            background-color: white;
        }

        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: 600;
            text-align: center;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }

        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background-color: #3a5bd9;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background-color: var(--secondary-color);
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        .btn i {
            margin-right: 8px;
        }

        .footer-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
        }

        .footer-link:hover {
            color: #3a5bd9;
            text-decoration: underline;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin: 0 10px;
            }

            .btn-group {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1><i class="fas fa-tasks"></i> Ajouter une Tâche</h1>

    <form action="tache?action=ajouter" method="post">
        <c:if test="${not empty projet_id}">
            <input type="hidden" name="projet_id" value="${projet_id}">
        </c:if>

        <c:if test="${empty projet_id}">
            <div class="form-group">
                <label for="projet_id">Projet:</label>
                <select name="projet_id" id="projet_id" required>
                    <option value="" disabled selected>-- Sélectionnez un projet --</option>
                    <c:forEach items="${projets}" var="projet">
                        <option value="${projet.id_PR}">${projet.nom}</option>
                    </c:forEach>
                </select>
            </div>
        </c:if>

        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="3" required
                      placeholder="Décrivez la tâche en détail..."></textarea>
        </div>

        <div class="form-group">
            <label for="date_debut">Date de Début:</label>
            <input type="date" id="date_debut" name="date_debut" required>
        </div>

        <div class="form-group">
            <label for="date_fin">Date de Fin:</label>
            <input type="date" id="date_fin" name="date_fin" required>
        </div>

        <div class="btn-group">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Enregistrer
            </button>
            <a href="tache?action=afficher" class="btn btn-secondary">
                <i class="fas fa-times"></i> Annuler
            </a>
        </div>
    </form>

    <a href="tache?action=afficher" class="footer-link">
        <i class="fas fa-arrow-left"></i> Retour à la liste des tâches
    </a>
</div>

<script>
    // Add client-side validation for dates
    document.addEventListener('DOMContentLoaded', function() {
        const dateDebut = document.getElementById('date_debut');
        const dateFin = document.getElementById('date_fin');

        dateDebut.addEventListener('change', function() {
            dateFin.min = this.value;
        });

        document.querySelector('form').addEventListener('submit', function(e) {
            if (new Date(dateFin.value) < new Date(dateDebut.value)) {
                alert('La date de fin doit être postérieure à la date de début.');
                e.preventDefault();
            }
        });
    });
</script>
</body>
</html>