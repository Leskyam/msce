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
	/// Descripción breve de tema_proyecto.
	/// </summary>
	public partial class clswfTema_proyecto : System.Web.UI.Page
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
				AjaxPro.Utility.RegisterTypeForAjax(typeof(clswfTema_proyecto));
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

		#region "*** ESTRUCTURAS ***"

		public struct struMencion
		{
			public System.Byte Id;
			public System.String Nombre;
			public System.Boolean Selected;
		}
		
		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROCEDIMIENTOS AJAX ***"

		[AjaxPro.AjaxMethod()]
		public clsTemaProyecto getTemaProyectoClass(System.Byte cantMenciones)
		{
			try
			{
				clsTemaProyecto TemaProyecto = new clsTemaProyecto();
				clsTemaProyecto.struMencion[] Menciones = new clsTemaProyecto.struMencion[cantMenciones];
				TemaProyecto.Menciones = Menciones;
				return TemaProyecto;
			}
			catch(System.Exception Ex)
			{
				string strErrorMessage = "Error al devolver la clase para los temas de proyecto.";
				throw new System.Exception(strErrorMessage, Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public DataView getAllTemasProyecto()
		{
			try
			{
			    clsTemaProyecto	TemaProyecto = new clsTemaProyecto();
				DataTable dtTemasProyecto = new DataTable();
				dtTemasProyecto = TemaProyecto.getAllRecords();
				DataView dvTemasProyecto = dtTemasProyecto.DefaultView;
				dtTemasProyecto = null;
				TemaProyecto = null;
				return dvTemasProyecto;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Imposible recuperar la lista de los temas de proyecto registrados.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Agregar(clsTemaProyecto TemaProyecto)
		{
			try
			{
				return System.Convert.ToBoolean(TemaProyecto.Agregar());
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al agregar tema de proyecto.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public bool Actualizar(clsTemaProyecto TemaProyecto)
		{
			try
			{
				return TemaProyecto.Actualizar();
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al actualizar datos del tema de proyecto.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool Eliminar(System.Byte Id)
		{
			try
			{
				clsTemaProyecto TemaProyecto = new clsTemaProyecto();
				bool boResult = TemaProyecto.Eliminar(Id);
				TemaProyecto = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al eliminar tema de proyecto.", Ex);
			}
		}
		
		[AjaxPro.AjaxMethod()]
		public bool canBeDeleted(System.Byte Id)
		{
			try
			{
				clsTemaProyecto TemaProyecto = new clsTemaProyecto();
				bool boResult = TemaProyecto.canBeDeleted(Id);
				TemaProyecto = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al comprobar si puede ser eliminado el tema de proyecto.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public string[] WhyCanNotBeDeleted(System.Byte Id)
		{
			try
			{
				clsTemaProyecto TemaProyecto = new clsTemaProyecto();
				string[] aryResult = TemaProyecto.WhyCanNotBeDeleted(Id);
				TemaProyecto = null;
				return aryResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al recuperar la(s) causa que impide eliminar el tema de proyecto.", Ex);
			}
		}

		[AjaxPro.AjaxMethod()]
		public System.String getSctringMenciones(System.Byte Id)
		{
			clsTemaProyecto TemaProyecto = new clsTemaProyecto();
			clsTemaProyecto.struMencion[] Menciones = TemaProyecto.getMenciones(Id);
			TemaProyecto = null;
			string strMenciones = string.Empty;
			for(int x=0; x<=(Menciones.Length-1); x++)
			{
				if(strMenciones!=string.Empty){strMenciones+=x<(Menciones.Length-1)?", ": " y ";}
				strMenciones += Menciones[x].Nombre;
			}
			return strMenciones;
		}

		[AjaxPro.AjaxMethod()]
		public struMencion[] getMencionesForEdit(System.Byte Id)
		{
			clsMencion Mencion = new clsMencion();
			DataTable dtMenciones = Mencion.getLista();
			Mencion = null;
			clsTemaProyecto TemaProyecto = new clsTemaProyecto();
			clsTemaProyecto.struMencion[] MisMenciones = TemaProyecto.getMenciones(Id);
			TemaProyecto = null;
			struMencion[] result = new struMencion[dtMenciones.Rows.Count];
			for(int x=0; x<=(dtMenciones.Rows.Count-1); x++)
			{
				result[x].Id = System.Convert.ToByte(dtMenciones.Rows[x]["Id"]);
				result[x].Nombre = System.Convert.ToString(dtMenciones.Rows[x]["Nombre"]);
				for(int y=0; y<=(MisMenciones.Length-1); y++)
				{
					if(System.Convert.ToByte(dtMenciones.Rows[x]["Id"])==MisMenciones[y].Id)
					{
						result[x].Selected = true;
						break;
					}
				}
			}
			return result;
		}

		[AjaxPro.AjaxMethod()]
		public struMencion[] getMencionesForNuevo()
		{
			clsMencion Mencion = new clsMencion();
			DataTable dtMenciones = Mencion.getLista();
			Mencion = null;
			struMencion[] result = new struMencion[dtMenciones.Rows.Count];
			for(int x=0; x<=(dtMenciones.Rows.Count-1); x++)
			{
				result[x].Id = System.Convert.ToByte(dtMenciones.Rows[x]["Id"]);
				result[x].Nombre = System.Convert.ToString(dtMenciones.Rows[x]["Nombre"]);
				result[x].Selected = true;
			}
			return result;
		}
		
		#endregion "*** FIN DE LOS PROCEDIMIENTOS AJAX ***"

	} // Fin de la clase.

} // Fin del namespace.
