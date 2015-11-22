<%@ Control Language="c#" AutoEventWireup="True" Codebehind="wucLeftOptions.ascx.cs" Inherits="ISPCFG.Msce.wucLeftOptions" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<script language="javascript">
<!--
function TextDecoration(obj)
{
	
	if(obj.style.textDecoration == 'underline')
	{
		//obj.style.backgroundColor = 'transparent';
		obj.style.textDecoration = 'none';
	}
	else
	{
		//obj.style.backgroundColor = '#f0f8ff';
		obj.style.textDecoration = 'underline';
	}
	return;
}

function ShowHideOptions(imgName, dvName)
{
	var oImg = document.getElementById(imgName);
	var oDiv = document.getElementById(dvName);
	
	if(oDiv.style.display==''){oDiv.style.display = 'block';}
	
	if(oDiv.style.display != 'block')
	{	
		oImg.src = 'imagenes/minus.gif';
		oDiv.style.display = 'block';
	}
	else
	{
		oImg.src = 'imagenes/plus.gif';
		oDiv.style.display = 'none';
	}
	
	return;
}

//-->
</script>

<table id="tbl_navBarLeft" cellspacing="0" cellpadding="0" width="205" border="0">
	<tr>
		<td background="imagenes/search_bg.gif">
			<table id="tbl_Patrocinan" cellspacing="0" cellpadding="0" border="0" height="65">
				<tr valign="middle">
					<td>
						<img alt="" src="imagenes/spacer.gif" width="5">
					</td>
					<td class="tinytext" valign="middle" align="left" width="100">
						Auspicia
						<a href="http://www.iplac.rimed.cu/" title="Instituto Pedagógico Latinoamericano y Caribeño." target="_blank"><img src="imagenes/logo_iplac.gif" alt="IPLAC" title="Instituto Pedagógico Latinoamericano y Caribeño." border="0"></a>
					</td>
					<td class="tinytext" valign="middle" align="left" width="100">
						Rectorea
						<img src="imagenes/logo_cep.gif" alt="CEP" title="Centro de Estudios Pedagógicos." border="0">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td id="td_navBarLeft" style="PADDING-RIGHT: 3px; PADDING-LEFT: 3px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px" valign="top" align="left" width="205" height="320">
			<!-- Opcionens a la izquierda -->
			<!-- TABLA PARA LA ENVOLTURA DE LAS TABLAS DE LAS OPCIONES -->
			<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<!-- OPCIONES: Académicos (Nacionales y Provinciales) -->
						<div id="dvWrapperAcademicos" class="dvLeftOptionWrapper">
							<div class="dvLeftOptionHeader" onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" onclick="JavaScript:ShowHideOptions('img01','dvAcademicos');"><img id="img01" src="imagenes/plus.gif" border="0">&nbsp;Comités
								de académicos</div>
							<div id="dvAcademicos" class="dvLeftOptionContent" style="DISPLAY: none">
								<span onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);"><a href="http://www.iplac.rimed.cu" target="_blank">Nacional</a></span><br>
								<span onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);">
									<a href="lista_usuarios.aspx?role=academico" target="_self">Provincial</a></span>
							</div>
						</div>
						<!-- 
						OPCIONES: Recordatorios (Solicitudes de registro, Solicitudes de tema de proy.
											Consultas por responder, Respuestas a consultas, 
											Mensajes no leídos). 
						-->
						<div id="dvWrapperRecordatorios" class="dvLeftOptionWrapper">
							<div class="dvLeftOptionHeader" onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" onclick="JavaScript:ShowHideOptions('img02','dvRecordatorios');"><img id="img02" src="imagenes/minus.gif" border="0">&nbsp;Recordatorios</div>
							<div id="dvRecordatorios" class="dvLeftOptionContent">
								<div id="dvRegistroPendiente" title="Solicitudes de registro de Maestrante." onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" style="display: none;">
									Solicitudes de registro
								</div>
								<div id="dvTemaProyectoPendiente" title="Maestrantes solicitando temas de proyecto." onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" style="display: none;">
									Solicitando tema de proy.
								</div>
								<div id="dvConsultasSinRespuesta" title="Consultas dirigidas a usted, que no han sido respondidas." onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" style="display: none;">
									Consultas por responder
								</div>
								<div id="dvConsultasRespondidas" title="Consultas respondidas que han sido leídas." onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" style="display: none;">
									Consultas respondidas
								</div>
								<div id="dvMensajesSinLeer" title="Mensajes sin leer." onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" onclick="JavaScript:ShowMessageViewer(this);">
									Mensajes sin leer
								</div>
							</div>
						</div>
						<!-- OPCIONES: Buscadores (Personas, consultas, bibliografía) -->
						<div id="dvWrapperBuscadores" class="dvLeftOptionWrapper">
							<div class="dvLeftOptionHeader" onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" onclick="JavaScript:ShowHideOptions('img03','dvBuscadores');"><img id="img03" src="imagenes/plus.gif" border="0">
								Buscadores
							</div>
							<div id="dvBuscadores" class="dvLeftOptionContent" style="DISPLAY: none">
								<span id="spSearchBibliografias" style="DISPLAY: none" onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);"><a href="buscador_bibliografias.aspx" target="_self">Bibliografías</a></span>
								<span id="spSearchConsultas" style="DISPLAY: none" onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);"><a href="buscador_consultas.aspx" target="_self">Consultas</a></span>
								<span id="spSearchUsuarios" style="DISPLAY: block" onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);"><a href="buscador_usuarios.aspx" target="_self">Usuarios</a></span>
							</div>
						</div>
						<!-- OPCIONES: Usuarios identificados (Lista de usuarios identificados) -->
						<div id="dvWrapperUsuariosIdentificados" class="dvLeftOptionWrapper">
							<div id="dvUsuariosIdentificadosHeader" class="dvLeftOptionHeader" onmouseover="JavaScript:TextDecoration(this);" onmouseout="JavaScript:TextDecoration(this);" onclick="JavaScript:if(document.getElementById('spUsuariosIdentificados').innerHTML!=''){ShowHideOptions('img04','spUsuariosIdentificados')};"><img id="img04" src="imagenes/minus.gif" border="0">&nbsp;Usuarios
								identificados</div>
							<span id="spUsuariosIdentificados" class="spLeftOptionContent" style="DISPLAY: none">
							</span>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px" valign="top" align="left" width="205">
		</td>
	</tr>
