<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-lg bg-body-tertiary rounded" aria-label="Thirteenth navbar example">
      <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample11" aria-controls="navbarsExample11" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse d-lg-flex" id="navbarsExample11">
          <a class="navbar-brand col-lg-3 me-0" href="#">VACACIONES CON EL GRUPO UTP</a>
          <ul class="navbar-nav col-lg-6 justify-content-lg-center">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
           <li class="nav-item">
           		<a href="index.jsp" class="nav-link">Inicio</a>
           </li>
           <li class="nav-item">
           		<a href="nuestrosservicios.jsp"class="nav-link">Servicios</a>
           </li>
           <li class="nav-item">
           		<a href="listarcuartos.jsp"	class="nav-link">Cuartos</a>
           </li>
           <li class="nav-item">
           		<a href="dashboard/DashboardMain.jsp" class="nav-link">Dasboard</a>
           </li>
          </ul>
          <div class="d-lg-flex col-lg-3 justify-content-lg-end">
            <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">Resevar
  			</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Ingrese Datos Personales</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
    	<!-- INGRESO DEL FORMULARIO RESERVA -->  
    	
	<form method="post" action="hacerReserva">
          <div class="form-floating mb-3">
            <input type="text" name="nombre" class="form-control rounded-3" id="floatingInput" placeholder="Nombre" required>
            <label for="floatingInput">Nombre</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="apellido_paterno" class="form-control rounded-3" id="floatingPassword" placeholder="Apellido Paterno" required>
            <label for="floatingInput">Apellido Paterno</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="apellido_materno" class="form-control rounded-3" id="floatingInput" placeholder="Apellido Materno" required>
            <label for="floatingInput">Apellido Materno</label>
          </div>
          <div class="form-floating mb-3">
            <input type="text" name="direccion" class="form-control rounded-3" id="floatingPassword" placeholder="Direccion" required>
            <label for="floatingInput">Direccion</label>
          </div>
          <div class="form-floating mb-3">
            <input type="number" name="dni" class="form-control rounded-3" id="floatingInput" placeholder="DNI" maxlength="8"
            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required>
            <label for="floatingInput">DNI</label>
          </div>
          <div class="form-floating mb-3">
            <input type="number" name="telefono" class="form-control rounded-3" id="floatingPassword" placeholder="Telefono" maxlength="9"
            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"  required>
            <label for="floatingInput">Telefono</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email" name="email" class="form-control rounded-3" id="floatingPassword" placeholder="Email" required>
            <label for="floatingInput">Email</label>
          </div>
          <div class="form-floating mb-3">
            <input type="date" name="fecha_entrada" class="form-control rounded-3" id="fecha_entrada" placeholder="Fecha Entrada" required>
            <label for="floatingInput">Fecha Entrada</label>
          </div>
          <div class="form-floating mb-3">
            <input type="date" name="fecha_salida" class="form-control rounded-3" id="fecha_salida" placeholder="Fecha Salida"  required>
            <label for="floatingInput">Fecha Salida</label>
          </div>
          <div class="form-floating mb-3">
            <select name="habitacion" id="habitacion" class="form-select">
              <option value="1">Pricing</option>
              <option value="1" selected>Habitacion 1</option>
              <option value="1">Other</option>
            </select>
            <label for="floatingInput">Habitacion</label>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit" value="Guardar">Guardar</button>
        </form>
        
        <!-- INGRESO DE SCRIPT PARA DATE -->
        <script>
  		var fechaActual = new Date().toISOString().split('T')[0];
  		document.getElementById("fecha_entrada").setAttribute("min", fechaActual);	
		</script>
		
		<!-- EL SCRIPT CAPTURA EL EVENTO DE EL PRIMER DATE Y RESTINGE AL SEGUNDO DATE -->
		<script>
		var fechaEntrada = document.getElementById("fecha_entrada");
		var fechaSalida = document.getElementById("fecha_salida");

		fechaEntrada.addEventListener("change", function() {
			  fechaSalida.setAttribute("min", fechaEntrada.value);
			});
		</script> 
      </div>
    </div>
  </div>
</div>
<!-- FIN MODAL -->
          </div>
        </div>
      </div>
    </nav>