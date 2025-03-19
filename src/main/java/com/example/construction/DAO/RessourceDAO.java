package com.example.construction.DAO;

import com.example.construction.JDBC.ConnectionJDBC;
import com.example.construction.Model.Ressource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RessourceDAO {
    private Connection connection;
    public RessourceDAO() throws SQLException, ClassNotFoundException {
        connection = ConnectionJDBC.getConnection();
    }
    public void ajouterRessource(Ressource ressource) {
//        String query = "insert into Ressource(nom,types,quantite,fournisseur,tache_id) values(?,?,?,?,?)";
//        PreparedStatement preparedStatement = connection.prepareStatement(query);
//        preparedStatement.
    }
}
