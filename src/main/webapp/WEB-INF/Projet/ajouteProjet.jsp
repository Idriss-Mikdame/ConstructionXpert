<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Projet</title>
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
        form {
            background: #fff;
            padding: 20px;
            margin-top: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Ajouter un Projet</h1>
    <form action="projet?action=ajouter" method="post">
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>

        <label for="debut">Date de début:</label>
        <input type="date" id="debut" name="debut" required>

        <label for="fin">Date de fin:</label>
        <input type="date" id="fin" name="fin" required>

        <label for="budget">Budget:</label>
        <input type="number" id="budget" name="budget" step="0.01" required>

        <button type="submit">Ajouter</button>
    </form>
</div>
</body>
</html>
