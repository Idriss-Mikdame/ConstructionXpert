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
<form action="ressource?action=ajouter" method="post">
  <label>ajouter un Ressource : </label><br>
  <input type="text" name="nom" ><br>
  <label>Types :</label><br>
  <input type="text" name="type"><br>
  <label>quantite :</label><br>
  <input type="number" name="quantite" ><br>
  <label>Nom fournisseur :</label><br>
  <input type="text" name="fournisseur" ><br><br>
  <input type="submit" value="Submit">
</form>
  </body>
</html>
