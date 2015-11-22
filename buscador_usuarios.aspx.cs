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
	/// Descripción breve de buscador_usuarios.
	/// </summary>
	public partial class clswfBuscadorUsuarios : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfBuscadorUsuarios));
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
		public DataView[] Buscar(string strToSearch, int intPage, int intRecordsByPage)
		{
			try
			{
				strToSearch = (strToSearch==string.Empty)?"%":"%" + strToSearch + "%";
				System.UInt32 Id = 0; 
				if(HttpContext.Current.User.Identity.IsAuthenticated)
				{
					clsUsuario thisUser = new clsUsuario(HttpContext.Current.User.Identity.Name);
					Id = thisUser.Id;
					thisUser = null;
				}
				clsUsuario Usuario = new clsUsuario();
				DataTable dt = Usuario.buscarByTexto(strToSearch, strToSearch, strToSearch, strToSearch);
				clsUtiles Utiles = new clsUtiles();
				DataView[] dv = Utiles.getPagina(dt, intPage, intRecordsByPage);
				dv[1].RowFilter = "Id<>" + Id;
				Usuario = null;
				Utiles = null;
				return dv;
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				throw new System.Exception("Error al realizar la búsqueda de los usuarios");
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	}	// Fin de la clase.

} // Fin del namespace.
