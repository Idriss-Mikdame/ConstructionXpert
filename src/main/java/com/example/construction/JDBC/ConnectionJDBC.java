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
        String ProjetTable = "CREATE TABLE IF NOT EXISTS  projet("
                + "id_PR INT(12) PRIMARY KEY AUTO_INCREMENT,"
                + "nom VARCAHR(255) NOT NULL,"
                + "description VARCAHR(255) NOT NULL,"
                + "date_debut DATE NOT NULL,"
                + "date_fin DATE NOT NULL,"
                + "budget DOUBLE NOT NULL)";
        statement.execute(ProjetTable);
        String TacheTable = "CREATE TABLE IF IF NOT EXISTS tache("
                + "id_TA INT(12) PRIMARY KEY AUTO_INCREMENT,"
                + "description VARCAHR(255) NOT NULL,"
                + "date_debut DATE NOT NULL,"
                + "date_fin DATE NOT NULL,"
                + "projet_id INT(12) NOT NULL,"
                + "FOREIGN  KEY (projet_id) REFERENCES projet(id_PR))";
        statement.execute(TacheTable);
    String RessourceTable = "CREATE TABLE IF NOT EXISTS  ressource("
            +"id_RESS INT(12) PRIMARY KEY AUTO_INCREMENT,"
            +"nom VARCAHR(255) NOT NULL,"
            +"types VARCAHR(255) NOT NULL,"
            +"quantite DOUBLE(200) NOT NULL,"
            +"fournissoure VARCHAR(255) NOT NULL,"
            +"tache_id INT(12) NOT NULL,),";
    statement.execute(RessourceTable);
    String Tache_Ressource = "CREATE TABLE IF NOT EXISTS tache_ressource("
            +"tache_ressource_id INT(12) PRIMARY KEY AUTO_INCREMENT,"
            +"id_ressource INT(12) NOT NULL,"
            +"id_tache INT(12) NOT NULL,"
            +"quantite DOUBLE(200) NOT NULL,"
            +"FOREIGN KEY (id_ressource) REFERENCES ressource(id_RESS)"
            +"FOREIGN KEY (id_tache) REFERENCES Tache(id_TA))";
    statement.execute(Tache_Ressource);
        String userrTable = "CREATE TABLE IF NOT EXISTS users ("
                + "id INT(12) PRIMARY KEY AUTO_INCREMENT, "
                + "username VARCHAR(50), "
                + "password VARCHAR(50), ";
        statement.executeUpdate(userrTable);

    return connection;
    }
}