</table>

<!-- EDITOR PARA MENSAJES -->
<div id="dvMessageEditor" style="DISPLAY: none; FONT-WEIGHT: normal; FONT-SIZE: 7pt; Z-INDEX: 1; WIDTH: 200px; COLOR: black; FONT-FAMILY: Verdana; POSITION: absolute">
	<div id="dvMessageEditorHeader" style="BORDER-RIGHT: #47639a 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #47639a 1px solid; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #47639a 1px solid; WIDTH: 100%; PADDING-TOP: 1px; BORDER-BOTTOM: #47639a 1px solid; HEIGHT: 16px; BACKGROUND-COLOR: #ffffe0; TEXT-ALIGN: left">
		A:
	</div>
	<div id="dvMessageEditorBody" style="BORDER-RIGHT: #47639a 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #47639a 1px solid; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #47639a 1px solid; WIDTH: 100%; PADDING-TOP: 1px; BORDER-BOTTOM: #47639a 1px solid; HEIGHT: 55px; BACKGROUND-COLOR: #ffffff">
		<textarea id="txtMessageContent" style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; FONT-WEIGHT: normal; FONT-SIZE: 7pt; PADDING-BOTTOM: 2px; OVERFLOW: auto; WIDTH: 100%; COLOR: black; BORDER-TOP-STYLE: none; PADDING-TOP: 2px; FONT-FAMILY: Verdana; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; POSITION: static; HEIGHT: 100%; BACKGROUND-COLOR: #f0f8ff; BORDER-BOTTOM-STYLE: none" onkeyup="JavaScript:document.getElementById('spCaracteresRestantes').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 100);" onkeydown="JavaScript:document.getElementById('spCaracteresRestantes').innerHTML='Caracteres restantes: ' + getInputCharLeft(this, 100);"></textarea>
	</div>
	<div id="dvMessageEditorFoot" style="BORDER-RIGHT: #47639a 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #47639a 1px solid; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #47639a 1px solid; WIDTH: 100%; PADDING-TOP: 1px; BORDER-BOTTOM: #47639a 1px solid; HEIGHT: 30px; BACKGROUND-COLOR: #ffffe0">
		<span style="DISPLAY: block; WIDTH: 100%; TEXT-ALIGN: left" id="spCaracteresRestantes">Caracteres
			restantes: 100</span>
		<span style="DISPLAY: block; WIDTH: 100%; TEXT-ALIGN: right"><a id="lnkSendMessage" name="lnkSendMessage" style="COLOR: #072660; TEXT-DECORATION: underline" href="JavaScript:SendMessage();">Enviar</a>&nbsp;<a style="COLOR: #072660; TEXT-DECORATION: underline" href="JavaScript:HideMessageEditor();">Cancelar</a>&nbsp;
		</span>
	</div>
