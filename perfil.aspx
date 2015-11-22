<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Page language="c#" Codebehind="perfil.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfPerfil" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Perfil</title>
		<meta content="False" name="vs_snapToGrid">
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
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"><!-- PAGE TABLE; BEGIN -->
		<form id="frm_Academico" method="post" runat="server">
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">PERFIL</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS ACADÉMICOS -->
															<table id="tbl_Generales1" width="100%" align="center" border="0" style="DISPLAY: none">
																<!-- txtNombre (también se define el ancho de cada una de las columnas) -->
																<tr valign="top">
																	<td align="left" width="165"><label for="txtNombre">Nombre:</label></td>
																	<td align="left" width="65%"><input class="frmTextInput_disabled" id="txtNombre" style="WIDTH: 100%" type="text" maxlength="50" onchange="JavaScript:valEmptyString(this, document.getElementById('spValNombre'), 'El campo \'\'Nombre\'\' no puede estar vacío.');" readonly> <span class="spErrorNotification" id="spValNombre"></span></td></tr>
																<!-- txtApellidos -->
																<tr valign="top">
																	<td align="left"><label for="txtApellidos">Apellidos:</label></td>
																	<td align="left">
																		<input class="frmTextInput_disabled" id="txtApellidos" style="WIDTH: 100%" type="text" maxlength="75" onchange="JavaScript:valEmptyString(this, document.getElementById('spValApellidos'), 'El campo \'\'Apellidos\'\' no puede estar vacío.');" readonly>
																		<span class="spErrorNotification" id="spValApellidos"></span>
																	</td>
																</tr>
																<!-- cboSexo -->
																<tr valign="top">
																	<td align="left"><label for="cboSexo">Sexo:</label></td>
																	<td align="left"><select class="frmTextInput_disabled" id="cboSexo" disabled><option value="F" selected>Femenino</option><option value="M">Masculino</option></select></td></tr>
																<!-- txtEmail -->
																<tr valign="top">
																	<td align="left"><label for="txtEmail">E-mail:</label></td>
																	<td align="left"><input class="frmTextInput_disabled" id="txtEmail" style="WIDTH: 100%" type="text" maxlength="75" onchange="JavaScript:valEmail();" readonly> <span class="spErrorNotification" id="spValEmail"></span></td></tr>
															</table>
															<table id="tbl_PerfilLogin" width="100%" align="center" border="0" style="DISPLAY: none">
																<!-- txtUserId -->
																<tr valign="top">
																	<td align="left" width="165"><label for="txtUserId">Id de
																			usuario:</label></td>
																	<td align="left" width="65%"><input class="frmTextInput" id="txtUserId" type="text" maxlength="25" onchange="JavaScipt:valUserId()"> <span><input class="frmCheckInput" id="chkUserIdBySystem" onclick="JavaScript:chkUserIdBySystemChange(this);" tabindex="-1" type="checkbox"><label id="lblUserIdBySystem" for="chkUserIdBySystem">Mantener 
																				mi "Id de usuario"</label></span> <span class="spErrorNotification" id="spValUserId"></span></td></tr>
																<!-- txtPassword1 -->
																<tr valign="top">
																	<td align="left"><label for="txtPassword1">Contraseña:</label></td>
																	<td align="left"><input class="frmTextInput" id="txtPassword1" type="password" maxlength="16" onchange="JavaScript:valPasswords();"> <span><input class="frmCheckInput" id="chkPasswordBySystem" onclick="JavaScript:chkPasswordBySystemChange(this);" tabindex="-1" type="checkbox"><label id="lblPasswordBySystem" title="El sistema genera y envía por correo la contraseña." for="chkPasswordBySystem">Mantener 
																				mi "Contraseña"</label> </span><span class="spErrorNotification" id="spValPassword1"></span></td></tr>
																<!-- txtPassword2 -->
																<tr valign="top">
																	<td align="left"><label for="txtPassword2">Repetir
																			contraseña:</label></td>
																	<td align="left"><input class="frmTextInput" id="txtPassword2" type="password" maxlength="16" onchange="JavaScript:valPasswords();"> <span class="spErrorNotification" id="spValPassword2"></span></td></tr>
															</table>
															<table id="tbl_Generales2" width="100%" align="center" border="0" style="DISPLAY: none">
																<!-- txtCentroTrabajo -->
																<tr valign="top">
																	<td align="left" width="165"><label for="txtCentroTrabajo">Centro
																			de trabajo:</label></td>
																	<td align="left" width="65%"><input class="frmTextInput_disabled" id="txtCentroTrabajo" style="WIDTH: 100%" type="text" maxlength="165" onchange="JavaScript:valEmptyString(this, document.getElementById('spValCentroTrabajo'), 'El campo \'\'Centro de trabajo\'\' no puede estar vacío.');" readonly> <span class="spErrorNotification" id="spValCentroTrabajo"></span></td></tr>
																<!-- txtFuncion -->
																<tr valign="top">
																	<td align="left"><label for="txtFuncion">Función que
																			desempeña:</label></td>
																	<td align="left"><input class="frmTextInput_disabled" id="txtFuncion" style="WIDTH: 100%" type="text" maxlength="165" onchange="JavaScript:valEmptyString(this, document.getElementById('spValFuncion'), 'El campo \'\'Función que desempeña\'\' no puede estar vacío.');" readonly> <span class="spErrorNotification" id="spValFuncion"></span></td></tr>
																<!-- cboCuentaBloqueada -->
																<tr valign="top">
																	<td align="left"><label for="cboCuentaBloqueada">Cuenta
																			bloqueada:</label></td>
																	<td align="left"><select class="frmTextInput_disabled" id="cboCuentaBloqueada" disabled onchange="JavaScript:cboCuentaBloqueadaChanged(this);"><option value="0" selected>No</option><option value="1">Sí</option></select><span class="spErrorNotification" id="spValCuentaBloqueada"></span></td></tr>
																<!-- cboPerfilPublico -->
																<tr valign="top">
																	<td align="left"><label for="cboPerfilPublico">Perfil
																			público:</label></td>
																	<td align="left"><select class="frmTextInput_disabled" id="cboPerfilPublico" disabled><option value="0">No</option><option value="1" selected>Sí</option></select></td></tr></table>
															<!-- TABLA PARA LOS DATOS PROPIOS DE LOS ACADÉMICOS -->
															<table id="tbl_Academico" width="100%" align="center" border="0" style="DISPLAY: none">
																<!-- txtFuncionAcademico (también se define el ancho de cada una de las columnas de esta tabla) -->
																<tr valign="top">
																	<td align="left" width="165"><label for="txtFuncionAcademico">Función como
																			académico:</label></td>
																	<td align="left" width="65%"><input class="frmTextInput_disabled" id="txtFuncionAcademico" style="WIDTH: 100%" type="text" maxlength="50" onchange="JavaScript:valEmptyString(this, document.getElementById('spValFuncionAcademico'), 'El campo \'\'Función como académico\'\' no puede estar vacío.');" readonly> <span class="spErrorNotification" id="spValFuncionAcademico"></span>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS DATOS PROPIOS DE LOS DOCENTES -->
															<table id="tbl_Docente" width="100%" align="center" border="0" style="display: none;">
																<tr valign="bottom">
																	<td height="20" colspan="2">
																		<span id="spRegisterDocente">
																			<a id="lnkRegisterDocente" style="display: none;" href="JavaScript:enableRegistroDocente();">
																				<img border="0" src="imagenes\logo_docente.gif">&nbsp;<b>Habilitar mi registro
																					como docente</b>
																			</a>
																		</span>
																	</td>
																</tr>
																<tr valign="top">
																	<td align="left" width="165"><label for="txtFacultadDepartamento">Facultad ó
																			departamento:</label></td>
																	<td align="left" width="65%">
																		<input id="txtFacultadDepartamento" class="frmTextInput_disabled" style="WIDTH: 100%" maxlength="75" type="text" readonly onchange="JavaScript:valEmptyString(this, document.getElementById('spValFacultadDepartamento'), 'El campo \'\'Función ó departamento\'\' no puede estar vacío.');">
																		<span class="spErrorNotification" id="spValFacultadDepartamento"></span>
																	</td>
																</tr>
																<!-- txtCategoriaDocente -->
																<tr valign="top">
																	<td align="left"><label for="cboCategoriaDocente">Categoría docente:</label></td>
																	<td align="left">
																		<select id="cboCategoriaDocente" class="frmTextInput_disabled" disabled></select>
																	</td>
																</tr>
																<!-- txtTituloAcademico -->
																<tr valign="top">
																	<td align="left"><label for="cboTituloAcademico">Título académico:</label></td>
																	<td align="left">
																		<select id="cboTituloAcademico" class="frmTextInput_disabled" disabled></select>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS DATOS PROPIOS DE LOS DOCENTES -->
															<table id="tbl_Maestrante" width="100%" align="center" border="0" style="DISPLAY: none">
																<!-- txtNoCI (también se define el ancho de cada una de las columnas de esta tabla) -->
																<tr valign="top">
																	<td align="left" width="165"><label for="txtNoCI">Carnet de
																			identidad:</label></td>
																	<td align="left" width="65%"><input class="frmTextInput_disabled" id="txtNoCI" style="WIDTH: 100%" type="text" maxlength="12" onchange="JavaScript:valNoCI();" readonly> <span class="spErrorNotification" id="spValNoCI"></span></td></tr>
																<!-- cboGrupo -->
																<tr valign="top">
																	<td align="left"><label for="cboGrupo">Grupo:</label></td>
																	<td align="left"><select class="frmTextInput_disabled" id="cboGrupo" disabled></select>
																	</td></tr></table>
															<!-- Separador entre los campos y los botones al pié -->
															<table id="tbl_Separator1" width="100%" align="center" border="0">
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr></table>
															<!-- TABLA PARA LOS BOTONES -->
															<table id="tbl_Buttoms" width="100%" align="center" border="0">
																<tr valign="top">
																	<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left">Estado
																			de la
																			actualización</span> </td>
																	<td align="right">
																		<a id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif" border="0"></a>
																		<a id="lnkCancelar" title="Cancelar" href="JavaScript:Cancelar();">&nbsp;<img id="imgCancelar" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																	</td>
																</tr>
															</table>
															<!-- Separador entre los botones y el pié -->
															<table id="tbl_Separator2" width="100%" align="center" border="0">
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table></td></tr></table>
									<!-- MAIN WINDOW; END --></td></tr></table>
						<!-- BODY TABLE; END --></td></tr></table></form>
		<!-- PAGE TABLE; END -->
		<script language="javascript">
		<!--

		/* 
			PARA LA DECLARACIÓN DE LAS IMÁGENES DE FONDO DE LAS CELDAS LO HAGO CON SCRIPTING
			PORQUE FireFox NO INTREPRETA BIEN LO QUE NECESITO SI UTILIZO ESTILOS.
		*/
		document.getElementById('td_body_bg').style.backgroundImage = "url(imagenes/body_bg.gif)";
		document.getElementById('td_body_bg').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_navBarLeft').style.backgroundImage = "url(imagenes/side_nav_bg.gif)";
		document.getElementById('td_navBarLeft').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_bodyHeader').style.backgroundImage = "url(imagenes/body_header.gif)";
		document.getElementById('td_bodyHeader').style.backgroundRepeat = "no-repeat";
		
		/*
			VARIABLES LOCALES
		*/
		// Almacenar los datos necesarios para cancelar ediciones.
		var originalValues = {"UserId": ''};
		var dvGenerales;
		
		function getPerfilData()
		{
			document.getElementById('spEstadoActualizacion').innerHTML = 'Recuperando datos...';
			ISPCFG.Msce.clswfPerfil.getPerfilData(settings.perfilId, getPerfilData_CallBack);
		}
		
		function getPerfilData_CallBack(res)
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
				if(typeof(res) != "object")
				{
					boError = true;
				}
			}
			if(boError)
			{
				if(settings.esMiPerfil==true)
				{
					strVar = "de su perfil";
				}
				else
				{
					strVar = "del perfil solicitado";
				}
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido recuperar los datos " + strVar + ". Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;
			}
			if(res.value[0].Rows.length==0) // Cuando no tiene datos el primer DataView (el de los datos generales de los usuarios)
			{
				if(settings.perfilId==0) // Realmente no existe el usuario.
				{
				strWarningMessage = "Estimado usuario, el perfil solicitado no ha sido encontrado. Si usted introdujo directamente en la barra de direcciones de su navegador los parámetros necesarios es probable que se halla equivocado.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Perfil no encontrado en la base de datos.', strWarningMessage, false);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				}
				else // Existe el usuario, pero su perfil es privado.
				{
				strWarningMessage = "Estimado usuario, el perfil solicitado existe, pero el usuario al que pertenece no permite que sus datos sean mostrados porque lo ha declarado como \"Privado\". Si usted es usuario de esta aplicación puede utilizar esta opción visitando su propio <a href=\"perfil.aspx\">perfil</a> mientras esté identificado.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Perfil declarado como privado.', strWarningMessage, false);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				}
				res=null;
				disableForm();
				return;
			}
			
			document.getElementById('spEstadoActualizacion').innerHTML = 'Estableciendo opciones...';
			dvGenerales = res.value[0];
			setDatosGenerales(res.value[0], settings.userRoles);
			setDatosAcademico(res.value[1]);
			setDatosDocente(res.value[2]);
			setDatosMaestrante(res.value[3]);
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			res = null;
		}
		
		function setDatosGenerales(dataView)
		{
			/*
				Establecer el header del contenido para informarle al usuario cual 
				es el perfil que está visualizando.
			*/
			if(settings.esMiPerfil==true)
			{
				document.getElementById('spHeaderContent').innerHTML = "MI PERFIL";
			}
			else
			{
				document.getElementById('spHeaderContent').innerHTML = "PERFIL DE: " + dataView.Rows[0].Nombre + " " + dataView.Rows[0].Apellidos + "<br>" + "ROLES: " + settings.perfilRoles;
			}
			
			document.getElementById('tbl_Generales1').style.display = "block";
			document.getElementById('tbl_Generales2').style.display = "block";

			var textNombre = document.getElementById('txtNombre');
			var textApellidos = document.getElementById('txtApellidos');
			var listSexo = document.getElementById('cboSexo');
			var textEmail = document.getElementById('txtEmail');
			var textUserId = document.getElementById('txtUserId');
			var textPassword1 = document.getElementById('txtPassword1');
			var textPassword2 = document.getElementById('txtPassword2');
			var textCentroTrabajo = document.getElementById('txtCentroTrabajo');
			var textFuncion = document.getElementById('txtFuncion');
			var listCuentaBloqueada = document.getElementById('cboCuentaBloqueada');
			var listPerfilPublico = document.getElementById('cboPerfilPublico');

			textNombre.value = dataView.Rows[0].Nombre;
			textApellidos.value = dataView.Rows[0].Apellidos;
			listSexo.selectedIndex = dataView.Rows[0].Sexo=='F'?0:1;	// Sexo.
			textEmail.value = dataView.Rows[0].email;
			textCentroTrabajo.value = dataView.Rows[0].CentroTrabajo;
			textFuncion.value = dataView.Rows[0].Funcion;
			listCuentaBloqueada.selectedIndex = dataView.Rows[0].CuentaBloqueada;
			//alert(dataView.Rows[0].PerfilPublico);
			listPerfilPublico.selectedIndex = dataView.Rows[0].PerfilPublico;
			// Mostrar los datos del login sólo si es el perfil del propio usuario.
			if(settings.esMiPerfil==true)
			{
				// Para todos los tipos de usuarios.
				textEmail.readOnly = false;
				textEmail.className = "frmTextInput";
				textEmail.focus();
				// Procesar la tabla de los elementos para el login
				document.getElementById('tbl_PerfilLogin').style.display = "block";
				textUserId.value = dataView.Rows[0].UserId;
				// Variable para almacenar el UserId por si se necesita retornar al valor original.
				originalValues.UserId = dataView.Rows[0].UserId;
				document.getElementById('chkUserIdBySystem').checked = true;
				chkUserIdBySystemChange(document.getElementById('chkUserIdBySystem'));
				// Manejar los controles para las contraseñas.
				textPassword1.value = "password";
				textPassword2.value = "password";
				document.getElementById('chkPasswordBySystem').checked = true;
				chkPasswordBySystemChange(document.getElementById('chkPasswordBySystem'));
				textCentroTrabajo.readOnly = false;
				textCentroTrabajo.className = "frmTextInput";
				textFuncion.readOnly = false;
				textFuncion.className = "frmTextInput";
				listCuentaBloqueada.disabled = false;
				listCuentaBloqueada.className = "frmTextInput";
				listPerfilPublico.disabled = false;
				listPerfilPublico.className = "frmTextInput";
				// Para cuando es Académico.
				if(settings.userRoles.indexOf("Académico")>-1)
				{
					textNombre.readOnly = false;
					textNombre.className = "frmTextInput";
					textNombre.focus();
					textApellidos.readOnly = false;
					textApellidos.className = "frmTextInput";
					listSexo.disabled = false;
					listSexo.className = "frmTextInput";
				}
			}
		}
		
		function setDatosAcademico(dataView)
		{
			if(dataView.Rows.length==0){return;} // No es académico.
			document.getElementById('tbl_Academico').style.display = "block";
			var textFuncionAcademico = document.getElementById('txtFuncionAcademico');
			textFuncionAcademico.value = dataView.Rows[0].FuncionAcademico;
			if(settings.esMiPerfil==true)
			{
				textFuncionAcademico.readOnly = false;
				textFuncionAcademico.className = "frmTextInput";
			}
		}
		
		function setDatosDocente(dataView)
		{
			var textFacultadDepartamento = document.getElementById('txtFacultadDepartamento');
			if(dataView.Rows.length==0)// No es docente.
			{
				// Pero si es académico hay que darle la posibilidad 
				// de que active su registro como docente si es necesario.
				if((settings.userRoles.indexOf("Académico")>-1) & (settings.esMiPerfil==true)) 
				{
					document.getElementById('lnkRegisterDocente').style.display = "block";
					document.getElementById('tbl_Docente').style.display = "block";
				}
				return;
			}
			/* 
				Si llegamos aquí es porque tiene un registro como docente, entonces, 
				hacemos desaparecer el link para activar los datos como docente y 
				sólo mostramos una etiqueta que identifique esta parte (los datos
				como docente).
			*/
			document.getElementById('spRegisterDocente').innerHTML = "<img border=\"0\" src=\"imagenes\\logo_docente.gif\">&nbsp;<b>Mi registro como docente</b>";
			document.getElementById('tbl_Docente').style.display = "block";
			if(settings.esMiPerfil==true)
			{
				textFacultadDepartamento.readOnly = false;
				textFacultadDepartamento.className = "frmTextInput";
				document.getElementById('cboCategoriaDocente').disabled = false;
				document.getElementById('cboCategoriaDocente').className = "frmTextInput";
				document.getElementById('cboTituloAcademico').disabled = false;
				document.getElementById('cboTituloAcademico').className = "frmTextInput";
			}
			textFacultadDepartamento.value = dataView.Rows[0].FacultadDepartamento;
			// Llenar las listas
			fillListaTitulosAcademicos(dataView.Rows[0].Id_TituloAcademico);
			fillListaCategoriasDocentes(dataView.Rows[0].Id_CategoriaDocente);
		}

		function enableRegistroDocente()
		{
			var lnk = document.getElementById('lnkRegisterDocente');
			var textFacultadDepartamento = document.getElementById('txtFacultadDepartamento');

			if(lnk.innerHTML.indexOf("Cancelar")==-1)
			{
				textFacultadDepartamento.readOnly = false;
				textFacultadDepartamento.className = "frmTextInput";
				document.getElementById('cboCategoriaDocente').disabled = false;
				document.getElementById('cboCategoriaDocente').className = "frmTextInput";
				document.getElementById('cboTituloAcademico').disabled = false;
				document.getElementById('cboTituloAcademico').className = "frmTextInput";
				lnk.innerHTML = "<img border=\"0\" src=\"imagenes\\logo_docente_cancel.gif\">&nbsp;<b>Cancelar mi registro como docente</b>";
				// Llenar las listas
				fillListaTitulosAcademicos(0);
				fillListaCategoriasDocentes(0);
			}
			else
			{
				textFacultadDepartamento.readOnly = true;
				textFacultadDepartamento.className = "frmTextInput_disabled";
				document.getElementById('cboCategoriaDocente').disabled = true;
				document.getElementById('cboCategoriaDocente').className = "frmTextInput_disabled";
				document.getElementById('cboTituloAcademico').disabled = true;
				document.getElementById('cboTituloAcademico').className = "frmTextInput_disabled";
				lnk.innerHTML="<img border=\"0\" src=\"imagenes\\logo_docente.gif\">&nbsp;<b>Habilitar mi registro como docente</b>";
			}
		}
		
		function setDatosMaestrante(dataView)
		{
			if(dataView.Rows.length==0){return;} // No es maestrante.
			/*	
				Sólo mostrar el NoCI y el Grupo si es el usuario que está revisando
				su propio perfil, porque estos son datos en los que se apoya el 
				académico para autorizar los registros.
			*/
			if(settings.esMiPerfil==true)
			{
				document.getElementById('tbl_Maestrante').style.display = "block";
				var textNoCI = document.getElementById('txtNoCI');
				var listGrupos = document.getElementById('cboGrupo');
				textNoCI.value = dataView.Rows[0].NoCI;
				fillListaGrupos(dataView.Rows[0].Id_Grupo);
				
			}
		}

		// Llenar el cbo de las categorías docentes.
		function fillListaCategoriasDocentes(IdActivo)
		{
			var refCbo = document.getElementById('cboCategoriaDocente');
			// Si en cboCategoriaDocente ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCbo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfPerfil.getListaCategoriasDocentes();
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de las categorías docentes.");
					res=null;
					return;
				}
				dataView = res.value;  
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					refCbo.options[refCbo.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);
				}
				res=null;			
			}
			// Pero al final siempre que se esté editando tratamos de establecer el 
			// valor de selectedIndex para que se corresponda con la sede que se esté editando.
			if(IdActivo!=0){setIndexInCbo(refCbo, IdActivo);}
		}
	
		// Llenar el cbo de los títulos académicos.
		function fillListaTitulosAcademicos(IdActivo)
		{
			var refCbo = document.getElementById('cboTituloAcademico');
			// Si en cboTituloAcademico ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCbo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfPerfil.getListaTitulosAcademicos();
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los títulos académicos.");
					res=null;
					return;
				}
				dataView = res.value;  
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					refCbo.options[refCbo.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);
				}
				res=null;			
			}
			// Pero al final siempre que se esté editando tratamos de establecer el 
			// valor de selectedIndex para que se corresponda con la sede que se esté editando.
			if(IdActivo!=0){setIndexInCbo(refCbo, IdActivo);}
		}

		// Llenar el cbo de las categorías maestrantes.
		function fillListaGrupos(IdActivo)
		{
			var refCbo = document.getElementById('cboGrupo');
			// Si el cbo ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCbo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfPerfil.getListaGrupos()
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
			if(IdActivo!=0){setIndexInCbo(refCbo, IdActivo);}
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
		
		function disableForm()
		{
			document.getElementById('tbl_Generales').style.display = 'none';
			document.getElementById('tbl_Academico').style.display = 'none';
			document.getElementById('tbl_Docente').style.display = 'none';
			document.getElementById('tbl_Maestrante').style.display = 'none';
			document.getElementById('tbl_Buttoms').style.display = 'none';
			document.getElementById('tbl_Separator1').style.display = 'none';
			document.getElementById('tbl_Separator2').style.display = 'none';
		}
		
		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valDocument()
		{
			resetAllValMessages();
			var val1 = true;
			var val2 = true;
			var val3 = true;
			var val4 = true;
			var val5 = true;
			var val6 = true;
			var val7 = true;
			var val8 = true;
			var val9 = true;
			// PARA TODOS
			val3 = valEmail();
			val4 = valUserId();
			val5 = valPasswords();
			val6 = valEmptyString(document.getElementById('txtCentroTrabajo'), document.getElementById('spValCentroTrabajo'), "El campo \"Centro de trabajo\" no puede estar vacío.");
			val7 = valEmptyString(document.getElementById('txtFuncion'), document.getElementById('spValFuncion'), "El campo \"Función que desempeña\" no puede estar vacío.");
			// PARA ACADÉMICOS
			if(settings.perfilRoles.indexOf("Académico")>-1)
			{
				val1 = valEmptyString(document.getElementById('txtNombre'), document.getElementById('spValNombre'), "El campo \"Nombre\" no puede estar vacío.");
				val2 = valEmptyString(document.getElementById('txtApellidos'), document.getElementById('spValApellidos'), "El campo \"Apellidos\" no puede estar vacío.");
				val8 = valEmptyString(document.getElementById('txtFuncionAcademico'), document.getElementById('spValFuncionAcademico'), "El campo \"Función como académico\" no puede estar vacío.");
			}
			// PARA ACADÉMICOS REGISTRÁNDOSE COMO DOCENTES O PARA LOS QUE ESTÁN REGISTRADOS YA COMO TAL.
			if((settings.perfilRoles.indexOf("Docente")>-1) || (document.getElementById('txtFacultadDepartamento').readOnly==false))
			{
				val9 = valEmptyString(document.getElementById('txtFacultadDepartamento'), document.getElementById('spValFacultadDepartamento'), "El campo \"Facultad ó departamento\" no puede estar vacío si desea habilitar su registro como docente.");
			}
			var boResult = false;
			boResult = (val1==true)&(val2==true)&(val3==true)&(val4==true)&(val5==true)&(val6==true)&(val7==true)&(val8==true)&(val9==true);
			//alert("1: " + val1 + " 2: " + val2 + " 3: " + val3 + " 4: " + val4 + " 5: " + val5 + " 6: " + val6 + " 7: " + val7 + " 8: " + val8 + " 9: " + val9);
			return boResult;
		}

		function Actualizar()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			resetAllValMessages();
			if(!valDocument()){return;}

			document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando su perfil...';
			var res = ISPCFG.Msce.clswfPerfil.getStructData().value;
			if(res.error!=null || res==null)
			{
				strErrorMessage = "1. Estimado usuario, ha sucedido un error que ha impedido actualizar los datos de su perfil como se solicitó. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res = null;
				return false;
			}
			var updatedData = res;
			// PARA TODOS
			updatedData.email = document.getElementById('txtEmail').value;
			updatedData.UserId = document.getElementById('txtUserId').value;
			updatedData.UserPass = document.getElementById('chkPasswordBySystem').checked?'':document.getElementById('txtPassword1').value;
			updatedData.CentroTrabajo = document.getElementById('txtCentroTrabajo').value;
			updatedData.Funcion = document.getElementById('txtFuncion').value;
			//alert("CuentaBloqueada: " + document.getElementById('cboCuentaBloqueada').value)
			updatedData.CuentaBloqueada = document.getElementById('cboCuentaBloqueada').value;
			//alert("PerfilPublico: " + document.getElementById('cboPerfilPublico').value)
			updatedData.PerfilPublico = document.getElementById('cboPerfilPublico').value;
			// PARA ACADÉMICOS
			if(settings.perfilRoles.indexOf("Académico")>-1)
			{
				updatedData.Nombre = document.getElementById('txtNombre').value;
				updatedData.Apellidos = document.getElementById('txtApellidos').value;
				updatedData.FuncionAcademico = document.getElementById('txtFuncionAcademico').value;
			}
			// PARA ACADÉMICOS REGISTRÁNDOSE COMO DOCENTES O PARA LOS QUE ESTÁN REGISTRADOS YA COMO TAL.
			if((settings.perfilRoles.indexOf("Docente")>-1) || (document.getElementById('txtFacultadDepartamento').readOnly==false))
			{
				updatedData.FacultadDepartamento = document.getElementById('txtFacultadDepartamento').value;
			}
			ISPCFG.Msce.clswfPerfil.Actualizar(updatedData, Actualizar_CallBack);
		}
		function Actualizar_CallBack(res)
		{
			var boError = false;
			if(res==null)
			{
				//alert("res es null");
				boError = true;
			} 
			if(!boError)
			{
				if(res.error!=null)
				{
					//alert("res tiene un error");
					boError = true;
				}
			}
			if(boError)
			{
				strErrorMessage = "2. Estimado usuario, ha sucedido un error que ha impedido actualizar los datos su perfil. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;
			}
			// Si se ordena salir de la aplicación porque se ha cambiado 
			//el "Id de usuario" y/o el estado de CuentaBloqueada a "Sí". 
			if(res.value[1]==true) 
			{
				ForceToCloseSession();
				return;
			}
	
			document.getElementById('spEstadoActualizacion').innerHTML = 'Actualización efectuada';
			getPerfilData();
			
		}
		
		function ForceToCloseSession()
		{
			ISPCFG.Msce.clswfPerfil.ForceToCloseSession(ForceToCloseSession_CallBlack);
		}

		function ForceToCloseSession_CallBlack(res)
		{
			if(res.value!='' & res.error==null){window.open(document.location.protocol + '//' + document.domain + res.value + '/index.aspx',"_self",null,false);}
			res = null;
			return;
		}
		
		/*
			ESTABLECE LA VISIBILIDAD DE LOS BOTONES: Nuevo, Actualizar y Cancelar.
		*/
		function setButtomsVisibility()
		{
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			if(settings.esMiPerfil==true)
			{
				btnActualizar.style.display = 'inline';
				btnCancelar.style.display = 'inline';
				return;
			}
			else
			{
				document.getElementById('tbl_Buttoms').style.display = 'none';
				document.getElementById('tbl_Separator2').style.display = 'none';
				//btnActualizar.style.display = 'none';
				//btnCancelar.style.display = 'none';
				return;					
			}
		}
		
		function Cancelar()
		{
			try
			{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar todos los elementos <span> de mensajes de error en datos.
			resetAllValMessages()
			// Este procedimientos refresca la lista de los académicos y muestra la misma.
			getPerfilData();
			}
			catch(e)
			{
				alert(e.toString());
			}
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
			FUNCIONES PARA VALIDACIONES EN CASO DE EDICIÓN DEL PERFIL PROPIO
		*/
		function valEmail()
		{
			var textEmail = document.getElementById('txtEmail');
			// Si es maestrante y no está especificando correo, entonces no validar.
			if((settings.userRoles.indexOf("Maestrante")>-1) & textEmail.value==""){return true;}
			if(!valEmptyString(textEmail, document.getElementById('spValEmail'), "El campo \"E-mail\" no puede estar vacío.")){return false;}
			return valEmailFormat(textEmail);
		}
		
		function valEmailFormat(sender)
		{
			if(sender.value==''){return false;}
			if(!valByPatern(sender, EMAIL_PATERN))
			{
				document.getElementById('spValEmail').innerHTML = 'El formato de la dirección electrónica no es correcto.';
				document.getElementById('spValEmail').style.display='block';
				return false;
			}
			document.getElementById('spValEmail').innerHTML = '';
			document.getElementById('spValEmail').style.display = 'none';
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
			if(!(textUserId.disabled))
			{
					res = ISPCFG.Msce.clswfPerfil.existUserId(settings.perfilId, textUserId.value).value;
					if(res.error!=null || res==null)
					{
						strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido comprobar si existe el \"Id de usuario\" que propone para su perfil. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
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

		function valUserIdFormat()
		{
			if(!valByPatern(document.getElementById('txtUserId'), USERID_PATERN))
			{
				document.getElementById('spValUserId').innerHTML = "El \"Id de usuario\" sólo admite los caracteres: a-z; A-Z; 0-9 y subreyado (_), no menor de cinco (5) de ellos y sin espacios.";
				document.getElementById('spValUserId').style.display = 'block';
				return false;
			}
			return true;
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
				// Revisar para ver cómo se implementa.
				//if(settings.Modo=='Editar'){textUserId.value=settings.UserIdEditado;}
				textUserId.value=originalValues.UserId;
				//getNewUserId();
				document.getElementById('spValUserId').style.display='none';
			}
		}
		
		function valPasswords()
		{
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
		
		function chkPasswordBySystemChange(sender)
		{
			var textPassword1 = document.getElementById('txtPassword1');
			var textPassword2 = document.getElementById('txtPassword2');
			textPassword1.value=textPassword2.value=sender.checked?'password':'';
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
		
		function cboCuentaBloqueadaChanged(sender)
		{
			if(sender.value=="1") // Se ha seleccionado bloquear la cuenta.
			{
				if(settings.perfilRoles.indexOf("Director")>-1)
				{
				document.getElementById('spValCuentaBloqueada').innerHTML = "Usted no puede bloquear su cuenta por su condición de \"Director(a)\", antes debe delegar esta función.";
				document.getElementById('spValCuentaBloqueada').style.display = "block";
				sender.selectedIndex = 0;
				return;
				}
				document.getElementById('spValCuentaBloqueada').innerHTML = "Si bloquea su cuenta no podrá hacer uso de esta hasta tanto solicite a algún académico que la active nuevamente.";
				document.getElementById('spValCuentaBloqueada').style.display = "block";
				return;
			}
			document.getElementById('spValCuentaBloqueada').innerHTML = "";
			document.getElementById('spValCuentaBloqueada').style.display = "none";
		}

		//alert("Id: " + settings.perfilId + " esMiPerfil: " + settings.esMiPerfil);
		getPerfilData();
		setButtomsVisibility();
	
		//-->
		</script>


	</body>
</html>
