package com.example.construction.DAO;

import com.example.construction.JDBC.ConnectionJDBC;
import com.example.construction.Model.Tache;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

public class TacheDAO {
    private Connection connection;
    public TacheDAO() throws SQLException, ClassNotFoundException {
        connection = ConnectionJDBC.getConnection();
    }
    private List<Tache> afficherProjetParID(int projet_id) throws SQLException {
        List<Tache> taches = new ArrayList<>();
        String sql = "SELECT * FROM Tache WHERE id_projet = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, projet_id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            taches.add(new Tache(
                    resultSet.getInt("id"),
                    resultSet.getInt("id_ptojet"),
                    resultSet.getString("description"),
                    resultSet.getDate("date_debut"),
                    resultSet.getDate("date_fin")));
        }
        return taches;
    }
    public void ajouterTache(Tache tache) throws SQLException{
        String sql = "insert into tache(projet_id,description,date_debut,date_fin) values(?,?,?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1,tache.getProjet_id());
            preparedStatement.setString(2,tache.getDescription());
            preparedStatement.setDate(3,new java.sql.Date(tache.getDate_debut().getTime()));
            preparedStatement.setDate(4,new java.sql.Date(tache.getDate_fin().getTime()));
        }
    }
    public List<Tache> affcherTaches() throws SQLException{
       List<Tache> affcherTaches = new ArrayList<Tache>();
        String sql = "select * from tache";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            affcherTaches.add(new Tache(
                    resultSet.getInt("id_TA"),
                    resultSet.getInt("projet_id"),
                    resultSet.getString("description"),
                    resultSet.getDate("date_debut"),
                    resultSet.getDate("date_fin")));
        }
        return affcherTaches;
    }
    public void supprimerTaches(int id) throws SQLException{
        String sql = "delete from tache where id_TA=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        }
    }
    public void modifTaches(Tache taches) throws SQLException{
        String sql = "UPDATE Tache SET projet_id=?, description=?, date_debut=?, date_fin=? WHERE id_TA=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1,taches.getProjet_id());
            preparedStatement.setString(2,taches.getDescription());
            preparedStatement.setDate(3,new java.sql.Date(taches.getDate_debut().getTime()));
            preparedStatement.setDate(4,new java.sql.Date(taches.getDate_fin().getTime()));
            preparedStatement.executeQuery();
        }
    }
    public Tache trouverParId(int id) throws SQLException{
        String query = "select * from tache where id_TA=?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1,id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if(resultSet.next()){
            return new Tache(
                    resultSet.getInt("id_TA"),
                    resultSet.getInt("projet_id"),
                    resultSet.getString("description"),
                    resultSet.getDate("date_debut"),
                    resultSet.getDate("date_fin"));
        }
        return null;
    }
}
