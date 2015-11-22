using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsGrupo.
	/// </summary>
	public class clsGrupo
	{
		public clsGrupo()
		{
		}

		public clsGrupo(System.Byte Id)
		{
			this.setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.Byte m_IdSede;
		private System.Byte m_IdMencion;
		private System.String m_Nombre;
		private System.String m_TableName = "tbl_grupo";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte Id
		{
			get{return this.m_Id;}
			set{this.m_Id = value;}
		}
		
		public System.Byte IdSede
		{
			get{return this.m_IdSede;}
			set{this.m_IdSede = value;}
		}
		
		public System.Byte IdMencion
		{
			get{return this.m_IdMencion;}
			set{this.m_IdMencion = value;}
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
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtGrupo.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtGrupo.Rows[0]["Id"]);
				this.m_IdSede = System.Convert.ToByte(dtGrupo.Rows[0]["Id_Sede"]);
				this.m_IdMencion = System.Convert.ToByte(dtGrupo.Rows[0]["Id_Mencion"]);
				this.m_Nombre = System.Convert.ToString(dtGrupo.Rows[0]["Nombre"]);
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
			string strSQL = "SELECT Id, Nombre FROM " + this.m_TableName + " ORDER BY Id_Sede, Nombre;";
			clsDAL oDAL = new clsDAL();
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtGrupo;
		}

		/// <summary>
		/// Devuelve un DataTable con los registros de todos los grupos y los 
		/// campos: Id, Nombre, Mencion y Sede. Ordenado por: Sede, Mencion, Nombre.
		/// </summary>
		/// <returns></returns>
		public DataTable getExtendedLista()
		{
			string strSQL = "SELECT " + this.m_TableName + ".Id, " + this.m_TableName + ".Nombre, " + 
				"tbl_mencion.Nombre AS Mencion, tbl_sede.Nombre AS Sede FROM " + this.m_TableName + " " + 
				"INNER JOIN tbl_mencion on " + this.m_TableName + ".Id_Mencion=tbl_mencion.Id " + 
				"INNER JOIN tbl_sede on " + this.m_TableName + ".Id_Sede=tbl_sede.Id " + 
				"ORDER BY Sede, Mencion, " + this.m_TableName + ".Nombre;";
			clsDAL oDAL = new clsDAL();
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtGrupo;
		}

		public System.Byte Agregar()
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, " + this.m_IdSede + ", " + this.m_IdMencion + ", '" + this.m_Nombre + "');";
			
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
				throw new System.Exception("Error al insertar grupo.", Ex);
			}
		}

		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET Id_Sede=" + this.m_IdSede + ", Id_Mencion=" + this.m_IdMencion + ", Nombre='" + this.m_Nombre + "' WHERE Id=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			try
			{
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al actualizar grupo.", Ex);
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
				"CASE WHEN tbl_usuario_maestrante.Id_Grupo=tbl_grupo.Id THEN true ELSE false END AS Maestrante, " +
				"CASE WHEN tbl_encuentro_orientaciones.Id_Grupo=tbl_grupo.Id THEN true ELSE false END AS Orientaciones " +
                "FROM tbl_grupo " +
                "LEFT JOIN tbl_usuario_maestrante ON tbl_grupo.Id = tbl_usuario_maestrante.Id_Grupo " +
				"LEFT JOIN tbl_encuentro_orientaciones ON tbl_grupo.Id = tbl_encuentro_orientaciones.Id_Grupo " +
				"WHERE tbl_grupo.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtGrupo.Rows.Count==0){return false;}

			for(int x=0; x<=(dtGrupo.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtGrupo.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.Byte Id)
		{
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_usuario_maestrante.Id_Grupo=tbl_grupo.Id THEN true ELSE false END AS Maestrante, " +
				"CASE WHEN tbl_encuentro_orientaciones.Id_Grupo=tbl_grupo.Id THEN true ELSE false END AS Orientaciones " +
				"FROM tbl_grupo " +
				"LEFT JOIN tbl_usuario_maestrante ON tbl_grupo.Id = tbl_usuario_maestrante.Id_Grupo " +
				"LEFT JOIN tbl_encuentro_orientaciones ON tbl_grupo.Id = tbl_encuentro_orientaciones.Id_Grupo " +
				"WHERE tbl_grupo.Id=" + Id + ";";
				
			clsDAL oDAL = new clsDAL();
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtGrupo.Rows.Count==0){return ("La sede ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtGrupo.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtGrupo.Rows[0][x]))
				{
					switch(dtGrupo.Columns[x].ColumnName)
					{
						case "Maestrante":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrado, al menos, un 'Maestrante' que pertenece al mismo."); 
							break;
						}
						case "Orientaciones":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrada, al menos, una 'Orientacion para encuentro presencial' con este grupo."); 
							break;
						}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " ORDER BY Id_Sede, Id_Mencion, Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtGrupo;
		}

		public DataTable getAllRecordsBySede(System.Byte IdSede)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id_Sede=" + IdSede + " ORDER BY Id_Mencion, Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtGrupo;
		}

		public DataTable getAllRecordsByMencion(System.Byte IdMencion)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id_Mencion=" + IdMencion + " ORDER BY Id_Sede, Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtGrupo;
		}

		/// <summary>
		/// Devuelve todos los registros de la tabla tbl_sede además del nombre de la provincia, 
		/// de la siguiente manera: Id, IdSede, Sede, IdMencion, Mencion, Nombre.
		/// </summary>
		/// <returns></returns>
		public DataTable getAllRecordsForReport()
		{
			string strSQL = "SELECT tbl_grupo.Id, tbl_sede.Id AS IdSede, tbl_sede.Nombre AS Sede, " +
				"tbl_mencion.Id AS IdMencion, tbl_mencion.Nombre AS Mencion, tbl_grupo.Nombre " +
				"FROM tbl_grupo " + 
				"INNER JOIN tbl_sede ON tbl_grupo.Id_Sede = tbl_sede.Id " +
                "INNER JOIN tbl_mencion ON tbl_grupo.Id_Mencion = tbl_mencion.Id " +
				"ORDER BY tbl_grupo.Id_Sede, tbl_grupo.Id_Mencion, tbl_grupo.Id;";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtGrupo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtGrupo;
		}

		public System.Byte getCantGruposTotal()
		{
			clsDAL oDAL = new clsDAL();
			System.Byte bytCant = System.Convert.ToByte(oDAL.getEscalarValue("SELECT COUNT(Id) FROM " + this.m_TableName + ";"));
			oDAL = null;
			return bytCant;
		}

		public System.Byte getCantGruposByMencion(System.Byte IdMencion)
		{
			clsDAL oDAL = new clsDAL();
			System.Byte bytCant = System.Convert.ToByte(oDAL.getEscalarValue("SELECT COUNT(Id) FROM " + this.m_TableName + " WHERE Id_Mencion=" + IdMencion + ";"));
			oDAL = null;
			return bytCant;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	} // Fin de la clase.

} // Fin del namespace.