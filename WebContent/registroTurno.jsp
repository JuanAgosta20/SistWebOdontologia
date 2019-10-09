<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="masterInclude.html"></jsp:include>
<link rel="stylesheet" href="Resources/css/stylesheetMain.css">
<title>Ficha odontologo</title>
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
	width: 350px;
	border-radius: 6px;
	margin: 3% auto 0 auto;
	padding: 20px;
	border: #9de2d4 1px solid;
	text-align:center;
}
</style>

<body>
	<jsp:include page="masterMenuAdmin.html"></jsp:include>
	<div class="container mt-3">
		<div>
			<div>
				<h5 class="titular">
					Turno
					</h1>
			</div>
			<form class="box">
				<table>
					<tr>
						<td>DNI paciente:</td>
						<td><input type="number"></td>
					</tr>
					<tr>
						<td>Odontologo:</td>
						<td>
						<select style="margin-bottom: 10px; width: 100%;">
							<option>Fernandez</option>
							<option>Da Costa</option>
							<option>Gomez</option>
						</select>
					</td>
					</tr>
					<tr>
						<td>Horario:</td>
						<td>
							<select style="margin-bottom: 10px;">
								<option>09:30hs</option>
								<option>10:00hs</option>
								<option>10:30hs</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>Fecha:</td>
						<td><input type="date"></td>
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