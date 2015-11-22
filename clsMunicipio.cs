using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsProvincia.
	/// </summary>
	public class clsMunicipio
	{
		/// <summary>
		/// Al crear un objeto del tipo provincia se cargarán en los campos de esta clase los 
		/// valores de los datos de la provincia para la que esté configurada la aplicación.
		/// </summary>
		public clsMunicipio()
		{
		}

		public clsMunicipio(System.Byte Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.Byte m_IdProvincia;
		private System.String m_Nombre;
		private System.String m_TableName = "tbl_municipio";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte Id
		{
			get {return this.m_Id;}
		}

		public System.Byte IdProvincia
		{
			get{return m_IdProvincia;}
		}

		public System.String Nombre
		{
			get {return this.m_Nombre;}
		}

		#endregion "*** FIN DE PROPIEDADES  ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.Byte Id)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtMunicipio;
			dtMunicipio = oDAL.getDataTable("SELECT * FROM " + this.m_TableName + " WHERE (Id = " + Id + ") AND (Id_Provincia = (SELECT Id_Provincia FROM tbl_maestria));");
			oDAL = null;

			if(dtMunicipio.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtMunicipio.Rows[0]["Id"]);
				this.m_IdProvincia = System.Convert.ToByte(dtMunicipio.Rows[0]["Id_Provincia"]);
				this.m_Nombre = System.Convert.ToString(dtMunicipio.Rows[0]["Nombre"]);
			}
			else
			{
				throw new System.Exception("Es probable que existan inconsistencias en una o varias " + 
					"de las siguientes tablas de la base de datos: tbl_maestria, tbl_provincia ó " +
					"tbl_municipio. Si es así es porque se han modificado los datos fuera de la " +
					"aplicación.");
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PUBLICOS ***"
		
		/// <summary>
		/// Devuelve el registro completo de la provincia cuyo Id se pase como valor del parámetro "Id"
		/// </summary>
		/// <param name="Id_Provincia"></param>
		/// <returns></returns>
		public System.Data.DataTable getById(System.Byte Id)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtMunicipio = oDAL.getDataTable("SELECT * FROM " + this.m_TableName + " WHERE Id=" + Id + ";");
			oDAL = null;
			return dtMunicipio;
		}

		/// <summary>
		/// Devuelve un DataTable con las columnas "Id" y "Nombre" de todas las provincias registradas.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getLista()
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtMunicipio = oDAL.getDataTable("SELECT Id, Nombre FROM " + this.m_TableName + " ORDER BY Nombre;");
			oDAL = null;
			return dtMunicipio;
		}

		public string getNombre(System.Byte Id)
		{
			clsDAL oDAL = new clsDAL();
			string strNombre = System.Convert.ToString(oDAL.getEscalarValue("SELECT Nombre FROM " + this.m_TableName + " WHERE Id=" + Id + ";"));
			oDAL = null;
			return strNombre;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PUBLICOS ***"
	}
}
