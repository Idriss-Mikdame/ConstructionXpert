package com.example.construction.DAO;

import com.example.construction.JDBC.ConnectionJDBC;
import com.example.construction.Model.TacheRessource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TacheRessourceDAO {
    private Connection connection;
    public TacheRessourceDAO() throws SQLException, ClassNotFoundException {
        connection = ConnectionJDBC.getConnection();
    }
    public void ajouteTacheRessource(int id_ressource,int id_tache ) throws SQLException {
    String sqladdTachetotache = "INSERT INTO Tache_Ressource(id_ressource,id_tache) VALUES(?,?)";
    PreparedStatement preparedStatement = connection.prepareStatement(sqladdTachetotache);
    preparedStatement.setInt(1, id_ressource);
    preparedStatement.setInt(2, id_tache);
    preparedStatement.executeUpdate();
    }
    public void  supprimerResourceFromtache(int id_ressource,int id_tache) throws SQLException {
        String query = "DELETE FROM Tache_Ressource WHERE id_ressource = ? AND id_tache = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id_ressource);
        preparedStatement.setInt(2, id_tache);
        preparedStatement.executeUpdate();
    }
    public List<Integer> selectAllTacheRessourceParsid(int id_tache) throws SQLException {
        ArrayList<Integer> ressourceid = new ArrayList<Integer>();
        String query = "SELECT * FROM Tache_Ressource WHERE id_tache = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id_tache);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            ressourceid.add(resultSet.getInt("id_ressource"));
        }
        return ressourceid;
    }

}
