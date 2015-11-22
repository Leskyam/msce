<%@ Page language="c#" Codebehind="lista_modulos.aspx.cs" AutoEventWireup="True" Inherits="ISPCFG.Msce.clswfListaModulos" %>
<%@ Register TagPrefix="uc1" TagName="wucHeader" Src="wucHeader.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucHeaderNavBar" Src="wucHeaderNavBar.ascx" %>
<%@ Register TagPrefix="uc1" TagName="wucLeftOptions" Src="wucLeftOptions.ascx" %>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en" >
<html>
  <head>
		<title>Maestría: Listado de módulos</title>
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
											<td id="td_bodyHeader" style="PADDING-RIGHT: 30px; PADDING-LEFT: 30px" valign="middle" align="center" width="545" height="65"><span class="subtit_A" id="spHeaderContent">LISTA DE MÓDULOS</span>
											</td>
										</tr>
										<tr valign="top">
											<td>
												<table id="Table5" cellspacing="0" cellpadding="15" width="100%" border="0">
													<tr>
														<td id="td_body_bg" valign="top" align="left" height="320">
															<!-- TABLA PARA LA LISTA DE LOS MÓDULOS -->
															<table id="tbl_List" width="100%" align="center" border="0">
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

		// LLENA LOS DATOS QUE CORRESPONDEN A LA PÁGINA.
		function getAllModulos()
		{
			// Obtener la referencia al elemento DIV que contendrá los datos de los módulos.
			var divListaModulos = document.getElementById('dvListaModulos');
			divListaModulos.innerHTML = "Recuperando lista de los módulos. Por favor, espere...";
			// Obtener los datos de los módulos.
			var res = ISPCFG.Msce.clswfListaModulos.getAllRecords().value;
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
				divListaModulos.innerHTML = "";
				var strErrorMessage = "Estimado usuario, ha sucedido un error que ha impedido recuperar los datos para la lista de los módulos. Le sugerimos que lo intente nuevamente. Si el problema persiste, consulte con los administradores del sistema.";
				ProcessPageError(document.getElementById('tr_Notify'), document.getElementById('sp_Notify'), strErrorMessage);
				dvModulos = null;
				return;
			}
			
			var dvModulos = res;
			// Comprobar que no sea cero (0) la cantidad de registros (módulos).
			if(dvModulos.Rows.length==0)
			{
				dvModulos = null;
				// Mostrar mensaje al usuario indicando que no existen módulos registrados.
				divListaModulos.innerHTML = "<b>NO EXISTEN MÓDULOS REGISTRADOS.</b>";
				return;
			}
			var strHTML =	"<table border=\"0\" align=\"center\">\n";
					strHTML += "\t<tr valign=\"middle\">\n";
					strHTML += "\t\t<td align=\"left\"><b>No. Orden</b></td>\n";
					strHTML += "\t\t<td align=\"left\"><b>Nombre breve</b></td>\n";
					strHTML += "\t\t<td align=\"left\"><b>Nombre completo</b></td>\n";
					strHTML += "\t</tr>\n";
	
			for(var i=0; i<=(dvModulos.Rows.length-1); ++i)
			{
				var NoOrden = dvModulos.Rows[i].NoOrden;
				var NombreCorto = dvModulos.Rows[i].NombreCorto;
				var NombreCompleto = dvModulos.Rows[i].NombreCompleto;
				var Objetivos = dvModulos.Rows[i].Objetivos;
				// Formar el cuerpo del registro actual.
				strHTML += "\t\t<tr valign=\"top\">\n";
				strHTML += "\t\t\t<td>" + NoOrden + "</td>\n";
				strHTML += "\t\t\t<td>" + NombreCorto + "</td>\n";
				strHTML += "\t\t\t<td>" + NombreCompleto + "</td>\n";
				strHTML += "\t\t</tr>\n";
				strHTML += "\t\t<tr valign=\"top\">\n";
				strHTML += "\t\t\t<td colspan=\"3\"><b>Objetivos:</b> " + Objetivos + "</td>\n";
				strHTML += "\t\t</tr>\n";
				if(i<dvModulos.Rows.length-1)
				{
					strHTML += "\t\t<tr valign=\"top\">\n";
					strHTML += "\t\t\t<td colspan=\"3\"><hr width=\"100%\" class=\"hr_SeparatorRecord\" size=\"1\"></hr></td>\n";
					strHTML += "\t\t</tr>\n";
				}
			}
			strHTML += "</table>";
			divListaModulos.innerHTML = strHTML;
			dvModulos=null; 
		}
		
		getAllModulos();
		
		//-->
		</script>


	</body>
</html>
