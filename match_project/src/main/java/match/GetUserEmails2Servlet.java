	package match;
	
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import java.io.IOException;
	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.json.Json;
	import javax.json.JsonObject;
	import javax.json.JsonReader;
	import java.io.StringReader;
	import java.util.List;
	import java.util.ArrayList;
	import javax.json.JsonArray;
	import javax.json.JsonArrayBuilder;
	/**
	 * Servlet implementation class GetUserEmails2Servlet
	 */
	@WebServlet("/GetUserEmails2Servlet")
	public class GetUserEmails2Servlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json; charset=UTF-8");
	        // 요청에서 JSON 데이터 읽기
	        StringBuilder sb = new StringBuilder();
	        String s;
	        while ((s = request.getReader().readLine()) != null) {
	            sb.append(s);
	        }
	        JsonReader jsonReader = Json.createReader(new StringReader(sb.toString()));
	        JsonObject jsonObject = jsonReader.readObject();
	        jsonReader.close();
	
	        // JSON 객체에서 배열 데이터 추출
	        JsonArray envTypesJson = jsonObject.getJsonArray("env_types");
	        JsonArray qualEduTypesJson = jsonObject.getJsonArray("qual_edu_types");
	        JsonArray qualExperienceJson = jsonObject.getJsonArray("qual_experience");
	
	        // JsonArray를 Java List로 변환
	        List<String> envTypes = new ArrayList<>();
	        for (int i = 0; i < envTypesJson.size(); i++) {
	            envTypes.add(envTypesJson.getString(i));
	        }
	
	        List<String> qualEduTypes = new ArrayList<>();
	        for (int i = 0; i < qualEduTypesJson.size(); i++) {
	            qualEduTypes.add(qualEduTypesJson.getString(i));
	        }
	
	        List<String> qualExperience = new ArrayList<>();
	        for (int i = 0; i < qualExperienceJson.size(); i++) {
	            qualExperience.add(qualExperienceJson.getString(i));
	        }
	
	        // 콘솔에 값 출력
	        System.out.println("Environment Types: " + envTypes);
	        System.out.println("Qualification Education Types: " + qualEduTypes);
	        System.out.println("Qualification Experience: " + qualExperience);
	        
	     // 각 List를 JsonArray로 변환
	        JsonArrayBuilder envTypesBuilder = Json.createArrayBuilder();
	        for (String envType : envTypes) {
	            envTypesBuilder.add(envType);
	        }
	
	        JsonArrayBuilder qualEduTypesBuilder = Json.createArrayBuilder();
	        for (String eduType : qualEduTypes) {
	            qualEduTypesBuilder.add(eduType);
	        }
	
	        JsonArrayBuilder qualExperienceBuilder = Json.createArrayBuilder();
	        for (String exp : qualExperience) {
	            qualExperienceBuilder.add(exp);
	        }
	        
	        response.setContentType("application/json");
	
	        // JSON 응답 객체 생성
	        JsonObject jsonResponse = Json.createObjectBuilder()
	            .add("envTypes", envTypesBuilder)
	            .add("qualEduTypes", qualEduTypesBuilder)
	            .add("qualExperience", qualExperienceBuilder)
	            .build();
	
	        response.getWriter().write(jsonResponse.toString());
	    }
	}