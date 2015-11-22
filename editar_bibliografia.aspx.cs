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
	/// Descripci�n breve de bibliografia.
	/// </summary>
	public partial class clswfEditarBibliografia : System.Web.UI.Page
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

		#region "*** EVENTOS ***"

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try
			{
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfEditarBibliografia));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta p�gina no estar� disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}

			if(Request.Files.Count>0)
			{
				for(int i=0; i<=(Request.Files.Count-1); i++)
				{
          System.Diagnostics.Debug.WriteLine("FileName: " + Request.Files[i].FileName + " ContentType: " + Request.Files[i].ContentType + " ContentLength: " + Request.Files[i].ContentLength);
				}
			}
		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public DataView getListaCursos()
		{
			try
			{
				clsCurso Curso = new clsCurso();
				DataView dv = Curso.getExtendedLista().DefaultView;
				Curso = null;
				return dv;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los cursos registrados.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getListaTemas(System.Byte IdCurso)
		{
			clsTema Tema = new clsTema();
			DataView dv = Tema.getLista().DefaultView;
      dv.RowFilter = "Id_Curso=" + IdCurso;
			Tema = null;
			return dv;
		}

		#endregion ""

	} // Fin de la clase.

} // Fin delnamespace.
