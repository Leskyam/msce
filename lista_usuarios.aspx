<%@ Page language="c#" Codebehind="lista_usuarios.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfListaUsuarios" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
	<head>
		<title>Maestría: Lista de usuarios</title>
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
		<form id="frm_Usuario" method="post" runat="server">
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="tit_Maestria_A" id="spHeaderTituloLista">LISTA
													DE USUARIOS</span></td></tr>
										<tr valign="top">
											<td>
												<table id="tbl_content" cellspacing="0" style="padding-right: 15px; padding-left: 15px" cellpadding="0" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA LISTA DE LOS USUARIOS -->
															<table id="tbl_List" width="100%" align="center" border="0">
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTOS PARA EL PAGINADO -->
																		<span id="spPaginatorBar" style="display: none; font-weight: bold; width: 100%; background-color: whitesmoke; text-align: center">
																			<a id="lnkPrimera" href="JavaScript:Primera();" title="Ir a: primera página" style="border-right: black 1px solid; padding-right: 2px; border-top: black 1px solid; padding-left: 2px; border-left: black 1px solid; border-bottom: black 1px solid">
																				&lt;&lt;</a>&nbsp;<a id="lnkAnterior" href="JavaScript:Anterior();" title="Ir a: página anterior" style="border-right: black 1px solid; padding-right: 2px; border-top: black 1px solid; padding-left: 2px; border-left: black 1px solid; border-bottom: black 1px solid">&lt;</a>&nbsp;<label for="txtCurrentPage">Página</label>&nbsp;<input type="text" maxlength="3" id="txtCurrentPage" class="frmTextInput" size="3" onchange="JavaScript:pageChange(this.value);">&nbsp;de&nbsp;<span id="spCantPaginas">10</span>&nbsp;<a id="lnkSiguiente" href="JavaScript:Siguiente();" title="Ir a: página siguiente" style="border-right: black 1px solid; padding-right: 2px; border-top: black 1px solid; padding-left: 2px; border-left: black 1px solid; border-bottom: black 1px solid">&gt;</a>&nbsp;<a id="lnkUltima" href="JavaScript:Ultima();" title="Ir a: última página" style="border-right: black 1px solid; padding-right: 2px; border-top: black 1px solid; padding-left: 2px; border-left: black 1px solid; border-bottom: black 1px solid">&gt;&gt;</a>
																		</span>
																	</td>
																</tr>
																<tr valign="top">
																	<td colspan="2">
																		<!-- ELEMENTO SPAN PARA LLENARLO CON LA TABLA DE LA LISTA DE LOS USUARIOS -->
																		<span id="dvListaUsuarios"></span>
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
		<script language="javascript">
		<!--

		/* 
			PARA LA DECLARACIÓN DE LAS IMÁGENES DE FONDO DE LAS CELDAS, LO HACEMOS POR SCRIPT
			PORQUE FireFox NO INTREPRETA BIEN LO QUE NECESITAMOS SI UTILIZAMOS ESTILOS.
		*/
		document.getElementById('tbl_content').style.backgroundImage = "url(imagenes/body_bg.gif)";
		document.getElementById('tbl_content').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_navBarLeft').style.backgroundImage = "url(imagenes/side_nav_bg.gif)";
		document.getElementById('td_navBarLeft').style.backgroundRepeat = "no-repeat";
		document.getElementById('td_bodyHeader').style.backgroundImage = "url(imagenes/body_header.gif)";
		document.getElementById('td_bodyHeader').style.backgroundRepeat = "no-repeat";

		/*
			OBTENER TODOS LOS REGISTROS DE LOS USUARIOS PARA SER MOSTRADOS EN LA TABLA 'tbl_List'.
		*/
		function listarUsuarios()
		{
			// Limpiar el área de notificación de errores.
			ClearPageAnyNotification(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'));
			document.getElementById('spHeaderTituloLista').innerHTML = "LISTA DE " + settings.roleName;
			document.title = "Maestría: Lista de " + settings.roleName.toLowerCase();
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			document.getElementById('dvListaUsuarios').innerHTML = "Recuperando lista de " + settings.roleName.toLowerCase() + ". Por favor, espere...";
			var res = ISPCFG.Msce.clswfListaUsuarios.getListaUsuarios(settings.role, settings.currentPage, settings.recordsByPage, listarUsuarios_CallBack);
		}
		// Retorno de listarUsuarios(role)
		function listarUsuarios_CallBack(res)
		{
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divListaUsuarios = document.getElementById('dvListaUsuarios')
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
				divListaUsuarios.innerHTML = '';
				strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido recuperar los datos para la lista de los " + settings.roleName.toLowerCase() + ". Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				res=null;
				return;
			}
			
			settings.cantPages = res.value[0].Rows[0].cantPages;
			var dvUsuarios = res.value[1];
			res=null;
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvUsuarios.Rows.length==0)
			{
				document.getElementById('tbl_List').style.display = 'block';
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divListaUsuarios.innerHTML = "<b>NO EXISTEN " + settings.roleName + " REGISTRADOS.</b>";
				document.getElementById('spPaginatorBar').style.display = 'none';
				dvUsuarios = null;
				return;
			}
			if(settings.cantPages>1){document.getElementById('spPaginatorBar').style.display = 'block';}
			// Formar el encabezado de la tabla de la lista de los usuarios.
			var strHTML_Header =	"<!-- TABLA DE ENCABEZADO DE LOS REGISTROS -->\n";
					strHTML_Header += "<table border=\"0\" width=\"100%\">\n";
					strHTML_Header += "\t<tr valign=\"bottom\">\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"70%\"><b>Nombre y apellidos</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"15%\"><b>Sexo</b></td>\n";
					strHTML_Header += "\t\t<td align=\"left\" width=\"15%\"><b>Perfil</b></td>\n";
					//strHTML_Header += "\t\t<td align=\"left\" width=\"10%\"><b>Acceso</b></td>\n";
					strHTML_Header += "\t</tr>\n";
			// Formar el cuerpo de la tabla de la lista de los usuarios.
			var strHTML_Body = '';
			for(var i=0; i<=(dvUsuarios.Rows.length-1); ++i)
			{
				var Id = dvUsuarios.Rows[i].Id;
				var NombreCompleto = dvUsuarios.Rows[i].Nombre + " " + dvUsuarios.Rows[i].Apellidos;
				var Sexo = dvUsuarios.Rows[i].Sexo=='F'?"Femenino":"Masculino";
				var Perfil = dvUsuarios.Rows[i].PerfilPublico;
				// Formar el cuerpo del registro actual.
				//strHTML_Body += "\t<!-- TABLA PARA DAR FORMATO A UN REGISTRO -->\n";
				// Nombre completo y Sexo.
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				if(Perfil)
				{
					strHTML_Body += "\t\t\t<td width=\"70%\"><a href=\"perfil.aspx?Id=" + Id + "\">" + NombreCompleto + "</a></td>\n";
				}
				else
				{
					strHTML_Body += "\t\t\t<td width=\"70%\">" + NombreCompleto + "</td>\n";
				}
				strHTML_Body += "\t\t\t<td width=\"15%\">" + Sexo + "</td>\n";
				if(Perfil)
				{
					strHTML_Body += "\t\t\t<td width=\"15%\"><a href=\"perfil.aspx?Id=" + Id + "\">Público</a></td>\n";
				}
				else
				{
					strHTML_Body += "\t\t\t<td width=\"15%\">Privado</td>\n";
				}
				strHTML_Body += "\t\t</tr>\n";
				/*
				if(i!=dvUsuarios.Rows.length-1)
				{
				strHTML_Body += "\t\t<tr valign=\"top\">\n";
				strHTML_Body += "\t\t\t<td colspan=\"3\" width=\"100%\"><hr size=\"1\" color=\"#47639a\" width=\"100%\"></hr></td>\n";
				strHTML_Body += "\t\t</tr>\n";
				}
				*/
			}
			strHTML_Foot = "</table>\n";
			divListaUsuarios.innerHTML = strHTML_Header + strHTML_Body + strHTML_Foot;
			document.getElementById('txtCurrentPage').value = settings.currentPage;
			document.getElementById('spCantPaginas').innerHTML = settings.cantPages;
			dvUsuarios=null;
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
		}
		
		function doNothing()
		{
			;
		}
		
		function Primera()
		{
			settings.currentPage = 1;
			listarUsuarios();
		}
		function Anterior()
		{
			--settings.currentPage; // = settings.currentPage-1;
			listarUsuarios();
		}
		function Siguiente()
		{
			++settings.currentPage; // = settings.currentPage+1;
			listarUsuarios();
		}
		function Ultima()
		{
			settings.currentPage = settings.cantPages;
			listarUsuarios();
		}
		function pageChange(page)
		{
			settings.currentPage = page;
			listarUsuarios();
		}
		/*
			INICIALIZAR VALORES PREDETERMINADOS
		*/
		settings.recordsByPage = 20; // Cantidad de registros que se mostrarán en cada página.
		settings.currentPage = 1; // Página donde comienza la lista, la primera vez que se ejecuta o se se refresca la página.
		
		listarUsuarios();
		
		//-->
		</script>

	</body>
</html>
