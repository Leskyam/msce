using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de profile.
	/// </summary>
	public partial class clswfPerfil : System.Web.UI.Page
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
		/// Método necesario para admitir el Diseñador. No se puede modificar
		/// el contenido del método con el editor de código.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Unload += new System.EventHandler(clsUtiles.Page_RegisterCopyright);
		}
		#endregion

		#region "*** VARIABLES PRIVADAS ***"

		private struSettings settings = new struSettings();

		#endregion "*** ***"

		#region "*** ESTRUCTURAS ***"

		private struct struSettings
		{
			public System.UInt32 perfilId; // Id del perfil que se está solicitando.
			public string perfilRoles; // Roles a los que pertenece el usuario propietario del perfil que se está solicitando.
			public string userRoles; // Roles del usuario que está solicitando ver el perfil.
			public bool esMiPerfil; // Indicador para saber si está viendo su propio perfil.
		}

		public struct struUpdateData
		{
			public string Nombre; 
			public string Apellidos;
			public System.Char Sexo;
			public string email; 
			public string UserId;
			public string UserPass;
			public string CentroTrabajo;
			public string Funcion;
			public System.Byte CuentaBloqueada;		// Se declara Byte porque AjaxPro no entiende Boolean.
			public System.Byte PerfilPublico;		// Se declara Byte porque AjaxPro no entiende Boolean.
			public string FuncionAcademico;
			public string FacultadDepartamento;
			public System.Byte IdCategoriaDocente;
			public System.Byte IdTituloAcademico;
		}

		#endregion 
		
		#region "*** EVENTOS ***"

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfPerfil));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta página no estará disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}


			settings.perfilId = 0;
			settings.esMiPerfil = false;

			if(!Page.IsStartupScriptRegistered("perfilSettings"))
			{
				// NEW
				// Existe el valor Id en el QueryString
				if(HttpContext.Current.Request.QueryString["Id"]!=null)
				{
					try
					{
            // Comprobar si es un UInt32 y si existe el Id en la base de datos.
						clsUsuario UsuarioById = new clsUsuario(System.Convert.ToUInt32(HttpContext.Current.Request.QueryString["Id"]));
						if(UsuarioById.Id>0)
						{
							settings.perfilId = UsuarioById.Id;
							settings.perfilRoles = UsuarioById.Roles.ToString();
						}
						UsuarioById = null;
					}
					catch(System.Exception)
					{
						clsUsuario UsuarioByUserId = new clsUsuario(HttpContext.Current.Request.QueryString["Id"].ToString());
						if(UsuarioByUserId.Id>0)
						{
							settings.perfilId = UsuarioByUserId.Id;
							//settings.perfilRoles = UsuarioByUserId.Roles.ToString();
						}
						UsuarioByUserId = null;
					}
				}
				else // Si no existe el Id en el QueryString
				{
					// Si está identificado recuperar el Id propio.
					if(HttpContext.Current.User.Identity.IsAuthenticated)
					{
						clsUsuario UsuarioActual = new clsUsuario(HttpContext.Current.User.Identity.Name);
						settings.perfilId = UsuarioActual.Id;
						UsuarioActual = null;
					}
				}
				// En este punto tenemos un valor Id válido del perfil del usuario que se está solicitando si 
				// corresponde ó cero (0), lo que indicaría que el usuario solicitando la página no está 
				// identificado y no utilizó un Id en el QueryString ó el utilizado no es válido.
				
				// Comprobar que el Id del perfil no es cero antes de ver si es el del propio usuario.
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				if(settings.perfilId>0)
				{
					settings.esMiPerfil = settings.perfilId==Usuario.Id;
					settings.perfilRoles = Usuario.Roles.ToString();
				}
				settings.userRoles = Usuario.Roles.ToString();
				Usuario = null;

				System.Text.StringBuilder sbScript = new System.Text.StringBuilder();
				sbScript.Append("<script language='JavaScript'><!-- " + System.Environment.NewLine);
				sbScript.Append("var settings = {\"perfilId\": " + settings.perfilId + ", " + System.Environment.NewLine);
				sbScript.Append("\"perfilRoles\": '" + settings.perfilRoles + "', " + System.Environment.NewLine);
				sbScript.Append("\"userRoles\": '" + settings.userRoles + "', " + System.Environment.NewLine);
				sbScript.Append("\"esMiPerfil\": " + System.Convert.ToByte(settings.esMiPerfil) + "}; " + System.Environment.NewLine);
				sbScript.Append("//--></script>" + System.Environment.NewLine);
				System.Diagnostics.Debug.WriteLine(sbScript.ToString());
				Page.RegisterStartupScript("perfilSettings", sbScript.ToString());
				sbScript = null;
			}
		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public object[] getPerfilData(System.UInt32 Id)
		{
			DataView[] dv = new DataView[4];
			// Datos generales
			clsUsuario Usuario = new clsUsuario();
			dv[0] = Usuario.getById(Id).DefaultView;
			dv[0].RowFilter = "PerfilPublico=1";
			// Si el usuario solicitando el perfil es el propietario del mismo, entonces liberar el filtro.
			if(HttpContext.Current.User.Identity.IsAuthenticated)
			{
        clsUsuario UsuarioActual = new clsUsuario(HttpContext.Current.User.Identity.Name);
				if(UsuarioActual.Id==Id){dv[0].RowFilter=string.Empty;}
				UsuarioActual = null;
			}
			Usuario = null;
			// Datos como académico
			clsAcademico Academico = new clsAcademico();
			dv[1] = Academico.getById(Id).DefaultView;
			Academico = null;
			// Datos como docente
			clsDocente Docente = new clsDocente();
			dv[2] = Docente.getById(Id).DefaultView;
			Docente = null;
			// Datos como maestrante
			clsMaestrante Maestrante = new clsMaestrante();
			dv[3] = Maestrante.getById(Id).DefaultView;
			Maestrante = null;

			return dv;

		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaCategoriasDocentes()
		{
			try
			{
				clsCategoriaDocente Categoria = new clsCategoriaDocente();
				DataView dvCategorias = Categoria.getLista().DefaultView;
				Categoria = null;
				return dvCategorias;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de las categorías docentes.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaTitulosAcademicos()
		{
			try
			{
				clsTituloAcademico Titulo = new clsTituloAcademico();
				DataView dvTitulos = Titulo.getLista().DefaultView;
				Titulo = null;
				return dvTitulos;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los títulos académcios.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaGrupos()
		{
			try
			{
				clsGrupo Grupo = new clsGrupo();
				DataView dvGrupos = Grupo.getExtendedLista().DefaultView;
				Grupo = null;
				return dvGrupos;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los grupos.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string getNewUserId(string Nombre, string Apellidos)
		{
			try
			{
				clsUsuario Usuario = new clsUsuario();
				string UserId = Usuario.generateUserId(Nombre, Apellidos);
				Usuario = null;
				return UserId;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible autogenerar el nuevo 'Id de usuario'.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool existUserId(System.UInt32 Id, string UserId)
		{
			try
			{
				clsUsuario Usuario = new clsUsuario();
				bool boResult = false;
				if(Id==0)
				{
					boResult = Usuario.existUserId(UserId);
				}
				else
				{
					boResult = Usuario.existUserId(Id, UserId);
				}
				Usuario = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible comprobar si existe el 'UserId'.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public clswfPerfil.struUpdateData getStructData()
		{
			clswfPerfil.struUpdateData updateData = new clswfPerfil.struUpdateData();
			return updateData;
		}

		[AjaxPro.AjaxMethod()]
		public bool[] Actualizar(struUpdateData updateData)
		{
			try
			{
				bool[] boResult = new bool[2];
				boResult[0] = false;
				boResult[1] = false;
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				if((Usuario.UserId!=updateData.UserId)||(System.Convert.ToBoolean(updateData.CuentaBloqueada)==true)){boResult[1]=true;}
				Usuario.email = updateData.email;
				Usuario.UserId = updateData.UserId;
				// Si updateData.UserPass = string.Empty, la contraseña se mantiene.
				Usuario.UserPass = updateData.UserPass;
				Usuario.CentroTrabajo = updateData.CentroTrabajo;
				Usuario.Funcion = updateData.Funcion;
				Usuario.CuentaBloqueada = System.Convert.ToBoolean(updateData.CuentaBloqueada);
				Usuario.PerfilPublico = System.Convert.ToBoolean(updateData.PerfilPublico);
				// Actualizar datos generales.
				Usuario.Actualizar();

				if(Usuario.IsInRole(clsUsuario.enuRolesName.Academico))
				{
					clsAcademico Academico = new clsAcademico(Usuario.Id);
					if((!Academico.IsInRole(clsUsuario.enuRolesName.Docente)) & (updateData.FacultadDepartamento!=null))
					{
						Academico.registrarComoDocente(updateData.IdCategoriaDocente, updateData.IdTituloAcademico, updateData.FacultadDepartamento);
					}
					Academico.Nombre = updateData.Nombre;
					Academico.Apellidos = updateData.Apellidos;
					Academico.Sexo = updateData.Sexo;
					Academico.FuncionAcademico = updateData.FuncionAcademico;
					// Si updateData.UserPass = string.Empty, la contraseña se mantiene.
					Academico.UserPass = updateData.UserPass;
					Academico.Actualizar();
					Academico = null;
				}
				if(Usuario.IsInRole(clsUsuario.enuRolesName.Docente))
				{
					clsDocente Docente = new clsDocente(Usuario.Id);
					Docente.FacultadDepartamento = updateData.FacultadDepartamento;
					Docente.IdCategoriaDocente = updateData.IdCategoriaDocente;
					Docente.IdTituloAcademico = updateData.IdTituloAcademico;
					// Si updateData.UserPass = string.Empty, la contraseña se mantiene.
					Docente.UserPass = updateData.UserPass;
					Docente.Actualizar();
					Docente = null;
				}
				Usuario = null;
				boResult[0] = true;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				throw new System.Exception("Error al actualizar los datos de su perfil.");
			}
		}

		[AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.ReadWrite)]
		public string ForceToCloseSession()
		{
			return forceToSignOut();
		}

		private string forceToSignOut()
		{
			try
			{
				string strAppPath = string.Empty;
				System.Web.Security.FormsAuthentication.SignOut();
				if(HttpContext.Current.Session!=null)
				{
					HttpContext.Current.Session.Abandon();
					strAppPath = HttpContext.Current.Request.ApplicationPath;
				}
				clsUsuario Usuario = new clsUsuario();
				Usuario.DeleteFronConnectedList(HttpContext.Current.User.Identity.Name);
				Usuario = null;
				
				return strAppPath;

			}
			
			catch(System.Exception)
			{
				//System.Diagnostics.Debug.WriteLine(Ex.ToString());
				return string.Empty;
			}
		}
		
		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"

	} // Fin de la clase

}	// Fin del namespace
