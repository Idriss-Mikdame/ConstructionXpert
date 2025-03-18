package com.example.construction.controllers;

import com.example.construction.DAO.RessourceDAO;
import com.example.construction.DAO.TacheDAO;
import com.example.construction.Model.Tache;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
@WebServlet("/tache")
public class TacheServlet extends HttpServlet {
    private TacheDAO tacheDAO;
    private RessourceDAO resourceDAO;

    public void init() {
        try {
            tacheDAO = new TacheDAO();
            resourceDAO = new RessourceDAO();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Error initializing ProjetDAO", e);
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String action = request.getParameter("action");

      try {
          switch (action) {
              case "new":
                  showForm(request, response);
                  break;
              case "ajouter":
                  ajouterTache(request, response);
                  break;
              case "modifier":
                  modifierTache(request, response);
                  break;
              case "supprimer":
                  supprimerTache(request, response);
                  break;
              case "afficher":
                  afficherTache(request, response);
                  break;
              case "trouverParid":
                  trouverTachebyID(request, response);
                  break;
              default:
                  response.sendRedirect("/tache?action=afficher");
                  break;
          }
      } catch (Exception e) {
          throw new ServletException("Erreur dans la gestion des Taches", e);
      }
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/Tache/ajouteTache.jsp").forward(request,response);
    }
    private void ajouterTache(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("projet_id"));
        String description = request.getParameter("description");
        Date date_debut = Date.valueOf(request.getParameter("debut"));
        Date date_fin = Date.valueOf(request.getParameter("fin"));
        Tache tache = new Tache(id, description, date_debut, date_fin);
       tacheDAO.ajouterTache(tache);
    }
    private void modifierTache(HttpServletRequest request, HttpServletResponse response) {}
    private void supprimerTache(HttpServletRequest request, HttpServletResponse response) {}
    private void afficherTache(HttpServletRequest request, HttpServletResponse response) {}
    private void trouverTachebyID(HttpServletRequest request, HttpServletResponse response) {}

}
