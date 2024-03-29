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

@WebServlet(name = "TermsController", urlPatterns = "/terms")
public class TermsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String termId = req.getParameter("termId");

        List<Term> terms = DBManager.getAllActiveTerms();

        Term selectedTerm = new Term();
        if (termId != null && !termId.isEmpty()) {
            for (Term term : terms) {
                if (termId.equals(String.valueOf(term.getId()))) {
                    selectedTerm = term;
                    break;
                }
            }
        } else {
            selectedTerm = terms.get(0);
        }

        List<Discipline> disciplines = DBManager.getDisciplinesByTermId(String.valueOf(selectedTerm.getId()));

        req.setAttribute("terms", terms);
        req.setAttribute("selectedTerm", selectedTerm);
        req.setAttribute("disciplines", disciplines);
        req.setAttribute("duration", selectedTerm.getDuration());

        req.getRequestDispatcher("WEB-INF/jsp/terms.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
