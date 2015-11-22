using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsCede.
	/// </summary>
	public class clsSede
	{
		public clsSede()
		{
		}

		public clsSede(System.Byte Id)
		{
			this.setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.Byte m_IdMunicipio;
		private System.String m_Nombre;
		private System.String m_TableName = "tbl_sede";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte Id
		{
			get{return this.m_Id;}
			set{this.m_Id = value;}
		}
		
		public System.Byte IdMunicipio
		{
			get{return this.m_IdMunicipio;}
			set{this.m_IdMunicipio = value;}
		}
		
		public System.String Nombre
		{
			get{return this.m_Nombre;}
			set{this.m_Nombre = value;}
		}

		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.Byte Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE " + this.m_TableName + ".Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dtSede = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtSede.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtSede.Rows[0]["Id"]);
				this.m_IdMunicipio = System.Convert.ToByte(dtSede.Rows[0]["Id_Municipio"]);
				this.m_Nombre = System.Convert.ToString(dtSede.Rows[0]["Nombre"]);
			}
		}
		
		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve un DataTable con los registros de todas las menciones y los 
		/// campos: Id, Nombre.
		/// </summary>
		/// <returns></returns>
		public DataTable getLista()
		{
			string strSQL = "SELECT Id, Nombre FROM " + this.m_TableName + " ORDER BY Id_Municipio, Nombre;";
			clsDAL oDAL = new clsDAL();
			DataTable dtSede = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtSede;
		}

		public System.Byte Agregar()
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, " + this.IdMunicipio + ", '" + this.m_Nombre + "');";
			
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				oDAL.ExecCommand(strSQL);
				System.Byte intIdentity = System.Convert.ToByte(oDAL.getLastIDENTITY(this.m_TableName));
				oDAL.CommitTrans();
				oDAL = null;
				return intIdentity;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al insertar sede.", Ex);
			}
		}

		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET Id_Municipio=" + this.m_IdMunicipio + ", Nombre='" + this.m_Nombre + "' WHERE Id=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			try
			{
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al actualizar sede.", Ex);
			}
		}

		public bool Eliminar()
		{
			if(this.m_Id==0){return false;}
			bool boResult = false;
			// Comprobar siempre si se puede eliminar antes de hacerlo, a pesar de que este método
			// es público, ya que al escribir el código se nos puede olvidar comprobar esto y MySQL
			// no admite chequeos de integridad, al menos en la 4.1.7.
			if(this.canBeDeleted(this.m_Id))
			{
				string strSQL = "DELETE FROM " + this.m_TableName + " WHERE Id=" + this.m_Id + ";";
				clsDAL oDAL = new clsDAL();
				boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL = null;
			}
			return boResult;
		}

		public bool Eliminar(System.Byte Id)
		{
			if(Id==0){return false;}
			bool boResult = false;
			// Comprobar siempre si se puede eliminar antes de hacerlo, a pesar de que este método
			// es público, ya que al escribir el código se nos puede olvidar comprobar esto y MySQL
			// no admite chequeos de integridad, al menos en la 4.1.7.
			if(this.canBeDeleted(Id))
			{
				string strSQL = "DELETE FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
				clsDAL oDAL = new clsDAL();
				boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL = null;
			}

			return boResult;
		}

		public bool canBeDeleted(System.Byte Id)
		{
			bool boResult = true;
			string strSQL = "SELECT DISTINCT " +
                "CASE WHEN tbl_grupo.Id_Sede=tbl_sede.Id THEN true ELSE false END AS Grupo " +
                "FROM tbl_sede " +
				"LEFT JOIN tbl_grupo ON tbl_sede.Id = tbl_grupo.Id_Sede " +
                "WHERE tbl_sede.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtSede = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtSede.Rows.Count==0){return false;}

			for(int x=0; x<=(dtSede.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtSede.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.Byte Id)
		{
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_grupo.Id_Sede=tbl_sede.Id THEN true ELSE false END AS Grupo " +
				"FROM tbl_sede " +
				"LEFT JOIN tbl_grupo ON tbl_sede.Id = tbl_grupo.Id_Sede " +
				"WHERE tbl_sede.Id=" + Id + ";";
				
			clsDAL oDAL = new clsDAL();
			DataTable dtSede = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtSede.Rows.Count==0){return ("La sede ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtSede.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtSede.Rows[0][x]))
				{
					switch(dtSede.Columns[x].ColumnName)
					{
						case "Grupo":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrado, al menos, un 'Grupo' que pertenece a la misma."); 
							break;
						}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " ORDER BY Id_Municipio, Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtSede = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtSede;
		}

		public DataTable getAllRecords(System.Byte IdMunicipio)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id_Municipio=" + IdMunicipio + " ORDER BY Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtSede = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtSede;
		}

		/// <summary>
		/// Devuelve todos los registros de la tabla tbl_sede además del nombre de la provincia, 
		/// de la siguiente manera: Id, Nombre, NombreMunicipio.
		/// </summary>
		/// <returns></returns>
		public DataTable getAllRecordsForReport()
		{
			string strSQL = "SELECT " + this.m_TableName + ".Id, " + this.m_TableName + ".Nombre, tbl_municipio.Nombre AS Municipio " +
                "FROM " + this.m_TableName + " " + 
                "INNER JOIN tbl_municipio ON " + this.m_TableName + ".Id_Municipio=tbl_municipio.Id " + 
				"ORDER BY Municipio;";
			clsDAL oDAL = new clsDAL();
			DataTable dtSede = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtSede;
		}

		/// <summary>
		/// Devuelve todos los registros de la tabla tbl_sede además del nombre de la provincia, 
		/// de la siguiente manera: Id, IdMunicipio, Provincia, Nombre.
		/// </summary>
		/// <returns></returns>
		public DataTable getAllRecordsForEdit()
		{
			string strSQL = "SELECT tbl_sede.Id, tbl_sede.Id_Municipio AS IdMunicipio, tbl_municipio.Nombre AS Municipio, tbl_sede.Nombre " +
				"FROM tbl_sede " +
                "INNER JOIN tbl_municipio ON tbl_sede.Id_Municipio = tbl_municipio.Id " +
				"WHERE tbl_municipio.Id_Provincia IN (SELECT Id_Provincia FROM tbl_maestria) " +
                "ORDER BY tbl_municipio.Nombre, tbl_sede.Nombre;";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtSede = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtSede;
		}

		/// <summary>
		/// Devuelve la cantidad de registros de esta entidad que estén en la base de datos.
		/// </summary>
		/// <returns></returns>
		public System.Byte getCantidad()
		{
			clsDAL oDAL = new clsDAL();
			System.Byte bytCant = System.Convert.ToByte(oDAL.getEscalarValue("SELECT COUNT(Id) FROM " + this.m_TableName + ";"));
			oDAL = null;
			return bytCant;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	} // Fin de la clase.

} // Fin del namespace.