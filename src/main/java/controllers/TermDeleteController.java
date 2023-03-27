package controllers;

import db.DBManager;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (name = "TermDeleteController", urlPatterns = "/term_delete")
public class TermDeleteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String selectedTerm = req.getParameter("idTerm");

        DBManager.deleteTerm(selectedTerm);
        resp.sendRedirect("/terms");
    }
}
