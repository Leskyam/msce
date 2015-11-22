using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsMaestria.
	/// </summary>
	public class clsMaestria
	{
		/// <summary>
		/// Al crear un objeto del tipo maestría se cargarán en los campos de esta clase los 
		/// valores de los datos del único registro que deberá haber en la tabla tbl_maestria.
		/// </summary>
		public clsMaestria()
		{
            setFieldsValue();
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_IdProvincia;
		private System.UInt32 m_IdUsuarioDirector;
		private System.String m_Nombre;
		private System.String m_Hospedero;
		private System.String m_Fundamentos;
		private System.String m_RequisitosIngreso;
		private System.DateTime m_datFechaInicio;
		private System.DateTime m_datFechaFin;
		private System.Boolean m_MatriculaAbierta;
		private System.Byte m_IdModuloActual;
		/* Otras variables para los nombres de la provincia donde se imparte 
		 * la maestría y el del director de la misma, ya que estos datos se 
		 * almacenan por sus IDs en la tabla tbl_maestria.
		*/
	//	private System.String m_IdProvinciaNombre;
	//	private System.String m_UsuarioDirectorNombre;
	//	private System.String m_ModuloActualNombre;


		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"
        
		public System.Byte IdProvincia
		{
			get {return this.m_IdProvincia;}
			set {this.m_IdProvincia = value;}
		}
		
		public System.UInt32 IdUsuarioDirector
		{
			get {return this.m_IdUsuarioDirector;}
			set {this.m_IdUsuarioDirector = value;}
		}
		
		public System.String Nombre
		{ 
			get {return this.m_Nombre;}
			set {this.m_Nombre = value;}
		}

		public System.String Hospedero
		{ 
			get {return this.m_Hospedero;}
			set {this.m_Hospedero = value;}
		}

		public System.String Fundamentos
		{
			get {return this.m_Fundamentos;}
			set {this.m_Fundamentos = value;}
		}

		public System.String RequisitosIngreso
		{
			get {return this.m_RequisitosIngreso;}
			set {this.m_RequisitosIngreso = value;}
		}

		public System.DateTime datFechaInicio
		{
			get {return this.m_datFechaInicio;}
			set {this.m_datFechaInicio = value;}
		}

		public System.DateTime datFechaFin
		{
			get {return this.m_datFechaFin;}
			set {this.m_datFechaFin = value;}
		}

		public System.Boolean MatriculaAbierta
		{
			get {return this.m_MatriculaAbierta;}
			set {this.m_MatriculaAbierta = value;}
		}

		public System.Byte IdModuloActual
		{
			get {return this.m_IdModuloActual;}
			set {this.m_IdModuloActual = value;}
		}
		
		#endregion "*** FIN DE PROPIEDADES ***"
		
		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue()
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtMaestria = oDAL.getDataTable("SELECT * FROM tbl_maestria;");
			oDAL = null;
			if(dtMaestria.Rows.Count==1)
			{
				this.m_IdProvincia = System.Convert.ToByte(dtMaestria.Rows[0]["Id_Provincia"]);
				this.m_IdUsuarioDirector = System.Convert.ToUInt32(dtMaestria.Rows[0]["Id_UsuarioDirector"]);
				this.m_Nombre = System.Convert.ToString(dtMaestria.Rows[0]["Nombre"]);
				this.m_Hospedero = System.Convert.ToString(dtMaestria.Rows[0]["Hospedero"]);
				this.m_Fundamentos = System.Convert.ToString(clsUtiles.getFromBLOB(dtMaestria.Rows[0]["Fundamentos"]));
				this.m_RequisitosIngreso = System.Convert.ToString(clsUtiles.getFromBLOB(dtMaestria.Rows[0]["RequisitosIngreso"]));
				this.m_datFechaInicio = System.Convert.ToDateTime(dtMaestria.Rows[0]["datFechaInicio"]);
				this.m_datFechaFin = System.Convert.ToDateTime(dtMaestria.Rows[0]["datFechaFin"]);
				this.m_MatriculaAbierta = System.Convert.ToBoolean(dtMaestria.Rows[0]["MatriculaAbierta"]);
				this.m_IdModuloActual = System.Convert.ToByte(dtMaestria.Rows[0]["ModuloActual"]);
			}
			else
			{
				throw new System.Exception("Los datos de la tabla 'tbl_maestria' parecen haber sido alterados " + 
					"fuera de la aplicación, existe más de un registro en la misma o ninguno. " + 
					"Esta es una tabla de configuración que debería tener sólo los datos que " + 
					"correspondan con la maestría actual.");
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PUBLICOS ***"
		
		/// <summary>
		/// Actualiza la tabla "tbl_maestria" con los valores de las propiedades en el momento de ejecución de este.
		/// </summary>
		/// <returns></returns>
		public bool Actualizar()
		{
			clsDAL oDAL = new clsDAL();
			string strSQL = "UPDATE tbl_maestria SET Id_Provincia=" + this.m_IdProvincia + ", Id_UsuarioDirector=" + this.m_IdUsuarioDirector + ", " +
                "Nombre='" + this.m_Nombre + "', Hospedero='" + this.m_Hospedero + "', Fundamentos='" + this.m_Fundamentos + "', RequisitosIngreso='" + this.m_RequisitosIngreso + "', " + 
                "datFechaInicio='" + clsUtiles.getStringMySqlFormatedDate(this.m_datFechaInicio) + "', datFechaFin='" + clsUtiles.getStringMySqlFormatedDate(this.m_datFechaFin) + "', " + 
				"MatriculaAbierta=" + this.m_MatriculaAbierta + ", ModuloActual=" + this.m_IdModuloActual +";";
			System.Boolean boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PUBLICOS ***"
		
	}
}
