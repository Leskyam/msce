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
	/// Descripción breve de maestrante.
	/// </summary>
	public partial class clswfMaestrante : System.Web.UI.Page
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

		#region "*** EVENTOS ***"
		
		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfMaestrante));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta página no estará disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}
		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public clsMaestrante getMaestranteClass()
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				return Maestrante;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos de docentes.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllMaestrantes()
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				DataView dvMaestrantes = Maestrante.getExtendedLista().DefaultView;
				dvMaestrantes.RowFilter="Id_AcademicoAutoriza<>0";
				Maestrante = null;
				return dvMaestrantes;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los docentes.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public clsMaestrante getMaestrante(System.UInt32 Id)
		{
			clsMaestrante Maestrante = new clsMaestrante(Id);
			Maestrante.UserPass = string.Empty; // Limpiar la contraseña antes de entregar al cliente.
			return Maestrante;
		}

		[AjaxPro.AjaxMethod()]
		public clsMaestrante.struMaestrante getStructMaestrante()
		{
			clsMaestrante.struMaestrante Maestrante = new clsMaestrante.struMaestrante();
			return Maestrante;
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
		public bool[] Agregar(clsMaestrante.struMaestrante MaestranteData)
		{
			try
			{
				bool boSendMail = MaestranteData.email!=string.Empty;
				bool[] boResult = new bool[2];
				clsMaestrante Maestrante = new clsMaestrante();
				// Procesar el password si viene vacío.
				MaestranteData.UserPass=MaestranteData.UserPass==string.Empty?Maestrante.generatePassword(MaestranteData.Nombre):MaestranteData.UserPass;
				// Poner el Id del académico que lo registra.
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				MaestranteData.IdAcademicoAutoriza = Usuario.Id;
				Maestrante.getDataFromStruct(MaestranteData);
				boResult[0] = Maestrante.Agregar();
				if(boResult[0] & boSendMail){boResult[1] = Maestrante.sendWelcomeMail();}
				Maestrante = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se insertaron los datos del nuevo docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsMaestrante.struMaestrante MaestranteData)
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				// Poner el Id del académico que lo registra.
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				MaestranteData.IdAcademicoAutoriza = Usuario.Id;
				Maestrante.getDataFromStruct(MaestranteData);
				bool boResult = Maestrante.Actualizar();
				Maestrante = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se actualizaron los datos del docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.UInt32 Id)
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				bool boResult = Maestrante.Eliminar(Id);
				Maestrante = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se actualizaron los datos del docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.UInt32 Id)
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				bool boResult = Maestrante.canBeDeleted(Id);
				Maestrante = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible comprobar si se admite eliminar el registro del docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.UInt32 Id)
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				string[] aryResult = Maestrante.WhyCanNotBeDeleted(Id);
				Maestrante = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el regsitro de este docente.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string getNewUserId(string Nombre, string Apellidos)
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				string UserId = Maestrante.generateUserId(Nombre, Apellidos);
				Maestrante = null;
				return UserId;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible obtener el nuevo 'UserId'.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool existUserId(System.UInt32 Id, string UserId)
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				bool boResult = false;
				if(Id==0)
				{
					boResult = Maestrante.existUserId(UserId);
				}
				else
				{
					boResult = Maestrante.existUserId(Id, UserId);
				}
				Maestrante = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible comprobar si existe el 'UserId'.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool existNoCI(System.UInt32 Id, string NoCI)
		{
			try
			{
				clsMaestrante Maestrante = new clsMaestrante();
				bool boResult = false;
				if(Id==0)
				{
					boResult = Maestrante.existNoCI(NoCI);
				}
				else
				{
					boResult = Maestrante.existNoCI(Id, NoCI);
				}
				Maestrante = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible comprobar si existe el 'NoCI'.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	} // Fin de la clase.

} // Fin del namespace.