</div>
<!-- FIN DEL EDITOR PARA MENSAJES -->

<!-- VISOR DE MENSAJES -->
<div id="dvMessageViewer" style="DISPLAY: none; FONT-WEIGHT: normal; FONT-SIZE: 7pt; Z-INDEX: 1; WIDTH: 200px; COLOR: black; FONT-FAMILY: Verdana; POSITION: absolute">
	<div id="dvMessageViewerHeader" style="BORDER-RIGHT: #47639a 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #47639a 1px solid; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #47639a 1px solid; WIDTH: 100%; PADDING-TOP: 1px; BORDER-BOTTOM: #47639a 1px solid; BACKGROUND-COLOR: #ffffe0; TEXT-ALIGN: left">
		De:
	</div>
	<div id="dvMessageViewerBody" style="BORDER-RIGHT: #47639a 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #47639a 1px solid; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #47639a 1px solid; WIDTH: 100%; PADDING-TOP: 1px; BORDER-BOTTOM: #47639a 1px solid; HEIGHT: 55px; BACKGROUND-COLOR: #f0f8ff; TEXT-ALIGN: justify">
	</div>
	<div id="dvMessageViewerFoot" style="BORDER-RIGHT: #47639a 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #47639a 1px solid; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #47639a 1px solid; WIDTH: 100%; PADDING-TOP: 1px; BORDER-BOTTOM: #47639a 1px solid; BACKGROUND-COLOR: #ffffe0">
		<span style="DISPLAY: block; WIDTH: 100%; TEXT-ALIGN: right"><a id="lnkNext" name="lnkNext" style="COLOR: #072660; TEXT-DECORATION: underline" href="JavaScript:getNextMessage();">Siguiente</a>&nbsp;<a style="COLOR: #072660; TEXT-DECORATION: underline" href="JavaScript:HideMessageViewer();">Cerrar</a>&nbsp;
		</span>
	</div>
</div>
<!-- FIN DEL VISOR DE MENSAJES -->

<script language="javascript">
<!--

/*
	MUESTRA Y SITÚA EL EDITOR PARA MENSAJES EN LA
	POSICIÓN CORRECTA SEGÚN EL ID DE USUARIO SOBRE
	EL QUE SE HAGA CLICK.
*/
function ShowMessageEditor(sender, userNombreCompleto)
{
	var topExtra;
	var leftExtra;
	var parentSender;
	var editorHeight;
	
	// Elemento DIV (envoltura del editor)
	objMessageEditor = document.getElementById('dvMessageEditor');
	// Elemento textArea
	textAreaContent = document.getElementById('txtMessageContent');
	// Elemento DIV (header del editor)
	editorHeader = document.getElementById('dvMessageEditorHeader')
	// Elemento <A> para enviar mensaje.
	objLinkSendMessage = document.getElementById('lnkSendMessage');

	if(msie)
	{
		parentSender = sender.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
		topExtra = 235;
		editorHeight = 50;
	}
	else
	{
		parentSender = sender.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
		topExtra = 230;
		editorHeight = 50;
	}
	
	leftExtra = 205;
	var leftPos = parentSender.offsetLeft + leftExtra;
	var topPos = sender.offsetTop + topExtra;
	
	// Reestablecer la cantidad de caracteres restantes para escribir, según como sea el valor de 'textAreaContent'.
	document.getElementById('spCaracteresRestantes').innerHTML='Caracteres restantes: ' + getInputCharLeft(textAreaContent, 100);
	
	objMessageEditor.style.left = leftPos;
	objMessageEditor.style.top = topPos;
	objMessageEditor.style.height = editorHeight;
	objMessageEditor.style.display = 'block';
	
	// Limpiar el contenido del textArea si el usuario al que se está escribiendo no es el mismo.
	if(editorHeader.innerHTML.indexOf(userNombreCompleto)<0){textAreaContent.value = '';}
	editorHeader.innerHTML = 'A: <a href="perfil.aspx?Id=' + sender.id + '" title="Ver perfil">' + userNombreCompleto + '</a>';
	// Establecer el href del link para envío de mensaje.
	objLinkSendMessage.href = "JavaScript:SendMessage('" + sender.id + "');";
	// Establecer el enfoque al textArea.
	textAreaContent.focus();
		
} // Fin de ShowMessageEditor()

