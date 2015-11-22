<%@ Page language="c#" Codebehind="grupo.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfGrupo" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title>Maestría: Grupos</title>
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
		<form id="frm_Grupo" method="post" runat="server">
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">GRUPOS</span> </td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<table id="tbl_Edit" width="80%" align="center" border="0" style="DISPLAY: none">
																<!-- cboSede -->
																<tr valign="middle">
																	<td align="left" width="15%">Sede: </td>
																	<td align="left"><select class="frmTextInput" id="cboSede"></select></td></tr>
																<!-- cboMencion -->
																<tr valign="middle">
																	<td align="left" width="15%">Mención: </td>
																	<td align="left"><select class="frmTextInput" id="cboMencion"></select></td></tr>
																<!-- Nombre -->
																<tr valign="bottom">
																	<td align="left" width="15%">Nombre: </td>
																	<td align="right"><span id="spLeftCharsNombre" style="COLOR: #47639a; TEXT-ALIGN: right">Caracteres
																			restantes:
																		</span></td></tr>
																<tr valign="top">
																	<td align="left" colspan="2"><input class="frmTextInput" id="txtNombre" onkeydown="JavaScript:document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 25);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValNombre'), 'El campo \'Nombre\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 25);" style="WIDTH: 100%" type="text"><span class="spErrorNotification" id="spValNombre"></span> </td></tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr></table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="80%" align="center" border="0">
																<tr valign="top">
																	<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left"></span></td>
																	<td align="right">
																		<a id="lnkNuevo" title="Agregar un nuevo módulo." href="JavaScript:Nuevo();"><img id="imgNuevo" title="Agregar un nuevo módulo." alt="Nuevo" src="imagenes/btn_nuevo.gif" border="0"></a>
																		<a id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif" border="0"></a>
																		<a id="lnkCancelar" title="Cancelar" href="JavaScript:Cancelar();">&nbsp;<img id="imgCancelar" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS MÓDULOS -->
																		<div id="dvListaGrupos"></div></td></tr></table></td></tr></table></td></tr></table>
									<!-- MAIN WINDOW; END --></td></tr></table>
						<!-- BODY TABLE; END --></td></tr></table></form>
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

		// LLENA LOS DATOS QUE CORRESPONDEN A LA PÁGINA.
		function getAllGrupos()
		{
			// Si el cboSede ó el cboMencion no tiene elementos en la lista, entonces ni intentar un roundtrip al servidor.
			//if(document.getElementById('cboSede').options.length==0 || document.getElementById('cboMencion').options.length==0){return;}
			// Obtener los datos de los módulos.
			var dvGrupos = ISPCFG.Msce.clswfGrupo.getAllGrupos().value;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divListaGrupos = document.getElementById('dvListaGrupos')
			// Si no existen registros de módulos.
			if(dvGrupos.Rows.length==0)
			{
				dvGrupos = null;
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divListaGrupos.innerHTML = "<b>NO EXISTEN GRUPOS REGISTRADOS.</b>";
				// Poner el webForm para ingresar Nuevo registro.
				Nuevo();
				return;
			}
			else
			{
				document.getElementById('tbl_Edit').style.display='none';
			}
			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table border=\"0\" width=\"80%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td width=\"15%\"><b>Acciones</b></td>\n";
					strHTML_Header += "\t\t<td><b>Sede</b></td>\n";
					strHTML_Header += "\t\t<td><b>Mención</b></td>\n";
					strHTML_Header += "\t\t<td><b>Nombre</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			
			var strHTML_Body = '';
			for(var i=0; i<=(dvGrupos.Rows.length-1); i++)
			{
				var Id = dvGrupos.Rows[i].Id;
				var IdSede = dvGrupos.Rows[i].IdSede;
				var Sede = dvGrupos.Rows[i].Sede;
				var IdMencion = dvGrupos.Rows[i].IdMencion;
				var Mencion = dvGrupos.Rows[i].Mencion;
				var Nombre = dvGrupos.Rows[i].Nombre;
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t\t<tr id=\"trGrupo" + Id + "\" valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" width=\"15%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ", " + IdSede + ", " + IdMencion + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Sede" + Id + "\">" + Sede + "</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Mencion" + Id + "\">" + Mencion + "</td>\n";
				strHTML_Body += "\t\t\t<td valign=\"top\" id=\"Nombre" + Id + "\">" + Nombre + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
			}
			
			strHTML_Foot = "</table>\n";
			
			divListaGrupos.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			dvGrupos=null; 
		}

		function Editar(Id, IdSede, IdMencion)
		{
			stopEditing();
			// Esconder todos los mensajes de error en datos de los controles.
			resetAllValMessages();
			// Establecer el modo de este webFrom.
			strMode = 'Editar';
			// Establecer la visibilidad de los notones de acuerdo al modo.
			setButtomsVisibility();
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Hacer visible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder el tr que ocntiene los datos que se van a editar.
			document.getElementById('trGrupo'+Id).style.display='none';
			IdEditado = Id;
			document.body.scrollTop = 0;
			// Llenar el cboSedes, donde también se maneja la posición del valor seleccionado de esta lista.
			fillListaSedes(IdSede);
			// Llenar el cboMenciones, donde también se maneja la posición del valor seleccionado de esta lista.
			fillListaMenciones(IdMencion);
			document.getElementById('txtNombre').value = document.getElementById('Nombre'+Id).innerHTML;
			document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtNombre'), 25);
			document.getElementById('cboSede').focus();
		}
		
		function Nuevo()
		{
			strMode = 'Nuevo';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Establecer la visibilidad de los notones de acuerdo al modo.
			setButtomsVisibility();
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Hacer visible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='';
			document.body.scrollTop = 0;
			// Limpiar los valores de los demás controles.
			document.getElementById('txtNombre').value='';
			// Si alguno de los CBOs de Sedes y de Menciones no tiene elementos, entonces el webForm no es funcional.
			if(!((fillListaSedes(0)==true)&(fillListaMenciones(0)==true))){return;};
			// Llenar el cboMenciones, donde también se maneja la posición del valor seleccionado de esta lista.
			document.getElementById('spLeftCharsNombre').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtNombre'), 25);
			document.getElementById('cboSede').focus();
		}

		// Llenar el cbo de las sedes.
		function fillListaSedes(IdSede)
		{
			var refCboSede = document.getElementById('cboSede');
			// Si el cboSede ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCboSede.options.length==0)
			{
				var res = ISPCFG.Msce.clswfGrupo.getListaSedes();
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de las sedes registradas.");
					res=null;
					return;
				}
				
				dataView = res.value;
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					refCboSede.options[refCboSede.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);
				}
				return true;
				res=null;			
			}

			// Establecer el valor de selectedIndex del cboSede para que 
			// se corresponda con el grupo que se esté editando.
			if(strMode=='Editar'||strMode=='Nuevo'){setIndexInCboSede(IdSede);}
		}
		
		// Establecer el valor de selectedIndex del cboSede para que 
		// se corresponda con el grupo que se esté editando.
		function setIndexInCboSede(IdSede)
		{
			var refCboSede = document.getElementById('cboSede');
			if(refCboSede.options.length==0){return;}
			for(var i = 0; i<=(refCboSede.options.length-1); i++)
			{
				if(refCboSede.options[i].value==IdSede){refCboSede.selectedIndex=i;return;}
			}
		}
		
		// Llenar el cbo de las menciones.
		function fillListaMenciones(IdMencion)
		{
			var refCboMencion = document.getElementById('cboMencion');
			// Si el cboSede ya está formado, entonces no es necesario llenarlo nuevamente.
			if(refCboMencion.options.length==0)
			{
				var res = ISPCFG.Msce.clswfGrupo.getListaMenciones()
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
					ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de las menciones registradas.");
					res=null;
					return;
				}
				
				dataView = res.value;  
				// Si no existen registros mandar a desabilitar el formulario.
				if(dataView.Rows.length==0){disableForm();return false;}
				for(var i = 0; i<=(dataView.Rows.length-1); i++)
				{
					refCboMencion.options[refCboMencion.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);
				}
				return true;
				res=null;			
			}

			// Establecer el valor de selectedIndex del cboMencion para que 
			// se corresponda con el grupo que se esté editando.
			if(strMode=='Editar'||strMode=='Nuevo'){setIndexInCboMencion(IdMencion);}
		}
		
		// Establecer el valor de selectedIndex del cboMencion para que 
		// se corresponda con el grupo que se esté editando.
		function setIndexInCboMencion(IdMencion)
		{
			var refCboMencion = document.getElementById('cboMencion');
			if(refCboMencion.options.length==0){return;}
			for(var i = 0; i<=(refCboMencion.options.length-1); i++)
			{
				if(refCboMencion.options[i].value==IdMencion){refCboMencion.selectedIndex=i;return;}
			}
		}

		function Actualizar()
		{
 			// Si no son válidos los datos, entonces retornar.
			if(!valDocument()){return;}
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar la zona de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Obtener la clase clsMódulo.
			var Grupo = ISPCFG.Msce.clswfGrupo.getGrupoClass().value;
			if(Grupo==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del grupo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				return;
			}
			
			// Obtener los valores de los campos.
			Grupo.IdSede = document.getElementById('cboSede').value;
			Grupo.IdMencion = document.getElementById('cboMencion').value;
			Grupo.Nombre = document.getElementById('txtNombre').value;
			var boResult = false;
			
			if(strMode=='Nuevo')
			{
				//Modulo.Id = null; Esto no es necesario, la clase clsModulo lo hace sola.
				document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando grupo...';
				ISPCFG.Msce.clswfGrupo.Agregar(Grupo, Actualizar_CallBack);
				Grupo = null;
				return;
			}
			if(strMode=='Editar')
			{
				Grupo.Id = IdEditado;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando grupo...';
				ISPCFG.Msce.clswfGrupo.Actualizar(Grupo, Actualizar_CallBack);
				Grupo = null;
			}
		}

		function Actualizar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				if(strMode=='Nuevo')
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar el grupo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del grupo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
				}
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
			}
			else
			{
				if(res.value==false || res.value==null)
				{
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos del grupo, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
				}
				else
				{
					stopEditing();
					getAllGrupos();
					strMode = 'Lista';
					setButtomsVisibility();
					document.getElementById('spEstadoActualizacion').innerHTML = 'Actualización efectuada.';
				}
			}				
			res=null;
		}
		
		function Eliminar(Id)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar la zona de notificación de actualización efectuada.
			document.getElementById('spEstadoActualizacion').innerHTML = '';

			var res = ISPCFG.Msce.clswfGrupo.canBeDeleted(Id);
			if(res.value==null)
			{
				var strErrorMessage = "No se pudo comprobar si este grupo puede ser eliminado.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = ISPCFG.Msce.clswfGrupo.WhyCanNotBeDeleted(Id).value;
				if(strWarning!=null)
				{
					// Ciclo para mostrar los errores.
					for(x=0; x<=(strWarning.length-1); x++)
					{
						boOmitirCloseButton = (x==(strWarning.length-2));
						ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Este grupo no puede ser eliminado por la(s) siguiente causa.', strWarning[x], boOmitirCloseButton);
					}
					res = null;
					strWarning = null;
					return;
				}
				else
				{
					var strErrorMessage = "No se han podido obtener las causas que impiden eliminar este grupo.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				}				
			}
			else
			{
				if(!window.confirm("Se eliminarán los datos del grupo seleccionado.")){return;}
				ISPCFG.Msce.clswfGrupo.Eliminar(Id, Eliminar_CallBack);
				res = null;
			}
		}
		
		function Eliminar_CallBack(res)
		{
			if(res.error!=null)
			{
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar el grupo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = "Estimado usuario, no se ha podido eliminar el grupo, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
				res = null;
				return;
			}
			else
			{
				getAllGrupos();
				document.body.scrollTop = 0;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Grupo eliminado.';
			}
		}
		
		function Cancelar()
		{
			stopEditing();
			strMode = 'Lista';
			setButtomsVisibility();
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder todos los mensajes de error en datos de los controles.
			resetAllValMessages();
		}

		function resetAllValMessages()
		{	
			document.getElementById('spValNombre').innerHTML = '';
			document.getElementById('spValNombre').style.display = 'none';
		}
		
		/*
			SI SE ESTÁ EN MODO DE EDICIÓN DE ALGÚN MÓDULO ENTONCES 
			SE HACEN VISIBLES LOS DATOS DEL MISMO EN LA LISTA, PERO
			EN CUALQUIER CASO, ESCONDE LA TABLA PARA LAS EDICIONES
			Y EL BOTÓN "Actualizar".
		*/
		function stopEditing()
		{
			// Si ya se estaba editando algún módulo.
			if(strMode=='Editar')
			{
				// Hacer visible el módulo que se estaba editando.
				if(document.getElementById('trGrupo'+IdEditado)!=null)
				{
					document.getElementById('trGrupo'+IdEditado).style.display='';
				}
			}
			// Hacer invisible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='none';
		}
		
		/*
			VALIDACIONES
		*/
		// Esta se encuentra en "main.js"
		// function valEmptyString(sender, objMessageLabel, strMessage)

		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valDocument()
		{
			// Validar txtNombre.
			var validNombre = valEmptyString(document.getElementById('txtNombre'), document.getElementById('spValNombre'), "El campo \"Nombre\" no puede estar vacío.");
			return validNombre;
		}

		function setButtomsVisibility()
		{
			var btnNuevo = document.getElementById('lnkNuevo');
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			switch(strMode)
			{
				case 'Nuevo':
				case 'Editar':
				{
					btnNuevo.style.display='none';
					btnActualizar.style.display='inline';
					btnCancelar.style.display='inline';
					break;					
				}
				// Para cuando no existan Sedes y/o Menciones registradas, este webForm no es válido.
				case 'Disabled':
				{
					btnNuevo.style.display='none';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
					break;
				}
				// default es igual a 'Lista'
				default:
				{
					btnNuevo.style.display='inline';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
				}
			}
		}

		function disableForm()
		{
			stopEditing();
			strMode = 'Disabled';
			setButtomsVisibility();
			var strMessage	= MSG_PROCESSING_BEGTAG;
					strMessage += "<b>PARA QUE ESTE FORMULARIO SEA COMPLETAMENTE FUNCIONAL ES ";
					strMessage += "NECESARIO QUE ESTEN REGISTRADAS DE ANTEMANO LAS <a href=\"sede.aspx\">Sedes</a> ";
					strMessage += "Y LAS <a href=\"mencion.aspx\">Menciones</a> QUE CORRESPONDAN.</b>";
					strMessage += MSG_ENDTAG;
			document.getElementById('dvListaGrupos').innerHTML = strMessage;
		}
		
		/*
			VARIABLES LOCALES DE ESTA PÁGINA		
		*/	
		var strMode = 'Lista'; // Los valores pueden ser: 'Lista', 'Editar', 'Nuevo' ó 'Disabled'.
		var IdEditado; // Para saber cual es el Id del módulo que se está editando.

		/*
			PROCEDIMIENTOS PARA INICIALIZACIÓN
		*/
		getAllGrupos();
		setButtomsVisibility();

		//-->
		</script>

	</body>
</html>
