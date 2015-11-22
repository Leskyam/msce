<%@ Register TagPrefix="c1c" Namespace="C1.Web.C1Command" Assembly="C1.Web.C1Command" %>
<%@ Control Language="c#" AutoEventWireup="True" Codebehind="wucHeaderNavBar.ascx.cs" Inherits="ISPCFG.Msce.wucHeaderNavBar" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<!-- TABAL PARA EJEMPLO DE LAS OPCIONES DEL DIRECTOR DE LA MAESTRÍA -->
<table cellspacing="0" cellpadding="0" width="750" align="center" border="0">
	<tr valign="top">
		<td>
			<table cellspacing="0" cellpadding="0" width="205" align="left" border="0">
				<tr>
					<td><img height="22" alt="" src="imagenes/header_bar_left.gif" width="21"></td>
					<td><a title="Portal" href="/"><img height="22" alt="Portal" src="imagenes/header_button_home.gif" width="184" border="0"></a></td>
				</tr>
			</table>
		</td>
		<td>
			<table id="tbl_HeaderOptions" cellspacing="0" cellpadding="0" width="545" align="right"
				bgcolor="#415884" border="0">
				<tr height="1">
					<td valign="top" bgcolor="#ffffff"></td>
				</tr>
				<tr height="20">
					<td id="td_HeaderOptions" style="PADDING-RIGHT: 3px; PADDING-LEFT: 3px; FONT-SIZE: 8pt; COLOR: #ffffff; FONT-FAMILY: Verdana"
						align="center">
						<!-- Espacio para el contenido de las opciones o de las frases. --><c1c:c1webmenu id="webmnu_header_options" visible="False" disableditemstyle-backcolor="Gray" itemspacing="0px"
							itemtextspacing="1px" iconbarwidth="3px" selecteditemstyle-forecolor="White" enableviewstate="False" itemstyle-backcolor="65, 88, 132" itemstyle-bordercolor="#415884"
							itemstyle-borderstyle="Solid" itemstyle-borderwidth="1px" menulayout="Horizontal" selecteditemstyle-backcolor="116, 139, 183" selecteditemstyle-bordercolor="#E0E0E0"
							font-size="8pt" font-names="Verdana" itemstyle-forecolor="White" forecolor="White" clientdir="includes/C1WebCommand" runat="server">
							<c1c:c1menuitem id="mnuInicio" runat="server" enableviewstate="False" text="Inicio" tooltip="Inicio de la aplicación."
								linkurl="index.aspx?Id=1"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnu_separator01" runat="server" enableviewstate="False" imageurl="imagenes/webmnu_separator.gif"
								delimiter="True"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnuMaestria" runat="server" enableviewstate="False" text="Maestría" imageurl="imagenes/webmnu_down.gif"
								submenuid="C1SubMenuMaestria"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnu_separator02" runat="server" enableviewstate="False" imageurl="imagenes/webmnu_separator.gif"
								delimiter="True"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnuPersonal" runat="server" enableviewstate="False" text="Personal" imageurl="imagenes/webmnu_down.gif"
								submenuid="C1SubMenuPersonal"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnu_separator03" runat="server" enableviewstate="False" imageurl="imagenes/webmnu_separator.gif"
								delimiter="True"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnuBibliografia" runat="server" enableviewstate="False" text="Bibliografía"
								imageurl="imagenes/webmnu_down.gif" submenuid="C1SubMenuBibliografia"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnu_separator04" runat="server" enableviewstate="False" imageurl="imagenes/webmnu_separator.gif"
								delimiter="True"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnuConsultas" runat="server" enableviewstate="False" text="Consultas" imageurl="imagenes/webmnu_down.gif"
								submenuid="C1SubMenuConsultas"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnu_separator05" runat="server" enableviewstate="False" imageurl="imagenes/webmnu_separator.gif"
								delimiter="True"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnuEncuentros" runat="server" enableviewstate="False" text="Encuentros" linkurl="encuentros.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnu_separator06" runat="server" enableviewstate="False" imageurl="imagenes/webmnu_separator.gif"
								delimiter="True"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnuMiMaletin" runat="server" enableviewstate="False" text="Mi maletín" linkurl="mi_maletin.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnu_separator07" runat="server" enableviewstate="False" imageurl="imagenes/webmnu_separator.gif"
								delimiter="True"></c1c:c1menuitem>
							<c1c:c1menuitem id="mnuMiproyecto" runat="server" enableviewstate="False" text="Mi proyecto" linkurl="solicitar_tema_proyecto.aspx"></c1c:c1menuitem>
						</c1c:c1webmenu><c1c:c1submenu id="C1SubMenuMaestria" itemspacing="2px" itemtextspacing="2px" iconbarwidth="3px"
							runat="server" parentitemid="mnuMaestria" enableviewstate="False">
							<c1c:c1menuitem id="smnuDatosGenerales" runat="server" enableviewstate="False" text="Datos generales"
								tooltip="Nombre, fundamentos y otros datos sobre esta maestría." linkurl="maestria.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuModulos" runat="server" enableviewstate="False" text="Módulos" tooltip="Declara los módulos."
								linkurl="modulo.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuCursosTemas" runat="server" enableviewstate="False" text="Cursos y sus temas"
								tooltip="Declara los cursos y sus temas." linkurl="curso_tema.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuMenciones" runat="server" text="Menciones" tooltip="Menciones (nieveles educativos)."
								linkurl="mencion.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuSedes" runat="server" text="Sedes" tooltip="Sedes universitarias donde tienen lugar los encuentros."
								linkurl="sede.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuGrupos" runat="server" text="Grupos" tooltip="Grupos en los que se organizan los maestrantes."
								linkurl="grupo.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuTemasProyecto" runat="server" enableviewstate="False" text="Temas para proyectos"
								tooltip="Declarar temas para proyectos de investigación." linkurl="tema_proyecto.aspx"></c1c:c1menuitem>
						</c1c:c1submenu><c1c:c1submenu id="C1SubMenuPersonal" itemspacing="2px" itemtextspacing="2px" iconbarwidth="3px"
							runat="server" parentitemid="mnuPersonal" enableviewstate="False">
							<c1c:c1menuitem id="smnuCategoriasDocentes" runat="server" enableviewstate="False" text="Categorías docentes"
								tooltip="Editar categorías docentes." linkurl="categoria_docente.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuTitulosAcademicos" runat="server" enableviewstate="False" text="Títulos académicos"
								tooltip="Editar títulos académicos." linkurl="titulo_academico.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuAcademicos" runat="server" enableviewstate="False" text="Académicos" tooltip="Editar datos de los académicos."
								linkurl="academico.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuDocentes" runat="server" enableviewstate="False" text="Docentes" tooltip="Editar datos de los docentes."
								linkurl="docente.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuMaestrantes" runat="server" enableviewstate="False" text="Maestrantes" tooltip="Editar datos de los maestrantes."
								linkurl="maestrante.aspx"></c1c:c1menuitem>
						</c1c:c1submenu><c1c:c1submenu id="C1SubMenuBibliografia" itemspacing="2px" itemtextspacing="2px" iconbarwidth="3px"
							runat="server" parentitemid="mnuBibliografia" enableviewstate="False">
							<c1c:c1menuitem id="smnuBibliografiaCD" runat="server" enableviewstate="False" text="Disco compacto"
								tooltip="Bibliografía en disco compacto." linkurl="bibliografia_cd.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuBibliografiaAudiovisual" runat="server" enableviewstate="False" text="Audio-visual"
								tooltip="Bibliografía audiovisual." linkurl="bibliografia_audiovisual.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuBibliografiaDocumento" runat="server" enableviewstate="False" text="Documento"
								tooltip="Bibliografía en documento." linkurl="bibliografia_documento.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuBuscarBibliografia" runat="server" enableviewstate="False" text="Buscar y descargar"
								tooltip="Buscar y descargar bibliografía." linkurl="buscador_bibliografias.aspx"></c1c:c1menuitem>
						</c1c:c1submenu><c1c:c1submenu id="C1SubMenuConsultas" runat="server" enableviewstate="False" itemtextspacing="2px"
							parentitemid="mnuConsultas" itemspacing="2px" iconbarwidth="3px">
							<c1c:c1menuitem id="smnuConsultar" runat="server" enableviewstate="False" text="Consultar" tooltip="Registrar nuevas consultas."
								linkurl="consultar.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuResponderConsultas" runat="server" enableviewstate="False" text="Responder consultas"
								tooltip="Responder consultas." linkurl="responder_consultas.aspx"></c1c:c1menuitem>
							<c1c:c1menuitem id="smnuBuscarConsultas" runat="server" enableviewstate="False" text="Buscar consultas"
								tooltip="Buscar consultas." linkurl="buscador_consultas.aspx"></c1c:c1menuitem>
						</c1c:c1submenu></td>
				</tr>
				<tr height="1">
					<td valign="top" bgcolor="#ffffff"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
