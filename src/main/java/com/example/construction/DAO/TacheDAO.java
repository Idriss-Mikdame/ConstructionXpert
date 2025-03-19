package com.example.construction.DAO;

import com.example.construction.JDBC.ConnectionJDBC;
import com.example.construction.Model.Tache;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TacheDAO {
    private Connection connection;

    public TacheDAO() throws SQLException, ClassNotFoundException {
        connection = ConnectionJDBC.getConnection();
    }

    public void ajouterTache(Tache tache) throws SQLException {
        String sql = "INSERT INTO tache(projet_id, description, date_debut, date_fin) VALUES(?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, tache.getProjet_id());
            preparedStatement.setString(2, tache.getDescription());
            preparedStatement.setDate(3, new java.sql.Date(tache.getDate_debut().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(tache.getDate_fin().getTime()));
            preparedStatement.executeUpdate();
        }
    }

    public List<Tache> afficherTaches() throws SQLException {
        List<Tache> taches = new ArrayList<>();
        String sql = "SELECT * FROM tache";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                taches.add(new Tache(
                        resultSet.getInt("id_TA"),
                        resultSet.getInt("projet_id"),
                        resultSet.getString("description"),
                        resultSet.getDate("date_debut"),
                        resultSet.getDate("date_fin")));
            }
        }
        return taches;
    }

    public List<Tache> afficherTachesParProjet(int projet_id) throws SQLException {
        List<Tache> taches = new ArrayList<>();
        String sql = "SELECT * FROM tache WHERE projet_id = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, projet_id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    taches.add(new Tache(
                            resultSet.getInt("id_TA"),
                            resultSet.getInt("projet_id"),
                            resultSet.getString("description"),
                            resultSet.getDate("date_debut"),
                            resultSet.getDate("date_fin")));
                }
            }
        }
        return taches;
    }

    public void supprimerTache(int id) throws SQLException {
        String sql = "DELETE FROM tache WHERE id_TA = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
    }

    public void modifierTache(Tache tache) throws SQLException {
        String sql = "UPDATE tache SET projet_id = ?, description = ?, date_debut = ?, date_fin = ? WHERE id_TA = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, tache.getProjet_id());
            preparedStatement.setString(2, tache.getDescription());
            preparedStatement.setDate(3, new java.sql.Date(tache.getDate_debut().getTime()));
            preparedStatement.setDate(4, new java.sql.Date(tache.getDate_fin().getTime()));
            preparedStatement.setInt(5, tache.getId_TA());
            preparedStatement.executeUpdate();
        }
    }

    public Tache trouverParId(int id) throws SQLException {
        String sql = "SELECT * FROM tache WHERE id_TA = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return new Tache(
                            resultSet.getInt("id_TA"),
                            resultSet.getInt("projet_id"),
                            resultSet.getString("description"),
                            resultSet.getDate("date_debut"),
                            resultSet.getDate("date_fin"));
                }
            }
        }
        return null;
    }
}

