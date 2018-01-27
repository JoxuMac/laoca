<%@page import="edu.uclm.esi.tysweb.laoca.dominio.*"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String p = request.getParameter("p");
	JSONObject jso=new JSONObject(p);	
	JSONObject respuesta=new JSONObject();

	try {
		String nombre=jso.optString("nombre");
		String email=jso.optString("email");

		
		Usuario usuario = Manager.get().registrar_anonimo(nombre,email);
		
		session.setAttribute("usuario", usuario);
		if(usuario == null)
			throw new Exception();
		
		respuesta.put("result", "OK");
		respuesta.put("email", usuario.geteMail());
		respuesta.put("nombre", usuario.getNombre());

		
	}
	catch (Exception e) {
		//response.sendRedirect("../login.html?err=1");
		respuesta.put("result", "ERROR");
		respuesta.put("mensaje", e.getMessage());
	}
	out.println(respuesta.toString());
%>