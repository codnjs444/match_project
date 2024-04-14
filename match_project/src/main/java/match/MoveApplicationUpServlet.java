package match;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import match.application.ApplicationMgr;

/**
 * Servlet implementation class MoveApplicationUpServlet
 */
@WebServlet("/MoveApplicationUpServlet")
public class MoveApplicationUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
	        StringBuilder sb = new StringBuilder();
	        String line;
	        BufferedReader reader = request.getReader();
	        while ((line = reader.readLine()) != null) {
	            sb.append(line);
	        }
	        String jsonData = sb.toString();

	        JsonReader jsonReader = Json.createReader(new StringReader(jsonData));
	        JsonObject jsonObject = jsonReader.readObject();
	        jsonReader.close();

	        // 문자열로 posting_idx를 읽은 후 정수로 변환
	        String postingIdxStr = jsonObject.getString("posting_idx");
	        int postingIdx = Integer.parseInt(postingIdxStr);  // 문자열을 정수로 변환
	        String userId = jsonObject.getString("user_id");

	        ApplicationMgr aMgr = new ApplicationMgr();
	        boolean result = aMgr.updateApplicationDateUp(postingIdx, userId);

	        response.setContentType("text/plain");
	        response.setCharacterEncoding("UTF-8");
	        if (result) {
	            response.getWriter().write("Success");
	        } else {
	            response.getWriter().write("Error");
	        }
	    }
	}
