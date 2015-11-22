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
	/// Descripci�n breve de ver_encuentros.
	/// </summary>
	public partial class clswfVerEncuentros : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfVerEncuentros));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta p�gina no estar� disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}

		}

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public DataView[] getEncuentros()
		{
      DataView[] dv = new DataView[2];
			clsMaestrante Maestrante = new clsMaestrante(HttpContext.Current.User.Identity.Name);
			clsEncuentro Encuentro = new clsEncuentro();
			DataTable dt; 
			dt = Encuentro.getPendientesByGrupo(Maestrante.IdGrupo);
			for(int i=0; i<=(dt.Rows.Count-1); i++)
			{
				dt.Rows[i]["Orientaciones"] = System.Convert.ToString(clsUtiles.getFromBLOB(dt.Rows[i]["Orientaciones"]));
			}
			dv[0] = dt.DefaultView;
			dt = Encuentro.getObsoletosByGrupo(Maestrante.IdGrupo, 3);
			for(int i=0; i<=(dt.Rows.Count-1); i++)
			{
				dt.Rows[i]["Orientaciones"] = System.Convert.ToString(clsUtiles.getFromBLOB(dt.Rows[i]["Orientaciones"]));
			}
			dv[1] = dt.DefaultView;
			Encuentro = null;
			Maestrante = null;
			return dv;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"



	}
}
