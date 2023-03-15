package controllers;

import db.DBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplineDeleteController", urlPatterns = "/discipline_delete")
public class DisciplineDeleteController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String ids = req.getParameter("idsForDeleteDiscipline");
        DBManager.deleteDisciplines(ids.split(" "));
        resp.sendRedirect("/disciplines");
    }
}
