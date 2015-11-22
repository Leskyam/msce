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
	/// Descripci�n breve de lesta_sedes.
	/// </summary>
	public partial class clswfListaSedes : System.Web.UI.Page
	{
	
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
		/// M�todo necesario para admitir el Dise�ador. No se puede modificar
		/// el contenido del m�todo con el editor de c�digo.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Unload += new System.EventHandler(clsUtiles.Page_RegisterCopyright);
		}
		#endregion

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfListaSedes));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta p�gina no estar� disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify, this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}
		}

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public DataView getAllRecords()
		{
			clsSede Sede = new clsSede();
			DataView dvSedes = Sede.getAllRecordsForReport().DefaultView;
			Sede = null;
			return dvSedes;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"



	} // Fin de la clase.

} // Fin del namespace.
