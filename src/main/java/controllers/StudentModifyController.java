package controllers;

import db.DBManager;
import entity.Student;
import services.DateService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.http.HttpClient;

@WebServlet(name = "StudentModifyController", urlPatterns = "/student_modify")
public class StudentModifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("idsForModify");
        Student student = DBManager.getStudenById(id);
        req.setAttribute("student", student);
        req.getRequestDispatcher("WEB-INF/jsp/student_modify.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String groupName = req.getParameter("group");
        String date = req.getParameter("date");
        String id = req.getParameter("id");

        if (surname.equals("") || name.equals("") || groupName.equals("") || date.equals("")) {
            req.setAttribute("error", "1");
            req.getRequestDispatcher("WEB-INF/jsp/student_modify.jsp").forward(req, resp);
            return;
        }

        int groupId = DBManager.getGroupId(groupName);
        String dateForDB = DateService.convertDateForDB(date);

        DBManager.modifyStudent(id, surname, name, groupId, dateForDB);
        resp.sendRedirect("/students");

    }
}
