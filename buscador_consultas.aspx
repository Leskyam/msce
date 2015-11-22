<%@ Page language="c#" Codebehind="buscador_consultas.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfBuscadorConsultas" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Buscar consultas</title>
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
		<form id="frm_BuscarConsultas" method="post" runat="server">
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">BUSCADOR
													DE CONSULTAS</span></td></tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA EDICIÓN DE LOS MÓDULOS -->
															<table id="tbl_Criterios" width="100%" align="center" border="0">
																<tr>
																	<td>
																		<!-- TABLA DE LOS CRITERIOS SIMPLES -->
																		<table id="tbl_SimpleSearch" width="100%" align="center" border="0">
																			<!-- Opciones para el criterio txtSearch -->
																			<tr>
																				<td colspan="2" valign="bottom">
																					<!-- TABLA DE LOS CRITERIOS AVANZADOS -->
																					<table id="tbl_AdvancedSearch" width="100%" align="center" border="0" style="DISPLAY: none">
																						<!-- cboTema -->
																						<tr valign="middle">
																							<td align="left" nowrap><label for="cboTema">Tema: </label><select class="frmTextInput" id="cboTema"></select><input type="checkbox" id="chkTodosTemas" onclick="JavaScript:chkTodosChanged(this);"><label for="chkTodosTemas">TODOS</label></td>
																						</tr>
																						<!-- cboDocente -->
																						<tr valign="middle">
																							<td align="left" nowrap><label for="cboDocente">Respondida por: </label><select class="frmTextInput" id="cboDocente"></select><input type="checkbox" id="chkTodosDocentes" onclick="JavaScript:chkTodosChanged(this);"><label for="chkTodosDocentes">TODOS</label></td>
																						</tr>
																						<tr valign="middle">
																							<td align="left" nowrap>
																								<input type="checkbox" id="chkSoloMisConsultas">
																								<label id="lblSoloMisConsultas" for="chkSoloMisConsultas">Buscar sólo mis 
																									consultas</label>
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr valign="bottom">
																				<td align="center" colspan="2">
																					<div id="dvAyudita" class="tinytext_N" style="display: block; width: 70%">Introduzca
																						cualquier parte de la consulta
																						(para ampliar las búsquedas teclee una cadena de pocos caracteres).</div>
																				</td>
																			</tr>
																			<tr valign="bottom">
																				<td align="center">
																				</td>
																				<td align="left">
																					<a id="lnkAdvancedOptions" href="JavaScript:switchAdvancedOptions();">Opciones
																						avanzadas</a>
																				</td>
																			</tr>
																			<!-- txtSearch -->
																			<tr valign="top">
																				<td align="right">
																					<input type="text" class="frmTextInput" id="txtSearch" maxlength="25" size="50">
																				</td>
																				<td align="left">
																					<a id="lnkBuscar" title="Buscar consultas." href="JavaScript:Buscar();">Buscar</a>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LA INFORMACIÓN GENERAL DE LOS RESULTADOS DE LA BÚSQUEDA -->
															<table id="tbl_ResultsInfo" width="100%" align="center" border="0">
																<tr valign="top">
																	<td colspan="2">
																		<div id="dvResultsInfo"></div>
																	</td>
																</tr>
															</table>
															<!-- TABLA PARA LOS RESULTADOS DE LA BÚSQUEDA -->
															<table id="tbl_Results" width="100%" align="center" border="0">
																<tr>
																	<td colspan="2" align="center">
																		<!-- ELEMENTOS PARA EL PAGINADO -->
																		<span id="spPaginatorBar" style="display: none; font-weight: bold; width: 100%; background-color: whitesmoke; text-align: center">
																			<a id="lnkPrimera" href="JavaScript:Primera();" title="Ir a: primera página" style="border-right: black 1px solid; padding-right: 2px; border-top: black 1px solid; padding-left: 2px; border-left: black 1px solid; border-bottom: black 1px solid">
																				&lt;&lt;</a>&nbsp;<a id="lnkAnterior" href="JavaScript:Anterior();" title="Ir a: página anterior" style="border-right: black 1px solid; padding-right: 2px; border-top: black 1px solid; padding-left: 2px; border-left: black 1px solid; border-bottom: black 1px solid">&lt;</a>&nbsp;<label for="txtCurrentPage">Página</label>&nbsp;<input type="text" maxlength="3" id="txtCurrentPage" class="frmTextInput" size="3" onchange="JavaScript:pageChange(this.value);">&nbsp;de&nbsp;<span id="spCantPaginas">10</span>&nbsp;<a id="lnkSiguiente" href="JavaScript:Siguiente();" title="Ir a: página siguiente" style="border-right: black 1px solid; padding-right: 2px; border-top: black 1px solid; padding-left: 2px; border-left: black 1px solid; border-bottom: black 1px solid">&gt;</a>&nbsp;<a id="lnkUltima" href="JavaScript:Ultima();" title="Ir a: última página" style="border-right: black 1px solid; padding-right: 2px; border-top: black 1px solid; padding-left: 2px; border-left: black 1px solid; border-bottom: black 1px solid">&gt;&gt;</a>
																		</span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2">
																		<div id="dvResults"></div>
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
			Este documento es funcional sólo si existen 
			consultas con respuesta, así que al iniciar 
			revisamos esto.
		*/
		function existenRespuestas()
		{
			var res = ISPCFG.Msce.clswfBuscadorConsultas.existenRespuestas();
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de las consultas por responder que le corresponden.");
				res=null;
				return false;
			}
			
			if(res.value==false)
			{
				res=null;
				disableForm();
				return false;
			}
			
			return true;

		}

		function Buscar()
		{
			settings.currentPage = 1;
			if(settings.searchMode=='Simple')
			{
				settings.tema = "!=0";
				settings.respondidaPor = "!=0";
				settings.soloMisConsultas = false;
			}
			else
			{
				settings.tema = document.getElementById('chkTodosTemas').checked?"!=0":"=" + document.getElementById('cboTema').value;
				settings.respondidaPor = document.getElementById('chkTodosDocentes').checked?"!=0":"=" + document.getElementById('cboDocente').value;
				settings.soloMisConsultas = document.getElementById('chkSoloMisConsultas').checked;
			}
			settings.cadena = document.getElementById('txtSearch').value;
			//alert("settings.tema: " + settings.tema + ", settings.respondidaPor: " + settings.respondidaPor + ", settings.soloMisConsultas: " + settings.soloMisConsultas + ", settings.cadena: " + settings.cadena);
			getResults();
		}
		
		function getResults()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			// Ocualtar el texto ayudita luego de enviar la solicitud de búsqueda.
			document.getElementById('dvAyudita').style.display='none';
			date = new Date();
			settings.begTime = date.getTime();
			var res = ISPCFG.Msce.clswfBuscadorConsultas.Buscar(settings.tema, settings.respondidaPor,  settings.soloMisConsultas, settings.cadena, settings.currentPage, settings.recordsByPage, getResults_CallBack);
		}
		// Retorno de buscarUsuarios(role)
		function getResults_CallBack(res)
		{
			date = new Date();
			settings.endTime = date.getTime();
			// Resetear el valor del Id expandido ya que se está gestionando una nueva lista.
			IdExpanded = null;
			// Obtener la referencia al elemento DIV que contendrá los datos resultantes de la búsqueda.
			var divResults = document.getElementById('dvResults')
			// Obtener la referencia al elemento DIV que contendrá los datos generales resultantes de la búsqueda.
			var divResultsInfo = document.getElementById('dvResultsInfo')

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
				if(res.value==null)
				{
					boError = true;
				}
			}
			if(!boError)
			{
				if(typeof(res.value)!='object')
				{
					boError = true;
				}
			}
			if(boError)
			{
				divResults.innerHTML = '';
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido recuperar los datos de la búsqueda solicitada. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res=null;
				return;
			}
			
			if(res.value[0].Rows.length>0)
			{
				settings.cantPages = res.value[0].Rows[0].cantPages;
				settings.currentPage = settings.currentPage<=settings.cantPages?settings.currentPage:settings.cantPages;
				settings.cantTotalRecords = res.value[0].Rows[0].cantTotalRecords;
			}
			else
			{
				settings.cantPages = 0;
				settings.cantTotalRecords = 0;
			}			
			var dvConsultas = res.value[1];
			res=null;
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvConsultas.Rows.length==0)
			{
				document.getElementById('tbl_Results').style.display = 'none';
				document.getElementById('tbl_ResultsInfo').style.display = '';
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divResults.innerHTML = "";
				divResultsInfo.innerHTML = "<b>Consultas encontradas (0).</b><br>";
				divResultsInfo.innerHTML += "No se encontró ninguna consulta que coincidiera con ";
				divResultsInfo.innerHTML += "los criterios seleccionanos y la cadena de "; 
				divResultsInfo.innerHTML += "caracteres <b>\"" + settings.cadena +"\"</b>. ";
				divResultsInfo.innerHTML += "Observe la sugerencia que aparece en la parte superior del vínculo \"Buscar\".";
				document.getElementById('spPaginatorBar').style.display = 'none';
				document.getElementById('dvAyudita').style.display = 'block';
				dvUsuarios = null;
				return;
			}
			if(settings.cantPages>1){document.getElementById('spPaginatorBar').style.display = 'block';}
			document.getElementById('tbl_Results').style.display = '';
			document.getElementById('tbl_ResultsInfo').style.display = '';
			
			var strTBLInfo = "<table border=\"0\" width=\"100%\">\n";
				 strTBLInfo += "\t<tr valign=\"top\">\n";
				 strTBLInfo += "\t\t<td align=\"left\" class=\"tinytext_A\">Consultas encontradas: <b>" + settings.cantTotalRecords + "</b></td>\n";
				 strTBLInfo += "\t\t<td align=\"right\" class=\"tinytext_A\">tiempo invertido: <b>" + (settings.endTime - settings.begTime)/1000 + " Seg.</b></td>\n";
				 strTBLInfo += "\t</tr>\n";
				 strTBLInfo += "</table>\n";
				 
			dvResultsInfo.innerHTML = strTBLInfo;
			
			// Formar el encabezado de la tabla de la lista de los usuarios.
			var strTBL_Result =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strTBL_Result += "<table border=\"0\" width=\"100%\">\n";
			// Formar el cuerpo de la tabla de la lista de los usuarios.
			for(var i=0; i<=(dvConsultas.Rows.length-1); ++i)
			{
			// Id, Maestrante, Docente, Tema, FechaHoraConsulta, Consulta, FechaHoraRespuesta, Respuesta y Leida
				var Id = dvConsultas.Rows[i].Id;
				var Maestrante = dvConsultas.Rows[i].Maestrante;
				var Docente = dvConsultas.Rows[i].Docente;
				var Tema = dvConsultas.Rows[i].Tema;
				var FechaHoraConsulta = getStringFromDate(dvConsultas.Rows[i].FechaHoraConsulta);
				var Consulta = dvConsultas.Rows[i].Consulta;
				var FechaHoraRespuesta = getStringFromDate(dvConsultas.Rows[i].FechaHoraRespuesta);
				var Respuesta = dvConsultas.Rows[i].Respuesta;
				var Leida = dvConsultas.Rows[i].Leida==1?"Sí":"No";
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				strTBL_Result += "\t\t<tr valign=\"top\">\n";
				strTBL_Result += "\t\t\t<td><div onclick=\"JavaScript:ver(" + Id + ");\" style=\"padding-right: 3px; padding-left: 3px; padding-bottom: 2px; padding-top: 2px;\" id=\"dvWrapperConsulta" + Id + "\" onmouseover=\"JavaScript:this.style.backgroundColor='#fffff5';this.style.cursor='pointer'\" onmouseout=\"JavaScript:this.style.backgroundColor='transparent';\">Consultante: <b>" + Maestrante + "</b> Responde: <b>" + Docente + "</b> Tema: <b>" + Tema + "</b> Fecha&nbsp;<sup>(consulta)</sup>: <b>" + FechaHoraConsulta + "</b> Fecha&nbsp;<sup>(respuesta)</sup>: <b>" + FechaHoraRespuesta + "</b><br>";
				strTBL_Result += "<a href=\"JavaScript:ver(" + Id + ");\"><b>Ver todo sobre esta consulta</b></a>&nbsp;<span id=\"spConsultaAbr" + Id + "\">" + getAbr(Consulta, 75) + "</span>";
				strTBL_Result += "<div id=\"dvWrapperContenido" + Id + "\" style=\"display: none;\">";
				strTBL_Result += "<div><b>Consulta:</b>&nbsp;" + Consulta + "</div>";
				strTBL_Result += "<div><b>Respuesta:</b>&nbsp;" + Respuesta + "</div>";
				strTBL_Result += "</div>";
				strTBL_Result += "</div>";
				strTBL_Result += "\t\t\t</td>\n";
			}
			strTBL_Result += "</table>\n";
			divResults.innerHTML = strTBL_Result;
			dvConsultas = null;
			
			document.getElementById('txtCurrentPage').value = settings.currentPage;
			document.getElementById('spCantPaginas').innerHTML = settings.cantPages;
			if(settings.currentPage==1)
			{
				document.getElementById('lnkPrimera').disabled = true;
				document.getElementById('lnkPrimera').href = 'JavaScript:doNothing();'
				document.getElementById('lnkPrimera').style.cursor = 'default';
				document.getElementById('lnkAnterior').disabled = true;
				document.getElementById('lnkAnterior').href = 'JavaScript:doNothing();';
				document.getElementById('lnkAnterior').style.cursor = 'default';
			}
			else
			{
				document.getElementById('lnkPrimera').disabled = false;
				document.getElementById('lnkPrimera').href = 'JavaScript:Primera();';
				document.getElementById('lnkPrimera').style.cursor = 'pointer';
				document.getElementById('lnkAnterior').disabled = false;
				document.getElementById('lnkAnterior').href = 'JavaScript:Anterior();';
				document.getElementById('lnkAnterior').style.cursor = 'pointer';
			}
			if(settings.currentPage==settings.cantPages)
			{
				document.getElementById('lnkSiguiente').disabled = true;
				document.getElementById('lnkSiguiente').href = 'JavaScript:doNothing();';
				document.getElementById('lnkSiguiente').style.cursor = 'dafault';
				document.getElementById('lnkUltima').disabled = true;
				document.getElementById('lnkUltima').href = 'JavaScript:doNothing();';
				document.getElementById('lnkUltima').style.cursor = 'dafault';
			}
			else
			{
				document.getElementById('lnkSiguiente').disabled = false;
				document.getElementById('lnkSiguiente').href = 'JavaScript:Siguiente();';
				document.getElementById('lnkSiguiente').style.cursor = 'pointer';
				document.getElementById('lnkUltima').disabled = false;
				document.getElementById('lnkUltima').href = 'JavaScript:Ultima();';
				document.getElementById('lnkUltima').style.cursor = 'pointer';
			}
			document.getElementById('txtSearch').focus();
		}
		
		function ver(Id)
		{
			if(IdExpanded!=null)
			{
				document.getElementById('spConsultaAbr'+IdExpanded).style.display = "inline";
				document.getElementById('dvWrapperContenido'+IdExpanded).style.display = "none";
				document.getElementById('dvWrapperConsulta'+IdExpanded).style.borderRight = "transparent";
				document.getElementById('dvWrapperConsulta'+IdExpanded).style.borderLeft = "transparent";
				document.getElementById('dvWrapperConsulta'+IdExpanded).style.borderTop = "transparent";
				document.getElementById('dvWrapperConsulta'+IdExpanded).style.borderBottom = "transparent";
			}
			document.getElementById('spConsultaAbr'+Id).style.display = "none";
			document.getElementById('dvWrapperContenido'+Id).style.display = "block";
			document.getElementById('dvWrapperConsulta'+Id).style.borderRight = "#3a6ea5 1px solid";
			document.getElementById('dvWrapperConsulta'+Id).style.borderLeft = "#3a6ea5 1px solid";
			document.getElementById('dvWrapperConsulta'+Id).style.borderTop = "#3a6ea5 1px solid";
			document.getElementById('dvWrapperConsulta'+Id).style.borderBottom = "#3a6ea5 1px solid";
			IdExpanded = Id;
		}
		
		function doNothing()
		{
			;
		}
		
		function Primera()
		{
			settings.currentPage = 1;
			getResults();
		}
		function Anterior()
		{
			--settings.currentPage; // = settings.currentPage-1;
			getResults();
		}
		function Siguiente()
		{
			++settings.currentPage; // = settings.currentPage+1;
			getResults();
		}
		function Ultima()
		{
			settings.currentPage = settings.cantPages;
			getResults();
		}
		function pageChange(page)
		{
			settings.currentPage = page!=0?Math.abs(page):1;
			getResults();
			document.getElementById('txtCurrentPage').value = settings.currentPage;
		}

		// Llenar el cbo de los Docentes y de los Temas.
		function fillListas()
		{
			var res = ISPCFG.Msce.clswfBuscadorConsultas.getListas();
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
				ProcessPageError(trNotify, spNotify, "Imposible recuperar la lista de los Docentes y de los Temas para los que se han respondido preguntas.");
				enableListaDocentes(false);
				enableListaTemas(false);
				res=null;
				return false;
			}
	
			/*
				LISTA DE LOS TEMAS
			*/
			dataView = res.value[0];
			refCbo = document.getElementById('cboTema');
			// Si no existen registros mandar a desabilitar el formulario.
			if(dataView.Rows.length==0){enableListaTemas(false);}
			refCbo.options.length = 0;
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				refCbo.options[refCbo.options.length] = new Option(getAbr(dataView.Rows[i].Modulo,15) + ": " + getAbr(dataView.Rows[i].Curso,40) + ": " + getAbr(dataView.Rows[i].Tema,10), dataView.Rows[i].Id);
			}

			/*
				LISTA DE LOS DOCENTES
			*/
			dataView = res.value[1];
			refCbo = document.getElementById('cboDocente');
			// Si no existen registros mandar a desabilitar el formulario.
			if(dataView.Rows.length==0){enableListaDocentes(false);}
			refCbo.options.length = 0;
			for(var i = 0; i<=(dataView.Rows.length-1); i++)
			{
				refCbo.options[refCbo.options.length] = new Option(dataView.Rows[i].Nombre + " (" + dataView.Rows[i].Ocurrencias + ")", dataView.Rows[i].Id);
			}
		
			res=null;			
			return true;
			
		}
		
		function enableListaDocentes(boEnable)
		{
			if(!boEnable)
			{
				document.getElementById('chkTodosDocentes').checked = true;
				document.getElementById('chkTodosDocentes').disabled = true;
				document.getElementById('cboDocente').disabled = true;
				document.getElementById('cboDocente').className = "frmTextInput_disabled";
			}
			else
			{
				document.getElementById('chkTodosDocentes').checked = false;
				document.getElementById('chkTodosDocentes').disabled = false;
				document.getElementById('cboDocente').disabled = false;
				document.getElementById('cboDocente').className = "frmTextInput";
			}
		}

		function enableListaTemas(boEnable)
		{
			if(!boEnable)
			{
				document.getElementById('chkTodosTemas').checked = true;
				document.getElementById('chkTodosTemas').disabled = true;
				document.getElementById('cboTema').disabled = true;
				document.getElementById('cboTema').className = "frmTextInput_disabled";
			}
			else
			{
				document.getElementById('chkTodosTemas').checked = false;
				document.getElementById('chkTodosTemas').disabled = false;
				document.getElementById('cboTema').disabled = false;
				document.getElementById('cboTema').className = "frmTextInput";
			}
		}
		
		/*
			Se ejecuta cuando cambia el valor de los checkboxes para indicar que
			se desea buscar en todos los temas y/o de todos los docentes que han 
			contestado consultas. Se aprovecha para establecer los valores de los
			parámetros de búsqueda "settings.tema" y "settings.respondidaPor"
		*/
		function chkTodosChanged(chkObject)
		{
			switch(chkObject.id)
			{
				case "chkTodosTemas":
				{
					var refCbo = document.getElementById('cboTema');
					break;
				}
				case "chkTodosDocentes":
				{
					var refCbo = document.getElementById('cboDocente');
					//settings.respondidaPor = chkObject.checked?'!=0': refCbo.value;
					break;
				}
				default:
				{
					alert("chkTodosChanged() se está ejecutando desde un elemento que no corresponde con los checkboxes 'chkTodosTemas' ó 'chkTodosDocentes'");
					return;
				}
			}
			refCbo.disabled = chkObject.checked;
			refCbo.className = chkObject.checked?"frmTextInput_disabled":"frmTextInput";
		}
		
		function disableForm()
		{
			var strMessage	= MSG_PROCESSING_BEGTAG;
					strMessage += "<b>NO EXISTEN RESPUESTA A CONSULTAS, POR TANTO ESTE BUSCADOR NO ";
					strMessage += "ES FUNCIONAL HASTA TANTO ALGÚN <a href=\"lista_usuarios.aspx?role=Docente\">Docentes</a> ";
					strMessage += "RESPONDA ALGUNA DE LAS CONSULTAS DIRIGIDAS A ÉL.</b>";
					strMessage += MSG_ENDTAG;
			document.getElementById('tbl_AdvancedSearch').style.display = 'none';
			document.getElementById('tbl_SimpleSearch').style.display = 'none';
			document.getElementById('dvResults').innerHTML = strMessage;
		}
		
		function switchAdvancedOptions()
		{
			link = document.getElementById('lnkAdvancedOptions');
			table = document.getElementById('tbl_AdvancedSearch');
	    if(table.style.display=='none')
	    {
				link.innerHTML = 'Opciones simples';
				settings.searchMode = 'Advanced';
				table.style.display='block';
				fillListas();
	    }
	    else
	    {
				link.innerHTML = 'Opciones avanzadas';
				settings.searchMode = 'Simple';
				document.getElementById('chkTodosTemas').checked = false;
				chkTodosChanged(document.getElementById('chkTodosTemas'));
				document.getElementById('chkTodosDocentes').checked = false;
				chkTodosChanged(document.getElementById('chkTodosDocentes'));
				document.getElementById('chkSoloMisConsultas').checked = false;
				table.style.display='none';				
	    }
		
		}
		
		/*
			VARIABLES LOCALES DE ESTA PÁGINA		
		*/	
		//settings.cadena = cadena de caracteres a buscar.
		//settings.currentPage = el valor de la página actual si es necesario el paginado.
		//settings.recordsByPage = la cantidad de registros que se mostrarán por página.
		//settings.cantTotalRecords = la cantidad total de registros que son devueltos por la búsqueda.
		//settings.begTime = la hora en que se comienza a hacer lá búsqueda.
		//settings.endTime = la hora en que se finaliza de hacer la búsqueda.
		var IdExpanded = null; // El Id de la consulta que se encuentra en estado expandido, si es el caso.
		/*
			SI NECESITA CAMBIAR LOS VALORES PREDETERMINADOS 
			DE CANTIDAD DE REGISTROS POR PÁGINA HABILITE Y
			MODIFIQUE EL VALOR DE	"settings.recordsByPage"
		*/
		//settings.recordsByPage = 5; // Cantidad de registros que se mostrarán en cada página.

		/*
			PROCEDIMIENTOS PARA INICIALIZACIÓN
		*/
		existenRespuestas();
		if(settings.role!="Maestrante")
		{	
			document.getElementById('chkSoloMisConsultas').style.display='none';
			document.getElementById('lblSoloMisConsultas').style.display='none';
		}

		//-->
		</script>

	</body>
</html>
