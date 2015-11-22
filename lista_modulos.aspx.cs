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
	/// Descripci�n breve de lista_modulo.
	/// </summary>
	public partial class clswfListaModulos : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfListaModulos));
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
            clsModulo Modulo = new clsModulo();
			DataTable dtModulos = new DataTable();
			dtModulos = Modulo.getAllRecords();
			for(int i=0; i<=(dtModulos.Rows.Count-1); i++)
			{
				dtModulos.Rows[i]["Objetivos"] = clsUtiles.getFromBLOB(dtModulos.Rows[i]["Objetivos"]).ToString();
			}
			DataView dvModulos = dtModulos.DefaultView;
            dtModulos = null;
			Modulo = null;
			return dvModulos;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"



	} // Fin de la clase.

} // Fin del namespace.
