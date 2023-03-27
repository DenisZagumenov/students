package controllers;

import db.DBManager;
import entity.Discipline;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (name = "TermModifyController", urlPatterns = "/term_modify")
public class TermModifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String selectedTerm = req.getParameter("idTerm");
        req.setAttribute("selectedTerm", selectedTerm);
        List<Discipline> disciplines = DBManager.getAllActiveDisciplines();
        req.setAttribute("disciplines", disciplines);
        req.getRequestDispatcher("WEB-INF/jsp/term_modify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String selectedTerm = req.getParameter("termId");
        String disciplinesId = req.getParameter("idsSelectedDisciplines");
        String duration = req.getParameter("duration");
        DBManager.modifyTerm(duration, disciplinesId.split(","), selectedTerm);

        resp.sendRedirect("/terms");
    }
}
