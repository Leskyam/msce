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
	/// Descripción breve de mi_maletin.
	/// </summary>
	public partial class clswfMiMaletin : System.Web.UI.Page
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

		}
		#endregion

		#region "*** EVENTOS ***"

		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(HttpContext.Current.Request.QueryString["downloadFile"]!=null)
			{
				try
				{
					string strFileName = HttpContext.Current.Request.QueryString["downloadFile"].ToString();
					clsMiMaletin MiMaletin = new clsMiMaletin(HttpContext.Current.User.Identity.Name);
					System.IO.FileInfo fInfo = MiMaletin.secureDownload(strFileName);
					// Write the stream to the byte array
					HttpContext.Current.Response.AddHeader("Content-disposition", "attachment; filename=" + strFileName);
					HttpContext.Current.Response.AddHeader("Content-Length", fInfo.Length.ToString());
					HttpContext.Current.Response.ContentType = "application/octet-stream";
					HttpContext.Current.Response.WriteFile(fInfo.FullName);
					HttpContext.Current.Response.End();
				}
				catch(System.Exception)
				{
					clsProcessError ProcessError = new clsProcessError();
					ProcessError.ShowPageErrorNotification(this.tr_Notify, this.sp_Notify, "No se puede descargar el fichero seleccionado.");
					ProcessError = null;
				}
			}

			try
			{
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfMiMaletin));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta página no estará disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}

			// Para cuando se suben ficheros.
			if(Request.Files.Count>0)
			{
				try
				{
					clsProcessError ProcessError = new clsProcessError();
					ProcessError.ClearPageErrorNotification(this.tr_Notify, this.sp_Notify);
					ProcessError = null;
					clsMiMaletin MiMaletin = new clsMiMaletin(HttpContext.Current.User.Identity.Name);
					MiMaletin.agregarFicheros(Request.Files);
          MiMaletin = null;
				}
				catch(System.Exception Ex)
				{
					clsProcessError ProcessError = new clsProcessError();
					ProcessError.ShowPageWarningNotification(this.tr_Notify, this.sp_Notify, string.Empty, Ex.Message);
					ProcessError = null;
				}
			}
		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public clsMiMaletin getMiMaletin()
		{
			clsMiMaletin MiMaletin = new clsMiMaletin(HttpContext.Current.User.Identity.Name);
			return MiMaletin;
		}

		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.String strFileName)
		{
			clsMiMaletin MiMaletin = new clsMiMaletin(HttpContext.Current.User.Identity.Name);
			return MiMaletin.EliminarFichero(strFileName);
		}

		[AjaxPro.AjaxMethod()]
		public bool Renombrar(System.String actualFileName, System.String newFileName)
		{
			clsMiMaletin MiMaletin = new clsMiMaletin(HttpContext.Current.User.Identity.Name);
			return MiMaletin.RenombrarFichero(actualFileName, newFileName);
		}

		[AjaxPro.AjaxMethod()]
		public bool existFile(System.String FileName)
		{
			clsMiMaletin MiMaletin = new clsMiMaletin(HttpContext.Current.User.Identity.Name);
			return MiMaletin.existFile(FileName);
		}
		
		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"


	} // Fin de la clase.

} // Fin del namespace.
