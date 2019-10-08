<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="masterInclude.html"></jsp:include>
	<link rel="stylesheet" href="Resources/css/stylesheetMain.css">
<title>Ficha paciente</title>
</head>
<style>
<
style>body {
	margin: 0 auto 0 auto;
	width: 100%;
	background: #ebf9f6;
}

input {
	border-radius: 4px;
	text-align: center;
	margin: 0px 0px 10px 0px;
}

.box {
	background: white;
	width: 300px;
	border-radius: 6px;
	margin: 3% auto 0 auto;
	padding: 20px;
	border: #9de2d4 1px solid;
}
</style>

<body>
	<jsp:include page="masterMenuAdmin.html"></jsp:include>
	<div class="container mt-3">
		<div>
			<div>
				<h5 class="titular">
					Agregar/editar paciente
					</h1>
			</div>
			<form class="box">
				<table>
					<tr>
						<td>Nombre:</td>
						<td><input></td>
					</tr>
					<tr>
						<td>Apellido:</td>
						<td><input></td>
					</tr>
					<tr>
						<td>DNI:</td>
						<td><input type="number"></td>
					</tr>
					<tr>
						<td>Tel�fono:</td>
						<td><input type="tel"></td>
					</tr>
					<tr>
						<td>Domicilio:</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>Fecha de nacimiento:</td>
						<td><input type="date"></td>
					</tr>
					<tr>
						<td>Anotacion:</td>
						<td><input type="text"></td>
					</tr>
				</table>
				<br>
				<div style="text-align: center">
					<button>Guardar</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>