/*
	MUESTRA Y SITÚA EL VISOR PARA MENSAJES EN LA
	POSICIÓN CORRECTA SEGÚN LA POSICIÓN DEL VÍNCULO
	CON NOMBRE "Mensajes sin leer (x)".
*/
function ShowMessageViewer(sender)
{
	var topExtra;
	var leftExtra;
	var parentSender;
	var viewerHeight;
	
	// Elemento DIV (envoltura del visor de mensajes)
	divMessageViewer = document.getElementById('dvMessageViewer');
	// Elemento DIV (header del visor)
	divMessageViewerHeader = document.getElementById('dvMessageViewerHeader')
	// Elemento <div> para el contenido del mensaje.
	divMessageViewerBody = document.getElementById('dvMessageViewerBody');
	// Elemento <A> para ver el siguiente mensaje.
	LinkNext = document.getElementById('lnkNext');

	if(msie)
	{
		parentSender = sender.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
		topExtra = 235;
		viewerHeight = 50;
	}
	else
	{
		parentSender = sender.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
		topExtra = 230;
		viewerHeight = 50;
	}
	
	leftExtra = 205;
	var leftPos = parentSender.offsetLeft + leftExtra;
	var topPos = sender.offsetTop + topExtra;
	
	divMessageViewer.style.left = leftPos; //sender.offsetLeft; // + sender.width; // eTABLE.offsetLeft + eSrc.width;
	divMessageViewer.style.top = topPos; // eTABLE.offsetTop + eTR.offsetTop;
	divMessageViewer.style.height = viewerHeight;
	divMessageViewer.style.display = 'block';
	
	getNextMessage();
		
} // Fin de ShowMessageEditor()

// Mostrar mensajes de advertencia de que no hay más mensajes.
function WarningNoMoreMessage()
{
			// Elemento DIV (header del visor)
			divMessageViewerHeader.innerHTML = "NO TIENE MENSJES";
			// Elemento <div> para el contenido del mensaje.
			document.getElementById('dvMessageViewerBody').innerHTML = "No existen mensajes para usted.";
			// Ocultar el vínculo al mensaje siguiente.
			document.getElementById('lnkNext').style.display='none';
}

function HideMessageEditor()
{
	textAreaContent = document.getElementById('txtMessageContent');
	// Limpiar el mensaje de envío satisfactorio al cerrar y el de error.
	if(textAreaContent.value=='Mensaje enviado correctamente.' || textAreaContent.value.indexOf('Ha ocurrido un error')>-1)
	{
		textAreaContent.value = '';		
	}
	// Ocultar el editor de mensajes.
	document.getElementById('dvMessageEditor').style.display='none';
} // Fin de HideMessageEditor()


function HideMessageViewer()
{
	document.getElementById('dvMessageViewer').style.display='none';
	document.getElementById('dvMessageViewerBody').innerHTML ='';
} // Fin de HideMessageViewer()

/*
	FUNCIONES PARA PROCEDIMIENTOS AJAX.
*/

// Actualizar la lista de usuarios identificados.
function getUsersList()
{
	//document.getElementById('spUsuariosIdentificados').innerHTML = "Cargando...";
	ISPCFG.Msce.wucLeftOptions.getUsersList(getUsersList_CallBack);
	window.setTimeout('getUsersList()', 60000); // 60000 es el valor correcto.
} // Fin de getUsersList()

function getUsersList_CallBack(res)
{
	var spListaUsuarios = document.getElementById('spUsuariosIdentificados');
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
	if(boError)
	{
		spListaUsuarios.innerHTML = "<span>" + MSG_ERROR_BEGTAG + "Error" + MSG_ENDTAG + "</span>";
		res = null;
		return;
	}
	if(res.value=='')
	{
		spListaUsuarios.style.display='none';
	}
	else
	{
		spListaUsuarios.style.display='block';
		document.getElementById('img04').src = 'imagenes/minus.gif';
	}
	spListaUsuarios.innerHTML = res.value;
	res = null;
	return;

} // Fin de getUsersList_CallBack()


