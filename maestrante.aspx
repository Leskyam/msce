<%@ Page language="c#" Codebehind="maestrante.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfMaestrante" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title>Maestría: Maestrantes</title>
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
		<form id="frm_Maestrante" method="post" runat="server">
			<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr>
					<td><!-- CONTROL PARA EL ENCABEZADO, QUE INCLUYE LOS CONTROLES PARA IDENTIFICACIÓN DE USUARIO --><uc1:wucheader id="ctlHeader" runat="server"></uc1:wucheader></td></tr>
				<tr>
					<td><!-- CONTROL PARA LA BARRA DE OPCIONES DEL ENCABEZADO --><uc1:wucheadernavbar id="ctlHeaderNavBar" runat="server"></uc1:wucheadernavbar></td></tr></table>
			<table id="Table2" cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr id="tr_Notify" style="DISPLAY: none" height="0" runat="server">
					<td width="750"><span class="spErrorNotification" id="sp_Notify" style="MARGIN-BOTTOM: 1px" runat="server"></span></td></tr>
				<tr valign="top">
					<td> <!-- BODY TABLE; BEGIN -->
						<table id="Table3" cellspacing="0" cellpadding="0" width="750" border="0">
							<tr valign="top">
								<td valign="top" align="right">
									<!-- Control Web para las opciones de la izquierda --><uc1:wucleftoptions id="ctlLeftOptions" runat="server"></uc1:wucleftoptions></td>
								<td> <!-- MAIN WINDOW; BEGIN -->
									<table id="Table4" cellspacing="0" cellpadding="0" width="545" border="0">
										<tr valign="top">
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">MAESTRANTES</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MAESTRANTES -->
															<table id="tbl_Edit" align="center" width="100%" border="0" style="DISPLAY: none">
																<!-- txtNombre (también se define el ancho de cada una de las columnas) -->
																<tr valign="top">
																	<td align="left" width="35%"><label for="txtNombre">Nombre:</label></td>
																	<td align="left" width="65%">
																		<input id="txtNombre" class="frmTextInput" style="WIDTH: 100%" maxlength="50" type="text" onchange="JavaScript:valEmptyString(this, document.getElementById('spValNombre'), 'El campo \'\'Nombre\'\' no puede estar vacío.');getNewUserId();">
																		<span class="spErrorNotification" id="spValNombre"></span>
																	</td>
																</tr>
																<!-- txtApellidos -->
																<tr valign="top">
																	<td align="left"><label for="txtApellidos">Apellidos:</label></td>
																	<td align="left">
																		<input id="txtApellidos" class="frmTextInput" style="WIDTH: 100%" maxlength="75" type="text" onchange="JavaScript:valEmptyString(this, document.getElementById('spValApellidos'), 'El campo \'\'Apellidos\'\' no puede estar vacío.');getNewUserId();">
																		<span class="spErrorNotification" id="spValApellidos"></span>
																	</td>
																</tr>
																<!-- cboSexo -->
																<tr valign="top">
																	<td align="left"><label for="cboSexo">Sexo:</label></td>
																	<td align="left"><select id="cboSexo" class="frmTextInput"><option value="F" selected>Femenino</option><option value="M">Masculino</option></select></td>
																</tr>
																<!-- txtEmail -->
																<tr valign="top">
																	<td align="left"><label for="txtEmail">E-mail:</label></td>
																	<td align="left">
																		<input id="txtEmail" class="frmTextInput" style="WIDTH: 100%" maxlength="75" type="text" onchange="JavaScript:valEmail();">
																		<span class="spErrorNotification" id="spValEmail"></span>
																	</td>
																</tr>
																<!-- txtUserId -->
																<tr valign="top">
																	<td align="left"><label for="txtUserId">Id de usuario:</label></td>
																	<td align="left">
																		<input id="txtUserId" class="frmTextInput" maxlength="25" type="text" onchange="JavaScipt:valUserId()">
																		<span><input id="chkUserIdBySystem" type="checkbox" onclick="JavaScript:chkUserIdBySystemChange(this);" class="frmCheckInput" tabindex="-1"><label id="lblUserIdBySystem" for="chkUserIdBySystem">Dejar
																				que el sistema decida</label></span>
																		<span class="spErrorNotification" id="spValUserId"></span>
																	</td>
																</tr>
																<!-- txtPassword1 -->
																<tr valign="top">
																	<td align="left"><label for="txtPassword1">Contraseña:</label></td>
																	<td align="left">
																		<input id="txtPassword1" class="frmTextInput" maxlength="16" type="password" onchange="JavaScript:valPasswords();">
																		<span><input id="chkPasswordBySystem" type="checkbox" onclick="JavaScript:chkPasswordBySystemChange(this);" class="frmCheckInput" tabindex="-1"><label id="lblPasswordBySystem" for="chkPasswordBySystem" title="El sistema genera y envía por correo la contraseña.">Dejar
																				que el sistema decida</label>
																		</span>
																		<span class="spErrorNotification" id="spValPassword1"></span>
																	</td>
																</tr>
																<!-- txtPassword2 -->
																<tr valign="top">
																	<td align="left"><label for="txtPassword2">Repetir contraseña:</label></td>
																	<td align="left">
																		<input id="txtPassword2" class="frmTextInput" maxlength="16" type="password" onchange="JavaScript:valPasswords();">
																		<span class="spErrorNotification" id="spValPassword2"></span>
																	</td>
																</tr>
																<!-- txtCentroTrabajo -->
																<tr valign="top">
																	<td align="left"><label for="txtCentroTrabajo">Centro de trabajo:</label></td>
																	<td align="left">
																		<input id="txtCentroTrabajo" class="frmTextInput" style="WIDTH: 100%" maxlength="150" type="text" onchange="JavaScript:valEmptyString(this, document.getElementById('spValCentroTrabajo'), 'El campo \'\'Centro de trabajo\'\' no puede estar vacío.');">
																		<span class="spErrorNotification" id="spValCentroTrabajo"></span>
																	</td>
																</tr>
																<!-- txtFuncion -->
																<tr valign="top">
																	<td align="left"><label for="txtFuncion">Función que desempeña:</label></td>
																	<td align="left">
																		<input id="txtFuncion" class="frmTextInput" style="WIDTH: 100%" maxlength="150" type="text" onchange="JavaScript:valEmptyString(this, document.getElementById('spValFuncion'), 'El campo \'\'Función que desempeña\'\' no puede estar vacío.');">
																		<span class="spErrorNotification" id="spValFuncion"></span>
																	</td>
																</tr>
																<!-- cboCuentaBloqueada -->
																<tr valign="top">
																	<td align="left"><label for="cboCuentaBloqueada">Cuenta bloqueada:</label></td>
																	<td align="left"><select id="cboCuentaBloqueada" class="frmTextInput"><option selected value="0">No</option><option value="1">Sí</option></select></td>
																</tr>
																<!-- cboPerfilPublico -->
																<tr valign="top">
																	<td align="left"><label for="cboPerfilPublico">Perfil público:</label></td>
																	<td align="left"><select id="cboPerfilPublico" class="frmTextInput"><option value="0">No</option><option value="1" selected>Sí</option></select></td>
																</tr>
																<!-- txtNoCI -->
																<tr valign="top">
																	<td align="left"><label for="txtNoCI">Carnet de identidad:</label></td>
																	<td align="left">
																		<input id="txtNoCI" class="frmTextInput" style="WIDTH: 100%" maxlength="12" type="text" onchange="JavaScript:valNoCI();">
																		<span class="spErrorNotification" id="spValNoCI"></span>
																	</td>
																</tr>
																<!-- cboGrupo -->
																<tr valign="top">
																	<td align="left"><label for="cboGrupo">Grupo:</label></td>
																	<td align="left">
																		<select id="cboGrupo" class="frmTextInput"></select>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1"></hr>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS BOTONES -->
															<table id="tbl_Buttoms" width="100%" align="center" border="0">
																<tr valign="top">
																	<td align="left">
																		<span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left">Estado
																			de la actualización</span>
																	</td>
																	<td align="right">
																		<a id="lnkNuevo" title="Agregar un nuevo usuario." href="JavaScript:Nuevo();"><img id="imgNuevo" title="Agregar un nuevo usuario." alt="Nuevo" src="imagenes/btn_nuevo.gif" border="0"></a>
																		<a id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif" border="0"></a>
																		<a id="lnkCancelar" title="Cancelar" href="JavaScript:Cancelar();">&nbsp;<img id="imgCancelar" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LA LISTA DE LOS MAESTRANTES -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<!-- LÍNEA DIVISORIA AL PIE DE LOS BOTONES -->
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1"></hr>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS USUARIOS -->
																		<span id="dvListaMaestrantes"></span>
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
		
		/*
			DECLARACIÓN E INICIALIZACIÓN DONDE CORRESPONDA DE LAS VARIABLES LOCALES.
		*/
		// Modo: para tomar los valores: "Disabled" ó "Listar" ó "Nuevo" ó "Editar", que
		// indican la operación actual del webForm.
		// IdEditado: para tomar el valor del Id del maestrante que se está editando
		// struMaestrante: para almacenar la estructura que nos permite guargar los datos 
		// para las actualizaciones e inserciones de nuevos Maestrantes.
		var settings = {"Modo":													'Listar',
										"IdEditado":										null,
										"NoCIEditado":									null,
										"UserIdEditado":								null,
										"struMaestrante":								null,
										"IdGrupoActivo":								0};
		/*
			OBTENER TODOS LOS REGISTROS DE LOS MAESTRANTES PARA SER MOSTRADOS EN LA TABLA 'tbl_List'.
		*/
		function listarAllMaestrantes()
		{
			// Establecer el modo del formulario.
			settings.Modo = 'Listar';
			// Cambiar el modo del formulario.
			switchView();
			// Obtener los datos de los módulos.
			var res = ISPCFG.Msce.clswfMaestrante.getAllMaestrantes().value;
			// Verificar que no exista error.
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
				if(typeof(res)!='object')
				{
					boError = true;
				}
			}
			if(boError)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido recuperar los datos para la lista de los maestrantes. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;
			}
			
			var dvMaestrantes = res;
			res=null;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divListaMaestrantes = document.getElementById('dvListaMaestrantes')
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvMaestrantes.Rows.length==0)
			{
				Nuevo();
				document.getElementById('tbl_List').style.display = 'block';
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divListaMaestrantes.innerHTML = "<b>NO EXISTEN MAESTRANTES REGISTRADOS.</b>";
				dvMaestrantes = null;
				return;
			}
			// Formar el encabezado de la tabla de la lista de los maestrantes.
			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"bottom\">\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"20%\"><b>Acciones</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"50%\"><b>Nombre y apellidos</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"20%\"><b>Id de usuario</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"10%\"><b>Acceso</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			// Formar el cuerpo de la tabla de la lista de los maestrantes.
			var strHTML_Body = '';
			for(var i=0; i<=(dvMaestrantes.Rows.length-1); ++i)
			{
				var Id = dvMaestrantes.Rows[i].Id;
				var NombreCompleto = dvMaestrantes.Rows[i].Nombre;
				var UserId = dvMaestrantes.Rows[i].UserId;
				var Acceso = dvMaestrantes.Rows[i].CuentaBloqueada!=true?'Permitido':'Denegado';
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr id=\"trAcademico" + Id + "\" valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td width=\"20%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;</td>\n";
				strHTML_Body += "\t\t\t<td width=\"50%\" id=\"NombreCompleto" + Id + "\">" + NombreCompleto + "</td>\n";
				strHTML_Body += "\t\t\t<td width=\"20%\" id=\"UserId" + Id + "\">" + UserId + "</td>\n";
				strHTML_Body += "\t\t\t<td width=\"10%\" id=\"Acceso" + Id + "\">" + Acceso + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
			}
			strHTML_Foot = "</table>\n";
			divListaMaestrantes.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			dvMaestrantes=null; 
		}
		
		function Nuevo()
		{
			settings.Modo = 'Nuevo';
			// Cambiar de vista el webForm.
			switchView();
			// Resetear los valores de los Id de las categorías y de los títulos académicos,
			// para que el control se establezca en la primera opción.
			settings.IdGrupoActivo = 0;
			
			document.getElementById('txtNombre').value = ''; //'';	// Nombre.
			document.getElementById('txtApellidos').value = ''; //'';	// Apellidos.
			document.getElementById('cboSexo').selectedIndex = 0;	// Sexo (Femenino preestablecido).
			document.getElementById('txtEmail').value = ''; //dferrer@cfg.rimed.cu;	// e-mail.
			document.getElementById('txtUserId').value = '';	// Id de usuario.
			document.getElementById('chkUserIdBySystem').checked = true;
			chkUserIdBySystemChange(document.getElementById('chkUserIdBySystem'));
			document.getElementById('lblUserIdBySystem').innerHTML = "Permitir que el sistema decida";
			document.getElementById('txtPassword1').value = '';
			document.getElementById('txtPassword2').value = '';
			document.getElementById('chkPasswordBySystem').checked = false;
			chkPasswordBySystemChange(document.getElementById('chkPasswordBySystem'));
			document.getElementById('lblPasswordBySystem').innerHTML = "Permitir que el sistema decida";
			// Inhabilitar el checkBox para autogenerar contraseña.
			document.getElementById('chkPasswordBySystem').disabled = true;
			document.getElementById('txtCentroTrabajo').value = '';	// Centro de trabajo.
			document.getElementById('txtFuncion').value = '';	// Función en el centro de trabajo.
			document.getElementById('cboCuentaBloqueada').selectedIndex = 0;	// Cuenta bloqueada (Preestablecido el No).
			document.getElementById('cboPerfilPublico').selectedIndex = 1;	// Perfil público (Preestablecido el Sí).
			document.getElementById('txtNoCI').value = '';	// Carnet de identidad.
			fillListaGrupos(settings.IdGrupoActivo);

			document.getElementById('txtNombre').focus();
			resetAllValMessages();
		}
		
		function Editar(Id)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			document.getElementById('spEstadoActualizacion').innerHTML = 'Recuperando datos. Por favor, espere...';
			settings.IdEditado=Id;
			ISPCFG.Msce.clswfMaestrante.getMaestrante(Id, Editar_CallBack);
		}
		// Retorno de Editar(Id)
		function Editar_CallBack(res)
		{
			var boError = false;
			if(res.error!=null)
			{
				boError = true;
			}
			if(res.value==null || typeof(res.value)!='object')
			{
				boError = true;
			}
			if(boError)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido recuperar los datos del maestrante. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;
			}
			settings.Modo = 'Editar';
			switchView();
			var Maestrante = res.value;
			document.getElementById('txtNombre').value = Maestrante.Nombre;	// Nombre.
			document.getElementById('txtApellidos').value = Maestrante.Apellidos;	// Apellidos.
			document.getElementById('cboSexo').selectedIndex = Maestrante.Sexo=='F'?0:1;	// Sexo.
			document.getElementById('txtEmail').value = Maestrante.email;	// e-mail.
			document.getElementById('txtUserId').value = Maestrante.UserId;	// Id de usuario.
			settings.UserIdEditado = Maestrante.UserId; // Para cuando se solicita que se mantenga el UserId y el usuario ya lo había cambiado.
			document.getElementById('chkUserIdBySystem').checked = true;
			chkUserIdBySystemChange(document.getElementById('chkUserIdBySystem'));
			document.getElementById('lblUserIdBySystem').innerHTML = "Mantener Id de usuario";
			document.getElementById('txtPassword1').value = "password";
			document.getElementById('txtPassword2').value = "password";
			document.getElementById('chkPasswordBySystem').checked = true;
			document.getElementById('chkPasswordBySystem').disabled = false;
			chkPasswordBySystemChange(document.getElementById('chkPasswordBySystem'));
			document.getElementById('lblPasswordBySystem').innerHTML = "Mantener contraseña";
			document.getElementById('txtCentroTrabajo').value = Maestrante.CentroTrabajo;	// Centro de trabajo.
			document.getElementById('txtFuncion').value = Maestrante.Funcion;	// Función en el centro de trabajo.
			document.getElementById('cboCuentaBloqueada').selectedIndex = Maestrante.CuentaBloqueada;	// Cuenta bloqueada.
			document.getElementById('cboPerfilPublico').selectedIndex = Maestrante.PerfilPublico;	// Perfil público.
			document.getElementById('txtNoCI').value = Maestrante.NoCI;	// Funcion como academico.
			settings.NoCIEditado = Maestrante.NoCI;
			settings.IdGrupoActivo = Maestrante.IdGrupo;
			fillListaGrupos(settings.IdGrupoActivo);
			
			Maestrante = null;
		}
		
		function Actualizar()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Validar el documento.
			if(!valDocument()){return;}
			// Limpiar todos los elementos <span> de mensajes de error en datos.
			resetAllValMessages();
			
			if(settings.Modo=='Editar')
			{
				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando datos. Por favor, espere...';
			}
			else
			{
				document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando datos. Por favor, espere...';
			}
			// Obtener la estructura donde almacenaremos los datos del Académico.
			var res = settings.struMaestrante;
			if(res==null)
			{
				res = ISPCFG.Msce.clswfMaestrante.getStructMaestrante().value;
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
					if(typeof(res)!='object')
					{
						boError = true;
					}
				}
				if(boError)
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del maestrante. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					document.getElementById('spEstadoActualizacion').innerHTML = '';
					res = null;
					return;
				}
				else
				{
					settings.struMaestrante = res;
				}
			}
			var Maestrante = settings.struMaestrante;
			res = null;
			Maestrante.Nombre = document.getElementById('txtNombre').value;	// Nombre.
			Maestrante.Apellidos = document.getElementById('txtApellidos').value;	// Apellidos.
			Maestrante.Sexo = document.getElementById('cboSexo').value;	// Sexo.
			Maestrante.UserId = document.getElementById('txtUserId').value;	// Id de usuario.
			Maestrante.UserPass = document.getElementById('chkPasswordBySystem').checked?'':document.getElementById('txtPassword1').value;
			Maestrante.CentroTrabajo = document.getElementById('txtCentroTrabajo').value;	// Centro de trabajo.
			Maestrante.Funcion = document.getElementById('txtFuncion').value;	// Centro de trabajo.
			Maestrante.email = document.getElementById('txtEmail').value;	// e-mail.
			Maestrante.datUltimoAcceso = new Date();	// Fecha/Hora.
			Maestrante.CuentaBloqueada = document.getElementById('cboCuentaBloqueada').value;	// Cuenta bloqueada.
			Maestrante.PerfilPublico = document.getElementById('cboPerfilPublico').value;	// Perfil público.
			Maestrante.NoCI = document.getElementById('txtNoCI').value;	// NoCI.
			Maestrante.IdGrupo = document.getElementById('cboGrupo').value;
			
			if(settings.Modo=='Editar')
			{
				Maestrante.Id = settings.IdEditado;
				ISPCFG.Msce.clswfMaestrante.Actualizar(Maestrante, Actualizar_CallBack);
				Maestrante = null;
				return;
			}
			else
			{
				ISPCFG.Msce.clswfMaestrante.Agregar(Maestrante, Actualizar_CallBack);
				Maestrante = null;
				return;
			}
		}
		// Retorno de Actualizar()
		function Actualizar_CallBack(res)
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
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del maestrante. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;
			}
			if(settings.Modo=='Editar')
			{
				if(res.value==false)
				{
					strErrorMessage = "Estimado usuario, no se han actualizado los datos del maestrante, sin embargo, no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					document.getElementById('spEstadoActualizacion').innerHTML = '';
					res=null;
					return;
				}
				else
				{
					listarAllMaestrantes();
					document.getElementById('spEstadoActualizacion').innerHTML = 'Actualización efectuada.';
					return;
				}
			}
			else
			{
				var boError = false;
				if(res.value[0]==false)
				{
					var strErrorMessage = "Estimado usuario, NO SE HA REGISTRADO EL NUEVO MAESTRANTE, sin embargo, no se ha reportado ningún error. es probable que el maestrante ya exista registrado, revise la lista de maestrantes, si no aparece, le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					document.getElementById('spEstadoActualizacion').innerHTML = '';
					boError = true;
				}
				if(res.value[0]==true & res.value[1]==false & document.getElementById('chkPasswordBySystem').checked)
				{
					listarAllMaestrantes();
					var strErrorMessage = "Estimado usuario, SE HA REGISTRADO EL NUEVO MAESTRANTE, sin embargo, no se le ha podido enviar el correo de notificación que contiene la contraseña y otros datos. NO ES NECESARIO QUE REGISTRE LOS DATOS DEL MAESTRANTE NUEVAMENTE. Le recomendamos que edite los datos del mismo, cambie la contraseña y le notifique personalmente.";
					document.getElementById('spEstadoActualizacion').innerHTML = 'Maestrante registrado.';
					boError = true;
				}
				if(boError==true)
				{
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					res=null;
					return;
				}
					res=null;
					Nuevo();
					document.getElementById('spEstadoActualizacion').innerHTML = 'Maestrante registrado.';
					return;
			}
		}
		
		function Eliminar(Id)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar el área de notificación de actualizaciones.
			document.getElementById('spEstadoActualizacion').innerHTML = 'Comprobando si puede ser eliminado...';
			var res = ISPCFG.Msce.clswfMaestrante.canBeDeleted(Id).value;
			if(res==null || res.error!=null)
			{
				var strErrorMessage = "No se pudo comprobar si este maestrante puede ser eliminado.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res = null;
				return;
			}
			if(res==false)
			{
				document.getElementById('spEstadoActualizacion').innerHTML = 'No se puede eleiminar. Recuperando causa(s)...';
				var strWarning = ISPCFG.Msce.clswfMaestrante.WhyCanNotBeDeleted(Id).value;
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				if(strWarning==null || strWarning.error!=null)
				{
					var strErrorMessage = "No se pudo recuperar las razones por las que este maestrante no puede ser eliminado.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					res = null;
					return;
				}
				// Ciclo para mostrar los errores.
				for(x=0; x<=(strWarning.length-1); x++)
				{
					boOmitirCloseButton = (x==(strWarning.length-2));
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'El registro de este maestrante no puede ser eliminado por la(s) siguiente causa.', strWarning[x], boOmitirCloseButton);
				}
				res = null;
				strWarning = null;
				return;
			}
			else
			{
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				if(!window.confirm("Se eliminarán los datos del maestrante seleccionado.")){return;}
				document.getElementById('spEstadoActualizacion').innerHTML = 'Eliminando registro del maestrante...';
				ISPCFG.Msce.clswfMaestrante.Eliminar(Id, Eliminar_CallBack);
				res = null;
			}
		}
		// Retorno de Eliminar(Id)
		function Eliminar_CallBack(res)
		{
			if(res==null || res.error!=null)
			{
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar el registro del maestrante. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				var strWarning = "Estimado usuario, no se ha podido eliminar el registro del maestrante, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
				res = null;
				return;
			}
			else
			{
				res = null;
				listarAllMaestrantes();
				document.body.scrollTop = 0;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Maestrante eliminado.';
			}
		}

		function Cancelar()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar todos los elementos <span> de mensajes de error en datos.
			resetAllValMessages()
			// Este procedimientos refresca la lista de los maestrantes y muestra la misma.
			listarAllMaestrantes();
		}

		// Llenar el cbo de las categorías maestrantes.
		function fillListaGrupos(IdActivo)
		{
			var refCbo = document.getElementById('cboGrupo');
			// Si el cbo ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCbo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfMaestrante.getListaGrupos()
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
					if(typeof(res)!='object')
					{
						boError = true;
					}
				}
				if(boError==true)
				{
					trNotify = document.getElementById('tr_Notify');
					spNotify = document.getElementById('sp_Notify');
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los grupos.");
					res=null;
					return;
				}
				dataView = res.value;  
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
				var Nombre = dataView.Rows[i].Nombre + " (SEDE: " + dataView.Rows[i].Sede + ")";
					refCbo.options[refCbo.options.length] = new Option(Nombre, dataView.Rows[i].Id);
				}
				res=null;			
			}
			// Pero al final siempre que se esté editando tratamos de establecer el 
			// valor de selectedIndex para que se corresponda con la sede que se esté editando.
			if(settings.Modo=='Editar'||settings.Modo=='Nuevo'){setIndexInCbo(refCbo, IdActivo);}
		}
	
		// Establecer el índice activo.
		function setIndexInCbo(sender, IdActivo)
		{
			if(sender.options.length==0){return;}
			for(var i = 0; i<=(sender.options.length-1); i++)
			{
				if(sender.options[i].value==IdActivo){sender.selectedIndex=i;return;}
			}
		}
	
		/*
			ESTABLECE LA VISIBILIDAD DE LOS BOTONES: Nuevo, Actualizar y Cancelar.
		*/
		function setButtomsVisibility()
		{
			var btnNuevo = document.getElementById('lnkNuevo');
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			// Se espera que la variables: settings.Mode tenga uno de los  
			// siguientes valores: "Disabled" ó "Listar" ó "Nuevo" ó "Editar".
			switch(settings.Modo)
			{
				case 'Editar':
				case 'Nuevo':
				{
					btnNuevo.style.display = 'none';
					btnActualizar.style.display = 'inline';
					btnCancelar.style.display = 'inline';
					break;					
				}
				case 'Listar':
				{
					btnNuevo.style.display = 'inline';
					btnActualizar.style.display = 'none';
					btnCancelar.style.display = 'none';
					break;
				}
				case 'Disabled':
				{
					btnNuevo.style.display = 'none';
					btnActualizar.style.display = 'none';
					btnCancelar.style.display = 'none';
				}
			}
		}
		
		function chkUserIdBySystemChange(sender)
		{
			var textUserId = document.getElementById('txtUserId')
			textUserId.className=sender.checked?'frmTextInput_disabled':'frmTextInput';
			textUserId.disabled=sender.checked;
			if(!sender.checked)
			{
				textUserId.focus();
			}
			else
			{
				if(settings.Modo=='Editar'){textUserId.value=settings.UserIdEditado;}
				getNewUserId();
				document.getElementById('spValUserId').style.display='none';
			}
		}

		function chkPasswordBySystemChange(sender)
		{
			var textPassword1 = document.getElementById('txtPassword1');
			var textPassword2 = document.getElementById('txtPassword2');
			if(document.getElementById('txtEmail').value!='')
			{
				textPassword1.value=textPassword2.value=sender.checked?'password':'';
			}
			textPassword1.className=textPassword2.className=sender.checked?'frmTextInput_disabled':'frmTextInput';
			textPassword1.disabled=textPassword2.disabled=sender.checked;
			if(!sender.checked)
			{
				textPassword1.focus();
			}
			else
			{
				document.getElementById('spValPassword1').style.display = 'none';
				document.getElementById('spValPassword2').style.display = 'none';
			}
		}
		
		function switchView()
		{
			tableEdit = document.getElementById('tbl_Edit');
			tableList = document.getElementById('tbl_List');
			switch(settings.Modo)
			{
				case 'Editar':
				case 'Nuevo':
				{
					tableList.style.display='none';
					tableEdit.style.display='block';
					document.getElementById('txtNombre').focus();
					break;
				}
				case 'Listar':
				case 'Disabled':
				{
					// Se aplica a 'Disabled' porque se deja ver la tabla de la Lista de 
					// académcios para mostrar el mensaje de que el formulario no es funcional.
					tableEdit.style.display='none';
					tableList.style.display='block';
					break;
				}
				default:
				{
					alert('Se te olvidó establecer el Modo en settings');
				}
			}
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Al cambiar de vista siempre limpiar las notificaciones.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Establecer al visibilidad de los botones de acuerdo a la vista actual.
			setButtomsVisibility();
		}
		
		// Recupera y establece en el control txtUserId el valor del UserId 
		// propuesto por el sistema, sólo si el webForm está en modo 'Nuevo'.
		function getNewUserId()
		{
			if(document.getElementById('chkUserIdBySystem').checked & settings.Modo=='Nuevo')
			{
				var Nombre = document.getElementById('txtNombre');
				var Apellidos = document.getElementById('txtApellidos');
				var regExp = new RegExp("^[ ]{1,}$"); // Espacios en blanco (desde 1...n).
				if((Nombre.value!='' & !regExp.test(Nombre.value)) & (Apellidos.value!='' & !regExp.test(Apellidos.value)))
				{
					ISPCFG.Msce.clswfMaestrante.getNewUserId(Nombre.value, Apellidos.value, getNewUserId_CallBack)
				}
			}
		}
		// Retorno de getNewUserId()
		function getNewUserId_CallBack(res)
		{
			if(res.error!=null || res.value==null)
			{
				document.getElementById('chkUserIdBySystem').checked=false;
				chkUserIdBySystemChange(document.getElementById('chkUserIdBySystem'));
				res=null;
				return;
			}
			document.getElementById('txtUserId').value = res.value;
			res=null;
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

		/*
			VALIDACIONES
		*/
		// Esta se encuentra en "main.js"
		// function valEmptyString(sender, objMessageLabel, strMessage)
		
		function valByPatern(sender, strPatern)
		{
			var regExp = new RegExp(strPatern);
			return (sender.value.match(regExp));
		}
				
		function valEmailFormat(sender)
		{
			if(sender.value==''){return false;}
			if(!valByPatern(sender, "^[A-Za-z0-9_-]{1,}[\@]{1}([A-Za-z0-9_-]{1,}[\.]{1}[A-Za-z0-9_-]{1,}){1,}$"))
			{
				document.getElementById('spValEmail').innerHTML = 'El formato de la dirección electrónica no es correcto.';
				document.getElementById('spValEmail').style.display='block';
				return false;
			}
			document.getElementById('spValEmail').innerHTML = '';
			document.getElementById('spValEmail').style.display = 'none';
			
			chkPassBySystem = document.getElementById('chkPasswordBySystem');
			chkPassBySystem.disabled = false;
			return true;
		}
		
		function valEmail()
		{
			var textEmail = document.getElementById('txtEmail');
			if(textEmail.value=='')
			{
				if(settings.Modo!='Editar')
				{
					chkPassBySystem = document.getElementById('chkPasswordBySystem');
					chkPassBySystem.checked = false;
					chkPasswordBySystemChange(chkPassBySystem);
					chkPassBySystem.disabled = true;
				}
				return true;
			}
			return valEmailFormat(textEmail);
		}
		
		function valPasswords()
		{
			//alert(document.getElementById('txtPassword1').value);
			//Comprobar que no esten vacíos los campos.
			if(!valEmptyString(document.getElementById('txtPassword1'), document.getElementById('spValPassword1'), "El campo \"Contraseña\" no puede estar vacío.")){return false;}
			if(!valEmptyString(document.getElementById('txtPassword2'), document.getElementById('spValPassword2'), "El campo \"Repetir contraseña\" no puede estar vacío.")){return false;}
			//Comprobar que no sean diferentes los valores.
			if(document.getElementById('txtPassword1').value.toUpperCase()!=document.getElementById('txtPassword2').value.toUpperCase())
			{
				document.getElementById('spValPassword2').innerHTML = 'Las contraseñas no coinciden.';
				document.getElementById('spValPassword2').style.display = 'block';
				return false;			
			}

			document.getElementById('spValPassword2').innerHTML = '';
			document.getElementById('spValPassword2').style.display = 'none';
			return true;			

		}
		
		function valUserIdFormat()
		{
			if(!valByPatern(document.getElementById('txtUserId'),"^[A-Za-z0-9_]{5,}$"))
			{
				document.getElementById('spValUserId').innerHTML = "El \"Id de usuario\" sólo admite los caracteres: a-z; A-Z; 0-9 y subreyado (_), no menor de cinco (5) de ellos y sin espacios.";
				document.getElementById('spValUserId').style.display = 'block';
				return false;
			}
			return true;
		}
		
		function valUserId()
		{
			var textUserId = document.getElementById('txtUserId');
			if(!(textUserId.disabled))
			{
				// Validar que no esté vacío.
				if(!valEmptyString(textUserId, document.getElementById('spValUserId'), "El campo \"Id de usuario \" no puede estar vacío.")){return false;}
				// Validar que cumla con el formato.
				if(!valUserIdFormat()){return false;}
			}
			
			if((settings.Modo=='Nuevo') & !(textUserId.disabled))
			{
					res = ISPCFG.Msce.clswfMaestrante.existUserId(0, textUserId.value).value;
					if(res.error!=null || res==null)
					{
						strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido comprobar si existe el \"Id de usuario\" que propone para el maestrante. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
						ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
						res = null;
						return false;
					}
					if(res==true)
					{
						document.getElementById('spValUserId').innerHTML = "El \"Id de usuario\" seleccionado ya exite. Elija otro.";
						document.getElementById('spValUserId').style.display = 'block';
						return false;
					}
			}
			if((settings.Modo=='Editar') & !(textUserId.disabled) & (textUserId.value!=settings.UserIdEditado))
			{
					res = ISPCFG.Msce.clswfMaestrante.existUserId(settings.IdEditado, textUserId.value).value;
					if(res.error!=null || res==null)
					{
						strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido comprobar si existe el \"Id de usuario\" que propone para el maestrante. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
						ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
						res = null;
						return false;
					}
					if(res==true)
					{
						document.getElementById('spValUserId').innerHTML = "El \"Id de usuario\" seleccionado ya exite. Elija otro.";
						document.getElementById('spValUserId').style.display = 'block';
						return false;
					}
			}
			document.getElementById('spValUserId').innerHTML = '';
			document.getElementById('spValUserId').style.display = 'none';
			return true;
		}	

		function valNoCI()
		{
			textNoCI = document.getElementById('txtNoCI');
			spanVal = document.getElementById('spValNoCI');
			if(!valEmptyString(textNoCI, spanVal, "El campo \"Carnet de identidad\" no puede estar vacío.")){return false;}
			if(!valByPatern(textNoCI,"^[0-9]{11}[A-Za-z]{0,1}$"))
			{
				spanVal.innerHTML = "El \"Carnet de identidad\" debe ser de once (11) dígitos. Se puede añadir un (1) caracter letra si es necesario, al final.";
				spanVal.style.display = 'block';
				textNoCI.focus();
				return false;
			}
			// Validación contra el servidor
			if((settings.Modo=='Nuevo'))
			{
					res = ISPCFG.Msce.clswfMaestrante.existNoCI(0, textNoCI.value).value;
					if(res.error!=null || res==null)
					{
						strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido comprobar si ya existe el \"Carnet de identidad\" que propone para el maestrante. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
						ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
						res = null;
						return false;
					}
					if(res==true)
					{
						spanVal.innerHTML = "El \"Carnet de identidad\" seleccionado ya exite. Si este es el caso en que coincidentemente se repite, puede agregar al final una letra, de lo contrario, elija otro.";
						spanVal.style.display = 'block';
						return false;
					}
			}
			if((settings.Modo=='Editar') & (textNoCI.value!=settings.NoCIEditado))
			{
					res = ISPCFG.Msce.clswfMaestrante.existNoCI(settings.IdEditado, textNoCI.value).value;
					if(res.error!=null || res==null)
					{
						strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido comprobar si existe el \"Carnet de identidad\" que propone para el maestrante. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
						ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
						res = null;
						return false;
					}
					if(res==true)
					{
						spanVal.innerHTML = "El \"Carnet de identidad\" seleccionado ya exite. Si este es el caso en que coincidentemente se repite, puede agregar al final una letra, de lo contrario, elija otro.";
						spanVal.style.display = 'block';
						return false;
					}
			}
			// Fin
			
			spanVal.innerHTML = '';
			spanVal.style.display = 'none';
			return true;

		}
		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valDocument()
		{
			resetAllValMessages();
			/*
			 El orden de las calidaciones se invierte para que el foco() se quede en el control 
			 que se encuentre en la parte más superior, en caso que hallan varios que no 
			 contengan datos válidos.
			*/
			var val8 = valNoCI();
			var val7 = valEmptyString(document.getElementById('txtFuncion'), document.getElementById('spValFuncion'), "El campo \"Función que desempeña\" no puede estar vacío.");
			var val6 = valEmptyString(document.getElementById('txtCentroTrabajo'), document.getElementById('spValCentroTrabajo'), "El campo \"Centro de trabajo\" no puede estar vacío.");
			var val5 = valPasswords();
			var val4 = valUserId();
			var val3 = valEmail();
			var val2 = valEmptyString(document.getElementById('txtApellidos'), document.getElementById('spValApellidos'), "El campo \"Apellidos\" no puede estar vacío.");
			var val1 = valEmptyString(document.getElementById('txtNombre'), document.getElementById('spValNombre'), "El campo \"Nombre\" no puede estar vacío.");
			//var val8 = valEmptyString(document.getElementById('txtNoCI'), document.getElementById('spValNoCI'), "El campo \"Carnet de identidad\" no puede estar vacío.");
			var boResult = false;
			boResult = (val1==true)&(val2==true)&(val3==true)&(val4==true)&(val5==true)&(val6==true)&(val7==true)&(val8==true);
			//alert("2: " + val2 + " 3: " + val3 + " 4: " + val4 + " 5: " + val5 + " 6: " + val6 + " 7: " + val7 + " 8: " + val8);
			return boResult;
		}
		
		function disableForm()
		{
			settings.Modo = 'Disabled';
			switchView();
			var strMessage	= MSG_PROCESSING_BEGTAG;
					strMessage += "<b>PARA QUE ESTE FORMULARIO SEA COMPLETAMENTE FUNCIONAL ES ";
					strMessage += "NECESARIO QUE ESTEN REGISTRADOS DE ANTEMANO LOS \"Grupos\" ";
					strMessage += "QUE CORRESPONDAN.</b>";
					strMessage += MSG_ENDTAG;
			document.getElementById('dvListaMaestrantes').innerHTML = strMessage;
		}

		/*
			INICIALIZAR DOCUMENTO
		*/
		listarAllMaestrantes();
		
		//-->
		</script>

	</body>
</html>
