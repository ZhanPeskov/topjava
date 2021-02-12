package ru.javawebinar.topjava.web;

import org.slf4j.Logger;
import ru.javawebinar.topjava.util.MealsUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalTime;

import static org.slf4j.LoggerFactory.getLogger;

public class MealServlet extends HttpServlet {
    private static final Logger log = getLogger(MealServlet.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            String strId = request.getParameter("id");

            if (strId != null) {
                int id = Integer.parseInt(strId);

                switch (action.toLowerCase()) {
                    case "update":
                    case "delete":
                    default:
                }
            }

            response.sendRedirect("meals");

            return;
        }

        log.debug("forward to meals");
        request.setAttribute("mealsTo", MealsUtil.filteredByStreams(LocalTime.MIN, LocalTime.MAX, MealsUtil.CALORIES_PER_DAY));
        request.getRequestDispatcher("meals.jsp").forward(request, response);
    }
}