function getCantLoggedUsers()
{
	ISPCFG.Msce.wucLeftOptions.getCantLoggedUsers(getCantLoggedUsers_CallBack);
	window.setTimeout('getCantLoggedUsers()', 60000); // 60000 es el valor correcto.
} // Fin de getCantUsersLogged()

function getCantLoggedUsers_CallBack(res)
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
		if(res.value==null)
		{	
			boError = true;
		}
	}
	if(boError)
	{
		document.getElementById('dvUsuariosIdentificadosHeader').innerHTML = "<img id=\"img04\" src=\"imagenes/minus.gif\" border=\"0\">&nbsp;Usuarios identificados (" + MSG_ERROR_BEGTAG + "Error" + MSG_ENDTAG + ")";
		res = null;
		return;
	}
	document.getElementById('dvUsuariosIdentificadosHeader').innerHTML = '<img id="img04" src="imagenes/minus.gif" border="0">&nbsp;Usuarios identificados (' + res.value + ')';
	res = null;

} // Fin de getCantUsersLogged_CallBack()

// Enviar mensaje a otro usuario.
function SendMessage(userTo)
{
	// Elemento textArea
	textAreaContent = document.getElementById('txtMessageContent');
	if(textAreaContent.value=='')
	{
		textAreaContent.value = 'ADVERTENCIA:\nTeclee aquí el contenido del mensaje.';
		return;
	}
	var msgData = userTo + '|' + textAreaContent.value;
	textAreaContent.value = 'Enviando mensaje. Por favor, espere...';
	ISPCFG.Msce.wucLeftOptions.SendMessage(msgData, SendMessage_CallBack);
}

// El retorno de "Enviar mensaje a otro usuario".
function SendMessage_CallBack(res)
{
	// Elemento textArea
	textAreaContent = document.getElementById('txtMessageContent');
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
	if(boError)
	{
		textAreaContent.value =  "Ha ocurrido un error.\nNO SE HA ENVIADO EL MENSAJE.";
		res = null;
		return;
	}
	if(res.value==true)
	{
		textAreaContent.value = "Mensaje enviado correctamente.";
	}
	else
	{	
		textAreaContent.value = "NO SE HA ENVIADO EL MENSAJE.\nSe desconoce la causa.";
	}
	res = null;
}

// Para las opciones de los Recordatorios
function getCantMensajesSinLeer()
{
	ISPCFG.Msce.wucLeftOptions.getCantMensajesSinLeer(getCantMensajesSinLeer_CallBack);
	window.setTimeout('getCantMensajesSinLeer()', 30000); // 30000 es el valor correcto.
}

function getCantMensajesSinLeer_CallBack(res)
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
		if(res.value==null)
		{	
			boError = true;
		}
	}
	if(boError)
	{
		document.getElementById('dvMensajesSinLeer').innerHTML = "Mensajes sin leer (" + MSG_ERROR_BEGTAG + "Error" + MSG_ENDTAG + ")";
		res = null;
		return;
	}
	document.getElementById('dvMensajesSinLeer').innerHTML = "Mensajes sin leer (" + res.value + ")";
	res = null;
}

function RemindAcademico()
{
	ISPCFG.Msce.wucLeftOptions.RemindAcademico(RemindAcademico_CallBack);
	window.setTimeout('RemindAcademico()', 90000); // 90000 es el valor correcto.
}

function RemindAcademico_CallBack(res)
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
		if(res.value==null)
		{	
			boError = true;
		}
	}
	if(boError)
	{
		document.getElementById('dvRegistroPendiente').innerHTML = "Solicitudes de registro (" + MSG_ERROR_BEGTAG + "Error" + MSG_ENDTAG + ")";
		document.getElementById('dvTemaProyectoPendiente').innerHTML = "Solicitando tema de proy. (" + MSG_ERROR_BEGTAG + "Error" + MSG_ENDTAG + ")";
		res=null;
		return;
	}

	if(res.value[0]>0)
	{
		document.getElementById('dvRegistroPendiente').innerHTML = "<a href=\"revisar_solicitud_registro.aspx\">Solicitudes de registro (" + res.value[0] + ")</a>";
	}
	else
	{
		document.getElementById('dvRegistroPendiente').innerHTML = "Solicitudes de registro (" + res.value[0] + ")";
	}
	
	//alert(res.value[0]);
	//document.getElementById('dvRegistroPendiente').style.display = 'block';
	
	document.getElementById('dvTemaProyectoPendiente').innerHTML = "<a href=\"revisar_tema_proyecto.aspx\">Solicitando tema de proy. (" + res.value[1] + ")</a>";
	res=null;
}

