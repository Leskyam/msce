namespace ISPCFG.Msce
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	/// <summary>
	///		Descripci�n breve de wucHeaderOptions.
	/// </summary>
	public partial class wucHeaderNavBar: System.Web.UI.UserControl
	{

		#region "*** CONTROLES ***"

		protected C1.Web.C1Command.C1MenuItem mnuEditarBibliografia;
		protected C1.Web.C1Command.C1MenuItem mnuBuscarBibliografia;

		#endregion "*** FIN DE CONTROLES ***"

		#region C�digo generado por el Dise�ador de Web Forms
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: llamada requerida por el Dise�ador de Web Forms ASP.NET.
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		///		M�todo necesario para admitir el Dise�ador. No se puede modificar
		///		el contenido del m�todo con el editor de c�digo.
		/// </summary>
		private void InitializeComponent()
		{

		}
		#endregion
		
		#region "*** EVENTOS ***"
		
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Asignar el link al men� Inicio ya que no sabemos con serteza donde estar� 
			// hosteada la aplicaci�n, as� que podemos variar la ubicaci�n de la misma.
			this.mnuInicio.LinkUrl = Request.ApplicationPath + "/index.aspx";
			// Introducir aqu� el c�digo de usuario para inicializar la p�gina
			if(!Page.User.Identity.IsAuthenticated)
			{
				if (!Page.IsStartupScriptRegistered("CambiarFrases"))
				{
					System.Text.StringBuilder sbScript = new System.Text.StringBuilder();
					sbScript.Append("<script language=JavaScript>" + System.Environment.NewLine);
					sbScript.Append("var aryText = new Array('No hay igualdad social posible sin igualdad de cultura. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'Ser culto es el �nico modo de ser libre. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'Al mundo nuevo corresponde universidad nueva. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'La educaci�n empieza con la vida, y no acaba sino con la muerte. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'El que sabe m�s, vale m�s. Saber es tener. La moneda se funde, y el saber no. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'Ense�ar es crear. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'El hombre ignorante no ha empezado a ser hombre. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'Hombres recoger� quien siembre escuelas. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'Lo hizo maestro, que es hacerlo creador. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'El mundo nuevo requiere escuela nueva. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'No fortifica la educaci�n si no es continua y constante. <sub>Jos� Mart�</sub>'," + System.Environment.NewLine);
					sbScript.Append("'Un pueblo de hombres educados ser� siempre un pueblo de hombres libres. <sub>Jos� Mart�</sub>');" + System.Environment.NewLine);
					sbScript.Append("var nextone=3;" + System.Environment.NewLine);
					sbScript.Append("document.getElementById('td_HeaderOptions').innerHTML=aryText[nextone-1];" + System.Environment.NewLine);
					sbScript.Append("setTimeout('cambio()', 8000);" + System.Environment.NewLine);
					sbScript.Append("function cambio()" + System.Environment.NewLine);
					sbScript.Append("{" + System.Environment.NewLine);
					sbScript.Append("if(nextone>aryText.length){nextone=1;}" + System.Environment.NewLine);
					sbScript.Append("document.getElementById('td_HeaderOptions').innerHTML=aryText[nextone-1];" + System.Environment.NewLine);
					sbScript.Append("nextone++;" + System.Environment.NewLine);
					sbScript.Append("setTimeout('cambio()', 8000);" + System.Environment.NewLine);
					sbScript.Append("}" + System.Environment.NewLine);
					sbScript.Append("</script>" + System.Environment.NewLine);
				
					Page.RegisterStartupScript("CambiarFrases", sbScript.ToString());
				}
			}
			else
			{
				this.webmnu_header_options.Visible=true;
				HideAllOption();
				if(HttpContext.Current.User.Identity.IsAuthenticated)
				{
					try
					{
						clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
						for(int x=0; x<=(Usuario.Roles.Roles.Length-1); x++)
						{
							ActivateAccordingUserRole(Usuario.Roles.Roles[x]);
						}
					}
					catch(System.Exception)
					{;}
				}
				HideOptionAccordingPage();
				SetSeparatorsVisibility();
			}

		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		/// <summary>
		/// Activar las opciones de los men�es de acuerdo al role que se para como valor del par�metro "strUserRole"
		/// </summary>
		/// <param name="strUserRole">Role del usuario.</param>
		private void ActivateAccordingUserRole(string strUserRole)
		{
			string strOpcionesDisponibles = string.Empty;

			switch(strUserRole)
			{
				case "Director":
				{
					strOpcionesDisponibles = "smnuDatosGenerales,smnuModulos,smnuCursosTemas,smnuCategoriasDocentes,smnuTitulosAcademicos,smnuAcademicos,smnuBibliografiaCD";
					break;
				}
				case "Acad�mico":
				{
					strOpcionesDisponibles = "smnuTemasProyecto,smnuDocentes,smnuMaestrantes,smnuMenciones,smnuGrupos,smnuSedes,smnuBibliografiaAudiovisual";
					break;
				}
				case "Docente":
				{
					strOpcionesDisponibles = "smnuBibliografiaDocumento,smnuBuscarConsultas,smnuResponderConsultas,mnuEncuentros";
					mnuEncuentros.LinkUrl = "planificar_encuentros.aspx";
                    mnuEncuentros.ToolTip = "Planificar encuentros presenciales.";
					break;
				}
				case "Maestrante":
				{
					strOpcionesDisponibles = "smnuBuscarConsultas,smnuConsultar,mnuEncuentros,mnuMiMaletin,mnuMiproyecto";
					mnuEncuentros.LinkUrl = "ver_encuentros.aspx";
					mnuEncuentros.ToolTip = "Ver encuentros presenciales planificados.";
					//mnuMiproyecto.Text = mnuMiproyecto.Text + " (Aprobado)";
					break;
				}
				default:
				{
					strOpcionesDisponibles = "mnuInicio";
					break;
				}

			}

			// Agregar las opciones que estar�n disponibles para todos los roles.
            strOpcionesDisponibles = "mnuInicio," + strOpcionesDisponibles + ",smnuBuscarBibliografia";

			for(int x=0; x<=(this.webmnu_header_options.Items.Count-1); x++)
			{
				// Si no es un delimitador
				if(!this.webmnu_header_options.Items[x].Delimiter)
				{
					bool boShowParent = false;
					if(this.webmnu_header_options.Items[x].HasSubMenu)
					{
						for(int y=0; y<=(this.webmnu_header_options.Items[x].SubMenu.Items.Count-1); y++)
						{
							if(strOpcionesDisponibles.IndexOf(this.webmnu_header_options.Items[x].SubMenu.Items[y].ID)>-1)
							{
								this.webmnu_header_options.Items[x].SubMenu.Items[y].Visible = true;
								boShowParent = true;
							}
						}
						if(boShowParent) {this.webmnu_header_options.Items[x].Visible=true;}
					}
					else
					{
						if(strOpcionesDisponibles.IndexOf(this.webmnu_header_options.Items[x].ID)>-1)
						{
                            this.webmnu_header_options.Items[x].Visible = true;
						}

					}
				}
			}

		}

		/// <summary>
		/// Esconder todas las opciones.
		/// </summary>
		private void HideAllOption()
		{
			for(int x=0; x<=(this.webmnu_header_options.Items.Count-1); x++)
			{
				// Si no es un delimitador
				if(!this.webmnu_header_options.Items[x].Delimiter)
				{
					if(this.webmnu_header_options.Items[x].HasSubMenu)
					{
						for(int y=0; y<=(this.webmnu_header_options.Items[x].SubMenu.Items.Count-1); y++)
						{
							this.webmnu_header_options.Items[x].SubMenu.Items[y].Visible=false;
						}
					}
					this.webmnu_header_options.Items[x].Visible=false;
				}
			}
		}


		/// <summary>
		/// Esconder las opciones de acuerdo a la p�gina que se est� visualizando, por ejemplo,
		/// si estamos en la p�gina de Inicio no es razonable que se muestre el link que lleva a la misma.
		/// </summary>
		private void HideOptionAccordingPage()
		{
			for(int x=0; x<=(this.webmnu_header_options.Items.Count-1); x++)
			{
				if(!this.webmnu_header_options.Items[x].Delimiter)
				{
					if(this.webmnu_header_options.Items[x].LinkUrl!=string.Empty)
					{
						string val1 = System.IO.Path.GetFileName(this.webmnu_header_options.Items[x].LinkUrl).ToLower();
                        string val2 = System.IO.Path.GetFileName(Request.Path).ToLower();
						//System.Diagnostics.Debug.WriteLine(val1 + " & " + val2);
						if(val1==val2){this.webmnu_header_options.Items[x].Visible=false;break;}
					}
					if(this.webmnu_header_options.Items[x].HasSubMenu)
					{
						for(int y=0; y<=(this.webmnu_header_options.Items[x].SubMenu.Items.Count-1); y++)
						{
							if(this.webmnu_header_options.Items[x].SubMenu.Items[y].LinkUrl!=string.Empty)
							{
								string val1 = System.IO.Path.GetFileName(this.webmnu_header_options.Items[x].SubMenu.Items[y].LinkUrl).ToLower();
								string val2 = System.IO.Path.GetFileName(Request.Path).ToLower();
								//System.Diagnostics.Debug.WriteLine(val1 + " & " + val2);
								if(val1==val2){this.webmnu_header_options.Items[x].SubMenu.Items[y].Visible=false;break;}
							}
						}
					}
					//System.Diagnostics.Debug.WriteLine(this.webmnu_header_options.Items[x].ID + ":  " + this.webmnu_header_options.Items[x].LinkUrl + " Submen�es: " + (this.webmnu_header_options.Items[x].HasSubMenu?this.webmnu_header_options.Items[x].SubMenu.Items.Count.ToString():"0"));
					//System.Diagnostics.Debug.WriteLine(this.webmnu_header_options.Items[x].HasSubMenu);

				}
			}
		}

		/// <summary>
		/// Establecer la visibilidad de los separadores de acuerdo a las opciones de men� al que corresponden.
		/// </summary>
		private void SetSeparatorsVisibility()
		{
			this.mnu_separator01.Visible = this.mnuInicio.Visible;
			this.mnu_separator02.Visible = this.mnuMaestria.Visible;
			this.mnu_separator03.Visible = this.mnuPersonal.Visible;
			this.mnu_separator04.Visible = this.mnuBibliografia.Visible;
			this.mnu_separator05.Visible = this.mnuConsultas.Visible;
			this.mnu_separator06.Visible = this.mnuEncuentros.Visible & this.mnuMiMaletin.Visible;
			this.mnu_separator07.Visible = this.mnuMiMaletin.Visible & this.mnuMiproyecto.Visible;
		}


		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

	
	}	// Fin de la clase

}	// Fin del namespace
