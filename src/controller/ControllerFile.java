package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;

@Controller
public class ControllerFile {
	@RequestMapping("/")
	public String home() {
		return "firstpage";
	}

	@ResponseBody
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String User(@RequestBody String userdata, HttpServletRequest req, HttpServletResponse res)
			throws JsonParseException, JsonMappingException, IOException {
		System.out.println("into spring");
		ObjectMapper objectmapper = new ObjectMapper();
		Map<String, String> map = new HashMap<>();
		Map<String, Object> map1 = objectmapper.readValue(userdata, new TypeReference<Map<String, Object>>() {
		});
		System.out.println(userdata);
		String firstname = (String) map1.get("firstname");
		String lastname = (String) map1.get("lastname");
		String email = (String) map1.get("email");
		String password = (String) map1.get("password");
		HttpSession session = req.getSession();
		session.setAttribute("name", firstname);
		session.setAttribute("email", email);
		System.out.println(firstname);
		Personpojo pojo = new Personpojo();
		pojo.setFirstname(firstname);
		pojo.setLastname(lastname);
		pojo.setEmail(email);
		pojo.setPassword(password);
		try {
			PersistenceManager pmf = PMF.get().getPersistenceManager();
			javax.jdo.Query q = pmf.newQuery(Personpojo.class, ("email==email1"));
			q.declareParameters("String email1");
			List<Personpojo> obj = (List<Personpojo>) q.execute(email);
			if (obj.isEmpty()) {
				pmf.makePersistent(pojo);
				map.put("key", "success");
				session.setAttribute("id", pojo);
				map.put("name", firstname);
			} else {
				map.put("key1", "fail");
				// out.println("you have already registerd ");
			}
		} catch (Exception e) {
			System.out.println("exception");
		}

		return objectmapper.writeValueAsString(map);
	}

	@ResponseBody
	@RequestMapping("/login")
	public String login(@RequestBody String logindata, HttpServletRequest req, HttpServletResponse res)
			throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper objectmapper = new ObjectMapper();
		Map<String, String> map = new HashMap<>();
		Map<String, Object> map1 = objectmapper.readValue(logindata, new TypeReference<Map<String, Object>>() {
		});
		System.out.println(logindata);
		String email = (String) map1.get("email1");
		String password = (String) map1.get("password1");
		HttpSession session = req.getSession();
		Personpojo object1 = new Personpojo();
		object1.setEmail(email);
		object1.setPassword(password);
		PersistenceManager pmf = PMF.get().getPersistenceManager();
		javax.jdo.Query q = pmf.newQuery(Personpojo.class, ("email==emails && password==passwords"));
		q.declareParameters("String emails,String passwords");
		try {
			List<Personpojo> results = (List<Personpojo>) q.execute(email, password);
			if (results.isEmpty()) {
				map.put("key", "success");
			} else {
				session.setAttribute("id", results.get(0));
				session.setAttribute("name", results.get(0).getFirstname());
				session.setAttribute("email", results.get(0).getEmail());
				map.put("key1", "fail");
				// out.println("your are logged in");
			}
		} catch (Exception e) {
			System.out.println("exception occured");
		}

