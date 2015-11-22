using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsTema.
	/// </summary>
	public class clsTema
	{
		public clsTema()
		{
			//
			// TODO: agregar aquí la lógica del constructor
			//
		}

		public clsTema(System.Byte Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.Byte m_IdCurso;
		private System.String m_Nombre;
		private System.String m_ObjetivosGenerales;
		private System.String m_ActividadesAprendizaje;
		private System.String m_ActividadesAutoevaluacion;
		private System.String m_TableName = "tbl_tema";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte Id
		{
			get{return this.m_Id;}
			set{this.m_Id = value;}
		}
		
		public System.Byte IdCurso
		{
			get{return this.m_IdCurso;}
			set{this.m_IdCurso = value;}
		}

		public System.String Nombre
		{
			get{return this.m_Nombre;}
			set{this.m_Nombre = value;}
		}

		public System.String ObjetivosGenerales
		{
			get{return this.m_ObjetivosGenerales;}
			set{this.m_ObjetivosGenerales = value;}
		}

		public System.String ActividadesAprendizaje
		{
			get{return this.m_ActividadesAprendizaje;}
			set{this.m_ActividadesAprendizaje = value;}
		}

		public System.String ActividadesAutoevaluacion
		{
			get{return this.m_ActividadesAutoevaluacion;}
			set{this.m_ActividadesAutoevaluacion = value;}
		}

		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.Byte Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE " + this.m_TableName + ".Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dtTema = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtTema.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtTema.Rows[0]["Id"]);
				this.m_IdCurso = System.Convert.ToByte(dtTema.Rows[0]["Id_Modulo"]);
				this.m_Nombre = System.Convert.ToString(dtTema.Rows[0]["Nombre"]);
				this.m_ObjetivosGenerales = System.Convert.ToString(dtTema.Rows[0]["ObjetivoGeneral"]);
				this.m_ActividadesAprendizaje = System.Convert.ToString(dtTema.Rows[0]["ActividadesAprendizaje"]);
				this.m_ActividadesAutoevaluacion = System.Convert.ToString(dtTema.Rows[0]["ActividadesAutoevaluacion"]);
			}
		}
		
		
		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

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

		public System.Byte Agregar()
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, " + this.IdCurso + ", '" + this.m_Nombre + "', '" + this.m_ObjetivosGenerales + "', '" + this.m_ActividadesAprendizaje + "', '" + this.ActividadesAutoevaluacion + "');";
			
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
				throw new System.Exception("Error al insertar tema.", Ex);
			}
		}

		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET Id_Curso=" + this.m_IdCurso + ", Nombre='" + this.m_Nombre + "', ObjetivosGenerales='" + this.m_ObjetivosGenerales + "', ActividadesAprendizaje= '" + this.m_ActividadesAprendizaje + "', ActividadesAutoevaluacion = '" + this.ActividadesAutoevaluacion + "'" +
				" WHERE Id=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			try
			{
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al actualizar tema.", Ex);
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
                "CASE WHEN tbl_consulta.Id_Tema=tbl_tema.Id THEN true ELSE false END AS Consulta, " +
                "CASE WHEN tbl_bibliografia_tema.Id_Tema=tbl_tema.Id THEN true ELSE false END AS Bibliografia " +
                "FROM tbl_tema " +
                "LEFT JOIN tbl_consulta ON tbl_tema.Id = tbl_consulta.Id_Tema " +
				"LEFT JOIN tbl_bibliografia_tema ON tbl_tema.Id = tbl_bibliografia_tema.Id_Tema " +
                "WHERE tbl_tema.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtTema = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtTema.Rows.Count==0){return false;}

			for(int x=0; x<=(dtTema.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtTema.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.Byte Id)
		{
			string strSQL = "SELECT DISTINCT " + 
				"CASE WHEN tbl_consulta.Id_Tema=tbl_tema.Id THEN true ELSE false END AS Consulta, " +
				"CASE WHEN tbl_bibliografia_tema.Id_Tema=tbl_tema.Id THEN true ELSE false END AS Bibliografia " +
				"FROM tbl_tema " +
				"LEFT JOIN tbl_consulta ON tbl_tema.Id = tbl_consulta.Id_Tema " +
				"LEFT JOIN tbl_bibliografia_tema ON tbl_tema.Id = tbl_bibliografia_tema.Id_Tema " +
				"WHERE tbl_tema.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtTema = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtTema.Rows.Count==0){return ("El tema ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtTema.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtTema.Rows[0][x]))
				{
					switch(dtTema.Columns[x].ColumnName)
					{
						case "Consulta":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrada, al menos, una 'Consulta' que pertenece al mismo."); 
							break;
						}
						case "Bibliografia":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrada, al menos, una 'Bibliografia' que pertenece al mismo."); 
							break;
						}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " ORDER BY Id_Curso, Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public DataTable getAllRecords(System.Byte IdCurso)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id_Curso=" + IdCurso + " ORDER BY Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtTema = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtTema;
		}

		public DataTable getLista()
		{
			string strSQL = "SELECT Id, Id_Curso, Nombre FROM " + this.m_TableName + " ORDER BY Id_Curso, Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/// <summary>
		/// Devuelve la lista de los temas que le corresponden al maestrante cuyo Id se pasa como valor del 
		/// parámetro IdUsuario, de acuerdo con la mención a la que pertenece el mismo. Los campos devueltos 
		/// son: Id, NombreCorto AS Modulo, tbl_curso.Nombre AS Curso, tbl_tema.Nombre AS Tema.
		/// </summary>
		/// <param name="IdUsuario"></param>
		/// <returns></returns>
		public DataTable getListaForMaestrante(System.UInt32 IdUsuario)
		{
			string strSQL = "SELECT tbl_tema.Id AS Id, tbl_modulo.NombreCorto AS Modulo, tbl_curso.Nombre AS Curso, " +
				"tbl_tema.Nombre AS Tema FROM tbl_tema " +
				"INNER JOIN tbl_curso_mencion ON tbl_tema.Id_Curso=tbl_curso_mencion.Id_Curso " +
				"INNER JOIN tbl_curso ON tbl_curso.Id=tbl_curso_mencion.Id_Curso " +
				"INNER JOIN tbl_modulo ON tbl_curso.Id_Modulo=tbl_modulo.Id " +
				"WHERE (tbl_curso_mencion.Id_Mencion IN(SELECT tbl_grupo.Id_Mencion " + 
				"FROM tbl_usuario_maestrante " +
				"INNER JOIN tbl_grupo ON tbl_usuario_maestrante.Id_Grupo=tbl_grupo.Id " + 
				"WHERE tbl_usuario_maestrante.Id_Usuario=" + IdUsuario + ")) AND " +
				"(tbl_modulo.NoOrden<=(SELECT NoOrden FROM tbl_modulo " +
				"WHERE Id=(SELECT ModuloActual FROM tbl_maestria)));";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public DataTable getListaForConsultasRespondidas()
		{
			string strSQL = "SELECT tbl_consulta.Id_Tema AS Id, tbl_modulo.NombreCorto AS Modulo, " +
				"tbl_curso.Nombre AS Curso, tbl_tema.Nombre AS Tema, COUNT(tbl_consulta.Id_Tema) AS Ocurrencias " +
				"FROM tbl_consulta " +
				"INNER JOIN tbl_tema ON tbl_consulta.Id_Tema=tbl_tema.Id " +
				"INNER JOIN tbl_curso ON tbl_tema.Id_Curso=tbl_curso.Id " +
				"INNER JOIN tbl_modulo ON tbl_curso.Id_Modulo=tbl_modulo.Id " +
				"INNER JOIN tbl_consulta_respuesta ON tbl_consulta.Id=tbl_consulta_respuesta.Id_Consulta " +
				"WHERE tbl_consulta.Id IN (SELECT Id_Consulta FROM tbl_consulta_respuesta) " +
				"GROUP BY Id, tbl_tema.Nombre, tbl_curso.Nombre, tbl_modulo.NombreCorto " +
				"ORDER BY Ocurrencias DESC;";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	} // Fin de la clase.

}	// Fin del namespace.
