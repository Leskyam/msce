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
	/// Descripci�n breve de mencion.
	/// </summary>
	public partial class clswfTitulo_academico : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfTitulo_academico));
			}
			catch(System.Exception)
			{
				string strErrorMessage = "Alguna(s) de las funcionalidades en esta p�gina no estar� disponible.";
				clsProcessError ProcessError = new clsProcessError();
				ProcessError.ShowPageErrorNotification(this.tr_Notify,this.sp_Notify, strErrorMessage);
				ProcessError = null;
			}
		}

		#endregion "*** FIN DE EVENTOS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"
	
		[AjaxPro.AjaxMethod()]
		public clsTituloAcademico getTituloAcademicoClass()
		{
			try
			{
				clsTituloAcademico TituloAcademico = new clsTituloAcademico();
				return TituloAcademico;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los datos del t�tulo acad�mico.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllTitulosAcademicos()
		{
			try
			{
				clsTituloAcademico TituloAcademico = new clsTituloAcademico();
				DataView dvTitulosAcademicos = TituloAcademico.getAllRecords().DefaultView;
				TituloAcademico = null;
				return dvTitulosAcademicos;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los t�tulos acad�micos.", Ex);
			}

		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsTituloAcademico TituloAcademico)
		{
			try
			{
				return System.Convert.ToBoolean(TituloAcademico.Agregar());
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible agregar el t�tulo acad�mico.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsTituloAcademico TituloAcademico)
		{
			try
			{
				return TituloAcademico.Actualizar();
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible actualizar el t�tulo acad�mico.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.Byte Id)
		{
			try
			{
				clsTituloAcademico TituloAcademico = new clsTituloAcademico();
				bool boResult = TituloAcademico.Eliminar(Id);
				TituloAcademico = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible eliminar el t�tulo acad�mico.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.Byte Id)
		{
			try
			{
				clsTituloAcademico TituloAcademico = new clsTituloAcademico();
				bool boResult = TituloAcademico.canBeDeleted(Id);
				TituloAcademico = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminada el t�tulo acad�mico.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.Byte Id)
		{
			try
			{
				clsTituloAcademico TituloAcademico = new clsTituloAcademico();
				string[] aryResult = TituloAcademico.WhyCanNotBeDeleted(Id);
				TituloAcademico = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el t�tulo acad�mico.", Ex);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS AJAX ***"
	
	} // Fin de la clase.

} // Fin del namespace.
