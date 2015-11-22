<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Page language="c#" Codebehind="maestria.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfMaestria" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>Maestría: Datos generales</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="estilos/main.css" type="text/css" rel="stylesheet">
		<link rel="shortcut icon" href="imagenes/favicon.ico" />
		<!-- Cargar el fichero principal de scripts del lado del cliente -->
		<script src="includes/main.js" type="text/javascript"></script>
		<script src="includes/dates.js" type="text/javascript"></script>
	</head>
	<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0"><!-- PAGE TABLE; BEGIN -->
		<form id="frm_Maestria" method="post" runat="server">
			<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr>
					<td><!-- CONTROL PARA EL ENCABEZADO, QUE INCLUYE LOS CONTROLES PARA IDENTIFICACIÓN DE USUARIO --><uc1:wucheader id="ctlHeader" runat="server"></uc1:wucheader></td></tr>
				<tr>
					<td><!-- CONTROL PARA LA BARRA DE OPCIONES DEL ENCABEZADO --><uc1:wucheadernavbar id="ctlHeaderNavBar" runat="server"></uc1:wucheadernavbar></td></tr></table>
			<table id="Table2" cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr id="tr_Notify" style="DISPLAY: none" height="0" runat="server">
					<td width="750"><span class="spErrorNotification" style="MARGIN-BOTTOM: 1px" id="sp_Notify" runat="server"></span></td></tr>
				<tr valign="top">
					<td> <!-- BODY TABLE; BEGIN -->
						<table id="Table3" cellspacing="0" cellpadding="0" width="750" border="0">
							<tr valign="top">
								<td valign="top" align="right">
									<!-- Control Web para las opciones de la izquierda -->
									<uc1:wucleftoptions id="ctlLeftOptions" runat="server"></uc1:wucleftoptions>
								</td>
								<td> <!-- MAIN WINDOW; BEGIN -->
									<table id="Table4" cellspacing="0" cellpadding="0" width="545" border="0">
										<tr valign="top">
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">DATOS
													GENERALES&nbsp; DE LA MAESTRÍA
												</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<table border="0" align="center">
																<!-- Provincia y Director -->
																<tr valign="top">
																	<td>Provincia donde se
																		desarrolla:</td>
																	<td><select class="frmTextInput" id="cboProvincia"></select>&nbsp;<img id="imgAyudita_cboProvincia" src="imagenes/ayudita_icon.gif" alt="Ayudita" title="No se debe cambiar la provincia porque ya existen sedes registradas." border="0" style="display: none;"></td></tr>
																<tr valign="top">
																	<td>Director del comité
																		académico:</td>
																	<td><select class="frmTextInput" id="cboDirector"></select></td></tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr>
																<!-- Nombre y Hospedero -->
																<tr valign="top">
																	<td>Nombre de la Maestría:</td>
																	<td align="left"><input class="frmTextInput" id="txtNombre" type="text" maxlength="75" size="50" onchange="JavaScript:valEmptyString(this, document.getElementById('spValNombre'), 'El campo \'Nombre\' no puede estar vacío.');"><span id="spValNombre" class="spErrorNotification"></span></td></tr>
																<tr valign="top">
																	<td>Entidad que hospeda esta
																		aplicación Web:</td>
																	<td align="left"><input class="frmTextInput" id="txtHospedero" type="text" maxlength="75" size="50" onchange="JavaScript:valEmptyString(this, document.getElementById('spValHospedero'), 'El campo \'Hospedero\' no puede estar vacío.');"><span id="spValHospedero" class="spErrorNotification"></span></td></tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr>
																<!-- Fecha de Inicio, Fecha Fin y Módulo actual -->
																<tr valign="top">
																	<td>Fecha de inicio:</td>
																	<td align="left"><input class="frmTextInput" id="txtFechaInicio" type="text" maxlength="11" onchange="JavaScript:return(valFechas(this));"><span id="spValFechaInicio" class="spErrorNotification" style="WIDTH: 255px">Fecha
																			no válida.</span></td></tr>
																<tr valign="top">
																	<td>Fecha de finalización:</td>
																	<td align="left"><input class="frmTextInput" id="txtFechaFin" type="text" maxlength="11" onchange="JavaScript:valFechas(this);"><span id="spValFechaFin" class="spErrorNotification" style="WIDTH: 255px">Fecha
																			no válida.</span></td></tr>
																<tr valign="top">
																	<td>Estado de la
																		matrícula:</td>
																	<td align="left"><select class="frmTextInput" id="cboMatricula"></select></td></tr>
																<tr valign="top">
																	<td>Módulo actual:</td>
																	<td><select class="frmTextInput" id="cboModulo"></select>&nbsp;<img id="imgAyudita_cboModulo" src="imagenes/ayudita_icon.gif" alt="Ayudita" title="No existen módulos registrados para mostrar." border="0" style="display: none;"></td></tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr>
																<!-- Fundamentos, Requisitos y Estado de la matrícula -->
																<tr valign="bottom">
																	<td align="left">Requisitos para
																		ingresar:
																	</td>
																	<td align="right">
																		<span style="COLOR: #47639a; TEXT-ALIGN: right" id="spLeftCharsRequisitos">Caracteres
																			restantes:</span><br>
																	</td>
																</tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<textarea class="frmTextInput" id="txtAreaRequisitos" style="WIDTH: 100%" rows="3" onkeyup="JavaScript:document.getElementById('spLeftCharsRequisitos').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 500);" onkeydown="JavaScript:document.getElementById('spLeftCharsRequisitos').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 500);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValRequisitos'), 'El campo \'Requisitos\' no puede estar vacío.');"></textarea>
																		<span id="spValRequisitos" class="spErrorNotification"></span>
																	</td>
																</tr>
																<tr valign="bottom">
																	<td align="left">
																		Fundamentos:
																	</td>
																	<td align="right">
																		<span style="COLOR: #47639a; TEXT-ALIGN: right" id="spLeftCharsFundamentos">Caracteres
																			restantes:</span><br>
																	</td>
																</tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<textarea class="frmTextInput" id="txtAreaFundamentos" style="WIDTH: 100%" rows="4" onkeyup="JavaScript:document.getElementById('spLeftCharsFundamentos').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" onkeydown="JavaScript:document.getElementById('spLeftCharsFundamentos').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 1000);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValFundamentos'), 'El campo \'Fundamentos\' no puede estar vacío.');"></textarea>
																		<span id="spValFundamentos" class="spErrorNotification"></span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr>
																<tr valign="top">
																	<td align="left">
																		<span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left">
																			Actualizando datos...
																		</span>
																	</td>
																	<td align="right">
																		<a id="imgActualizar" title="Actualizar" href="JavaScript:ActualizaDatosGen();"><img alt="Actualizar" border="0" src="imagenes/btn_actualizar.gif"></a>&nbsp;<a id="imgCancelar" title="Cancelar" href="JavaScript:FillPageData();"><img alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<!-- MAIN WINDOW; END --></td></tr></table>
						<!-- BODY TABLE; END --> </td></tr></table></form>
		<!-- PAGE TABLE; END -->
		
		<script language="javascript">
		<!--

		/* 
			PARA LA DECLARACIÓN DE LAS IMÁGENES DE FONDO DE LAS CELDAS, LO HACEMOS POR SCRIPT
			PORQUE FireFox NO INTREPRETA BIEN LO QUE NECESITAMOS SI UTILIZAMOS ESTILOS.
		*/
		document.getElementById('td_body_bg').style.backgroundImage = "url(imagenes/body_bg.gif)";
		document.getElementById('td_body_bg').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_navBarLeft').style.backgroundImage = "url(imagenes/side_nav_bg.gif)";
		document.getElementById('td_navBarLeft').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_bodyHeader').style.backgroundImage = "url(imagenes/body_header.gif)";
		document.getElementById('td_bodyHeader').style.backgroundRepeat = "no-repeat";

		/**** COMIENZO DE LOS PROCEDIMIENTOS AJAX ****/

		// VARIABLES QUE SE UTILIZARÁN DE UN PROCEDIMIENTO A OTRO
		// Provincia actualmente registrada.
		var intIdProvinciaActual;
		// Director(a) actualmente registrado.
		var intIdDirectorActual;
		// Módulo actualmente registrado.
		var intIdModuloActual;
		// Estado de la matrícula actualmente registrado.
		var intIdMatriculaAbierta;
		// Indicador para saber si se debe redireccionar a la
		// página de Inicio porque se ha cambiado el Director.
		var boDirectorChanged = false;
		
		// Recuperar los datos de la Maestría en la propia clase.
		function getMaestriaClass()
		{
			var Maestria = ISPCFG.Msce.clswfMaestria.getMaestriaClass().value;
			var boError = false;
			if(Maestria==null)
			{
				boError = true;
			}
			if(!boError)
			{
				if(Maestria.error!=null)
				{
					boError = true;
				}
			}
			if(boError)
			{
				// Poner en NULL los IDs.
				// Id de provincia actual.
				intIdProvinciaActual = null;
				// Director(a) actualmente registrado.
				intIdDirectorActual = null;
				// Módulo actualmente registrado.
				intIdModuloActual = null;
				// Estado de la matrícula actualmente registrado.
				intIdMatriculaAbierta = null;
				// Limpiar la lista del estado de la Matrícula.
				document.getElementById('cboMatricula').options.length = 0;
				// Limpiar los campos que son de texto.
				document.getElementById('txtNombre').value = '';
				document.getElementById('txtHospedero').value = '';
				document.getElementById('txtFechaInicio').value = '';
				document.getElementById('txtFechaFin').value = '';
				document.getElementById('txtAreaFundamentos').value = '';
				document.getElementById('txtAreaRequisitos').value = '';

				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible recuperar los datos de la Maestría.");
				Maestria = null;
				return;
			}
			intIdProvinciaActual = Maestria.IdProvincia;
			intIdDirectorActual = Maestria.IdUsuarioDirector;
			intIdModuloActual = Maestria.IdModuloActual;
			intIdMatriculaAbierta = Maestria.MatriculaAbierta;
			document.getElementById('txtNombre').value = Maestria.Nombre;
			document.getElementById('txtHospedero').value = Maestria.Hospedero;
			document.getElementById('txtFechaInicio').value = getStringFromDate(Maestria.datFechaInicio);
			document.getElementById('txtFechaFin').value = getStringFromDate(Maestria.datFechaFin);
			document.getElementById('txtAreaFundamentos').value = Maestria.Fundamentos;
			document.getElementById('spLeftCharsFundamentos').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaFundamentos'), 1000);
			document.getElementById('txtAreaRequisitos').value = Maestria.RequisitosIngreso;
			document.getElementById('spLeftCharsRequisitos').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaRequisitos'), 500);
		}

		// Llenar el cbo para la selección de la provincia.
		function FillcboProvincia()
		{
			ISPCFG.Msce.clswfMaestria.FillcboProvincia(FillcboProvincia_CallBack);
		}
		// Llenar el cbo para la selección de la provincia.
		function FillcboProvincia_CallBack(res)
		{
			var boError = false;
			if(res.error!=null)
			{
				boError = true;
			}
			else
			{
				if (res.value == null || typeof(res.value) != "object")
				{
					boError = true;
				}
			}
			if(boError==true)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible recuperar los datos para la lista de las provincias.");
				res=null
				return;
			}
			SelectProvincia = document.getElementById('cboProvincia');
			SelectProvincia.options.length = 0; //reset the control dropdown  
			dataView = res.value;  
			var intIdIndex = 0;
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				intIdIndex = dataView.Rows[i].Id==intIdProvinciaActual?i:intIdIndex;
				SelectProvincia.options[SelectProvincia.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);       
			}
			SelectProvincia.selectedIndex = intIdIndex;
			// Mostrar ayudita so ya existen sedes, por los cual no se puede cambiar la provincia.
			if(SelectProvincia.options.length==1){document.getElementById('imgAyudita_cboProvincia').style.display='inline';}
			
			res=null;
		}

		// Llenar el cbo para la selección del Director.
		function FillcboDirector()
		{
			ISPCFG.Msce.clswfMaestria.FillcboDirector(FillcboDirector_CallBack);
		}
		// Llenar el cbo para la selección del Director.
		function FillcboDirector_CallBack(res)
		{
			var boError = false;
			if(res==null)
			{
				boError = true;			
			}
			if(!boError)
			{
				if(res.error!=null)
				{
					boError = true;
				}
			}
			if(!boError)
			{
				if (res.value == null || typeof(res.value) != "object")
				{
					boError = true;
				}
			}
			if(boError)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible recuperar los datos del director de la Maestría.");
				res=null;
				return;
			}
			  
			SelectDirector = document.getElementById('cboDirector');
			SelectDirector.options.length = 0; //reset the control dropdown  
			dataView = res.value;  
			var intIdIndex = 0;
			for(var i = 0; i < dataView.Rows.length; ++i)
			{
				intIdIndex = dataView.Rows[i].Id==intIdDirectorActual?i:intIdIndex;
				SelectDirector.options[SelectDirector.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);       
			}  
			SelectDirector.selectedIndex = intIdIndex;
			res=null;
		}
		
		// Llenar el cbo para la selección del Módulo actual.
		function FillcboModulo()
		{
			ISPCFG.Msce.clswfMaestria.FillcboModulo(FillcboModulo_CallBack);
		}
		// Llenar el cbo para la selección de la provincia.
		function FillcboModulo_CallBack(res)
		{
			var boError = false;
			if(res==null)
			{
				boError = true;			
			}
			if(!boError)
			{
				if(res.error!=null)
				{
					boError = true;
				}
			}
			if(!boError)
			{
				if (res.value == null || typeof(res.value) != "object")
				{
					boError = true;
				}
			}
			if(boError)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible recuperar los datos para la lista de los Módulos.");
				res=null;
				return;
			}
			
			SelectModulo = document.getElementById('cboModulo');
			SelectModulo.options.length = 0; //reset the control dropdown  
			dataView = res.value;  
			var intIdIndex = 0;
			for(var i = 0; i<=(dataView.Rows.length-1); ++i)
			{
				intIdIndex = dataView.Rows[i].Id==intIdModuloActual?i:intIdIndex;
				SelectModulo.options[SelectModulo.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);       
			}  

			// Siempre agregar, al final de la lista, la posibilidad de que se establezca 
			// que no existe módulo activo.
			SelectModulo.options[SelectModulo.options.length] = new Option('No hay módulo activo', 0);       
			// Mostrar Ayudita si no hay módulos registrados.
			if(SelectModulo.options.length==1){document.getElementById('imgAyudita_cboModulo').style.display='inline';}
			// Pero si 'intIdModuloActual' es cero (0), valor que se recupera de la tabla 
			// de configuraciones de la Maestría, entonces es que no se ha establecido 
			// ningún módulo como el activo para la Maestría.
			if(intIdModuloActual==0)
			{
				intIdIndex = (SelectModulo.options.length-1);
			}
			
			SelectModulo.selectedIndex = intIdIndex;
			res=null;
		}

		/*
			FUNCIONES PARA ACTUALIZACIÓN DE LOS DATOS GENERALES DE 
			LA MAESTRÍA	EN LA BASE DE DATOS DE LA APLICACIÓN.
		*/
		// Actualizar datos generales de la maestría.
		function ActualizaDatosGen()
		{
			// Si no son válidos los datos, entonces retornar.
			if(!valDocument()){return;}
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Obtener los datos de la Maestría a través de la propia clase.
			var res = ISPCFG.Msce.clswfMaestria.getMaestriaClass().value;
			var boError = false;
			if(res==null)
			{
				boError = true;			
			}
			if(!boError)
			{
				if(res.error!=null)
				{
					boError = true;
				}
			}
			if(boError)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible actualizar los datos de la maestría.");
				res=null;
				return;
			}
			
			Maestria = res;
			res = null;
			// Si se ha cambiado el Director de la Maestría.
			if(Maestria.IdUsuarioDirector!=document.getElementById('cboDirector').value)
			{
				boDirectorChanged = true;
				var strMsgChangingDirector =	"Usted está delegando la función de Director del comité académico.\n";
						strMsgChangingDirector +=	"El Director es la única persona con acceso a ésta y otras páginas,\n";   
						strMsgChangingDirector +=	"como concecuencia, usted será remitido a la página de inicio.\n";
						strMsgChangingDirector +=	"Está de acuerto?";
 
				if(!window.confirm(strMsgChangingDirector)){return;}
			}
			
			// Avisar que comienza el proceso de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando datos...';
			// Estableciendo los valores en el objeto Maestria que se enviará al servidor.
			Maestria.IdProvincia = document.getElementById('cboProvincia').value;
			Maestria.IdUsuarioDirector = document.getElementById('cboDirector').value;
			Maestria.Nombre = document.getElementById('txtNombre').value;
			Maestria.Hospedero = document.getElementById('txtHospedero').value;
			Maestria.Fundamentos = document.getElementById('txtAreaFundamentos').value;
			Maestria.RequisitosIngreso = document.getElementById('txtAreaRequisitos').value;
			Maestria.datFechaInicio = getDateFromString(document.getElementById('txtFechaInicio').value);
			Maestria.datFechaFin = getDateFromString(document.getElementById('txtFechaFin').value);
			Maestria.MatriculaAbierta = document.getElementById('cboMatricula').value==0?false:true;
			Maestria.IdModuloActual = document.getElementById('cboModulo').value;
			ISPCFG.Msce.clswfMaestria.ActualizaDatosGen(Maestria, ActualizaDatosGen_CallBack);
			Maestria=null;
		}
		// Actualizar datos generales de la maestría.
		function ActualizaDatosGen_CallBack(res)
		{
			var boError = false;
			if(res==null)
			{
				boError = true;			
			}
			if(!boError)
			{
				if(res.error!=null)
				{
					boError = true;
				}
			}
			if(boError)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos generales de la Maestría. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.");
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return
			}
			document.getElementById('spEstadoActualizacion').innerHTML = 'Actualización efectuada.';
			res=null;
			if(boDirectorChanged){RedirectToInicio();}
		}
		
		/**** FIN DE LOS PROCEDIMIENTOS AJAX ****/

		// Llenar el cbo para el estado de la matrícula.
		function FillcboMatricula()
		{
			SelectMatricula = document.getElementById('cboMatricula');
			SelectMatricula.options.length = 0; //reset the control dropdown  
			if(intIdMatriculaAbierta!=null)
			{
				SelectMatricula.options[SelectMatricula.options.length] = new Option("Abierta", 1);
				SelectMatricula.options[SelectMatricula.options.length] = new Option("Cerrada", 0);
				SelectMatricula.selectedIndex = intIdMatriculaAbierta==1?0:1;
			}
		}

		function FillPageData()
		{
			// Obtener los datos de la maestría actual de la clase Maestria devuelta por este procedimiento.
			getMaestriaClass();
			// Llenar el cbo para la selección de la provincia.
			FillcboProvincia();
			// Llenar el cbo para la selección del Director.
			FillcboDirector();
			// Llenar el cbo para la selección del Módulo actual.
			FillcboModulo();
			// Llenar los datos del cboMatricula
			FillcboMatricula();
			// Limpiar el mensaje de datos actualizados si es que tiene contenido.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Ocultar todos los mensajes de validación.
			resetAllValMessages();
		}

		// Llenar esta página con los datos que le corresponden.
		FillPageData();

		/*
			FUNCIONES PARA VALIDACIÓN
		*/
		
		// Esta se encuentra en "main.js"
		// function valEmptyString(sender, objMessageLabel, strMessage)

		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valDocument()
		{
			boResult = false;
			// Validar txtNombre.
			var validNombre = valEmptyString(document.getElementById('txtNombre'), document.getElementById('spValNombre'), "El campo \"Nombre\" no puede estar vacío.");
			// Validar txtHospedero.
			var validHospedero = valEmptyString(document.getElementById('txtHospedero'), document.getElementById('spValHospedero'), "El campo \"Hospedero\" no puede estar vacío.");
			// Validar txtAreaRequisitos.
			var validRequisitos = valEmptyString(document.getElementById('txtAreaRequisitos'), document.getElementById('spValRequisitos'), "El campo \"Requisitos\" no puede estar vacío.");
			// Validar txtAreaFundamentos.
			var validFundamentos = valEmptyString(document.getElementById('txtAreaFundamentos'), document.getElementById('spValFundamentos'), "El campo \"Fundamentos\" no puede estar vacío.");
			// Validar fechas.
			var validFechas = valFechas(null);
			var boResult = (validNombre==true) & (validHospedero==true) & (validRequisitos==true) & (validFundamentos==true) & (validFechas==true);
			if(boResult){resetAllValMessages;}
			return boResult;
		}
		
		/*
			VALIDAR LAS FECHAS DE INICIO Y FIN DE LA MAESTRÍA.
			Esta función valida las fechas desde el punto de vista 
			del formato, que debe ser: dd-mmm-aaaa y también advierte
			que la fecha de fin tiene que ser mayor que la de inicio.
		*/
		function valFechas(sender)
		{
			// Controles input con las supuestas fechas en string.
			var inputFechaInicio = document.getElementById('txtFechaInicio');
			var inputFechaFin = document.getElementById('txtFechaFin');
			// Elementos <span> para mensaje de validación.
			var valFechaInicio = document.getElementById('spValFechaInicio');
			var valFechaFin = document.getElementById('spValFechaFin');
			// Fechas obtenidas según valores string de los input.
			var datFechaInicio = new Date();
			var datFechaFin = new Date;
			// Variable para el resultado.
			var boResult = true;
			// La fecha de hoy.
			var today = new Date();
			
			// Ocultar los controles de validación.
			valFechaInicio.style.display = 'none';
			valFechaFin.style.display = 'none';
			
			// Validando FechaInicio
			try
			{
				datFechaInicio = getDateFromString(inputFechaInicio.value);
			}
			catch(ExFechaInicio)
			{
				valFechaInicio.innerHTML = ExFechaInicio.toString();
				valFechaInicio.style.display = 'block';
				boResult = false;
			}
			// Validando FechaFin
			try
			{
				datFechaFin = getDateFromString(inputFechaFin.value);
			}
			catch(ExFechaFin)
			{
				valFechaFin.innerHTML = ExFechaFin.toString();
				valFechaFin.style.display = 'block';
				boResult = false;
			}

			// Si no se muestran ninguno de los controles para mensajes de error.
			if(boResult==true)
			{
				//var datFechaInicio;
				//var datFechaFin;
				// Comparar las fechas.
				if(datFechaInicio>=datFechaFin)
				{
					boResult=false;
					if(sender!=null)
						if(sender==inputFechaInicio)
						{	
							valFechaInicio.innerHTML = "La fecha de inicio tiene que ser menor que la de finalización.";
							valFechaInicio.style.display='block';
						}
						else
						{
							valFechaFin.innerHTML = "La fecha de finalización tiene que ser mayor que la de inicio.";
							valFechaFin.style.display='block';
						}
					else
					{
							valFechaFin.innerHTML = "La fecha de finalización tiene que ser mayor que la de inicio.";
							valFechaFin.style.display='block';
					}
				}
			}
			return boResult;
		}
		
		// Ocultar todos los elementos <span> para mensajes de validación
		function resetAllValMessages()
		{
			var y = 0;
			var frm = document.forms[0];
			if(msie)
			{
				for (i=0; i<=(frm.all.length-1); i++) 
				{
					if(frm.all[i].id.indexOf('spVal') != -1) 
					{
						frm.all[i].innerHTML = '';
						frm.all[i].style.display = 'none';
					}
				}
			}
			else
			{
				for(i=0; i<=(document.all.length-1); i++)
				{
					if(document.all(i).tagName.toUpperCase()!="SPAN"){continue;}
					if(document.all(i).id.indexOf('spVal') != -1) 
					{
						document.all(i).innerHTML = '';
						document.all(i).style.display = 'none';
					}
				}
			}
		}


		//-->
		</script>


	</body>
</html>
