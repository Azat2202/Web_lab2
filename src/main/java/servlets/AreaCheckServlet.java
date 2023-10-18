package servlets;

import beans.Point;
import beans.PointsArray;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import validators.HitStatus;
import validators.Validator;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import static java.time.temporal.ChronoUnit.MINUTES;

@WebServlet("/area-check-servlet")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            long timer = System.nanoTime();
            Validator validator = new Validator(req);

            HitStatus hitStatus = validator.getStatus();
            Point point = validator.getPoint();

            int timezone = Integer.parseInt(req.getParameter("timezone"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            String currentTime = formatter.format(LocalDateTime.now().plusMinutes(timezone));
            long scriptTime = (long) ((System.nanoTime() - timer) * 0.001);

            var bean = (PointsArray) req.getSession().getAttribute("bean");
            if (bean == null) {
                bean = new PointsArray();
                req.getSession().setAttribute("bean", bean);
            }

            point.setTime(currentTime);
            point.setStatus(hitStatus == HitStatus.HIT);
            point.setScriptTime(scriptTime);
            bean.addPoint(point);

            Gson gson = new Gson();
            Map<String, Object> json = new HashMap<>();
            json.put("x", point.getX());
            json.put("y", point.getY());
            json.put("r", point.getR());
            json.put("status", point.getStatus());
            json.put("time", point.getTime());
            json.put("scriptTime", point.getScriptTime());
            String msg = gson.toJson(json);
            resp.getWriter().write(msg);
        } catch (Exception exception){
            ControllerServlet.sendError(resp, "Data is incorrect");
        }
    }
}
