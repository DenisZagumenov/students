package controllers;

import db.DBManager;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TermCreateController", urlPatterns = "/term_create")
public class TermCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Discipline> disciplines = DBManager.getAllActiveDisciplines();

        req.setAttribute("disciplines", disciplines);
        req.getRequestDispatcher("WEB-INF/jsp/term_create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String disciplinesId = req.getParameter("idsSelectedDisciplines");
        String duration = req.getParameter("duration");
        DBManager.createTerm(duration, disciplinesId.split(","));

        resp.sendRedirect("/terms");

    }
}
