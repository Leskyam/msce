<%@ Page language="c#" Codebehind="register.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfRegister" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<HTML>
	<HEAD>
		<title>Maestría: Solicitud de registro</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="estilos/main.css" type="text/css" rel="stylesheet">
		<link rel="shortcut icon" href="imagenes/favicon.ico" />
		<!-- Cargar el fichero principal de scripts del lado del cliente -->
		<script src="includes/main.js" type="text/javascript"></script>
		<script src="includes/dates.js" type="text/javascript"></script>
	</HEAD>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"> <!-- PAGE TABLE; BEGIN -->
		<form id="frm_Maestrante" method="post" runat="server">
			<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr>
					<td><!-- CONTROL PARA EL ENCABEZADO, QUE INCLUYE LOS CONTROLES PARA IDENTIFICACIÓN DE USUARIO --><uc1:wucheader id="ctlHeader" runat="server"></uc1:wucheader></td>
				</tr>
				<tr>
					<td><!-- CONTROL PARA LA BARRA DE OPCIONES DEL ENCABEZADO --><uc1:wucheadernavbar id="ctlHeaderNavBar" runat="server"></uc1:wucheadernavbar></td>
				</tr>
			</table>
			<table id="Table2" cellspacing="0" cellpadding="0" width="750" align="center" border="0">
				<tr id="tr_Notify" style="DISPLAY: none" height="0" runat="server">
					<td width="750"><span class="spErrorNotification" id="sp_Notify" style="MARGIN-BOTTOM: 1px" runat="server"></span></td>
				</tr>
				<tr valign="top">
					<td> <!-- BODY TABLE; BEGIN -->
						<table id="Table3" cellspacing="0" cellpadding="0" width="750" border="0">
							<tr valign="top">
								<td valign="top" align="right">
									<!-- Control Web para las opciones de la izquierda --><uc1:wucleftoptions id="ctlLeftOptions" runat="server"></uc1:wucleftoptions></td>
								<td> <!-- MAIN WINDOW; BEGIN -->
									<table id="Table4" cellspacing="0" cellpadding="0" width="545" border="0">
										<tr valign="top">
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle"
												align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">SOLICITUD 
													DE REGISTRO</span></td>
										</tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MAESTRANTES -->
															<table id="tbl_Edit" width="100%" align="center" border="0">
																<!-- txtNombre (también se define el ancho de cada una de las columnas) -->
																<tr valign="top">
																	<td align="left" width="35%"><label for="txtNombre">Nombre:</label></td>
																	<td align="left" width="65%"><input class="frmTextInput" id="txtNombre" style="WIDTH: 100%" type="text" maxlength="50"
																			onchange="JavaScript:valEmptyString(this, document.getElementById('spValNombre'), 'El campo \'\'Nombre\'\' no puede estar vacío.');getNewUserId();">
																		<span class="spErrorNotification" id="spValNombre"></span>
																	</td>
																</tr>
																<!-- txtApellidos -->
																<tr valign="top">
																	<td align="left"><label for="txtApellidos">Apellidos:</label></td>
																	<td align="left"><input class="frmTextInput" id="txtApellidos" style="WIDTH: 100%" type="text" maxlength="75"
																			onchange="JavaScript:valEmptyString(this, document.getElementById('spValApellidos'), 'El campo \'\'Apellidos\'\' no puede estar vacío.');getNewUserId();">
																		<span class="spErrorNotification" id="spValApellidos"></span>
																	</td>
																</tr>
																<!-- cboSexo -->
																<tr valign="top">
																	<td align="left"><label for="cboSexo">Sexo:</label></td>
																	<td align="left"><select class="frmTextInput" id="cboSexo"><option value="F" selected>Femenino</option>
																			<option value="M">Masculino</option>
																		</select></td>
																</tr>
																<!-- txtEmail -->
																<tr valign="top">
																	<td align="left"><label for="txtEmail">E-mail (opcional):</label></td>
																	<td align="left"><input class="frmTextInput" id="txtEmail" style="WIDTH: 100%" type="text" maxlength="75"
																			onchange="JavaScript:valEmail();"> <span class="spErrorNotification" id="spValEmail">
																		</span>
																	</td>
																</tr>
																<!-- txtUserId -->
																<tr valign="top">
																	<td align="left"><label for="txtUserId">Id de usuario:</label></td>
																	<td align="left"><input class="frmTextInput_disabled" id="txtUserId" type="text" maxlength="25" onchange="JavaScipt:valUserId()">
																		<span><input class="frmCheckInput" id="chkUserIdBySystem" onclick="JavaScript:chkUserIdBySystemChange(this);"
																				tabindex="-1" type="checkbox" checked><label id="lblUserIdBySystem" for="chkUserIdBySystem">Dejar 
																				que el sistema decida</label></span> <span class="spErrorNotification" id="spValUserId">
																		</span>
																	</td>
																</tr>
																<!-- txtPassword1 -->
																<tr valign="top">
																	<td align="left"><label for="txtPassword1">Contraseña:</label></td>
																	<td align="left"><input class="frmTextInput" id="txtPassword1" type="password" maxlength="16" onchange="JavaScript:valPasswords();">
																		<span class="spErrorNotification" id="spValPassword1"></span>
																	</td>
																</tr>
																<!-- txtPassword2 -->
																<tr valign="top">
																	<td align="left"><label for="txtPassword2">Repetir contraseña:</label></td>
																	<td align="left"><input class="frmTextInput" id="txtPassword2" type="password" maxlength="16" onchange="JavaScript:valPasswords();">
																		<span class="spErrorNotification" id="spValPassword2"></span>
																	</td>
																</tr>
																<!-- txtCentroTrabajo -->
																<tr valign="top">
																	<td align="left"><label for="txtCentroTrabajo">Centro de trabajo:</label></td>
																	<td align="left"><input class="frmTextInput" id="txtCentroTrabajo" style="WIDTH: 100%" type="text" maxlength="150"
																			onchange="JavaScript:valEmptyString(this, document.getElementById('spValCentroTrabajo'), 'El campo \'\'Centro de trabajo\'\' no puede estar vacío.');">
																		<span class="spErrorNotification" id="spValCentroTrabajo"></span>
																	</td>
																</tr>
																<!-- txtFuncion -->
																<tr valign="top">
																	<td align="left"><label for="txtFuncion">Función que desempeña:</label></td>
																	<td align="left"><input class="frmTextInput" id="txtFuncion" style="WIDTH: 100%" type="text" maxlength="150"
																			onchange="JavaScript:valEmptyString(this, document.getElementById('spValFuncion'), 'El campo \'\'Función que desempeña\'\' no puede estar vacío.');">
																		<span class="spErrorNotification" id="spValFuncion"></span>
																	</td>
																</tr>
																<!-- cboCuentaBloqueada -->
																<!-- cboPerfilPublico -->
																<tr valign="top">
																	<td align="left"><label for="cboPerfilPublico">Perfil público:</label></td>
																	<td align="left"><select class="frmTextInput" id="cboPerfilPublico"><option value="0">No</option>
																			<option value="1" selected>Sí</option>
																		</select></td>
																</tr>
																<!-- txtNoCI -->
																<tr valign="top">
																	<td align="left"><label for="txtNoCI">Carnet de identidad:</label></td>
																	<td align="left"><input class="frmTextInput" id="txtNoCI" style="WIDTH: 100%" type="text" maxlength="12"
																			onchange="JavaScript:valNoCI();"> <span class="spErrorNotification" id="spValNoCI">
																		</span>
																	</td>
																</tr>
																<!-- cboGrupo -->
																<tr valign="top">
																	<td align="left"><label for="cboGrupo">Grupo:</label></td>
																	<td align="left"><select class="frmTextInput" id="cboGrupo"></select>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS BOTONES -->
															<table id="tbl_Buttoms" width="100%" align="center" border="0">
																<tr valign="top">
																	<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left">Estado 
																			de la actualización</span>
																	</td>
																	<td align="right"><a id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif"
																				border="0"></a> <a id="lnkCancelar" title="Cancelar" href="JavaScript:Cancelar();">
																			&nbsp;<img id="imgCancelar" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif"
																				border="0"></a>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LA LISTA DE LOS MAESTRANTES -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<!-- LÍNEA DIVISORIA AL PIE DE LOS BOTONES -->
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS USUARIOS -->
																		<span id="dvNotify"></span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" align="right">
																		<a href="index.aspx">Aceptar</a>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<!-- MAIN WINDOW; END --></td>
							</tr>
						</table>
						<!-- BODY TABLE; END --></td>
				</tr>
			</table>
		</form>
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
		var settings = {"Modo":	'Nuevo'};

		function Actualizar()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Validar el documento.
			if(!valDocument()){return;}
			document.getElementById('spEstadoActualizacion').innerHTML = 'Procesando solicitud de registro...';
			// Obtener la estructura donde almacenaremos los datos del Maestrante.
			res = ISPCFG.Msce.clswfRegister.getStructMaestrante().value;
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
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido procesar su solicitud de registro. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res = null;
				return;
			}
			var Maestrante = res;
			res = null;
			Maestrante.Nombre = document.getElementById('txtNombre').value;	// Nombre.
			Maestrante.Apellidos = document.getElementById('txtApellidos').value;	// Apellidos.
			Maestrante.Sexo = document.getElementById('cboSexo').value;	// Sexo.
			Maestrante.UserId = document.getElementById('txtUserId').value;	// Id de usuario.
			Maestrante.UserPass = document.getElementById('txtPassword1').value;
			Maestrante.CentroTrabajo = document.getElementById('txtCentroTrabajo').value;	// Centro de trabajo.
			Maestrante.Funcion = document.getElementById('txtFuncion').value;	// Centro de trabajo.
			Maestrante.email = document.getElementById('txtEmail').value;	// e-mail.
			Maestrante.datUltimoAcceso = new Date();	// Fecha/Hora.
			//Maestrante.CuentaBloqueada = document.getElementById('cboCuentaBloqueada').value;	// Cuenta bloqueada.
			Maestrante.PerfilPublico = document.getElementById('cboPerfilPublico').value;	// Perfil público.
			Maestrante.NoCI = document.getElementById('txtNoCI').value;	// NoCI.
			Maestrante.IdGrupo = document.getElementById('cboGrupo').value;
			
			ISPCFG.Msce.clswfRegister.Agregar(Maestrante, Actualizar_CallBack);
			Maestrante = null;
			return;
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
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido procesar su solicitud de registro. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;
			}
			if(res.value==false)
			{
					var strErrorMessage = "Estimado usuario, NO SE HA REGISTRADO SU SOLICITUD, sin embargo, no se ha reportado ningún error. es probable que el maestrante ya exista registrado, revise la lista de maestrantes, si no aparece, le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					document.getElementById('spEstadoActualizacion').innerHTML = '';
			}
			else
			{
					Notify();
					document.getElementById('spEstadoActualizacion').innerHTML = 'Solicitud registrada.';
					return;
			}
		}
		
		function Notify()
		{
			var strNotifyMessage = document.getElementById('cboSexo').selectedIndex==0?"Estimada ":"Estimado ";
			strNotifyMessage += document.getElementById('txtNombre').value + " " + document.getElementById('txtApellidos').value + ",<br>";
			strNotifyMessage += "Su solicitud de registro para hacer uso de esta aplicación ha sido procesada, para que esta sea válida ";
			strNotifyMessage += "debe ser revisada y aprobada por uno de los miembros del comité de académicos de esta maestría. ";
			boWithEmail = document.getElementById('txtEmail').value!=''?true:false;
			if(boWithEmail)
			{
				strNotifyMessage += "Se enviará un correo electrónico a: " + document.getElementById('txtEmail').value + " cuando esta solicitud sea aprobada. ";
			}
			else
			{
				strNotifyMessage += "Lamentablemente no ha proporcionado usted una dirección electrónica a donde podamos dirigir una notificación en caso de ser aprobada esta solicitud, ";
				strNotifyMessage += "por tanto, le invitamos a que intente acceder a la aplicación de manera periódica en los días siguientes y haciendo uso de los datos que proporcionó. ";
			}
			strNotifyMessage += "<br><br>Atentamente,<br><a href=\"lista_usuarios.aspx?role=academico\">Comité de académicos.";
			document.getElementById('dvNotify').innerHTML = strNotifyMessage;
			settings.Modo='Notificar';
			switchView();
		}

		function Cancelar()
		{
		/*
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar todos los elementos <span> de mensajes de error en datos.
			resetAllValMessages();
			document.getElementById('txtNombre').value='';
			document.getElementById('txtApellidos').value='';
			document.getElementById('cboSexo').selectedIndex=0;
			document.getElementById('txtEmail').value='';
			document.getElementById('txtUserId').value='';
			document.getElementById('txtPassword1').value='';
			document.getElementById('txtPassword2').value='';
			document.getElementById('txtCentroTrabajo').value='';
			document.getElementById('txtFuncion').value='';
			document.getElementById('cboPerfilPublico').selectedIndex=1;
			document.getElementById('txtNoCI').value='';
			document.getElementById('cboGrupo').selectedIndex=0;
			document.getElementById('txtNombre').focus();
		*/
			document.location = "index.aspx";
		}
		
		// Llenar el cbo de las categorías maestrantes.
		function fillListaGrupos()
		{
			var refCbo = document.getElementById('cboGrupo');
			// Si el cbo ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCbo.options.length==0)
			{
				var res = ISPCFG.Msce.clswfRegister.getListaGrupos()
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
		}
	
		/*
			ESTABLECE LA VISIBILIDAD DE LOS BOTONES: Nuevo, Actualizar y Cancelar.
		*/
		function setButtomsVisibility()
		{
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			// Se espera que la variables: settings.Mode tenga uno de los  
			// siguientes valores: "Disabled" ó "Listar" ó "Nuevo" ó "Editar".
			switch(settings.Modo)
			{
				case 'Nuevo':
				{
					btnActualizar.style.display = 'inline';
					btnCancelar.style.display = 'inline';
					break;					
				}
				case 'Notificar':
				case 'Disabled':
				{
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
				getNewUserId();
				document.getElementById('spValUserId').style.display='none';
			}
		}

		function switchView()
		{
			tableEdit = document.getElementById('tbl_Edit');
			tableList = document.getElementById('tbl_List');
			switch(settings.Modo)
			{
				case 'Nuevo':
				{
					tableList.style.display='none';
					tableEdit.style.display='block';
					document.getElementById('txtNombre').focus();
					break;
				}
				case 'Notificar':
				{
					tableList.style.display='block';
					tableEdit.style.display='none';
					break;
				}
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
					ISPCFG.Msce.clswfRegister.getNewUserId(Nombre.value, Apellidos.value, getNewUserId_CallBack)
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
		
		function valEmail()
		{
			var textEmail = document.getElementById('txtEmail');
			if(textEmail.value==''){return true;}
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
					res = ISPCFG.Msce.clswfRegister.existUserId(0, textUserId.value).value;
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
					res = ISPCFG.Msce.clswfRegister.existNoCI(0, textNoCI.value).value;
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
			document.getElementById('dvNotify').innerHTML = strMessage;
		}

		/*
			INICIALIZAR DOCUMENTO
		*/
		switchView();
		fillListaGrupos();
		// Ocultar la imagen de registro.
		if(document.getElementById('imgRegister')!=null)
		{
			document.getElementById('imgRegister').style.visibility='hidden';		
		}
		//-->
		</script>
	</body>
</HTML>
