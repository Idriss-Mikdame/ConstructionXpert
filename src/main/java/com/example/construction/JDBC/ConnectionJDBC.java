package com.example.construction.JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionJDBC {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/construction\", \"root\", \"\"");
        Statement statement = connection.createStatement();
        String ProjetTable = "CREATE TABLE IF NOT EXISTE projet("
                + "id_PR INT(12) PRIMARY KEY AUTO_INCREMENT,"
                + "nom VARCAHR(255) NOT NULL,"
                + "description VARCAHR(255) NOT NULL,"
                + "date_debut DATE NOT NULL,"
                + "date_fin DATE NOT NULL,"
                + "budget DOUBLE NOT NULL)";
        statement.execute(ProjetTable);
        String TacheTable = "CREATE TABLE IF NO EXISTE tache("
                + "id_TA INT(12) PRIMARY KEY AUTO_INCREMENT,"
                + "description VARCAHR(255) NOT NULL,"
                + "date_debut DATE NOT NULL,"
                + "date_fin DATE NOT NULL,"
                + "projet_id INT(12) NOT NULL,"
                + "FOREIGN  KEY (projet_id) REFERENCES projet(id_PR))";
        statement.execute(TacheTable);
    String RessourceTable = "CREATE TABLE IF NO EXISTE ressource("
            +"id_RESS INT(12) PRIMARY KEY AUTO_INCREMENT,"
            +"nom VARCAHR(255) NOT NULL,"
            +"types VARCAHR(255) NOT NULL,"
            +"quantite DOUBLE(200) NOT NULL,"
            +"fournissoure VARCHAR(255) NOT NULL,"
            +"tache_id INT(12) NOT NULL,),"
            +"FOREIGN KEY (tache_id) REFERENCES Tache(id_TA) )";
    statement.execute(RessourceTable);
        String userrTable = "CREATE TABLE IF NOT EXISTS users ("
                + "id INT(12) PRIMARY KEY AUTO_INCREMENT, "
                + "username VARCHAR(50), "
                + "password VARCHAR(50), ";
        statement.executeUpdate(userrTable);

    return connection;
    }
}
