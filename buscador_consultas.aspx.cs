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
	/// Descripción breve de buscador_consultas.
	/// </summary>
	public partial class clswfBuscadorConsultas : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfBuscadorConsultas));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta página no estará disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}

			if(!Page.IsStartupScriptRegistered("SearchSettings"))
			{
				clsUsuario Usuario = new clsUsuario(HttpContext.Current.User.Identity.Name);
				System.Text.StringBuilder sbSearchSettings = new System.Text.StringBuilder();
				sbSearchSettings.Append("<script language='JavaScript'><!--" + System.Environment.NewLine);
				sbSearchSettings.Append("var settings = {\"role\": '" + Usuario.RolePrincipal + "', " + System.Environment.NewLine);
				sbSearchSettings.Append("\"tema\":'!=0', " + System.Environment.NewLine);
				sbSearchSettings.Append("\"respondidaPor\": '!=0', " + System.Environment.NewLine);
				sbSearchSettings.Append("\"soloMisConsultas\": '!=0', " + System.Environment.NewLine);
				sbSearchSettings.Append("\"cadena\": '%', " + System.Environment.NewLine);
				sbSearchSettings.Append("\"currentPage\":1, " + System.Environment.NewLine);
				sbSearchSettings.Append("\"recordsByPage\":5, " + System.Environment.NewLine);
				sbSearchSettings.Append("\"cantPages\":0, " + System.Environment.NewLine);
				sbSearchSettings.Append("\"begTime\":0, " + System.Environment.NewLine);
				sbSearchSettings.Append("\"endTime\":0, " + System.Environment.NewLine);
				sbSearchSettings.Append("\"searchMode\":'Simple'};" + System.Environment.NewLine);
				sbSearchSettings.Append("//--></script>" + System.Environment.NewLine);
				Usuario = null;
				Page.RegisterStartupScript("SearchSettings", sbSearchSettings.ToString());
                sbSearchSettings = null;
			}
		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public DataView[] getListas()
		{
			DataView[] dv = new DataView[2]; 
			clsTema Tema = new clsTema();
			dv[0] = Tema.getListaForConsultasRespondidas().DefaultView;
			Tema = null;
			clsDocente Docente = new clsDocente();
			dv[1] = Docente.getListaConConsultasRespondidas().DefaultView;
			Docente = null;
			return dv;
		}

		[AjaxPro.AjaxMethod()]
		public bool existenRespuestas()
		{
			clsConsultaRespuesta Respuesta = new clsConsultaRespuesta();
			bool boResult = Respuesta.getCantRespuestas()>0?true:false;
			return boResult;
		}

		[AjaxPro.AjaxMethod()]
		public DataView[] Buscar(string paramTema, string paramRespondidaPor,  bool paramSoloMisConsultas, string strToSearch, int intPage, int intRecordsByPage)
		{
			try
			{
				strToSearch = (strToSearch==string.Empty)?"%":"%" + strToSearch + "%";
				paramTema = (paramTema==string.Empty)?"!=0":paramTema;
				paramRespondidaPor = (paramRespondidaPor==string.Empty)?"!=0":paramRespondidaPor;
				string IdUsuarioMaestrante = "!=0"; 
				clsUsuario thisUser = new clsUsuario(HttpContext.Current.User.Identity.Name);
				if(paramSoloMisConsultas & thisUser.RolePrincipal==System.Convert.ToString(clsUsuario.enuRolesName.Maestrante))
				{
                    IdUsuarioMaestrante = "=" + System.Convert.ToString(thisUser.Id);
				}
				thisUser = null;
				clsConsulta Consulta = new clsConsulta();
				DataTable dt = Consulta.Buscar(paramTema, paramRespondidaPor, IdUsuarioMaestrante, strToSearch);
				clsUtiles Utiles = new clsUtiles();
				DataView[] dv = Utiles.getPagina(dt, intPage, intRecordsByPage);
				Utiles = null;
				return dv;
			}
			catch(System.Exception Ex)
			{
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				throw new System.Exception("Error al realizar la búsqueda de las consultas");
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"

	}	// Fin de la clase.

}	// Fin del namespace.
