using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsMencion.
	/// </summary>
	public class clsMencion
	{
		public clsMencion()
		{
		}

		public clsMencion(System.Byte Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.String m_Nombre;
		private System.String m_TableName = "tbl_mencion";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte Id
		{
			get{return this.m_Id;}
			set{this.m_Id = value;}
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
			DataTable dtMencion = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtMencion.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtMencion.Rows[0]["Id"]);
				this.m_Nombre = System.Convert.ToString(dtMencion.Rows[0]["Nombre"]);
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
			string strSQL = "SELECT Id, Nombre FROM " + this.m_TableName + " ORDER BY Nombre;";
			DataTable dtMencion;
			clsDAL oDAL = new clsDAL();
			dtMencion = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtMencion;
		}

		public System.Byte Agregar()
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, '" + this.m_Nombre + "');";
			
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
				throw new System.Exception("Error al insertar mención.", Ex);
			}
		}

		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET Nombre='" + this.m_Nombre + "' WHERE Id=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			try
			{
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al actualizar mención.", Ex);
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
				"CASE WHEN tbl_grupo.Id_Mencion=tbl_mencion.Id THEN true ELSE false END AS Grupo, " +
				"CASE WHEN tbl_curso_mencion.Id_Mencion=tbl_mencion.Id THEN true ELSE false END AS Curso, " +
				"CASE WHEN tbl_mencion_tema_proyecto.Id_Mencion=tbl_mencion.Id THEN true ELSE false END AS TemaProyecto " +
				"FROM tbl_mencion " +
				"LEFT JOIN tbl_grupo ON tbl_mencion.Id = tbl_grupo.Id_Mencion " +
				"LEFT JOIN tbl_curso_mencion ON tbl_mencion.Id = tbl_curso_mencion.Id_Mencion " +
				"LEFT JOIN tbl_mencion_tema_proyecto ON tbl_mencion.Id = tbl_mencion_tema_proyecto.Id_Mencion " +
				"WHERE tbl_mencion.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtMencion = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtMencion.Rows.Count==0){return false;}

			for(int x=0; x<=(dtMencion.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtMencion.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.Byte Id)
		{
			string strSQL = "SELECT DISTINCT " + 
				"CASE WHEN tbl_grupo.Id_Mencion=tbl_mencion.Id THEN true ELSE false END AS Grupo, " +
				"CASE WHEN tbl_curso_mencion.Id_Mencion=tbl_mencion.Id THEN true ELSE false END AS Curso, " +
				"CASE WHEN tbl_mencion_tema_proyecto.Id_Mencion=tbl_mencion.Id THEN true ELSE false END AS TemaProyecto " +
				"FROM tbl_mencion " +
				"LEFT JOIN tbl_grupo ON tbl_mencion.Id = tbl_grupo.Id_Mencion " +
				"LEFT JOIN tbl_curso_mencion ON tbl_mencion.Id = tbl_curso_mencion.Id_Mencion " +
				"LEFT JOIN tbl_mencion_tema_proyecto ON tbl_mencion.Id = tbl_mencion_tema_proyecto.Id_Mencion " +
				"WHERE tbl_mencion.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtMencion = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtMencion.Rows.Count==0){return ("La mención ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtMencion.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtMencion.Rows[0][x]))
				{
					switch(dtMencion.Columns[x].ColumnName)
					{
						case "Grupo":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrado, al menos, un 'Grupo' que pertenece a la misma."); 
							break;
						}
						case "Curso":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrado, al menos, un 'Curso' que le corresponde a la misma."); 
							break;
						}
						case "TemaProyecto":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrado, al menos, un 'Tema de proyecto' que le corresponde a la misma."); 
							break;
						}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " ORDER BY Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtMencion = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtMencion;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"



	} // Fin de la clase.

} // Fin del namespace.
