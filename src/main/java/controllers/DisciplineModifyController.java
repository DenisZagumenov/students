package controllers;

import db.DBManager;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplineModifyController", urlPatterns = "/discipline_modify")
public class DisciplineModifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("idsForModifyDiscipline");
        Discipline discipline = DBManager.getDisciplineById(id);
        req.setAttribute("discipline", discipline);
        req.getRequestDispatcher("WEB-INF/jsp/discipline_modify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("discipline");
        String id = req.getParameter("id");

        if (name.equals("")) {
            req.setAttribute("error", "1");
            req.getRequestDispatcher("WEB-INF/jsp/discipline_modify.jsp").forward(req, resp);
            return;
        }

        DBManager.modifyDiscipline(id, name);
        resp.sendRedirect("/disciplines");
    }
}
