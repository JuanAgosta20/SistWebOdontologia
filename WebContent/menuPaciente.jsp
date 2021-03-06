<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@page import="Entidad.Paciente"%>
<%@page import="Entidad.Tratamiento"%>
<%@page import="Entidad.Consulta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="masterInclude.html"></jsp:include>

<%//if(session.getAttribute("usuario") == null) response.sendRedirect("index.jsp");%>

<title>Ficha paciente</title>
<link rel="stylesheet" href="Resources/css/stylesheetMain.css">
</head>
<body>
	<jsp:include page="masterMenuOdont.jsp"></jsp:include>
	<%
		Paciente paciente = null;
		List<Tratamiento> listTrats = null;
		List<Consulta> listCons = null;
		if (request.getAttribute("paciente") != null) {
			paciente = (Paciente) request.getAttribute("paciente");
			listTrats = (ArrayList<Tratamiento>) request.getAttribute("tratamientos");
			listCons = (ArrayList<Consulta>) request.getAttribute("consultas");
		} else {
			response.sendRedirect("ServletPacientes");
		}
	%>
	<div class="container mt-3">
		<h5 class="titular">Ficha paciente</h5>
		<br />
		<div class="row justify-content-center" style="text-align: center;">
			<div class="rounded col-8" style="border: #9de2d4 1px solid;">
				<div class="subtitular">Datos del paciente</div>
				<table class="table table-sm mt-3">
					<tr>
						<th>Nombre:</th>
						<td><%=paciente.getNombre()%></td>
					</tr>
					<tr>
						<td>Apellido:</td>
						<td><%=paciente.getApellido()%></td>
					</tr>
					<tr>
						<td>DNI:</td>
						<td><%=paciente.getDni()%></td>
					</tr>
					<tr>
						<td>Tel�fono:</td>
						<td><%=paciente.getTelefono()%></td>
					</tr>
					<tr>
						<td>Domicilio:</td>
						<td><%=paciente.getDomicilio()%></td>
					</tr>
					<tr>
						<td>Fecha de nacimiento:</td>
						<td><%=paciente.getFechaNacimiento()%></td>
					</tr>
					<%
						if (paciente.hayExtra()) {
					%>
					<tr>
						<td>Informaci�n extra:</td>
						<td><%=paciente.getInfoExtra()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
		</div>
		<br />
		<div class="row bordeVerde">
			<div class="col-12">
			<h5 class="subtitular p-2"> Odontograma del paciente</h5>
				<jsp:include page="odontograma.html"></jsp:include>
			</div>
		</div>
		<br>
		<div class="row mt-3" style="text-align: center;">
			<div class="col-7 rounded bordeVerde">
				<div class="subtitular">Historial cl�nico</div>
				<table class="table mt-3">
					<tr>
						<th>Turno</th>
						<th>Odontologo</th>
						<th>Tratamiento</th>
						<th>Fecha</th>
						<th>Detalle</th>
					</tr>
					<%
						for (Consulta con : listCons) {
							String det = "<b>Odontologo:</b> " + con.getNombreOdontologo() + " " + con.getApellidoOdontologo() +
							", DNI: " + con.getDniOdontologo() + "</br></br>";
							if (con.getAnotacion() != null && !con.getAnotacion().isEmpty())
								det += "<b>Anotacion:</b> " + con.getAnotacion() + "</br></br>";
							if(!con.getPiezasArregladas().isEmpty()){
								det += "<b>Piezas</b></br>";
								for (String p : con.getPiezasArregladas()) {
									det += p + "</br>";
								}
							}
					%>
					<tr>
						<td><%=con.getIDTurno()%></td>
						<td><%=con.getApellidoOdontologo()%></td>
						<td><%=con.getIdTratamiento()%></td>
						<td><%= con.getFecha().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))  %></td>
						<td><button
								onclick="verDetalles(this, '<%=con.getIDTurno() + "T"%>')"
								class="btn btn-outline-primary btn-sm">Ver detalle</button></td>
					</tr>
					<tr id="<%=con.getIDTurno() + "T"%>" style="display: none;">
						<td colspan="5"><%=det%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div class="col-5 rounded bordeVerde">
				<div class="subtitular">Registrar nueva consulta</div>
				<div><!-- <form method="POST" action="ServletHistoriales"> -->
				<input type="hidden" id="idpaciente" value="<%=paciente.getIDPaciente()%>">
				<input name="idturno" id="turno" type="hidden" 
				
				<% if(request.getParameter("idturno") != null){ %>
					value="<%= request.getParameter("idturno") %>"
				<%}else{ %>
					value="<%= "null" %>"
				<%} %>
				>
					<table class="table mt-3">
						<tr>
							<th>Tratamiento</th>
							<th>Anotacion extra:</th>
						</tr>
						<tr>
							<td><select id="tratamiento">
									<%
										for (Tratamiento trat : listTrats) {
									%>
									<option value="<%=trat.getNombreID()%>"><%=trat.getNombreID()%></option>
									<%
										}
									%>

							</select></td>
							<td><textarea id="anotacion" style="width: 100%" rows="1"></textarea></td>
						</tr>
					</table>
					<button type="button" class="btn btn-success m-2" id="saveOdont">Guardar ficha</button>
					<div class="text-primary border border-primary rounded m-2 p-2" id="cartelEspera" style="display:none;">
						Guardando.. por favor espere...
					</div>
				</div>
			</div>

		</div>
		<br> <br>
	</div>
	<script type="text/javascript">
		function verDetalles(btn, id){
			if(btn.textContent == "Cerrar"){
				btn.textContent = "Ver detalle";
				$("#"+id).hide();
			}else{
				btn.textContent = "Cerrar";
				$("#"+id).show();
			}
		}
	</script>
</body>
</html>