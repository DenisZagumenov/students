package controllers;

import db.DBManager;
import entity.Grade;
import entity.Student;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentProgressController", urlPatterns = "/student_progress")
public class StudentProgressController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String studentId = req.getParameter("idsForProgress");
        String termId = req.getParameter("termId");

        // 1. Получить из базы данных студента по его Id

        Student student = DBManager.getStudenById(studentId);

        // 2. Получить активные семестры

        List<Term> terms = DBManager.getAllActiveTerms();

        // 3. Получить выбранный семестр (или самый первый, если он не выбирался)

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

        // 4. Получить все дисциплины и оценки по ним для конкретного студента

        List<Grade> grades = DBManager.getGradesByStudentAndTermIds(studentId, String.valueOf(selectedTerm.getId()));

        // 5. Полученными данными заполнить страницу.

        req.setAttribute("student", student);
        req.setAttribute("terms", terms);
        req.setAttribute("selectedTerm", selectedTerm);
        req.setAttribute("grades", grades);
        req.getRequestDispatcher("WEB-INF/jsp/student_progress.jsp").forward(req, resp);
    }
}
