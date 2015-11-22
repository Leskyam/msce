using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsMencion.
	/// </summary>
	public class clsTituloAcademico
	{
		public clsTituloAcademico()
		{
		}

		public clsTituloAcademico(System.Byte Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.String m_Nombre;
		private System.String m_TableName = "tbl_titulo_academico";

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
			DataTable dtTituloAcademico = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtTituloAcademico.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtTituloAcademico.Rows[0]["Id"]);
				this.m_Nombre = System.Convert.ToString(dtTituloAcademico.Rows[0]["Nombre"]);
			}
		}
		
		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve un DataTable con los registros de todas los títulos académicos y los 
		/// campos: Id, Nombre.
		/// </summary>
		/// <returns></returns>
		public DataTable getLista()
		{
			string strSQL = "SELECT Id, Nombre FROM " + this.m_TableName + " ORDER BY Nombre;";
			DataTable dtTituloAcademico;
			clsDAL oDAL = new clsDAL();
			dtTituloAcademico = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtTituloAcademico;
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
				throw new System.Exception("Error al insertar título académico.", Ex);
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
				throw new System.Exception("Error al actualizar título académico.", Ex);
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
				"CASE WHEN tbl_usuario_docente.Id_TituloAcademico=tbl_titulo_academico.Id THEN true ELSE false END AS Docente " + 
				"FROM tbl_titulo_academico " +
				"LEFT JOIN tbl_usuario_docente ON tbl_titulo_academico.Id=tbl_usuario_docente.Id_TituloAcademico " +
				"WHERE tbl_titulo_academico.Id=" + Id + ";";

			clsDAL oDAL = new clsDAL();
			DataTable dtTituloAcademico = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtTituloAcademico.Rows.Count==0){return false;}

			for(int x=0; x<=(dtTituloAcademico.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtTituloAcademico.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.Byte Id)
		{
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_usuario_docente.Id_TituloAcademico=tbl_titulo_academico.Id THEN true ELSE false END AS Docente " + 
				"FROM tbl_titulo_academico " +
				"LEFT JOIN tbl_usuario_docente ON tbl_titulo_academico.Id=tbl_usuario_docente.Id_TituloAcademico " +
				"WHERE tbl_titulo_academico.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtTituloAcademico = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtTituloAcademico.Rows.Count==0){return ("El título académico ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtTituloAcademico.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtTituloAcademico.Rows[0][x]))
				{
					switch(dtTituloAcademico.Columns[x].ColumnName)
					{
						case "Docente":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrado, al menos, un 'Docente' que pertenece al mismo."); 
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
			DataTable dtTituloAcademico = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtTituloAcademico;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	} // Fin de la clase.

} // Fin del namespace.
