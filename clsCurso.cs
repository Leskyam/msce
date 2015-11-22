using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsCurso.
	/// </summary>
	public class clsCurso
	{
		public clsCurso()
		{
		}

		public clsCurso(System.Byte Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.Byte m_IdModulo;
		private System.String m_Nombre;
		private System.String m_ObjetivoGeneral;
		private struMencion[] m_Menciones;
		private System.String m_TableName = "tbl_curso";
		private System.String m_TBL_MisMenciones = "tbl_curso_mencion";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** ESTRUCTURAS ***"

		/// <summary>
		/// Contiene los campos Id y Nombre.
		/// </summary>
		public struct struMencion
		{
			public System.Byte Id;
            public System.String Nombre;
		}

		#endregion "*** FIN DE ESTRUCTURAS ***"

		#region "*** PROPIEDADES ***"

		public System.Byte Id
		{
			get{return this.m_Id;}
			set{this.m_Id = value;}
		}
		
		public System.Byte IdModulo
		{
			get{return this.m_IdModulo;}
			set{this.m_IdModulo = value;}
		}

		public System.String Nombre
		{
			get{return this.m_Nombre;}
			set{this.m_Nombre = value;}
		}

		public System.String ObjetivoGeneral
		{
			get{return this.m_ObjetivoGeneral;}
			set{this.m_ObjetivoGeneral = value;}
		}

		public struMencion[] Menciones
		{
			get{return this.m_Menciones;}
			set{this.m_Menciones = value;}
		}

		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.Byte Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE " + this.m_TableName + ".Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dtCurso = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtCurso.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtCurso.Rows[0]["Id"]);
				this.m_IdModulo = System.Convert.ToByte(dtCurso.Rows[0]["Id_Modulo"]);
				this.m_Nombre = System.Convert.ToString(dtCurso.Rows[0]["Nombre"]);
				this.m_ObjetivoGeneral = System.Convert.ToString(dtCurso.Rows[0]["ObjetivoGeneral"]);
				this.m_Menciones = getMenciones(this.m_Id);
			}
		}

		/// <summary>
		/// Eliminar los registros relacionados en la tabla "tbl_curso_mencion".
		/// </summary>
		/// <param name="IdCurso"></param>
		/// <returns></returns>
		private bool Eliminar_Curso_Mencion(System.Byte IdCurso)
		{
			bool boResult = false;
			string strSQL = "DELETE FROM " + this.m_TBL_MisMenciones + " WHERE Id_Curso=" + IdCurso + ";";
			clsDAL oDAL = new clsDAL();
			boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}
		
		private bool ActualizaMenciones()
		{
			clsDAL oDAL = new clsDAL();
			// Primero borrar
			string strMenciones = string.Empty;
			string strSQL;

			for(int x=0; x<=(this.m_Menciones.Length-1); x++)
			{
				if(strMenciones!=string.Empty){strMenciones+=", ";}
				strMenciones += this.m_Menciones[x].Id.ToString();
			}
			strSQL = "DELETE FROM " + this.m_TBL_MisMenciones + " WHERE Id_Curso=" + this.m_Id + " AND Id_Mencion NOT IN(" + strMenciones + ");";
			oDAL.ExecCommand(strSQL);
			// Hacer el update o insert
			for(int x=0; x<=(this.m_Menciones.Length-1); x++)
			{
				strSQL = "SELECT Id FROM " + this.m_TBL_MisMenciones + " WHERE Id_Curso=" + this.m_Id + " AND Id_Mencion=" + this.m_Menciones[x].Id + ";";
				if(!(System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL))))
				{
					strSQL = "INSERT INTO " + this.m_TBL_MisMenciones + " VALUES(null, " + this.m_Id + ", " + this.m_Menciones[x].Id + ");"; 
					oDAL.ExecCommand(strSQL);
				}
			}

			return true;

		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve un DataTable con los registros de todos los curso y los 
		/// campos: Id, Nombre.
		/// </summary>
		/// <returns></returns>
		public DataTable getLista()
		{
			string strSQL = "SELECT Id, Nombre FROM " + this.m_TableName + " ORDER BY Nombre;";
			DataTable dtCurso;
			clsDAL oDAL = new clsDAL();
			dtCurso = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtCurso;
		}

		/// <summary>
		/// Devuelve un DataTable con los registros de todos los curso y los 
		/// campos: Id, Nombre, Modulo. Donde "Modulo" es el nombre del módulo
		/// al que pertenece el curso.
		/// </summary>
		/// <returns></returns>
		public DataTable getExtendedLista()
		{
			string strSQL = "SELECT tbl_curso.Id, tbl_curso.Nombre, tbl_modulo.NombreCorto AS Modulo " + 
				"FROM " + this.m_TableName + " " + 
                "INNER JOIN tbl_modulo ON tbl_curso.Id_Modulo=tbl_modulo.Id " +
                "ORDER BY tbl_curso.Id_Modulo, tbl_curso.Id;";
			DataTable dtCurso;
			clsDAL oDAL = new clsDAL();
			dtCurso = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtCurso;
		}
		
		public System.Byte Agregar()
		{
			if(this.m_Menciones.Length==0)
			{
				throw new System.Exception("Los cursos deben estar destinados, al menos, a una de las Menciones registradas.");
			}
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, " + this.m_IdModulo + ", '" + this.m_Nombre + "', '" + this.m_ObjetivoGeneral + "');";
			
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				oDAL.ExecCommand(strSQL);
				this.m_Id = System.Convert.ToByte(oDAL.getLastIDENTITY(this.m_TableName));
				AgregarMisMenciones(this.m_Menciones);
				oDAL.CommitTrans();
				oDAL = null;
				return this.m_Id;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al insertar curso.", Ex);
			}
		}

		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET Id_Modulo=" + this.m_IdModulo + ", Nombre='" + this.m_Nombre + "', ObjetivoGeneral='" + this.m_ObjetivoGeneral + "'" +
				" WHERE Id=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
				if(boResult & ActualizaMenciones())
				{
					oDAL.CommitTrans();
				}
				else
				{
					boResult = false;
					oDAL.RollBackTrans();
				}
				oDAL = null;
				return boResult;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al actualizar curso.", Ex);
			}
		}

		public bool Eliminar()
		{
			clsDAL oDAL = new clsDAL();
			try
			{
				if(this.m_Id==0){return false;}
				bool boResult = false;
				// Comprobar siempre si se puede eliminar antes de hacerlo, a pesar de que este método
				// es público, ya que al escribir el código se nos puede olvidar comprobar esto y MySQL
				// no admite chequeos de integridad, al menos en la 4.1.7.
				if(this.canBeDeleted(this.m_Id))
				{
					string strSQL = "DELETE FROM " + this.m_TableName + " WHERE Id=" + this.m_Id + ";";
					oDAL.BeginTrans();
					boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
					boResult = boResult & Eliminar_Curso_Mencion(this.m_Id );
					oDAL.CommitTrans();
					oDAL = null;
				}

				return boResult;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al eliminar curso.", Ex);
			}
		}

		public bool Eliminar(System.Byte Id)
		{
			clsDAL oDAL = new clsDAL();

			try
			{
				if(Id==0){return false;}
				bool boResult = false;
				// Comprobar siempre si se puede eliminar antes de hacerlo, a pesar de que este método
				// es público, ya que al escribir el código se nos puede olvidar comprobar esto y MySQL
				// no admite chequeos de integridad, al menos en la 4.1.7.
				if(this.canBeDeleted(Id))
				{
					string strSQL = "DELETE FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
					oDAL.BeginTrans();
					boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
					boResult = boResult & Eliminar_Curso_Mencion(Id);
					oDAL.CommitTrans();
					oDAL = null;
				}

				return boResult;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al eliminar curso.", Ex);
			}
		}

		public bool canBeDeleted(System.Byte Id)
		{
			bool boResult = true;
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_tema.Id_Curso=tbl_curso.Id THEN true ELSE false END AS Tema " + 
                "FROM tbl_curso " +
                "LEFT JOIN tbl_tema ON tbl_curso.Id = tbl_tema.Id_curso " +
                "WHERE tbl_curso.Id=" + Id + ";";
			// Esta opción se elimina porque esta es una entidad extendida, o sea, que cuando borramos
			// el curso también borramos todos sus registro en la tabla 'tbl_curso_mencion'
			// "CASE WHEN tbl_curso_mencion.Id_Curso=tbl_curso.Id THEN true ELSE false END AS Mencion " + 
			// "LEFT JOIN tbl_curso_mencion ON tbl_curso.Id = tbl_curso_mencion.Id_Curso " +
			
			clsDAL oDAL = new clsDAL();
			DataTable dtCurso = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtCurso.Rows.Count==0){return false;}

			for(int x=0; x<=(dtCurso.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtCurso.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.Byte Id)
		{
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_tema.Id_Curso=tbl_curso.Id THEN true ELSE false END AS Tema " + 
				"FROM tbl_curso " +
				"LEFT JOIN tbl_tema ON tbl_curso.Id = tbl_tema.Id_curso " +
				"WHERE tbl_curso.Id=" + Id + ";";
			// Esta opción se elimina porque esta es una entidad extendida, o sea, que cuando borramos
			// el curso también borramos todos sus registro en la tabla 'tbl_curso_mencion'
			// "CASE WHEN tbl_curso_mencion.Id_Curso=tbl_curso.Id THEN true ELSE false END AS Mencion " + 
			// "LEFT JOIN tbl_curso_mencion ON tbl_curso.Id = tbl_curso_mencion.Id_Curso " +
			
			clsDAL oDAL = new clsDAL();
			DataTable dtCurso = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtCurso.Rows.Count==0){return ("El curso ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtCurso.Columns.Count-1); x++)
			{
				//System.Diagnostics.Debug.WriteLine("Id: " + Id + " " + dtModulo.Columns[x].ColumnName + ": " + dtModulo.Rows[0][x].ToString());
				if(System.Convert.ToBoolean(dtCurso.Rows[0][x]))
				{
					switch(dtCurso.Columns[x].ColumnName)
					{
						case "Tema":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrado, al menos, un 'Tema' que pertenece al mismo."); 
							break;
						}
							//	case "Mencion":
							//	{
							//		if(sbResult.Length!=0){sbResult.Append("|");}
							//		sbResult.Append("Existe registrada, al menos, una 'Mención' que se relaciona con el mismo."); 
							//		break;
							//	}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " ORDER BY Id_Modulo, Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtCursos = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtCursos;
		}

		public DataTable getAllRecords(System.Byte IdModulo)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id_Modulo=" + IdModulo + " ORDER BY Id;";
			clsDAL oDAL = new clsDAL();
			DataTable dtCursos = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtCursos;
		}

		#region "*** PROCEDIMIENTOS PARA LAS MENCIONES QUE LE PERTENECEN AL CURSO ***"

		/// <summary>
		/// Devuelve una estructura con los campos: Id, Id_Mencion y Nombre de todos los registros
		/// de las menciones en la tabla tbl_curso_mencion.
		/// </summary>
		/// <param name="Id"></param>
		/// <returns></returns>
		public struMencion[] getMenciones(System.Byte Id)
		{
			string strSQL = "SELECT tbl_curso_mencion.Id, tbl_curso_mencion.Id_Mencion, tbl_mencion.Nombre " + 
				"FROM tbl_curso_mencion " +
				"INNER JOIN tbl_mencion ON tbl_curso_mencion.Id_Mencion=tbl_mencion.Id " +
				"WHERE tbl_curso_mencion.Id_Curso=" + Id + " ORDER BY tbl_mencion.Nombre;";

			clsDAL oDAL = new clsDAL();
			DataView dvMisMenciones = oDAL.getDataTable(strSQL).DefaultView;
			struMencion[] MisMenciones = new struMencion[dvMisMenciones.Table.Rows.Count];
			for(int x=0; x<=(dvMisMenciones.Table.Rows.Count-1); x++)
			{
				MisMenciones[x].Id = System.Convert.ToByte(dvMisMenciones.Table.Rows[x]["Id_Mencion"]);
				MisMenciones[x].Nombre = System.Convert.ToString(dvMisMenciones.Table.Rows[x]["Nombre"]);
			}
			return MisMenciones;

		}

		private void AgregarMisMenciones(struMencion[] MisMenciones)
		{
			string strSQL = string.Empty;

			clsDAL oDAL = new clsDAL();
			//DataView dvMisMenciones = oDAL.getDataTable(strSQL).DefaultView;
			for(int x=0; x<=(MisMenciones.Length-1); x++)
			{
				strSQL = "INSERT INTO tbl_curso_mencion VALUES(null, " + this.m_Id + ", " + MisMenciones[x].Id + ");";
				oDAL.ExecCommand(strSQL);
			}
			oDAL = null;
			return;
		}


		#endregion "*** PROCEDIMIENTOS PARA LAS MENCIONES QUE LE PERTENECEN AL CURSO ***"

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	} // Fin de la clase.

}	// Fin del namespace.
