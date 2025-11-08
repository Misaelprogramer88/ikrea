<?php include "conexion.php"; ?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Insumos</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

<style>
  .card{
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
    margin-top:20px;
  }
  .form{
    margin-top:20px;
  }
  .row{
    display:grid;
    grid-template-columns: repeat(4, 1fr);
    gap:15px;
    margin-bottom:15px;
  }
  label{
    font-weight:bold;
    font-size:14px;
  }
  input, select, textarea{
    width:100%;
    padding:8px;
    border:1px solid #ccc;
    border-radius:5px;
  }
  textarea{
    resize:none;
    height:40px;
  }
  button{
    padding:10px;
    border:none;
    border-radius:5px;
    cursor:pointer;
  }
  button[type="reset"]{ background:#999; color:white; }
  button[type="submit"]{ background:#28a745; color:white; }
</style>

</head>
<body class="p-4 bg-light">

<h1>Insumos</h1>

<div class="card">
  <h2>Nuevo Insumo</h2>

  <form id="formInsumo" class="form">

    <div class="row">

      <div>
        <label>Nombre del insumo:</label>
        <input type="text" id="nombre" name="nombre">
      </div>

      <div>
        <label>Función:</label>
        <input type="text" id="funcion" name="funcion">
      </div>

      <div>
        <label>¿Es fertilizante?</label>
        <select id="fertilizante" name="fertilizante">
          <option value="">Seleccione...</option>
          <option value="si">Sí</option>
          <option value="no">No</option>
        </select>
      </div>

      <div>
        <label>Notas:</label>
        <textarea id="notas" name="notas"></textarea>
      </div>

    </div>

    <div class="row" style="grid-template-columns: repeat(2, 1fr);">
      <button type="reset">Limpiar</button>
      <button type="submit">Registrar</button>
    </div>

  </form>
</div>


<!-- ✅ Tabla de insumos -->
<div class="card mt-4">
  <h2>Lista de Insumos</h2>

  <table id="tablaInsumos" class="display table table-striped">
      <thead>
          <tr>
              <th>ID</th>
              <th>Orden ID</th>
              <th>Producto</th>
              <th>Cantidad</th>
              <th>Nombre</th>
              <th>Función</th>
              <th>Fertilizante</th>
              <th>Notas</th>
              <th>Fecha</th>
          </tr>
      </thead>
      <tbody id="contenidoInsumos"></tbody>
  </table>
</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<script>

// ✅ Guardar nuevo insumo manual
$("#formInsumo").submit(function(e){
    e.preventDefault();

    $.ajax({
        url: "guardar_insumo.php",
        method: "POST",
        data: {
            nombre: $("#nombre").val(),
            funcion: $("#funcion").val(),
            fertilizante: $("#fertilizante").val(),
            notas: $("#notas").val(),
        },
        success: function(res){
            if(res.trim() === "OK"){
                alert("Insumo registrado");
                $("#formInsumo")[0].reset();
                cargarInsumos();
            } else {
                alert("Error: " + res);
            }
        }
    });
});


// ✅ Cargar insumos desde la base de datos
function cargarInsumos() {
    $.ajax({
        url: "cargar_insumos.php",
        method: "GET",
        success: function(res){
            let datos = JSON.parse(res);
            let html = "";

            datos.forEach(i => {
                html += `
                <tr>
                    <td>${i.id}</td>
                    <td>${i.orden_id ?? ''}</td>
                    <td>${i.producto ?? ''}</td>
                    <td>${i.cantidad ?? ''}</td>
                    <td>${i.nombre ?? ''}</td>
                    <td>${i.funcion ?? ''}</td>
                    <td>${i.fertilizante ?? ''}</td>
                    <td>${i.notas ?? ''}</td>
                    <td>${i.fecha}</td>
                </tr>`;
            });

            $("#contenidoInsumos").html(html);
            $("#tablaInsumos").DataTable();
        }
    });
}

cargarInsumos();

</script>

</body>
</html>
