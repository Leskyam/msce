namespace ISPCFG.Msce
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	/// <summary>
	///		Descripción breve de wucLeftOptions.
	/// </summary>
	public partial class wucLeftOptions : System.Web.UI.UserControl
	{

		#region Código generado por el Diseñador de Web Forms
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: llamada requerida por el Diseñador de Web Forms ASP.NET.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		///		Método necesario para admitir el Diseñador. No se puede modificar
		///		el contenido del método con el editor de código.
		/// </summary>
		private void InitializeComponent()
		{

		}
		#endregion
		
		#region "*** EVENTOS ***"

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				AjaxPro.Utility.RegisterTypeForAjax(typeof(wucLeftOptions));
			}
			catch(System.Exception)
			{
				;
			}
			
			// Para ocultar la opción que se corresponde con la página actual, según el nombre del fichero.
			string strFileName = System.IO.Path.GetFileName(HttpContext.Current.Request.Path);

			// Registrar el script para la cantidad de usuarios identificados y
			// para la lista de los mismos en caso que el usuario halla sido identificado.
			if (!Page.IsStartupScriptRegistered("UsuariosIdentificados"))
			{
				System.Text.StringBuilder sbUsuariosIdentificados = new System.Text.StringBuilder();
				sbUsuariosIdentificados.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
				if(HttpContext.Current.User.Identity.IsAuthenticated)
				{
					sbUsuariosIdentificados.Append("getUsersList();" + System.Environment.NewLine);
				}
				sbUsuariosIdentificados.Append("getCantLoggedUsers();");
				sbUsuariosIdentificados.Append("//--></script>" + System.Environment.NewLine);

				Page.RegisterStartupScript("UsuariosIdentificados", sbUsuariosIdentificados.ToString());
			}

			if(HttpContext.Current.User.Identity.IsAuthenticated)
			{
				if(!Page.IsStartupScriptRegistered("Buscadores"))
				{
				System.Text.StringBuilder sbBuscadores = new System.Text.StringBuilder();
				sbBuscadores.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
					if(strFileName!="buscador_bibliografias.aspx")
					{
						sbBuscadores.Append("document.getElementById('spSearchBibliografias').style.display='block';" + System.Environment.NewLine);
					}
					if(strFileName!="buscador_consultas.aspx")
					{
						sbBuscadores.Append("document.getElementById('spSearchConsultas').style.display='block';" + System.Environment.NewLine);
					}
					if(strFileName=="buscador_usuarios.aspx")
					{
						sbBuscadores.Append("document.getElementById('spSearchUsuarios').style.display='none';" + System.Environment.NewLine);
					}
				//sbBuscadores.Append("document.getElementById('spSearchUsuarios').style.display='block';" + System.Environment.NewLine);
				sbBuscadores.Append("//--></script>" + System.Environment.NewLine);
				Page.RegisterStartupScript("Buscadores", sbBuscadores.ToString());
				sbBuscadores = null;
				}
			}

			if(!HttpContext.Current.User.Identity.IsAuthenticated)
			{
				if(!Page.IsStartupScriptRegistered("Recordatorios_Off"))
				{
					System.Text.StringBuilder sbRecordatorios = new System.Text.StringBuilder();
					sbRecordatorios.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
					sbRecordatorios.Append("document.getElementById('dvWrapperRecordatorios').style.display='none';" + System.Environment.NewLine);
					sbRecordatorios.Append("//--></script>" + System.Environment.NewLine);
					Page.RegisterStartupScript("Recordatorios_Off", sbRecordatorios.ToString());
					sbRecordatorios = null;
				}
			}
			else
			{
				// Ocultar todos los recordatorios, excepto "Mensajes sin leer", ya que le corresponde a todos.
				/*
				if(!Page.IsStartupScriptRegistered("Hide_All_Recordatorios"))
				{
					// Se ocultarán los siguientes: dvRegistroPendiente, dvTemaProyectoPendiente, dvConsultasSinRespuesta, dvConsultasRespondidas
					System.Text.StringBuilder sbRecordatorios = new System.Text.StringBuilder();
					sbRecordatorios.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
					sbRecordatorios.Append("document.getElementById('dvRegistroPendiente').style.display='none';" + System.Environment.NewLine);
					sbRecordatorios.Append("document.getElementById('dvTemaProyectoPendiente').style.display='none';" + System.Environment.NewLine);
					sbRecordatorios.Append("document.getElementById('dvConsultasSinRespuesta').style.display='none';" + System.Environment.NewLine);
					sbRecordatorios.Append("document.getElementById('dvConsultasRespondidas').style.display='none';" + System.Environment.NewLine);
					sbRecordatorios.Append("//--></script>" + System.Environment.NewLine);
					
					Page.RegisterStartupScript("Hide_All_Recordatorios", sbRecordatorios.ToString());
					sbRecordatorios = null;
				}
				*/
				if(!Page.IsStartupScriptRegistered("remind_Todos"))
				{
					System.Text.StringBuilder sbReminder = new System.Text.StringBuilder();
					sbReminder.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
					sbReminder.Append("getCantMensajesSinLeer();" + System.Environment.NewLine);
					sbReminder.Append("//--></script>" + System.Environment.NewLine);
					
					Page.RegisterStartupScript("remind_Todos", sbReminder.ToString());
					sbReminder = null;
				}
				try
				{
					clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
					// Para los de Role Académico
					if(Usuario.IsInRole(clsUsuario.enuRolesName.Academico))
					{
						if(!Page.IsStartupScriptRegistered("remind_Academico"))
						{
							System.Text.StringBuilder sbReminder = new System.Text.StringBuilder();
							sbReminder.Append("<script language='JavaScript'><!-- " + System.Environment.NewLine);
							if(strFileName!="revisar_solicitud_registro.aspx")
							{
								sbReminder.Append("document.getElementById('dvRegistroPendiente').style.display='block'; " + System.Environment.NewLine);
							}
							if(strFileName!="revisar_tema_proyecto.aspx")
							{
								sbReminder.Append("document.getElementById('dvTemaProyectoPendiente').style.display='block'; " + System.Environment.NewLine);
							}
							sbReminder.Append("RemindAcademico(); " + System.Environment.NewLine);
							sbReminder.Append("//--></script> " + System.Environment.NewLine);
					
							Page.RegisterStartupScript("remind_Academico", sbReminder.ToString());
							sbReminder = null;
						}
					}
					// Para los de Role Docente
					if(Usuario.IsInRole(clsUsuario.enuRolesName.Docente))
					{
						if(!Page.IsStartupScriptRegistered("remind_Docente"))
						{
							System.Text.StringBuilder sbReminder = new System.Text.StringBuilder();
							sbReminder.Append("<script language='JavaScript'><!-- " + System.Environment.NewLine);
							if(strFileName!="responder_consultas.aspx")
							{
								sbReminder.Append("document.getElementById('dvConsultasSinRespuesta').style.display='block'; " + System.Environment.NewLine);
							}
							sbReminder.Append("RemindDocente(); " + System.Environment.NewLine);
							sbReminder.Append("//--></script> " + System.Environment.NewLine);
					
							Page.RegisterStartupScript("remind_Docente", sbReminder.ToString());
							sbReminder = null;
						}
					}
					// Para los de Role Maestrante
					if(Usuario.IsInRole(clsUsuario.enuRolesName.Maestrante))
					{
						if(!Page.IsStartupScriptRegistered("remind_Maestrante"))
						{
							System.Text.StringBuilder sbReminder = new System.Text.StringBuilder();
							sbReminder.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
							sbReminder.Append("document.getElementById('dvConsultasRespondidas').style.display='block';" + System.Environment.NewLine);
							sbReminder.Append("RemindMaestrante();" + System.Environment.NewLine);
							sbReminder.Append("//--></script>" + System.Environment.NewLine);
					
							Page.RegisterStartupScript("remind_Maestrante", sbReminder.ToString());
							sbReminder = null;
						}
					}
				}
				catch(System.Exception Ex)
				{
					System.Diagnostics.Debug.WriteLine(Ex.ToString());
				}

			}

		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		/// <summary>
		/// Devuelve el HTML necesario para mostrar en la página los UserIds de los usuarios
		/// identificados actualmente por la aplicación. Cada usuario aparecerá dentro de 
		/// un elemento <span></span>.
		/// </summary>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public string getUsersList()
		{
			if(HttpContext.Current.User.Identity.IsAuthenticated)
			{
				if(clsUsuario.LoggedUsers.Length>0)
				{
					// Cadena que representa el TAB.
					string strTab = System.Web.UI.HtmlTextWriter.DefaultTabString;
					// Las comillas dobles.
					char strQuote = System.Web.UI.HtmlTextWriter.DoubleQuoteChar;
					// Nueva línea
					string strNewLine = System.Environment.NewLine;
				
					System.Text.StringBuilder sbHTML = new System.Text.StringBuilder();
					sbHTML.Append(string.Empty);
					for(int x=(clsUsuario.LoggedUsers.Length-1); x>=0; x--)
					{
						if(clsUsuario.LoggedUsers[x].UserId.ToLower() != HttpContext.Current.User.Identity.Name.ToLower())
						{
							string strTimeSinceLastRequest = (System.DateTime.Now.Subtract(clsUsuario.LoggedUsers[x].datLastRequest)).ToString().Substring(0,8);
							if(System.Convert.ToInt16(strTimeSinceLastRequest.Substring(3,2))>1)
							{
								clsUsuario Usuario = new clsUsuario();
								Usuario.DeleteFronConnectedList(clsUsuario.LoggedUsers[x].UserId);
								Usuario = null;
								continue;
							}
							
							strTimeSinceLastRequest = (clsUsuario.LoggedUsers[x].datLastRequest.Subtract(clsUsuario.LoggedUsers[x].datUltimoAcceso)).ToString().Substring(0,8);
							string strLogoImageName = string.Empty;
							if(clsUsuario.LoggedUsers[x].RolePrincipal.ToLower() == "director" || clsUsuario.LoggedUsers[x].RolePrincipal.ToLower() == "académico")
							{
								strLogoImageName = "logo_academico.gif";
							}
							else
							{
								strLogoImageName = "logo_" + clsUsuario.LoggedUsers[x].RolePrincipal.ToLower() + ".gif";
							}
							sbHTML.Append(strTab + strTab + "<span onclick=" + strQuote + "JavaScript:ShowMessageEditor(this, '" + clsUsuario.LoggedUsers[x].Nombre + " " + clsUsuario.LoggedUsers[x].Apellidos + "');" + strQuote + " id='" + clsUsuario.LoggedUsers[x].UserId + "' title='" + clsUsuario.LoggedUsers[x].Nombre + " " + clsUsuario.LoggedUsers[x].Apellidos + "'><img src='imagenes/" + strLogoImageName + "' border='0'>" + clsUsuario.LoggedUsers[x].UserId + "&nbsp;(" + strTimeSinceLastRequest + ")</span><br>" + strNewLine);
						}
					}
					//	<span onclick="JavaScript:ShowMessageEditor(this, 'Bárbara Apellidos de Bárbara');" id='Director' title='Bárbara Apellidos de Bárbara'><img src='imagenes/logo_academico.gif' border='0'>Director&nbsp;(00:00:06)</span><br>
					return sbHTML.ToString();
				}
			}

			return string.Empty;

		}

		/// <summary>
		/// Devuelve la cantidad de usuarios identificados actualmente por la aplicación.
		/// </summary>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public int getCantLoggedUsers()
		{
			try
			{
				if(HttpContext.Current.User.Identity.IsAuthenticated)
				{
					return (clsUsuario.LoggedUsers.Length>0)?(clsUsuario.LoggedUsers.Length-1):clsUsuario.LoggedUsers.Length;
				}
				else
				{
					return clsUsuario.LoggedUsers.Length;
				}
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception ("Imposible recuperar la cantidad de usuarios identificados.", Ex);
			}
		}

		/// <summary>
		/// Enviar mensaje, tomando en cuenta el Usuario que lo origina, a quien está destinado,
		/// la fecha y el contenido del mismo.
		/// </summary>
		/// <param name="strMessageData"></param>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public bool SendMessage(string strMessageData)
		{
			try
			{
				string[] aryMessageData = strMessageData.Split('|');
				clsUsuario UsuarioFrom = new clsUsuario(HttpContext.Current.User.Identity.Name);
				clsUsuario UsuarioTo = new clsUsuario(aryMessageData[0]);
                clsUsuario_Mensaje Mensaje = new clsUsuario_Mensaje();
				System.Boolean boResult = System.Convert.ToBoolean(Mensaje.Agregar(System.Convert.ToUInt32(UsuarioFrom.Id),System.Convert.ToUInt32(UsuarioTo.Id),System.DateTime.Now,aryMessageData[1]));
				UsuarioFrom = null;
				UsuarioTo = null;
				Mensaje = null;
				System.Diagnostics.Debug.WriteLine("Original: " + aryMessageData[1]);
				System.Diagnostics.Debug.WriteLine("HtmlDecode: " + HttpContext.Current.Server.HtmlDecode(aryMessageData[1]));
				System.Diagnostics.Debug.WriteLine("HtmlEncode: " + HttpContext.Current.Server.HtmlEncode(aryMessageData[1]));
				return boResult;
			}

			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al enviar mensaje.", Ex);
			}
		}

		/// <summary>
		/// Devuelve la cantidad de mensajes pendientes
		/// </summary>
		/// <returns></returns>
		[AjaxPro.AjaxMethod()]
		public System.UInt16 getCantMensajesSinLeer()
		{
			try
			{
				clsUsuario_Mensaje Mensaje = new clsUsuario_Mensaje();
				System.UInt16 intMensajes = Mensaje.getMensajesNoLeidos(HttpContext.Current.User.Identity.Name);
				Mensaje = null;
				return intMensajes;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception ("Imposible recuperar la cantidad de mensajes sin leer.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] getNextMessage()
		{
			try
			{
				clsUsuario_Mensaje Mensaje = new clsUsuario_Mensaje();
				DataTable dtMensaje = Mensaje.getNextMessage(HttpContext.Current.User.Identity.Name);
				string[] strResult = new string[3];
				if(dtMensaje.Rows.Count==1)
				{
					clsUsuario Usuario = new clsUsuario(System.Convert.ToUInt32(dtMensaje.Rows[0]["Id_Usuario_From"]));
					strResult[0] = Usuario.Nombre + " " + Usuario.Apellidos;
					Usuario = null;
					strResult[1] = clsUtiles.getPresentationDateTime(System.Convert.ToDateTime(dtMensaje.Rows[0]["FechaHora"]));
					strResult[2] = System.Convert.ToString(dtMensaje.Rows[0]["Mensaje"]);
					Mensaje.Delete(System.Convert.ToUInt32(dtMensaje.Rows[0]["Id"]));
				}
				else
				{	
					strResult[0] = string.Empty;
				}
				Mensaje = null;
				return strResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception ("Imposible recuperar el siguiente mensaje.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public System.UInt16[] RemindAcademico()
		{
			try
			{
			System.UInt16[] result = new System.UInt16[2];
			clsMaestrante Maestrante = new clsMaestrante();
				bool boError = false;
				try
				{
					result[0] = Maestrante.getCantSolicitandoRegistro();
					boError = false;
				}
				catch(System.Exception)
				{
					boError = true;
					result[0] = 0;
				}
				try
				{
					result[1] = Maestrante.getCantTemasProyecto(clsMaestrante.enuEstadoTemaProyecto.NoRevisado);
					boError = false;
				}
				catch(System.Exception)
				{
					boError = true;
					result[1] = 0;
				}
			
				Maestrante = null;
				if(!boError)
				{
					return result;
				}
				else
				{
					throw new System.Exception ("Imposible recuperar los temas para proyecto pendientes y/o las solicitudes de registro.");
				}

			}
			catch(System.Exception Ex)
			{
				throw new System.Exception ("Imposible recuperar los temas para proyecto pendientes y/o las solicitudes de registro.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public System.UInt16 RemindDocente()
		{
			try
			{
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				clsConsulta Consulta = new clsConsulta();
				System.UInt16 intConsultas = Consulta.getCantConsultasSinRespuesta(Usuario.Id);
				Usuario = null;
				Consulta =null;
				return intConsultas;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception ("Imposible recuperar las consultas pendientes por respuesta.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public System.UInt16 RemindMaestrante()
		{
			try
			{
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				clsConsulta Consulta = new clsConsulta();
				System.UInt16 intConsultas = Consulta.getCantConsultasRespondidas(Usuario.Id);
				Usuario = null;
				Consulta =null;
				return intConsultas;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception ("Imposible recuperar las consultas pendientes por revisar.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	} // Fin de la clase.

} // Fin del namespace.