		return objectmapper.writeValueAsString(map);
	}

	@RequestMapping("/aftersignup")
	public ModelAndView afterlogin() {
		return new ModelAndView("success");
	}

	@ResponseBody
	@RequestMapping(value = "/Timer", method = RequestMethod.POST)
	public String Timepost(@RequestBody String timedata, HttpServletRequest req, HttpServletResponse res)
			throws JsonParseException, JsonMappingException, IOException {
		System.out.println("timer method");
		ObjectMapper objectmapper = new ObjectMapper();
		// objectmapper.configure(DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES,
		// false);
		Map<String, String> map = new HashMap<>();
		Map<String, Object> map1 = objectmapper.readValue(timedata, new TypeReference<Map<String, Object>>() {
		});
		String time = (String) map1.get("time");
		System.out.println(time);
	//	String pausetime = (String) map1.get("pausetime");
		String[] arr=time.split(":");
		//String[] pausearray = pausetime.split(":");
		String HH = arr[0];
		String MM = arr[1];
		String SS= arr[2];
		Integer hours=Integer.parseInt(HH.trim());
		Integer minutes=Integer.parseInt(MM.trim());
		Integer sec=Integer.parseInt(SS.trim());
		System.out.println("hours"+HH);
		long hourssec= hours*60*60;
		long minutesec = minutes*60;
		long totalsec = hourssec+minutesec+sec;
		Long millisec = totalsec*1000;
		HttpSession session = req.getSession();
		Personpojo registerobj = (Personpojo) session.getAttribute("id");
		Long ids = registerobj.getIds();
		System.out.println(ids.toString());
		String email = registerobj.getEmail();
		TimerPojo date = new TimerPojo();
		date.setTime(millisec);
		date.getIdvalues().add(ids);
		date.setEmail(email);
		PersistenceManager pmf = PMF.get().getPersistenceManager();
		
		try {

			Query query = pmf.newQuery(TimerPojo.class, ("time == Time && Idvalues == id1 "));
			query.declareParameters("Long Time,String id1");

			try {

				List<TimerPojo> results1 = (List<TimerPojo>) query.execute(millisec, ids);
				if (results1.isEmpty() || results1.equals(null)) {
					pmf.makePersistent(date);
					map.put("key", "success");
				} else if (results1.get(0).getIsDelete().equals(true)) {
					results1.get(0).setIsDelete(false);
					pmf.makePersistent(results1.get(0));
					map.put("key", "success");
				} else {
					map.put("key1", "fail");
					System.out.println("time already exists");

				}
			} catch (Exception e) {
				System.out.println(e);
			}
		} finally {
			pmf.close();
		}

		return objectmapper.writeValueAsString(map);

	}

	@ResponseBody
	@RequestMapping(value = "/ListOfTimersOfUser", method = RequestMethod.POST)
	public String displayListOfTimersOfUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// PrintWriter out = response.getWriter();
		// String email = request.getParameter("email");
		HttpSession session = request.getSession();
		HashMap<String, Object> responseMap = new HashMap<>();
		Personpojo registerobj = (Personpojo) session.getAttribute("id");
		Long Id = registerobj.getIds();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		List<TimerPojo> results1 = null;
		List<String> listStrings = new ArrayList<String>();
		try {

			Query query = pm.newQuery(TimerPojo.class, ("Idvalues == id1 && isDelete == false"));
			query.declareParameters("String id1");

			try {

				results1 = (List<TimerPojo>) query.execute(Id);

				// System.out.println("dfdf");
				if (results1.isEmpty() || results1.equals(null)) {
				} else {
					for (TimerPojo d : results1) {
						System.out.println(d.getTime());
						long totalseconds = (d.getTime())/1000;
						System.out.println(totalseconds);
					    int hours = (int) (totalseconds/3600);
					    long secondsleft = totalseconds-hours*3600;
					    int minutes = (int) (secondsleft/60);
					    long seconds = secondsleft-minutes*60;
					    System.out.println(hours);
					    System.out.println(minutes);
					    System.out.println(seconds);
					    String formattedTime = "";
					    if (hours < 10)
					        formattedTime += "0";
					    formattedTime += hours + ":";

					    if (minutes < 10)
					        formattedTime += "0";
					    formattedTime += minutes + ":";

					    if (seconds < 10)
					        formattedTime += "0";
					    formattedTime += seconds ;

                          System.out.println(formattedTime);		
					
					    
				
						// out.println(d.getaddTime());
						// response.getWriter().write("dfgh");
					  // String timer = d.getTime().toString();
						listStrings.add(formattedTime);
						

					}
					// System.out.println(((TimerJDO) results1).getaddTime());

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} finally {

			pm.close();
		}
		responseMap.put("listOfStrings", listStrings);
		ObjectMapper obj = new ObjectMapper();
		String response1 = obj.writeValueAsString(responseMap);

		return response1;

	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String Delete(@RequestBody String delete, HttpServletRequest request, HttpServletResponse response)
			throws JsonParseException, JsonMappingException, IOException {
		System.out.println("into delete method");
		ObjectMapper objectmapper = new ObjectMapper();
		Map<String, String> map = new HashMap<>();
		Map<String, Object> maper = objectmapper.readValue(delete, new TypeReference<Map<String, Object>>() {
		});
		System.out.println(delete);
		String deleteTime = (String) maper.get("deltime");
		String[] arr=deleteTime.split(":");
		String HH = arr[0];
		String MM = arr[1];
		String SS= arr[2];
		Integer hours=Integer.parseInt(HH.trim());
		Integer minutes=Integer.parseInt(MM.trim());
		Integer sec=Integer.parseInt(SS.trim());
		long hourssec= hours*60*60;
		long minutesec = minutes*60;
		long totalsec = hourssec+minutesec+sec;
		Long millisec = totalsec*1000;
	    HttpSession session = request.getSession();
		PersistenceManager pm = PMF.get().getPersistenceManager();
		TimerPojo dataobj = new TimerPojo();
		List<TimerPojo> results11 = null;
		try {

			Query query = pm.newQuery(TimerPojo.class, ("time == time1"));
			query.declareParameters("Long time1");

			try {

				results11 = (List<TimerPojo>) query.execute(millisec);

				if (results11.isEmpty() || results11.equals(null)) {
					map.put("key1", "fail");
				} else {
					for (TimerPojo dd : results11) {
						dd.getIsDelete();
						dd.setIsDelete(true);
						map.put("key", "success");

					}
				}
			} catch (Exception e) {
				System.out.println(e);
			}

		} finally {

		}
		return objectmapper.writeValueAsString(map);
	}

	@ResponseBody
	@RequestMapping(value = "/signout", method = RequestMethod.POST)
	public String delete(HttpServletRequest req, HttpServletResponse res)
			throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper objectmapper = new ObjectMapper();
		System.out.println("in signout method");
		Map<String, String> map = new HashMap<>();
		map.put("key", "success");
		return objectmapper.writeValueAsString(map);

	}

	@RequestMapping("/Aftersigout")
	public ModelAndView signout(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession(false);
		Personpojo obj = (Personpojo) session.getAttribute("id");
		String email = obj.getEmail();
		System.out.println(email);
		session.invalidate();
		/*
		 * res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"
		 * ); // HTTP 1.1. res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		 * res.setDateHeader("Expires", 0);
		 */ return new ModelAndView("firstpage");

	}
}
