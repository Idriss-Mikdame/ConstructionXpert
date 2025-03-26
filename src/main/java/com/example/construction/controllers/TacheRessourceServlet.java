package com.example.construction.controllers;

import com.example.construction.DAO.ProjetDAO;
import com.example.construction.DAO.RessourceDAO;
import com.example.construction.DAO.TacheDAO;
import com.example.construction.DAO.TacheRessourceDAO;
import com.example.construction.Model.Ressource;
import com.example.construction.Model.Tache;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/tacheRessource")
public class TacheRessourceServlet extends HttpServlet {
    private RessourceDAO ressourceDAO;
    private TacheDAO tacheDAO;
    private TacheRessourceDAO tacheRessourceDAO;
    public void init() {
        try {
            ressourceDAO = new RessourceDAO();
            tacheDAO = new TacheDAO();
            tacheRessourceDAO = new TacheRessourceDAO();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Error initializing TacheDAO or ProjetDAO", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {

        }

        try {
            switch (action) {
                case "listeTacheRessource":
                    ListTacheRessource(request,response);
                    break;
                case "afficherAttachForm":
                    Showform(request,response);
                    break;
                case "ajouterTacheRessource":
                    AjouterTacheRessource(request,response);
                    break;
                case "supprimerTacheRessource":
                    SupprimertacheRessource(request,response);
                    break;
                case "afficherTacheRessource":
                    Affichertacheressource(request,response);
                    break;
                default:
                    break;
            }
        }catch (Exception e) {
            throw new ServletException("Erreur dans la gestion des projets", e);
        }
    }

    private void Affichertacheressource(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id_tache = Integer.parseInt(request.getParameter("id"));
        Tache taches = tacheDAO.trouverParId(id_tache);

        List<Integer> id_ressource = tacheRessourceDAO.selectAllTacheRessourceParsid(id_tache);
        List<Ressource> tacheRessource = new ArrayList<>();

        for (Integer idRessource : id_ressource) {
            Ressource ressource = ressourceDAO.afficherRessourceParid(idRessource);
            if (ressource != null) {
                tacheRessource.add(ressource);
            }
        }
        request.setAttribute("tacheRessource", tacheRessource);
        request.setAttribute("tache",taches);
        request.getRequestDispatcher("/TacheRessource/TacheRessource.jsp").forward(request,response);

    }

    private void SupprimertacheRessource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id_ressource = Integer.parseInt(request.getParameter("id_ressource"));
        int id_tache = Integer.parseInt(request.getParameter("id_tache"));
        tacheRessourceDAO.supprimerResourceFromtache(id_ressource,id_tache);
        response.sendRedirect("tacheRessource?action=afficherTacheRessource&id=" + id_tache);
    }

    private void AjouterTacheRessource(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        try {
            int id_ressource = Integer.parseInt(request.getParameter("id_ressource"));
            int id_tache = Integer.parseInt(request.getParameter("id_tache_select")); // Changed from id_tache to id_tache_select

            tacheRessourceDAO.ajouterRessourcedeTache(id_ressource, id_tache);

            // Redirect to the task's resource view
            response.sendRedirect("tacheRessource?action=afficherTacheRessource&id=" + id_tache);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID de tâche ou ressource invalide");
            Showform(request, response);
        } catch (SQLException e) {
            request.setAttribute("error", "Erreur lors de l'ajout de la ressource: " + e.getMessage());
            Showform(request, response);
        }
    }
    private void Showform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id_tache = 0;
            if (request.getParameter("id_tache") != null) {
                id_tache = Integer.parseInt(request.getParameter("id_tache"));
            }

            Tache tache = null;
            if (id_tache > 0) {
                tache = tacheDAO.trouverParId(id_tache);
            }

            List<Ressource> ressources = ressourceDAO.afficherRessource();
            List<Tache> taches = tacheDAO.afficherTaches();

            request.setAttribute("tache", tache);
            request.setAttribute("taches", taches);
            request.setAttribute("ressources", ressources);
            request.getRequestDispatcher("/TacheRessource/ajouterTacheRessource.jsp").forward(request,response);
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException("Error in Showform: " + e.getMessage(), e);
        }
    }

    private void ListTacheRessource(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Tache> taches = tacheDAO.afficherTaches();
        List<Ressource> ressources = ressourceDAO.afficherRessource();
        request.setAttribute("taches", taches);
        request.setAttribute("ressources", ressources);
        request.getRequestDispatcher("/TacheRessource/afficherTacheRessource.jsp").forward(request,response);
    }
}
