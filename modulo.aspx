<%@ Page language="c#" Codebehind="modulo.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfModulo" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title>Maestría: Módulos</title>
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
		<form id="frm_Modulo" method="post" runat="server">
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
									<!-- Control Web para las opciones de la izquierda -->
									<uc1:wucleftoptions id="ctlLeftOptions" runat="server"></uc1:wucleftoptions>
								</td>
								<td> <!-- MAIN WINDOW; BEGIN -->
									<table id="Table4" cellspacing="0" cellpadding="0" width="545" border="0">
										<tr valign="top">
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">MÓDULOS</span>
											</td>
										</tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<table id="tbl_Edit" border="0" align="center" width="90%" style="display: none;">
																<tr valign="top">
																	<td title="Número de orden: ej. '1', '2', etc." colspan="1" width="270">
																		Número de orden:&nbsp;<input class="frmTextInput" id="txtNoOrden" onchange="JavaScript:valNoOrden();" title="Número de orden: ej. '1', '2', etc." type="text" maxlength="2" size="2">
																	</td>
																	<td title="Nombre corto: ej. 'Módulo I', 'Módulo II', etc." width="270">
																		Nombre corto:&nbsp;<input class="frmTextInput" id="txtNombreCorto" onchange="JavaScript:valNombreCorto();" title="Nombre corto: ej. 'Módulo I', 'Módulo II', etc." type="text" maxlength="15" size="20">
																	</td>
																</tr>
																<tr valign="top">
																	<td><span class="spErrorNotification" id="spValNoOrden"></span></td>
																	<td><span class="spErrorNotification" id="spValNombreCorto"></span></td></tr>
																<!-- Nombre completo -->
																<tr valign="bottom">
																	<td align="left" colspan="1" rowspan="1">
																		Nombre completo:
																	</td>
																	<td align="right">
																		<span id="spLeftCharsNombreCompleto" style="COLOR: #47639a; TEXT-ALIGN: right">
																			Caracteres restantes:
																		</span>
																	</td>
																</tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<input class="frmTextInput" id="txtNombreCompleto" onkeydown="JavaScript:document.getElementById('spLeftCharsNombreCompleto').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 75);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValNombreCompleto'), 'El campo \'Nombre completo\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsNombreCompleto').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 75);" style="WIDTH: 100%" type="text">
																		<span class="spErrorNotification" id="spValNombreCompleto"></span>
																	</td>
																</tr>
																<tr valign="bottom">
																	<td align="left">
																		Objetivos:
																	</td>
																	<td align="right" colspan="1" rowspan="1">
																		<span id="spLeftCharsObjetivos" style="COLOR: #47639a; TEXT-ALIGN: right">
																			Caracteres restantes:
																		</span>
																	</td>
																</tr>
																<tr valign="top">
																	<td align="left" colspan="2">
																		<textarea class="frmTextInput" id="txtAreaObjetivos" onkeydown="JavaScript:document.getElementById('spLeftCharsObjetivos').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 500);" onchange="JavaScript:valEmptyString(this, document.getElementById('spValObjetivos'), 'El campo \'Objetivos\' no puede estar vacío.');" onkeyup="JavaScript:document.getElementById('spLeftCharsObjetivos').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 500);" style="WIDTH: 100%" rows="4"></textarea>
																		<span class="spErrorNotification" id="spValObjetivos"></span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="90%" align="center" border="0">
																<tr valign="top">
																	<td align="left">
																		<span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left">
																			Actualizando datos...
																		</span>
																	</td>
																	<td align="right">
																		<a id="lnkNuevo" title="Agregar un nuevo módulo." href="JavaScript:Nuevo();"><img id="imgNuevo" title="Agregar un nuevo módulo." alt="Nuevo" src="imagenes/btn_nuevo.gif" border="0"></a>
																		<a id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif" border="0"></a>
																		<a id="lnkCancelar" title="Cancelar" href="JavaScript:Cancelar();">&nbsp;<img id="imgCancelar" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif" border="0"></a>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="30" style="HEIGHT: 30px">
																		<hr width="100%" color="#47639a" size="1">
																		</hr></td></tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS MÓDULOS -->
																		<div id="dvListaModulos">
																		</div>
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

		/*
			VARIABLES GLOBALES A ESTA PÁGINA		
		*/	
		var strMode = 'Lista'; // Los valores pueden ser: 'Lista', 'Editar' y 'Nuevo'.
		var IdEditado; // Para saber cual es el Id del módulo que se está editando.

		/*
			VALIDACIONES
		*/
		
		// Esta se encuentra en "main.js"
		// function valEmptyString(sender, objMessageLabel, strMessage)

		/*
			VALIDA EL CAMPO txtNoOrden DESDE TODO PUNTO DE VISTA
			PARA CUANDO SE ESTÁ EDITANDO Y CUANDO SE ESTÁ AGREGANDO
			UN NUEVO REGISTRO O MÓDULO.
		*/
		function valNoOrden()
		{
			var textNoOrden = document.getElementById('txtNoOrden');
			
			if(!valEmptyString(textNoOrden, document.getElementById('spValNoOrden'), "El campo \"Número de orden\" no puede estar vacío.")){return false;}
			
			if(isNaN(textNoOrden.value))
			{
				document.getElementById('spValNoOrden').innerHTML = "El valor del campo \"Número de orden\" debe ser un número.";
				document.getElementById('spValNoOrden').style.display='block';
				return false;
			}
			
			if(strMode=='Nuevo')
			{
				var boValidNoOrden = ISPCFG.Msce.clswfModulo.isValidForNewNoOrden(textNoOrden.value).value;
				
				if(boValidNoOrden==false)
				{
					document.getElementById('spValNoOrden').innerHTML = "Ya existe un módulo con \"Número de orden\" igual a: " + textNoOrden.value + ". Por favor, cámbielo.";
					document.getElementById('spValNoOrden').style.display='block';
					return false;
				}
			}
			
			if(strMode=='Editar')
			{
				var boValidNoOrden = ISPCFG.Msce.clswfModulo.isValidForChangeNoOrden(IdEditado, textNoOrden.value).value;
				
				if(boValidNoOrden==false)
				{
					document.getElementById('spValNoOrden').innerHTML = "Ya existe un módulo con \"Número de orden\" igual a: " + textNoOrden.value + ". Por favor, cámbielo.";
					document.getElementById('spValNoOrden').style.display='block';
					return false;
				}
			}
			
			document.getElementById('spValNoOrden').innerHTML='';
			document.getElementById('spValNoOrden').style.display='none';
			return true;
		}

		/*
			VALIDA EL CAMPO txtNombreCorto DESDE TODO PUNTO DE VISTA
			PARA CUANDO SE ESTÁ EDITANDO Y CUANDO SE ESTÁ AGREGANDO
			UN NUEVO REGISTRO O MÓDULO.
		*/
		function valNombreCorto()
		{
			var textNombreCorto = document.getElementById('txtNombreCorto');
			
			if(!valEmptyString(textNombreCorto, document.getElementById('spValNombreCorto'), "El campo \"Nombre corto\" no puede estar vacío.")){return false;}
			
			
			if(strMode=='Nuevo')
			{
				var boValidNombreCorto = ISPCFG.Msce.clswfModulo.isValidForNewNombreCorto(textNombreCorto.value).value;
			
				if(boValidNombreCorto==false)
				{
					document.getElementById('spValNombreCorto').innerHTML = "Ya existe un módulo con \"Nombre corto\" igual a: " + textNombreCorto.value + ". Por favor, cámbielo.";
					document.getElementById('spValNombreCorto').style.display='block';
					return false;
				}
			}
			
			if(strMode=='Editar')
			{
				var boValidNombreCorto = ISPCFG.Msce.clswfModulo.isValidForChangeNombreCorto(IdEditado, textNombreCorto.value).value;
				
				if(boValidNombreCorto==false)
				{
					document.getElementById('spValNombreCorto').innerHTML = "Ya existe un módulo con \"Nombre corto\" igual a: " + textNombreCorto.value + ". Por favor, cámbielo.";
					document.getElementById('spValNombreCorto').style.display='block';
					return false;
				}
			}
			
			document.getElementById('spValNombreCorto').innerHTML='';
			document.getElementById('spValNombreCorto').style.display='none';
			return true;
		}
		
		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valDocument()
		{
			boResult = false;
			// Validar txtNoOrden.
			var validNoOrden = valNoOrden();
			// Validar txtNombreCorto.
			var validNombreCorto = valNombreCorto();
			// Validar txtNombreCompleto.
			var validNombreCompleto = valEmptyString(document.getElementById('txtNombreCompleto'), document.getElementById('spValNombreCompleto'), "El campo \"Nombre completo\" no puede estar vacío.");
			// Validar txtAreaObjetivos.
			var validObjetivos = valEmptyString(document.getElementById('txtAreaObjetivos'), document.getElementById('spValObjetivos'), "El campo \"Objetivos\" no puede estar vacío.");

			return (validNoOrden==true) & (validNombreCorto==true) & (validNombreCompleto==true) & (validObjetivos==true);

		}

		function setButtomsVisibility()
		{
			var btnNuevo = document.getElementById('lnkNuevo');
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			switch(strMode)
			{
				case 'Editar':
				{
					btnNuevo.style.display='none';
					btnActualizar.style.display='inline';
					btnCancelar.style.display='inline';
					break;
				}
				case 'Nuevo':
				{
					btnNuevo.style.display='none';
					btnActualizar.style.display='inline';
					btnCancelar.style.display='inline';
					break;					
				}
				default:
				{
					btnNuevo.style.display='inline';
					btnActualizar.style.display='none';
					btnCancelar.style.display='none';
				}
			}
		}
		
		function Editar(Id)
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
			
			IdEditado = Id;
			document.body.scrollTop = 0;
			document.getElementById('txtNoOrden').value = document.getElementById('NoOrden'+Id).innerHTML;
			document.getElementById('txtNombreCorto').value = document.getElementById('NombreCorto'+Id).innerHTML;
			document.getElementById('txtNombreCompleto').value = document.getElementById('NombreCompleto'+Id).innerHTML;
			document.getElementById('spLeftCharsNombreCompleto').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtNombreCompleto'), 75);
			document.getElementById('txtAreaObjetivos').value = document.getElementById('Objetivos'+Id).innerHTML;
			document.getElementById('spLeftCharsObjetivos').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaObjetivos'), 500);
			document.getElementById('dvModulo'+Id).style.display='none';
			document.getElementById('txtNoOrden').focus();
		}
		
		/*
			PROCEDIMIENTOS CON DEPENDENCIA DE AJAX
		*/
		
		// LLENA LOS DATOS QUE CORRESPONDEN A LA PÁGINA.
		function FillPageData()
		{
			// Obtener los datos de los módulos.
			var dvModulos = ISPCFG.Msce.clswfModulo.FillPageData().value;
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divListaModulos = document.getElementById('dvListaModulos')
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvModulos.Rows.length==0)
			{
				dvModulos = null;
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divListaModulos.innerHTML = "<b>NO EXISTEN MÓDULOS REGISTRADOS.</b>";
				Nuevo();
				document.getElementById('txtNoOrden').value=1;
				return;
			}
			else
			{
				document.getElementById('tbl_Edit').style.display='none';
			}
			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"middle\">\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"20%\"><b>Acciones</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"20%\"><b>No. Orden</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"60%\"><b>Nombre corto</b></td>\n";
					strHTML_Header += "\t</tr>\n";
					strHTML_Header += "</table>\n";
			
			divListaModulos.innerHTML = strHTML_Header;
			
			for(var i=0; i<=(dvModulos.Rows.length-1); ++i)
			{
				var strHTML_Body = "";
				var Id = dvModulos.Rows[i].Id;
				var NoOrden = dvModulos.Rows[i].NoOrden;
				var NombreCorto = dvModulos.Rows[i].NombreCorto;
				var NombreCompleto = dvModulos.Rows[i].NombreCompleto;
				var Objetivos = dvModulos.Rows[i].Objetivos;
				// Formar el cuerpo del registro actual.
				strHTML_Body =	"<div id=\"dvModulo" + Id + "\">\n";
				strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML_Body += "\t<table border=\"0\" width=\"100%\">\n";
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td rowspan=\"3\" width=\"20%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;</td>\n";
				strHTML_Body += "\t\t\t<td width=\"20%\" id=\"NoOrden" + Id + "\">" + NoOrden + "</td>\n";
				strHTML_Body += "\t\t\t<td width=\"60%\" id=\"NombreCorto" + Id + "\">" + NombreCorto + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td colspan=\"2\" width=\"80%\" id=\"NombreCompleto" + Id + "\">" + NombreCompleto + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td colspan=\"2\" width=\"80%\" id=\"Objetivos" + Id + "\">" + Objetivos + "</td>\n";
				strHTML_Body += "\t\t</tr>\n";
				if(i<dvModulos.Rows.length-1)
				{
					strHTML_Body += "\t\t<tr valign=\"top\">\n";
					strHTML_Body += "\t\t\t<td colspan=\"3\">\n";
					strHTML_Body += "\t\t\t\t<hr width=\"100%\" class=\"hr_SeparatorRecord\" size=\"1\"></hr>\n";
					strHTML_Body += "\t\t\t</td>\n";
					strHTML_Body += "\t\t</tr>\n";
					strHTML_Body += "\t</table>\n";
					strHTML_Body += "</div>\n";
				}
				divListaModulos.innerHTML += strHTML_Body;
				
			}
			
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			dvModulos=null; 
			
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

			// La comprobación del valor de resultado la hago cuando asigno el valor a
			// otra variable, más adelante en este mismo procedimiento.
			var bytNextNoOrden = ISPCFG.Msce.clswfModulo.getNextNoOrden().value;

			// Hacer visible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='';
			document.body.scrollTop = 0;
			document.getElementById('txtNoOrden').value=bytNextNoOrden!=null?bytNextNoOrden:'';
			// Limpiar los valores de los demás controles.
			document.getElementById('txtNombreCorto').value='';
			document.getElementById('txtNombreCompleto').value='';
			document.getElementById('spLeftCharsNombreCompleto').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtNombreCompleto'), 75);
			document.getElementById('txtAreaObjetivos').value='';
			document.getElementById('spLeftCharsObjetivos').innerHTML='Caracteres restantes: ' + getInputCharLeft(document.getElementById('txtAreaObjetivos'), 500);
			document.getElementById('txtNoOrden').focus();
		}
		
		function resetAllValMessages()
		{	
			document.getElementById('spValNoOrden').innerHTML = '';
			document.getElementById('spValNoOrden').style.display = 'none';
			document.getElementById('spValNombreCorto').innerHTML = '';
			document.getElementById('spValNombreCorto').style.display = 'none';
			document.getElementById('spValNombreCompleto').innerHTML = '';
			document.getElementById('spValNombreCompleto').style.display = 'none';
			document.getElementById('spValObjetivos').innerHTML = '';
			document.getElementById('spValObjetivos').style.display = 'none';
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
				if(document.getElementById('dvModulo'+IdEditado)!=null)
				{
					document.getElementById('dvModulo'+IdEditado).style.display='block';
				}
			}
			// Hacer invisible la tabla para los controles de edición del módulo.
			document.getElementById('tbl_Edit').style.display='none';
		}
				
		function Cancelar()
		{
			stopEditing();
			strMode = 'default';
			setButtomsVisibility();
			document.getElementById('spEstadoActualizacion').innerHTML = '';
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Esconder todos los mensajes de error en datos de los controles.
			resetAllValMessages();
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
			var Modulo = ISPCFG.Msce.clswfModulo.getModuloClass().value;
			if(Modulo==null)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del módulo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				return;
			}
			// Obtener los valores de los campos.
		 	var textNoOrden = document.getElementById('txtNoOrden').value;
			var textNombreCorto = document.getElementById('txtNombreCorto').value;
			var textNombreCompleto = document.getElementById('txtNombreCompleto').value;
			var textObjetivos = document.getElementById('txtAreaObjetivos').value;
			var boResult = false;
			
			Modulo.NoOrden = textNoOrden;
			Modulo.NombreCorto = textNombreCorto;
			Modulo.NombreCompleto = textNombreCompleto;
			Modulo.Objetivos = textObjetivos;
			
			if(strMode=='Nuevo')
			{
				//Modulo.Id = null; Esto no es necesario, la clase clsModulo lo hace sola.
				document.getElementById('spEstadoActualizacion').innerHTML = 'Agregando módulo...';
				ISPCFG.Msce.clswfModulo.Agregar(Modulo, Actualizar_CallBack);
				Modulo = null;
				return;
			}
			if(strMode=='Editar')
			{
				Modulo.Id = IdEditado;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualizando módulo...';
				ISPCFG.Msce.clswfModulo.Actualizar(Modulo, Actualizar_CallBack);
				Modulo = null;
			}
			
		}

		function Actualizar_CallBack(res)
		{
			var strErrorMessage;
			if(res.error!=null)
			{
				if(strMode=='Nuevo')
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido agregar el nuevo módulo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";					
				}
				else
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del módulo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";				
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
					var strWarningMessage = "Estimado usuario, no se ha podido actualizar los datos del módulo, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarningMessage);
				}
				else
				{
					stopEditing();
					FillPageData();
					strMode = 'default';
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

			var res = ISPCFG.Msce.clswfModulo.canBeDeleted(Id);
			if(res.value==null)
			{
				var strErrorMessage = "No se pudo comprobar si este módulo puede ser eliminado.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = ISPCFG.Msce.clswfModulo.WhyCanNotBeDeleted(Id).value;
				if(strWarning!=null)
				{
					// Ciclo para mostrar los errores.
					for(x=0; x<=(strWarning.length-1); x++)
					{
						boOmitirCloseButton = (x==(strWarning.length-2));
						ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), 'Este módulo no puede ser eliminado por la(s) siguiente causa.', strWarning[x], boOmitirCloseButton);
					}
					res = null;
					strWarning = null;
					return;
				}
				else
				{
					var strErrorMessage = "No se han podido obtener las causas que impiden eliminar este módulo.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				}				
			}
			else
			{
				if(!window.confirm("Se eliminarán los datos del módulo seleccionado.")){return;}
				ISPCFG.Msce.clswfModulo.Eliminar(Id, Eliminar_CallBack);
				res = null;
			}
		}
		
		function Eliminar_CallBack(res)
		{
			if(res.error!=null)
			{
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido eliminar el módulo. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res = null;
				return;
			}
			if(res.value==false)
			{
				var strWarning = "Estimado usuario, no se ha podido eliminar el módulo, sin embargo no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageWarning(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), null, strWarning);
				res = null;
				return;
			}
			else
			{
				FillPageData();
				document.body.scrollTop = 0;
				document.getElementById('spEstadoActualizacion').innerHTML = 'Módulo eliminado.';
			}
		}
		
		/*
			INICIALIZAR LA PÁGINA.
		*/
		FillPageData();
		setButtomsVisibility();

		
		//-->
		</script>


	</body>
</html>