function RemindDocente()
{
	ISPCFG.Msce.wucLeftOptions.RemindDocente(RemindDocente_CallBack);
	window.setTimeout('RemindDocente()', 90000); // 90000 es el valor correcto.
}

function RemindDocente_CallBack(res)
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
		if(res.value==null)
		{	
			boError = true;
		}
	}
	if(boError)
	{
		document.getElementById('dvConsultasSinRespuesta').innerHTML = "Consultas por responder (" + MSG_ERROR_BEGTAG + "Error" + MSG_ENDTAG + ")";
		res=null;
		return;
	}
	if(res.value>0)
	{
		document.getElementById('dvConsultasSinRespuesta').innerHTML = "<a href=\"responder_consultas.aspx\">Consultas por responder (" + res.value + ")</a>";
	}
	else
	{
		document.getElementById('dvConsultasSinRespuesta').innerHTML = "Consultas por responder (" + res.value + ")";
	}
	res=null;
}

function RemindMaestrante()
{
	ISPCFG.Msce.wucLeftOptions.RemindMaestrante(RemindMaestrante_CallBack);
	window.setTimeout('RemindMaestrante()', 90000); // 90000 es el valor correcto.
}

function RemindMaestrante_CallBack(res)
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
		if(res.value==null)
		{	
			boError = true;
		}
	}
	if(boError)
	{
		document.getElementById('dvConsultasRespondidas').innerHTML = "Consultas respondidas (" + MSG_ERROR_BEGTAG + "Error" + MSG_ENDTAG + ")";
		res=null;
		return;
	}
	if(res.value==0)
	{
		document.getElementById('dvConsultasRespondidas').innerHTML = "Consultas respondidas (" + res.value + ")";
	}
	else
	{
		document.getElementById('dvConsultasRespondidas').innerHTML = "<a href=\"consultar.aspx\" target=\"_self\">Consultas respondidas (" + res.value + ")</a>";
	}
	res = null;
}

// Este es un método Ajax, recuerda moverlo a donde corresponde en la página.
function getNextMessage()
{
	if(document.getElementById('dvMensajesSinLeer').innerHTML.indexOf('(0)')>-1)
	{
		WarningNoMoreMessage();		
		return;
	}
	// Elemento DIV (header del visor)
	document.getElementById('dvMessageViewerHeader').innerHTML = "Por favor, espere...";
	ISPCFG.Msce.wucLeftOptions.getNextMessage(getNextMessage_CallBack);
}

/* 
	En res debe venir un array de string con los siguientes datos:
	res.value[0] = Nombre del usuario que envió el usuario.
	res.value[1] = Fecha en que se envíó el mensaje.
	res.value[2] = Contenido del mensaje.
*/
function getNextMessage_CallBack(res)
{
	// Elemento DIV (header del visor)
	divMessageViewerHeader = document.getElementById('dvMessageViewerHeader')
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
	if(boError)
	{
		divMessageViewerHeader.innerHTML = MSG_ERROR_BEGTAG + "(Error)" + MSG_ENDTAG;
		// Elemento <div> para el contenido del mensaje.
		document.getElementById('dvMessageViewerBody').innerHTML = MSG_ERROR_BEGTAG + "Error mientras se recuperaba el siguiente mensaje." + MSG_ENDTAG;
		res=null;
		return;
	}
	if(res.value[0]!='')
	{
		// Elemento DIV (header del visor)
		divMessageViewerHeader.innerHTML = "De: " + res.value[0] + "<br>Fecha: " + res.value[1];
		// Elemento <div> para el contenido del mensaje.
		document.getElementById('dvMessageViewerBody').innerHTML = res.value[2];
		// Mandar a ejecutar el método que actualice la cantidad de mensajes pendientes.
		getCantMensajesSinLeer();
		if(document.getElementById('dvMensajesSinLeer').innerHTML.indexOf('(0)')>-1)
		{
			document.getElementById('lnkNext').style.display='none';
		}
	}
	else
	{
		WarningNoMoreMessage();
	}
}

//-->
</script>

