using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsProvincia.
	/// </summary>
	public class clsProvincia
	{
		/// <summary>
		/// Al crear un objeto del tipo provincia se cargarán en los campos de esta clase los 
		/// valores de los datos de la provincia para la que esté configurada la aplicación.
		/// </summary>
		public clsProvincia()
		{
			setFieldsValue(0);
		}

		public clsProvincia(System.Byte Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.String m_Nombre;
		private System.String m_Acronimo;
		
		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte Id
		{
			get {return m_Id;}
		}

		public System.String Nombre
		{
			get {return m_Nombre;}
		}

		public System.String Acronimo
		{
			get {return m_Acronimo;}
		}
		
		#endregion "*** FIN DE PROPIEDADES  ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.Byte Id)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtProvincia;
			if(Id==0)
			{
				dtProvincia = oDAL.getDataTable("SELECT * FROM tbl_provincia WHERE Id = (SELECT Id_Provincia FROM tbl_maestria);");
			}
			else
			{
				dtProvincia = oDAL.getDataTable("SELECT * FROM tbl_provincia WHERE Id = " + Id + ";");
			}
			oDAL = null;

			if(dtProvincia.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtProvincia.Rows[0]["Id"]);
				this.m_Nombre = System.Convert.ToString(dtProvincia.Rows[0]["Nombre"]);
				this.m_Acronimo = System.Convert.ToString(dtProvincia.Rows[0]["Acronimo"]);
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
		/// Devuelve el registro completo de la provincia cuyo Id se pase como valor del parámetro "Id"
		/// </summary>
		/// <param name="Id_Provincia"></param>
		/// <returns></returns>
		public System.Data.DataTable getById(System.Byte Id)
		{
			clsDAL oDAL = new clsDAL();
            DataTable dtProvincia = oDAL.getDataTable("SELECT * FROM tbl_provincia WHERE Id=" + Id + ";");
            oDAL = null;
			return dtProvincia;
		}

		/// <summary>
		/// Devuelve un DataTable con las columnas "Id" y "Nombre" de todas las provincias registradas.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getLista()
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtProvincia = oDAL.getDataTable("SELECT Id, Nombre FROM tbl_provincia ORDER BY Nombre;");
			oDAL = null;
			return dtProvincia;
		}

		public string getNombre(System.Byte Id)
		{
			clsDAL oDAL = new clsDAL();
			string strNombre = System.Convert.ToString(oDAL.getEscalarValue("SELECT Nombre FROM tbl_provincia WHERE Id=" + Id + ";"));
			oDAL = null;
			return strNombre;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PUBLICOS ***"
	}
}
