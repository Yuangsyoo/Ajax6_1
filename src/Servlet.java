import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2017/6/1.
 */
public class Servlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        List list = new ArrayList();
        Model model = new Model();
        model.setId(10001);
        model.setUsername("yoyo");
        Model model1 = new Model();
        model1.setId(10002);
        model1.setUsername("koko");
        list.add(model);
        list.add(model1);
        ObjectMapper om = new ObjectMapper();
        String json = om.writeValueAsString(list);
        response.getWriter().print(json);


    }
}
