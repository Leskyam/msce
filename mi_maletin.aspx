<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Page language="c#" Codebehind="mi_maletin.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfMiMaletin" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<HTML>
	<HEAD>
		<title>Maestría: Mi maletín</title>
		<meta content="False" name="vs_showGrid">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="estilos/main.css" type="text/css" rel="stylesheet">
		<link rel="shortcut icon" href="imagenes/favicon.ico">
		<!-- Cargar el fichero principal de scripts del lado del cliente -->
		<script src="includes/main.js" type="text/javascript"></script>
		<script src="includes/dates.js" type="text/javascript"></script>
	</HEAD>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"> <!-- PAGE TABLE; BEGIN -->
		<form id="frm_MiMaletin" method="post" enctype="multipart/form-data" runat="server">
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
												align="center" width="545" height="65">
												<span class="subtit_A" id="spHeaderContent">MI MALETÍN </span>
											</td>
										</tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="0" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="center" height="320" width="100%" style="PADDING-RIGHT: 15px; PADDING-LEFT: 15px">
															<!-- TABLA PARA LA INFORMACIÓN DE LA QUOTA ASIGNADA Y UTILIZADA -->
															<table id="tbl_Info" width="100%" style="DISPLAY: block" border="0">
																<tr valign="bottom">
																	<td align="left" class="normalTextInfo_A" width="100%">
																		<label><b>Quota:</b></label>&nbsp;<span id="spEspacioPermitido"></span>&nbsp;&nbsp;
																		<label><b>Espacio utilizado:</b></label>&nbsp;<span id="spEspacioOcupado"></span>
																	</td>
																	<!-- Fondo: #ffffcc Bordes: #330099 Verde: #66cc00 Azul: #415884 Rojo: #ff0033 -->
																	<td align="left" width="152">
																		<label id="lblTextoPorciento" class="tinyTextInfo_A"></label>
																		<br>
																		<span id="dvWrapperPorciento" style="BORDER-RIGHT: #330099 1px solid; BORDER-TOP: #330099 1px solid; DISPLAY: block; BORDER-LEFT: #330099 1px solid; WIDTH: 152px; BORDER-BOTTOM: #330099 1px solid; HEIGHT: 5px; BACKGROUND-COLOR: #ffffcc; TEXT-ALIGN: left">
																			<span id="dvImagenPorciento" style="DISPLAY: block; MARGIN: 1px; WIDTH: 0px; HEIGHT: 3px; BACKGROUND-COLOR: #ff6666; TEXT-ALIGN: left">
																			</span></span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1" width="100%">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA RENOMBRAR FICHERO -->
															<table id="tbl_Renombrar" style="DISPLAY: none" width="100%" align="center" border="0">
																<!-- txtNombreActual -->
																<tr valign="middle">
																	<td align="left" colspan="2" width="510">
																		<span class="normalTextInfo_A"><b>Cambiar nombre del fichero seleccionado</b></span>
																	</td>
																</tr>
																<tr valign="middle">
																	<td align="left" nowrap>
																		<label for="txtNombreActual">Nombre actual del fichero:</label>
																	</td>
																	<td align="left">
																		<input class="frmTextInput_disabled" id="txtNombreActual" size="35" maxlength="50" type="text"
																			readonly>
																	</td>
																</tr>
																<!-- txtNuevoNombre -->
																<tr valign="middle">
																	<td align="left" nowrap>
																		<label for="txtNuevoNombre">Nuevo nombre propuesto:</label>
																	</td>
																	<td align="left">
																		<input class="frmTextInput" id="txtNuevoNombre" size="35" maxlength="50" type="text"><span id="spValNuevoNombre" class="spErrorNotification" style="WIDTH: 100%"></span>
																	</td>
																</tr>
																<!-- Separador -->
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA AGREGAR NUEVOS FICHEROS AL MALETÍN -->
															<table id="tbl_Nuevo" style="DISPLAY: none" width="100%" align="center" border="0">
																<tr valign="middle">
																	<td align="left" width="510" colspan="2">
																		<span class="normalTextInfo_A"><b>Agregar nuevos ficheros a mi maletín</b></span>
																	</td>
																</tr>
																<!-- TR para incrustar los elementos para la selección de ficheros para hacer uploads -->
																<tr valign="top">
																	<td align="left">
																		<div id="dvWrapperFileBrowser"><input class="frmTextInput" id="element_input" size="50" type="file" name="file_1" runat="server"><br>
																			<div id="files_list" style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: black 1px solid; PADDING-LEFT: 5px; FONT-SIZE: 7pt; BACKGROUND: #fff; PADDING-BOTTOM: 5px; BORDER-LEFT: black 1px solid; PADDING-TOP: 5px; BORDER-BOTTOM: black 1px solid">
																				<div id="files_list_header">Files (maximum X):</div>
																			</div>
																		</div>
																		<script src="includes/multifile.js"></script>
																	</td>
																</tr>
																<!-- Separador -->
																<tr valign="top">
																	<td height="1" width="100%">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<tr valign="top">
																	<td align="left">
																		<span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left"></span>
																	</td>
																	<td align="right" nowrap>
																		<a id="lnkNuevo" title="Agregar un nuevo módulo." href="JavaScript:Nuevo();"><img id="imgNuevo" title="Agregar un nuevo módulo." alt="Nuevo" src="imagenes/btn_nuevo.gif"
																				border="0"></a> <a id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">
																			&nbsp;<img title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif"
																				border="0"></a> <a id="lnkCancelar" title="Cancelar" href="JavaScript:Cancelar();">
																			&nbsp;<img id="imgCancelar" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif"
																				border="0"></a>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2" height="1">
																		<hr width="100%" color="#47639a" size="1">
																		</hr>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS FICHEROS EN EL MALETÍN -->
																		<div id="dvLista"></div>
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
		</form> <!-- PAGE TABLE; END -->
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
		
		var settings = {"Modo": 'Listar', "allowNewUploads": true, "IdEditado": null};
		
		function getMiMaletin()
		{
			settings.Modo = 'Listar';
			switchView();
			ISPCFG.Msce.clswfMiMaletin.getMiMaletin(getMiMaletin_CallBack);
		}
		function getMiMaletin_CallBack(res)
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los elementos de su perfil.");
				res=null;
				return false;
			}
				
			MiMaletin = res.value;  
			document.getElementById('spEspacioPermitido').innerHTML = parseInt(parseInt(MiMaletin.BriefcaseMaxSizeAllowed)/1024) + " KB";
			document.getElementById('spEspacioOcupado').innerHTML = parseInt(parseInt(MiMaletin.EspacioOcupado)/1024) + " KB";
			// Azul: #415884 Verde: #66cc00 Rojo: #ff0033
			// Entre 0 y 50 mostrar la barra de porciento de color azul.
			if(parseInt(MiMaletin.PorcientoOcupado)<=50){document.getElementById('dvImagenPorciento').style.backgroundColor = "#415884";}
			// Entre 51 y 80 mostrar la barra de porciento de color verde.
			if(parseInt(MiMaletin.PorcientoOcupado)>50 & parseInt(MiMaletin.PorcientoOcupado)<=80){document.getElementById('dvImagenPorciento').style.backgroundColor = "#66cc00";}
			// Mayor que 80 mostrar la barra de porciento de color rojo.
			if(parseInt(MiMaletin.PorcientoOcupado)>80){document.getElementById('dvImagenPorciento').style.backgroundColor = "#ff0033";}
			// Definir el ancho de la barra que indica el porciento de manera gráfica.
			document.getElementById('dvImagenPorciento').style.width = parseInt(parseFloat(MiMaletin.PorcientoOcupado)*1.5)<=150?parseInt(parseFloat(MiMaletin.PorcientoOcupado)*1.5):150;
			document.getElementById('lblTextoPorciento').innerHTML = parseFloat(MiMaletin.PorcientoOcupado) + " % utilizado";
			
			// Establecer la variable que indica si se permiten nuevos uploads.
			settings.allowNewUploads = MiMaletin.PorcientoOcupado<100.00;

			var strHTML = "<table border=\"0\" width=\"100%\">\n";
					strHTML += "\t<tr valign=\"bottom\">\n";
					strHTML += "\t\t<td align=\"left\" width=\"20%\" nowrap><b>Acciones</b></td>\n";
					strHTML += "\t\t<td align=\"left\" width=\"50%\" nowrap><b>Nombre</b></td>\n";
					strHTML += "\t\t<td align=\"left\" width=\"10%\"><b>Tamaño (bytes)</b></td>\n";
					strHTML += "\t\t<td align=\"left\" width=\"20%\"><b>Ultima modificacion</b></td>\n";
					strHTML += "\t</tr>\n";

			for(i=0; i<=(MiMaletin.Contenido.length-1); i++)
			{
				var Id = MiMaletin.Contenido[i].Id;
				var Nombre = MiMaletin.Contenido[i].Nombre;
				var Size = MiMaletin.Contenido[i].Size;
				var Fecha = MiMaletin.Contenido[i].FechaUltimaModificacion;
				// Formar el cuerpo del registro actual.
				//strHTML += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML += "\t<tr id=\"trFile" + Id + "\" valign=\"top\">\n";
				strHTML += "\t\t<td width=\"20%\"><a style=\"text-Decoration: underline\" href=\"JavaScript:Renombrar(" + Id + ", '" + Nombre + "');\">Renombrar</a>&nbsp;<a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar('" + Nombre + "');\">Eliminar</a>&nbsp;</td>\n";
				strHTML += "\t\t<td width=\"30%\" id=\"Nombre" + Id + "\"><a href=\"JavaScript:download(this, '" + Nombre + "');\">" + Nombre + "</a></td>\n";
				strHTML += "\t\t<td width=\"20%\" id=\"Size" + Id + "\">" + Size + "</td>\n";
				strHTML += "\t\t<td width=\"30%\" id=\"Fecha" + Id + "\">" + getStringFromDate(Fecha) + "</td>\n";
				strHTML += "\t</tr>\n";
			}
			
			strHTML += "\t<tr id=\"trFoot\" valign=\"bottom\">\n";
			strHTML += "\t\t<td colspan=\"4\"><b>Total de ficheros:</b> " + MiMaletin.CantTotalFiles + "</td>\n";
			strHTML += "\t</tr>\n";
			strHTML += "</table>\n";
				
			document.getElementById("dvLista").innerHTML = strHTML;	
			// Ejecutar la función setButtomsVisibility(), aunque esta se ejecuta en switchView(), 
			// para que se tenga en cuenta si se ha deshabilitado la posibilidad de hacer nuevos uploads.
			setButtomsVisibility();
			
		}

		function Nuevo()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar el área de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = "";

			settings.Modo = "Nuevo";
			switchView();
			document.getElementById('element_input').focus();
			return;
		}

		function Renombrar(id, nombre)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar el área de notificación de actualización.
			document.getElementById('spEstadoActualizacion').innerHTML = "";

			/* Para cuando se está cambiando un nombre de fichero y 
				 se selecciona cambiar el nombre a otro, sin utilizar cancelar.
			*/
			if(settings.Modo=='Renombrar' & settings.IdEditado!=null)
			{
				// Si existe el TR, entonces mostrarlo porque debe estar oculto.
				if(document.getElementById('trFile'+settings.IdEditado)!=undefined){document.getElementById('trFile'+settings.IdEditado).style.display='';}
			}
			settings.Modo = 'Renombrar';
			settings.IdEditado = id;
			switchView();
			document.getElementById('trFile'+settings.IdEditado).style.display = 'none';
			document.getElementById('txtNombreActual').value = nombre;
			document.getElementById('txtNuevoNombre').value = nombre;
			document.getElementById('txtNuevoNombre').focus();
		}

		function Actualizar()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));

			switch(settings.Modo)
			{
				case 'Renombrar':
				{
					if(document.getElementById('txtNombreActual').value==document.getElementById('txtNuevoNombre').value){return;}

					//alert("Renombrando");
					if(!valNuevoNombre())
					{
						document.getElementById('txtNombreActual').focus();
						//alert("No es válido");
						return;
					}
					document.getElementById('spEstadoActualizacion').innerHTML = "Cambiando nombre. Por favor, espere...";
					var ActualNombre = document.getElementById('txtNombreActual').value;
					var NuevoNombre = document.getElementById('txtNuevoNombre').value;
					ISPCFG.Msce.clswfMiMaletin.Renombrar(ActualNombre, NuevoNombre, Renombrar_CallBack);
					break;
				}
				case 'Nuevo':
				{
					// Comprobar si no hay ficheros en la lista 'files_list' y tampoco en el control 'element_input'
					if((document.getElementById('files_list').childNodes.length==1) & (document.getElementById('element_input').value=="")){return;};

					// Si se establece el valor de la propiedad 'file_patern' del objeto 'files_Selector', 
					// entonces comprobar que cumpla con dicha regla el nombre del fichero que se indica en 
					// dicho control ala hora de la actualización, si es que no está en balnco el mismo.
					if(files_Selector.file_patern!=null)
					{
						var element = document.getElementById('element_input');
						var i = element.value.lastIndexOf("\\"); // Para Windows
						if(i==-1){i = element.value.lastIndexOf("/");} // Para Linux
						var fileName = element.value.substring(eval(i+1), element.value.length); 
						var regExp = new RegExp(files_Selector.file_patern);
						if(!fileName.match(regExp))
						{
							alert("El nombre de fichero: \"" + fileName + "\" no es válido.");
							element.focus();
							return;
						}
					}
					document.forms["frm_MiMaletin"].submit();
					break;
				}
				default:
				{
					return;
				}
			}
			settings.Modo = "Listar";
			getMiMaletin();
			return;
		}
		function Renombrar_CallBack(res)
		{
			var boError = false;
			if(res.error!=null)
			{
				boError = true;
			}
			else
			{
				if (res.value == null)
				{
					boError = true;
				}
			}
			if(boError==true)
			{
				// Limpiar el área de notificación de actualización.
				document.getElementById('spEstadoActualizacion').innerHTML = "";
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible cambiar el nombre del fichero como se solicitó porque ha sucedido un error.");
				res=null;
				return false;
			}

			if(res.value==false)
			{
				// Limpiar el área de notificación de actualización.
				document.getElementById('spEstadoActualizacion').innerHTML = "";
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible cambiar el nombre del fichero como se solicitó, sin embargo, no se ha reportado ningún error.");
				res=null;
				return false;
			}
			else
			{
				document.getElementById('spEstadoActualizacion').innerHTML = "Actualización efectuada";
				return true;
			}
		}

		function Eliminar(strFileName)
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			
			if(!window.confirm("Eliminará de manera permanente el fichero '" + strFileName + "'")){return;}
			document.getElementById('spEstadoActualizacion').innerHTML = "Eliminando fichero. Por favor, espere...";
			ISPCFG.Msce.clswfMiMaletin.Eliminar(strFileName, Eliminar_CallBack);
		}
		function Eliminar_CallBack(res)
		{
			var boError = false;
			if(res.error!=null)
			{
				boError = true;
			}
			else
			{
				if (res.value == null)
				{
					boError = true;
				}
			}
			if(boError==true)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible eliminar el fichero como se solicitó porque ha sucedido un error.");
				document.getElementById('spEstadoActualizacion').innerHTML = "";
				res=null;
				return;
			}

			if(res.value==false)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible eliminar el fichero como se solicitó, sin embargo, no se ha reportado ningún error.");
				document.getElementById('spEstadoActualizacion').innerHTML = "";
				res=null;
				return;
			}
			else
			{
				res = null;
				getMiMaletin();
				document.getElementById('spEstadoActualizacion').innerHTML = "Fichero eliminado.";
			}
		}
		
		function Cancelar()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Limpiar el mensaje en la parte izquierda de los botones.
			document.getElementById('spEstadoActualizacion').innerHTML = "";

			switch(settings.Modo)
			{
				case 'Nuevo':
				{
					files_Selector.clearFileSelection();
					break;
				}
				case 'Renombrar':
				{
					document.getElementById('trFile'+settings.IdEditado).style.display='';
					settings.IdEditado = null;
					break;
				}
			}

			settings.Modo = "Listar";
			getMiMaletin();
			return;
		}

		function download(objLink, strFileName)
		{
			document.location.href = document.location.pathname + "?downloadFile=" + strFileName;
		}
		
		/*
			VALIDACIONES
		*/
		// Esta se encuentra en "main.js"
		// function valEmptyString(sender, objMessageLabel, strMessage)
		
		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valNuevosUploads()
		{
			return false;
		}

		function valNuevoNombre()
		{
			if(!valEmptyString(document.getElementById('txtNuevoNombre'), document.getElementById('spValNuevoNombre'), "El campo \"Nuevo nombre\" no puede estar vacío.")){return false;}
			if(!valByPatern(document.getElementById('txtNuevoNombre'), BRIEFCASE_FILENAME_PATERN))
			{
				document.getElementById('spValNuevoNombre').innerHTML = "Revise el nombre del fichero, sólo se admiten los caracteres: a-z; A-Z; 0-9 y subreyado (_), además de lo establecido para la extensión.";
				document.getElementById('spValNuevoNombre').style.display='block';
				return false;
			}
			document.getElementById('spEstadoActualizacion').innerHTML = "Comprobando nombre del fichero...";
			var res = ISPCFG.Msce.clswfMiMaletin.existFile(document.getElementById('txtNuevoNombre').value).value;
			if(res.error!=null)
			{
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible comprobar si ya existe el nombre del fichero, ha sucedido un error, si el problema persiste consulte a los administradores del sistema.");
				res=null;
				return false;
			}			
			if(res==true)
			{
				document.getElementById('spValNuevoNombre').innerHTML = "El nombre del fichero que propone ya se utiliza por parte de otro fichero, elija otro nombre.";
				document.getElementById('spValNuevoNombre').style.display='block';
				res=null;
				return false;
			}			

			return true;
		}
		
		function switchView()
		{
			// Referencias a las tablas
			var table_Info = document.getElementById('tbl_Info');
			var table_List = document.getElementById('tbl_List');
			var table_Nuevo = document.getElementById('tbl_Nuevo');
			var table_Renombrar = document.getElementById('tbl_Renombrar');

			// Las tablas para información y para la 
			// lista de ficheros siemre estarán visibles.
			table_Info.style.display = 'block';
			table_List.style.display = 'block';
			
			switch(settings.Modo)
			{
				case 'Listar':
				{
					table_Nuevo.style.display = 'none';
					table_Renombrar.style.display = 'none';
					break;
				}
				case 'Nuevo':
				{
					table_Nuevo.style.display = 'block';
					table_Renombrar.style.display = 'none';
					break;
				}
				case 'Renombrar':
				{
					table_Renombrar.style.display = 'block';
					table_Nuevo.style.display = 'none';
					break;
				}
				// Para cuando no existan Sedes y/o Menciones registradas, este webForm no es válido.
				case 'Disabled':
				{
					table_Info.style.display = 'block';
					table_Renombrar.style.display = 'none';
					table_List.style.display = 'none';
					table_Nuevo.style.display = 'none';
					break;
				}
			}
			
			setButtomsVisibility();
			
		}

		function setButtomsVisibility()
		{
			var btnNuevo = document.getElementById('lnkNuevo');
			var btnActualizar = document.getElementById('lnkActualizar');
			var btnCancelar = document.getElementById('lnkCancelar');
			
			switch(settings.Modo)
			{
				case 'Nuevo':
				case 'Renombrar':
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
			
			// Establecer las opciones para el botón "Nuevo" según la propiedad "settings.allowNewUploads"
			if(settings.allowNewUploads==false)
			{
				btnNuevo.style.display='none';
				document.getElementById('spEstadoActualizacion').innerHTML = "<b>SU MALETÍN ESTÁ LLENO, NO PODRÁ AGREGAR NUEVOS FICHEROS</b>";
			}
		}

		function disableForm()
		{
			alert("Deshabilitar webForm");
		}


		/*
			INICIALIZAR ESTE WEBFORM.
		*/
		// Asignar al objeto para los "INPUT FILE" múltiples el PATERN correspondiente 
		// al formato de los nombres de ficheros para los maletines que se encuentra en 
		// el fichero main.js
		files_Selector.file_patern = BRIEFCASE_FILENAME_PATERN;
		// Leer los ficheros que se encuentran en el maletín del usuario actual.
		getMiMaletin();

		//-->
		
		</script>
	</body>
</HTML>
