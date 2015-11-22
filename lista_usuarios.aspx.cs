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
	/// Descripción breve de ver_academicos.
	/// </summary>
	public partial class clswfListaUsuarios : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfListaUsuarios));

				clsUsuario.enuRolesName role = new ISPCFG.Msce.clsUsuario.enuRolesName();
				// Preestablecer valores para cuando no existe QueryString["role"]
				role = clsUsuario.enuRolesName.Academico;
				string roleName = "ACADÉMICOS";

				if(Page.Request.QueryString["role"]!=null)
				{
					switch(Page.Request.QueryString["role"].ToLower())
					{
						case "3": // Docentes
						case "docente":
						case "docentes":
						{
							role = clsUsuario.enuRolesName.Docente;
							roleName = "DOCENTES";
							break;
						}
						case "4": // Maestrantes
						case "maestrante":
						case "maestrantes":
						{
							role = clsUsuario.enuRolesName.Maestrante;
							roleName = "MAESTRANTES";
							break;
						}
					}
				}

				if(!Page.IsStartupScriptRegistered("ListarUsuarios"))
				{
					System.Text.StringBuilder sbScript = new System.Text.StringBuilder();
					sbScript.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
					sbScript.Append("var settings = {\"role\":'" + System.Convert.ToByte(role) + "', " + System.Environment.NewLine);
					sbScript.Append("\"roleName\":'" + roleName + "', \"currentPage\":1, \"recordsByPage\":0, \"cantPages\":0};" + System.Environment.NewLine);
					sbScript.Append("//--></script>" + System.Environment.NewLine);
					Page.RegisterStartupScript("ListarUsuarios", sbScript.ToString());
				}
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta página no estará disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
				return;
			}
		}

		#endregion "*** EVENTOS ***"

		#region "***  PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public DataView[] getListaUsuarios(clsUsuario.enuRolesName role, int intPage, int intRecordsByPage)
		{
			try
			{
				clsUsuario Usuario = new clsUsuario();
				clsUtiles Utiles = new clsUtiles();
				DataView[] dv = Utiles.getPagina(Usuario.getAllRecords(role), intPage, intRecordsByPage);
				Usuario = null;
				Utiles = null;
				return dv;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los usuarios.", Ex);
			}

		}

		#endregion "***  FIN DE LOS PROCEDIMIENTOS AJAX ***"


	} // Fin de la clase.

} // Fin del namespace.
