<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Page language="c#" Codebehind="bibliografia_cd.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfBibliografiaCD" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<HTML>
	<HEAD>
		<title>Maestría: Editar bibliografía</title>
		<meta content="False" name="vs_showGrid">
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="estilos/main.css" type="text/css" rel="stylesheet">
		<LINK href="imagenes/favicon.ico" rel="shortcut icon">
		<!-- Cargar el fichero principal de scripts del lado del cliente -->
		<script src="includes/main.js" type="text/javascript"></script>
		<script src="includes/dates.js" type="text/javascript"></script>
	</HEAD>
	<body leftMargin="0" topMargin="0" marginwidth="0" marginheight="0"> <!-- PAGE TABLE; BEGIN -->
		<form id="frm_EditarBibliografia" method="post" encType="multipart/form-data" runat="server">
			<table cellSpacing="0" cellPadding="0" width="750" align="center" border="0">
				<tr>
					<td><!-- CONTROL PARA EL ENCABEZADO, QUE INCLUYE LOS CONTROLES PARA IDENTIFICACIÓN DE USUARIO --><uc1:wucheader id="ctlHeader" runat="server"></uc1:wucheader></td>
				</tr>
				<tr>
					<td><!-- CONTROL PARA LA BARRA DE OPCIONES DEL ENCABEZADO --><uc1:wucheadernavbar id="ctlHeaderNavBar" runat="server"></uc1:wucheadernavbar></td>
				</tr>
			</table>
			<table id="Table2" cellSpacing="0" cellPadding="0" width="750" align="center" border="0">
				<tr id="tr_Notify" style="DISPLAY: none" height="0" runat="server">
					<td width="750"><span class="spErrorNotification" id="sp_Notify" style="MARGIN-BOTTOM: 1px" runat="server"></span></td>
				</tr>
				<tr vAlign="top">
					<td> <!-- BODY TABLE; BEGIN -->
						<table id="Table3" cellSpacing="0" cellPadding="0" width="750" border="0">
							<tr vAlign="top">
								<td vAlign="top" align="right">
									<!-- Control Web para las opciones de la izquierda --><uc1:wucleftoptions id="ctlLeftOptions" runat="server"></uc1:wucleftoptions></td>
								<td> <!-- MAIN WINDOW; BEGIN -->
									<table id="Table4" cellSpacing="0" cellPadding="0" width="545" border="0">
										<tr vAlign="top">
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" vAlign="middle"
												align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">BIBLIOGRAFÍA 
													EN DISCO COMPACTO</span></td>
										</tr>
										<tr vAlign="top">
											<td>
												<table id="Table5" cellSpacing="0" cellPadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" vAlign="top" align="center" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LA BIBLIOGRAFÍA -->
															<table id="tbl_Edit" style="DISPLAY: block" cellPadding="0" width="100%" align="center"
																border="0">
																<!-- txtTitulo -->
																<tr vAlign="middle">
																	<td align="left" width="70"><label for="txtTitulo">Título:</label>
																	</td>
																	<td align="left" width="475"><input class="frmTextInput" id="txtTitulo" style="WIDTH: 100%" type="text" onchange="JavaScript:valEmptyString(this, document.getElementById('spValTitulo'), 'El campo \'Título\' no puede estar vacío.');"><span class="spErrorNotification" id="spValTitulo"></span>
																	</td>
																</tr>
																<!-- txtAutores -->
																<tr vAlign="top">
																	<td align="left" width="70"><label for="txtAutores">Autor(es):</label>
																	</td>
																	<td align="left" width="475">
																		<textarea class="frmTextInput" id="txtAutores" style="WIDTH: 100%" onchange="JavaScript:valEmptyString(this, document.getElementById('spValAutores'), 'El campo \'Autor(es)\' no puede estar vacío.');"></textarea><span class="spErrorNotification" id="spValAutores"></span>
																	</td>
																<tr>
																	<td align="left" colSpan="2">
																		<!-- optTipo --><label><b>Tipo de bibliografía:</b>&nbsp;</label>&nbsp;&nbsp;<input id="optTipoBasica" type="radio" CHECKED value="1" name="optTipo"><label style="CURSOR: pointer" for="optTipoBasica">Básica</label>&nbsp;<input id="optTipoComplementaria" type="radio" value="2" name="optTipo"><label style="CURSOR: pointer" for="optTipoComplementaria">Complementaria</label>
																		<!-- FIN DE LA TABLA PARA LAS OPCIONES DE TIPO --></td>
																</tr>
																<!-- TR para la selección de o los temas a los que pertenece la bibliografía. -->
																<tr vAlign="middle">
																	<td align="left" colSpan="2"><label><b>Selección de temas</b></label>&nbsp;&nbsp; <input class="frmCheckInput" id="chkTodosTemas" onclick="JavaScript:this.checked==true?document.getElementById('dvWrapperTemaSelector').style.display='none':document.getElementById('dvWrapperTemaSelector').style.display='block';"
																			tabIndex="-1" type="checkbox" CHECKED name="chkTodosTemas"><label style="CURSOR: pointer" for="chkTodosTemas">Aplicable 
																			para todos los temas</label>
																		<div id="dvWrapperTemaSelector" style="BORDER-RIGHT: lightgrey 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: lightgrey 1px solid; DISPLAY: none; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; BORDER-LEFT: lightgrey 1px solid; PADDING-TOP: 2px; BORDER-BOTTOM: lightgrey 1px solid">
																			<table width="99%" border="0">
																				<tr>
																					<td nowrap colSpan="3"><label for="cboCurso">Curso:</label>&nbsp;<select class="frmTextInput" id="cboCurso" onchange="JavaScript:fillListaTemas(this.value, 0);"></select></td>
																				</tr>
																				<tr>
																					<td vAlign="top"><label for="listTemas">Temas del curso</label><br>
																						<select class="frmTextInput" id="listTemas" ondblclick="JavaScript:addToTemaSelection();"
																							style="WIDTH: 100px" multiple>
																						</select><br>
																						<A href="JavaScript:invertSourceSelection();">Invertir selección</A></td>
																					<td vAlign="middle" noWrap align="center">&nbsp;&lt;--&gt;&nbsp;</td>
																					<td vAlign="top"><label for="listTemasSeleccionados">Temas seleccionados</label><br>
																						<select class="frmTextInput" id="listTemasSeleccionados" ondblclick="JavaScript:deleteFromTemaSelection();"
																							style="WIDTH: 330px; HEIGHT: 95px" tabIndex="-1" multiple>
																						</select>
																						<span class="spErrorNotification" id="spValTemasSeleccionados"></span>
																					</td>
																				</tr>
																				<tr>
																					<td><A title="Agregar los temas seleccionados a la lista." tabIndex="-1" href="JavaScript:addToTemaSelection();">Agregar 
																							a la lista</A></td>
																					<td vAlign="middle" align="center"></td>
																					<td><A title="Eliminar todos los temas seleccionados de la lista." tabIndex="-1" href="JavaScript:clearTemaSelection();">Cancelar 
																							toda la selección</A></td>
																				</tr>
																			</table>
																		</div>
																	</td>
																</tr>
																<!-- TR para incrustar los elementos para la selección de ficheros para hacer uploads -->
																<tr vAlign="bottom">
																	<td align="left" colSpan="2"><label for="txtURL">Dirección URL (no se aceptan 
																			direcciones IP):</label><br>
																		<input class="frmTextInput" id="txtURL" style="WIDTH: 100%" type="text" onchange="JavaScript:if(valURL()){validURLAccess();};"><span class="spErrorNotification" id="spValURL"></span>
																	</td>
																</tr>
																<!-- Credenciales para accede a la URL -->
																<tr vAlign="middle">
																	<td align="left" colSpan="2"><label><b>Credenciales para acceder a este recurso</b></label>&nbsp;&nbsp;
																		<input class="frmCheckInput" id="chkCredenciales" onclick="JavaScript:chkCredencialesClick(this);"
																			tabIndex="-1" type="checkbox" name="chkCredenciales"><label style="CURSOR: pointer" for="chkCredenciales">No 
																			se requieren credenciales</label>
																		<div id="dvWrapperCredenciales" style="BORDER-RIGHT: lightgrey 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: lightgrey 1px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; BORDER-LEFT: lightgrey 1px solid; PADDING-TOP: 2px; BORDER-BOTTOM: lightgrey 1px solid">
																			<table width="99%" border="0">
																				<tr>
																					<td noWrap colSpan="3"><label for="txtCredencialesUserId">Id de usuario:</label><input class="frmTextInput" id="txtCredencialesUserId" type="text" onchange="JavaScript:if(valCredenciales(this, 'Id de usuario')){if(document.getElementById('txtCredencialesUserPass').value!=''){validURLAccess();}};">&nbsp;<label for="txtCredencialesUserPass">Contraseña:</label><input class="frmTextInput" id="txtCredencialesUserPass" type="password" onchange="JavaScript:if(valCredenciales(this, 'Contraseña')){if(document.getElementById('txtCredencialesUserId').value!=''){validURLAccess();}};"><span class="spErrorNotification" id="spValCredenciales"></span>
																					</td>
																				</tr>
																			</table>
																		</div>
																	</td>
																</tr>
																<tr>
																</tr>
																<!-- Separador -->
																<tr vAlign="top">
																	<td colSpan="2" height="1">
																		<hr width="100%" color="#47639a" SIZE="1">
																		</hr>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS BOTONES -->
															<table id="tbl_Buttoms" width="100%" align="center" border="0">
																<tr vAlign="top">
																	<td align="left"><span id="spEstadoActualizacion" style="COLOR: #47639a; TEXT-ALIGN: left">Estado 
																			de la actualización</span>
																	</td>
																	<td align="right"><A id="lnkNuevo" title="Agregar un nuevo usuario." href="JavaScript:Nuevo();"><IMG id="imgNuevo" title="Agregar un nuevo usuario." alt="Nuevo" src="imagenes/btn_nuevo.gif"
																				border="0"></A> <A id="lnkActualizar" title="Actualizar modificación." href="JavaScript:Actualizar();">
																			&nbsp;<IMG title="Actualizar modificación." alt="Actualizar" src="imagenes/btn_actualizar.gif"
																				border="0"></A> <A id="lnkCancelar" title="Cancelar" href="JavaScript:Cancelar();">
																			&nbsp;<IMG id="imgCancelar" title="Cancelar" alt="Cancelar" src="imagenes/btn_cancelar.gif"
																				border="0"></A>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS BOTONES Y LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<!-- LÍNEA DIVISORIA AL PIE DE LOS BOTONES -->
																<tr vAlign="top">
																	<td colSpan="2" height="1" width="510">
																		<hr width="100%" color="#47639a" SIZE="1">
																		</hr>
																	</td>
																</tr>
																<tr vAlign="top">
																	<td colSpan="2">
																		<!-- ELEMENTO DIV PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS MÓDULOS -->
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

		/*
			DECLARACIÓN E INICIALIZACIÓN DONDE CORRESPONDA DE LAS VARIABLES LOCALES.
		*/
		// Modo: para tomar los valores: "Disabled" ó "Listar" ó "Nuevo" ó "Editar", que
		// indican la operación actual del webForm.
		var settings = {"Modo":	'Listar', "IdEditado": 0, "struCompactDisc":	null};
		
		function listarCDs()
		{
			settings.Modo = 'Listar';
			switchView();
			ISPCFG.Msce.clswfBibliografiaCD.getListaCDs(listarCDs_CallBack);
		}
		function listarCDs_CallBack(res)
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los discos compactos registrados.");
				res=null
				return;
			}
			// Comprobar que no sea cero la cantidad de registros.
			if(res.value.Rows.length==0)
			{
				document.getElementById('dvLista').innerHTML = "<b>NO EXISTE REGISTRADA BIBLIOGRAFÍA EN DISCO COMPACTO</b>";
				res = null;
				Nuevo();
				return;
			}
			
			var listaCDs = res.value;
			var strHTML =	"<table border=\"0\" width=\"100%\">\n";
					strHTML += "\t<tr valign=\"middle\">\n";
					strHTML += "\t\t<td width=\"15%\"><b>Acciones</b></td>\n";
					strHTML += "\t\t<td><b>Datos del disco compacto</b></td>\n";
					strHTML += "\t</tr>\n";

			for(var i=0; i<=(listaCDs.Rows.length-1); i++)
			{
				var Id = listaCDs.Rows[i].Id;
				var Titulo = listaCDs.Rows[i].Titulo;
				var Registrante = listaCDs.Rows[i].Registrante;
				var Tipo = listaCDs.Rows[i].Tipo;
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strHTML += "\t\t<tr id=\"trCD" + Id + "\" valign=\"top\">\n";
				strHTML += "\t\t\t<td valign=\"top\" width=\"15%\"><!--a style=\"text-Decoration: underline\" href=\"JavaScript:Editar(" + Id + ");\">Editar</a>&nbsp;--><a style=\"text-Decoration: underline\" href=\"JavaScript:Eliminar(" + Id + ");\">Eliminar</a>&nbsp;</td>\n";
				strHTML += "\t\t\t<td valign=\"top\"><b>Título:</b> " + Titulo + "<br>";
				strHTML += "<b>Registrado por:</b> " + Registrante + "<br>";
				strHTML += "<b>Tipo:</b> " + Tipo + "<br>";
				strHTML += "\t\t\t</td>\n"
				strHTML += "\t\t</tr>\n";
			}
			
			strHTML += "</table>\n";
			document.getElementById('dvLista').innerHTML = strHTML;
			res = null;
			return;

		}

		function Nuevo()
		{
			settings.Modo = 'Nuevo';
			switchView();
			fillCboCurso();
			fillListaTemas(document.getElementById('cboCurso').value,0);
			//alert("Esta funcionalidad no está implementada aún...");
			return;
		}

		function Editar(Id)
		{
			settings.IdEditado = Id;
			document.getElementById('trCD'+Id).style.display = 'none';
			settings.Modo = 'Editar';
			switchView();
			fillCboCurso();
			fillListaTemas(document.getElementById('cboCurso').value, 0);
			var res = ISPCFG.Msce.clswfBibliografiaCD.getCompactDisc(settings.IdEditado);
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar los datos del disco compacto para su edición.");
				res=null
				return;
			}
			var CompactDisc = res.value;
			res = null;
			document.getElementById('txtTitulo').value = CompactDisc.Titulo;
			document.getElementById('txtAutores').value = CompactDisc.Autores;
			if(CompactDisc.Tipo==1)
			{
				// Bibliografía básica.
				document.getElementById('optTipoBasica').checked = true;
			}
			else
			{
				// Bibliografía complementaria.
				document.getElementById('optTipoComplementaria').checked = true;
			}
			
			// txtURL
			document.getElementById('txtURL').value = CompactDisc.FullURL;
			
			// txtCredencialesUserId y txtCredencialesUserPass
			if(CompactDisc.URLUserName!="" & CompactDisc.URLUserPass!="")
			{
				if(document.getElementById('chkCredenciales').checked==true){document.getElementById('chkCredenciales').click();}
				document.getElementById('txtCredencialesUserId').value = CompactDisc.URLUserName;
				document.getElementById('txtCredencialesUserPass').value = CompactDisc.URLUserPass;
			}
			else
			{
				document.getElementById('txtCredencialesUserId').value = "";
				document.getElementById('txtCredencialesUserPass').value = "";
				if(document.getElementById('chkCredenciales').checked==false){document.getElementById('chkCredenciales').click();}
			}
			if((CompactDisc.Temas.length==1) & (CompactDisc.Temas[0].IdTema==0))
			{
				if(document.getElementById('chkTodosTemas').checked == false){document.getElementById('chkTodosTemas').click();}
			}
			else
			{
				alert("Implementar el llenado de la lista de temas seleccionados.");
				if(document.getElementById('chkTodosTemas').checked == true){document.getElementById('chkTodosTemas').click();}
			}
			
			//alert("Esta funcionalidad no está implementada aún...");
			document.getElementById('txtTitulo').focus();
			return;
		}

		function Eliminar(Id)
		{
			if(!window.confirm("Se eliminará el registro del disco compacto seleccionado.")){return;}
			document.getElementById('spEstadoActualizacion').innerHTML = "Eliminando registro. Por favor, espere...";
			ISPCFG.Msce.clswfBibliografiaCD.Eliminar(Id, Eliminar_CallBack);
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
				document.getElementById('spEstadoActualizacion').innerHTML = "";
				trNotify = document.getElementById('tr_Notify');
				spNotify = document.getElementById('sp_Notify');
				ProcessPageError(trNotify, spNotify, "Imposible eliminar los datos del disco compacto seleccionado.");
				res=null
				return;
			}
			if(res.value==true)
			{
				document.getElementById('spEstadoActualizacion').innerHTML = "Registro eliminado";
				listarCDs();
			}

		}

		function Cancelar()
		{
			resetAllValMessages();
			if(settings.Modo=='Editar')
			{			
				if(document.getElementById('trCD'+settings.IdEditado)!=undefined){document.getElementById('trCD'+settings.IdEditado).style.display = '';}
			}
			settings.Modo = 'Listar';
			switchView();

			//alert("Esta funcionalidad no está implementada aún...");
			return;
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
			var res = settings.struCompactDisc;
			if(res==null)
			{
				res = ISPCFG.Msce.clswfBibliografiaCD.getStructCD().value;
				var boError = false;
				if(res.error!=null)
				{
					boError = true;
				}
				if(!boError)
				{
					if(res==null || typeof(res)!='object')
					{
						boError = true;
					}
				}
				if(boError)
				{
					strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del disco compacto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
					ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
					document.getElementById('spEstadoActualizacion').innerHTML = '';
					res = null;
					return;
				}
			}
			
			settings.struCompactDisc = res;
			var CompactDisc = settings.struCompactDisc; //.value;
			CompactDisc.Titulo = document.getElementById('txtTitulo').value;	// Titulo.
			CompactDisc.Autores = document.getElementById('txtAutores').value;	// Autores.
			CompactDisc.Tipo = document.getElementById('optTipoBasica').checked==true?document.getElementById('optTipoBasica').value:document.getElementById('optTipoComplementaria').value;
			CompactDisc.datFechaRegistro = new Date();	// Fecha de registro.
			CompactDisc.FileSize = 0;
			CompactDisc.FullURL = document.getElementById('txtURL').value;	// Dirección URL.
			CompactDisc.URLUserName = document.getElementById('txtCredencialesUserId').value;	// Id de usuario con acceso a la URL.
			CompactDisc.URLUserPass = document.getElementById('txtCredencialesUserPass').value;	// Contraseña de usuario con acceso a la URL.
			// Establecer los Temas seleccionados si existe alguno.
			aryTemas = new Array();
			if(document.getElementById('listTemasSeleccionados').options.length==0)
			{
				aryTemas[0] = 0;
			}
			else
			{
				var aryIndex = 0;
				var list = document.getElementById('listTemasSeleccionados');
				for(i=0; i<=(list.childNodes.length-1); i++)
				{
					if(list.childNodes[i].nodeName=="OPTGROUP")
					{
						oGroup = list.childNodes[i];
						// Contar hacia atrás para que al remover las opciones no se afecte la cantidad de ciclos.
						for(y=(oGroup.childNodes.length-1); y>=(0); y--) 
						{
							aryTemas[aryIndex++] = oGroup.childNodes[y].value;
						}	
					}
				}
			}
		
			if(settings.Modo=='Editar')
			{
				CompactDisc.Id = settings.IdEditado;
				ISPCFG.Msce.clswfBibliografiaCD.Actualizar(CompactDisc, aryTemas, Actualizar_CallBack);
				CompactDisc = null;
				return;
			}
			else
			{
				ISPCFG.Msce.clswfBibliografiaCD.Agregar(CompactDisc, aryTemas, Actualizar_CallBack);
				CompactDisc = null;
				return;
			}
		}
		// Retorno de Actualizar()
		function Actualizar_CallBack(res)
		{
			var boError = false;
			if(res.error!=null)
			{
				//alert(res.error.Message);
				boError = true;
			}
			if(!boError)
			{
				if(res==null)
				{
					boError = true;
				}
			}
			if(boError)
			{
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido actualizar los datos del disco compacto. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;
			}
			
			if(res.value==false)
			{
				if(settings.Modo=='Editar')
				{
					strErrorMessage = "Estimado usuario, no se han actualizado los datos del disco compacto, sin embargo, no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				}
				else
				{
					strErrorMessage = "Estimado usuario, no se ha registrado el disco compacto, sin embargo, no se ha reportado ningún error. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				}

				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				document.getElementById('spEstadoActualizacion').innerHTML = '';
				res=null;
				return;

			}
			else
			{
				listarCDs();
				document.getElementById('spEstadoActualizacion').innerHTML = 'Actualización efectuada.';
				res=null;
				return;
			}
		}
		
		// Llenar el cbo de los módulos-cursos
		function fillCboCurso()
		{
			var res = ISPCFG.Msce.clswfBibliografiaCD.getListaCursos();
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los cursos registrados.");
				res=null
				return;
			}
			
			var refCboCurso = document.getElementById('cboCurso');
			refCboCurso.options.length = 0; // reiniciar la lista de opciones.
			dataView = res.value;  
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				refCboCurso.options[refCboCurso.options.length] = new Option(dataView.Rows[i].Modulo + ": " + getAbr(dataView.Rows[i].Nombre,60), dataView.Rows[i].Id);
			}
			res=null;			
		}

		// Llenar la lista de Temas de donde seleccionar.
		function fillListaTemas(IdCurso, IdTema)
		{
			var res = ISPCFG.Msce.clswfBibliografiaCD.getListaTemas(IdCurso);
			var boError = false;
			if(res.error!=null)
			{
				// El mensaje a continuación Funciona OK.
				//alert(res.error.Message.toString());
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los temas.");
				res=null;
				return false;
			}
			
			dataView = res.value;  
			var list = document.getElementById('listTemas');
			// Limpiar la lista anterior.
			list.options.length = 0;
			// Si no existen registros mandar a desabilitar el formulario.
			if(dataView.Rows.length==0)
			{
				list.options[list.options.length] = new Option("Curso sin temas", null);
				list.disabled = true;
				return;
			}
			list.disabled = false;
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				list.options[list.options.length] = new Option(dataView.Rows[i].Nombre, dataView.Rows[i].Id);
			}
			return true;
			res=null;			

			// Establecer el valor de selectedIndex del cboMencion para que 
			// se corresponda con el grupo que se esté editando.
			//if(strMode=='Editar'||strMode=='Nuevo'){setIndexInCboTema(IdTema);}
		}
		
		/*
			Eliminar todos los elementos "option" de la lista de la derecha (seleccionados o no).
		*/
		function clearTemaSelection()
		{
			document.getElementById('listTemasSeleccionados').innerHTML = "";
		}
		
		/*
			Agregar a la lista de la derecha los elementos "option" seleccionados en la lista de la izquierda.
		*/
		function addToTemaSelection()
		{
			// NEW CODE
			var listSource = document.getElementById('listTemas');
			if(listSource.selectedIndex==-1)
			{
				if(window.confirm("Se agregarán todos los temas de la lista.\nSi desea agregar sólo alguno(s) selecciónelo(s)."))
				{
					for(i=0; i<=(listSource.childNodes.length-1); i++)
					{
						listSource.childNodes[i].selected=true;
					}
				}
				else
				{
					return;
				}
			}

			var listTarget = document.getElementById('listTemasSeleccionados');
			var IdGrupo = document.getElementById('cboCurso').value; // EL identificador del curso.
			var textoGrupo = getAbr(document.getElementById('cboCurso').options[document.getElementById('cboCurso').selectedIndex].text,45);
			// create new option group
			var oGroup = null;
			
			// Para buscar entre los OPTGROUP
			for(i=0; i<=(listTarget.childNodes.length-1); i++)
			{
				if(listTarget.childNodes[i].value==IdGrupo)
				{
					oGroup = listTarget.childNodes[i];
					break;
				}
			}
			
			if(oGroup==null)
			{
				oGroup = document.createElement('optgroup');
				oGroup.value = IdGrupo;
				oGroup.label = textoGrupo;
			}
			
			for(i=0; i<=(listSource.childNodes.length-1); i++)
			{
				var valor = listSource.childNodes[i].value;
				var texto = listSource.childNodes[i].text;
				if(listSource.childNodes[i].selected==true & !existSelectedTema(valor))
				{
					var oOption = document.createElement('option');
					oOption.value = valor;
					oOption.innerHTML = oOption.text = oOption.label = texto;
					oGroup.appendChild(oOption);
				}
			}
			
			listTarget.appendChild(oGroup);
			listSource.selectedIndex = -1;
			
			valSeleccionTemas();
		}
		/*
			Eliminar los elementos "option" seleccionados en la lista de la derecha.
		*/
		function deleteFromTemaSelection()
		{
			var list = document.getElementById('listTemasSeleccionados');
			for(i=0; i<=(list.childNodes.length-1); i++)
			{
				if(list.childNodes[i].nodeName=="OPTGROUP")
				{
					oGroup = list.childNodes[i];
					// Contar hacia atrás para que al remover las opciones no se afecte la cantidad de ciclos.
					for(y=(oGroup.childNodes.length-1); y>=(0); y--) 
					{
						if(list.options[oGroup.childNodes[y].index].selected)
						{
							list.remove(oGroup.childNodes[y].index);
						}
					}	
					// Finalmente si no tiene elementos, eliminar el grupo.
					if(oGroup.childNodes.length==0)
					{
						list.removeChild(oGroup);
					}
				}
			}
			
			valSeleccionTemas();
			
		}
		
		/*
			Comprueba si ya está seleccionado el tema cuyo 
			Id se pasa como valor del parámetro "IdTema".
		*/
		function existSelectedTema(IdTema)
		{
			var list = document.getElementById('listTemasSeleccionados');
			for(z=0; z<=(list.childNodes.length-1); z++)
			{
				oGroup = list.childNodes[z];
				for(y=0; y<=(oGroup.childNodes.length-1); y++)
				{
					if(oGroup.childNodes[y].value==IdTema){return true;}
				}
			}
			return false;
		}
		
		/*
			Invierte la selección en el elemento select que muestra los temas a seleccionar.
		*/
		function invertSourceSelection()
		{
			var listSource = document.getElementById("listTemas");
			for(i=0; i<=(listSource.childNodes.length-1); i++)
			{
				listSource.childNodes[i].selected = !listSource.childNodes[i].selected;
			}
		}

		function chkCredencialesClick(chkElement)
		{
			chkElement.checked==true?document.getElementById('dvWrapperCredenciales').style.display='none':document.getElementById('dvWrapperCredenciales').style.display='block';
			if(chkElement.checked==true)
			{
				document.getElementById('txtCredencialesUserId').value = "";
				document.getElementById('txtCredencialesUserPass').value = "";
				document.getElementById('spValCredenciales').innerHTML = "";
				document.getElementById('spValCredenciales').style.display = "none";
				return;
			}

			document.getElementById('txtCredencialesUserId').focus();
		}
		
		/*
			VALIDACIONES
		*/
		// Obtener los recursos que se encuentran en la URL que se proporciona.
		function validURLAccess()
		{
			// Al cambiar de vista siempre limpiar las notificaciones.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			var userName = "";
			var userPass = "";
			if(!document.getElementById('chkCredenciales').checked)
			{
				userName = document.getElementById('txtCredencialesUserId').value;
				userPass = document.getElementById('txtCredencialesUserPass').value;
			}
			ISPCFG.Msce.clswfBibliografiaCD.validURLAccess(document.getElementById('txtURL').value, userName, userPass, validURLAccess_CallBack);
		}
		function validURLAccess_CallBack(res)
		{
			var boError = false;
			var errMessage = "";
			var errSugest = "";
			if(res.error!=null)
			{
				boError = true;
				errMessage = res.error.Message.toString();

				// (401) No autorizado. Normalmente cuando se requieren credenciales.
				if(res.error.Message.toString().indexOf("(401)")>-1)
				{	
					if(document.getElementById('txtCredencialesUserId').value!="")
					{
						errSugest = "<b>SUGERENCIA:</b> Revise las credenciales (\"Id de usuario\" y \"Contraseña\") que usted está proporcionando para acceder al recurso que aparece en \"Dirección URL\".";
					}
					else
					{
						document.getElementById('spValURL').innerHTML = "<b>ADVERTENCIA:</b> Este recurso requiere credenciales (\"Id de usuario\" y \"Contraseña\").";
						document.getElementById('spValURL').style.display = 'block';
						document.getElementById('chkCredenciales').checked=false;
						chkCredencialesClick(document.getElementById('chkCredenciales'));
						res = null;
						return false;
						//errSugest = "</b>SUGERENCIA:</b> Verifique con los administradores del sistema si el recurso (\"Dirección URL\") requiere credenciales (\"Id de usuario\" y \"Contraseña\").";
					}
				}
				// (403) Prohibido. Normalmente cuando existe la URL, pero no está configurado el permiso para listar directorios en la misma.
				if(res.error.Message.toString().indexOf("(403)")>-1)
				{	
					errSugest = "<b>SUGERENCIA:</b> Verifique con los administradores del sistema si el recurso (\"Dirección URL\") está propiamente configurado.";
				}
				// (404) No se encontró. Normalmente cuando no existe la URL.
				if(res.error.Message.toString().indexOf("(404)")>-1)
				{	
					errSugest = "<b>SUGERENCIA:</b> Verifique con los administradores del sistema si el recurso (\"Dirección URL\") existe.";
				}
				// (414) URL mou larga. Normalmente cuando la URL es muy larga.
				if(res.error.Message.toString().indexOf("(414)")>-1)
				{	
					errSugest = "<b>SUGERENCIA:</b> Verifique con los administradores del sistema el recurso (\"Dirección URL\") proporcionado, el servidor donde se encuentra advierte que la URL es muy larga.";
				}
				// (500) Error interno del servidor. Normalmente cuando existe algún error del servidor donde se hospeda la URL.
				if(res.error.Message.toString().indexOf("(500)")>-1)
				{	
					errSugest = "<b>SUGERENCIA:</b> Verifique con los administradores del sistema si el servidor donde se encuentra el recurso (\"Dirección URL\") se encuentra funcionando de manera apropiada.";
				}
				if(errSugest=="")
				{
					errMessage = "Ha ocurrido el siguiente error: " + errMessage;
				}

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
				if(errSugest=="")
				{
					document.getElementById('spValURL').innerHTML = "Imposible verificar la validez de la dirección URL que proporcionó." + " " + errMessage;
				}
				else
				{
					document.getElementById('spValURL').innerHTML = errMessage + "<br>" + errSugest;
				}
				document.getElementById('spValURL').className = "spErrorNotification";
				document.getElementById('spValURL').style.display = 'block';
				res=null;
				return false;
			}
			if(res.value)
			{
				document.getElementById('spValURL').className = "spWarningNotification";
				document.getElementById('spValURL').innerHTML = "Comprobada la existencia de la Dirección URL";
				document.getElementById('spValURL').style.display = 'block';
				res = null;
				return true;
			}
		}
		
		function valSeleccionTemas()
		{
			if(!document.getElementById('chkTodosTemas').checked==true)
			{
				if(document.getElementById('listTemasSeleccionados').options.length==0)
				{
					document.getElementById('spValTemasSeleccionados').innerHTML = "Selección de temas incompleta.";
					document.getElementById('spValTemasSeleccionados').style.display = 'block';
					document.getElementById('listTemas').focus();
					return false;
				}
			}
			
			document.getElementById('spValTemasSeleccionados').innerHTML = "";
			document.getElementById('spValTemasSeleccionados').style.display = 'none';
			return true;
		}
		
		function valURL()
		{
			var textURL = document.getElementById('txtURL');
			if(!valEmptyString(textURL, document.getElementById('spValURL'), "El campo \"Dirección URL\" no puede estar vacío.")){return false;}
			parseURL();
			if(!validURLAccess()){return false;}
			// Hay que comentar esta parte para poder utilizar localhost
			return true; //valURLFormat();
		}
		
		/*
			Agregar el último slash "/" si no aparece y convierte el protocolo en minúscula.  
		*/
		function parseURL()
		{
			var textURL = document.getElementById('txtURL');
			// Agregar el último slash "/" si no aparece.
			if(textURL.value.lastIndexOf("/")!= (textURL.value.length-1)){textURL.value+="/";}
		}

		function valURLFormat()
		{
			var textURL = document.getElementById('txtURL');
			var valorOriginalURL = textURL.value;
			
			// FTP no se implementa aún
			if(valByPatern(textURL, FTPADDR_PATERN)){alert("La opción de hospedar información en sitios FTP no se ha implementado aún.");return false;}
			
			textURL.value = textURL.value.toLowerCase()
			if(!valByPatern(textURL, HTTPADDR_PATERN) & !valByPatern(textURL, HTTPSADDR_PATERN) & !valByPatern(textURL, FTPADDR_PATERN))
			{
				document.getElementById('spValURL').innerHTML = 'El formato de la dirección URL no es correcto.';
				if(textURL.value.indexOf("http://",0)==-1 & textURL.value.indexOf("https://",0)==-1 & textURL.value.indexOf("ftp://",0)==-1)
				{
					document.getElementById('spValURL').innerHTML += '<br>Revise el comienzo de la dirección, los protocolos permitidos son: \"http://\", \"https://\" y \"ftp://\".';
				}

				document.getElementById('spValURL').style.display='block';
				// Retornar el campo a su valor original.
				textURL.value = valorOriginalURL;
				return false;
			}

			document.getElementById('spValURL').innerHTML += '';
			document.getElementById('spValURL').style.display='none';
			// Retornar el campo a su valor original.
			textURL.value = valorOriginalURL;
			return true;
		}
		
		/*
			Validar las credenciales para acceder al recurso de la dirección URL.
		*/
		function valCredenciales(objField, strFieldName)
		{
			if(document.getElementById('chkCredenciales').checked!=true)
			{
				if(!valEmptyString(objField, document.getElementById('spValCredenciales'), "El campo \"" + strFieldName + "\" no puede estar vacío.")){return false;}
			}
			
			return true;
		}
		
		// Valida todo el documento apoyándose en las funciones 
		// específicas para cada uno de los controles.
		function valDocument()
		{
			document.getElementById('spEstadoActualizacion').className = "spWarningNotification";
			document.getElementById('spEstadoActualizacion').innerHTML = "Validando los datos del disco compacto";

			resetAllValMessages();
			// Título
			var val1 = valEmptyString(document.getElementById('txtTitulo'), document.getElementById('spValTitulo'), "El campo \"Titulo\" no puede estar vacío.");
			// Autores
			var val2 = valEmptyString(document.getElementById('txtAutores'), document.getElementById('spValAutores'), "El campo \"Autor(es)\" no puede estar vacío.");
			// Selección de temas
			var val3 = valSeleccionTemas();
			// Dirección URL
			var val4 = valURL();
			// Credenciales (Id de usuario)
			var val5 = valCredenciales(document.getElementById('txtCredencialesUserId'),"Id de usuario");
			// Credenciales (Contraseña)
			var val6 = valCredenciales(document.getElementById('txtCredencialesUserPass'),"Contraseña");
			var boResult = false;
			boResult = (val1==true)&(val2==true)&(val3==true)&(val4==true)&(val5==true)&(val6==true);
			//alert("1: " + val1 + "2: " + val2 + " 3: " + val3 + " 4: " + val4 + " 5: " + val5 + " 6: " + val6);
			
			if(!boResult)
			{
				document.getElementById('spEstadoActualizacion').style.color = "#47639a";
				document.getElementById('spEstadoActualizacion').style.textAlign = "left";
				document.getElementById('spEstadoActualizacion').innerHTML = "";
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

		function switchView()
		{
			tableEdit = document.getElementById('tbl_Edit');
			tableList = document.getElementById('tbl_List');
			switch(settings.Modo)
			{
				case 'Editar':
				case 'Nuevo':
				{
					tableList.style.display='block';
					tableEdit.style.display='block';
					document.getElementById('txtTitulo').focus();
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
		
		function disableForm()
		{
			alert("Deshabilitar webForm");
		}


		/*
			INICIALIZAR ESTE WEBFORM.
		*/
		//-->
		listarCDs();
		document.getElementById('chkCredenciales').checked = true;
		chkCredencialesClick(document.getElementById('chkCredenciales'));

		</script>
	</body>
</HTML>
