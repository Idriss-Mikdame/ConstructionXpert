<%--
  Created by IntelliJ IDEA.
  User: idriss
  Date: 17/03/2025
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>ajoute un tache </h1>
<form action="" method="post">
    <input type="hidden" name="projectId" value="tes">
    <label>Ajouter Description :</label><br>
    <input type="text" name="description"/><br>
    <label>Date_debut</label><br>
    <input type="date" name="debut"/><br>
    <label>Date_fin</label><br>
    <input type="date" name="fin"/><br><br>
    <input type="submit" value="Submit">

</form>
</body>
</html>
