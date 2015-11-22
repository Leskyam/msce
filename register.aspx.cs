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
	/// Descripción breve de register.
	/// </summary>
	public partial class clswfRegister : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfRegister));
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
		public clsMaestrante.struMaestrante getStructMaestrante()
		{
			clsMaestrante.struMaestrante Maestrante = new clsMaestrante.struMaestrante();
			return Maestrante;
		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsMaestrante.struMaestrante MaestranteData)
		{
			try
			{
				bool boResult = false;
				clsMaestrante Maestrante = new clsMaestrante();
				// Poner el Id del académico que lo registra, o sea, ninguno, porque esto es un autoregistro.
				MaestranteData.IdAcademicoAutoriza = 0;
				Maestrante.getDataFromStruct(MaestranteData);
				boResult = Maestrante.Agregar();
				Maestrante = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("No se insertaron los datos del nuevo docente.", Ex);
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

	}	// Fin de la clase.
}	// Fin del namespace.
