using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsCurso.
	/// </summary>
	public class clsTemaProyecto
	{
		public clsTemaProyecto()
		{
		}

		public clsTemaProyecto(System.Byte Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.Byte m_Id;
		private System.String m_Nombre;
		private System.Boolean m_Habilitado;
		private struMencion[] m_Menciones;
		private System.String m_TableName = "tbl_tema_proyecto";
		private System.String m_TBL_MisMenciones = "tbl_mencion_tema_proyecto";

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
		
		public System.String Nombre
		{
			get{return this.m_Nombre;}
			set{this.m_Nombre = value;}
		}

		public System.Boolean Habilitado
		{
			get{return this.m_Habilitado;}
			set{this.m_Habilitado = value;}
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
			DataTable dtTemaProyecto = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtTemaProyecto.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtTemaProyecto.Rows[0]["Id"]);
				this.m_Nombre = System.Convert.ToString(dtTemaProyecto.Rows[0]["Nombre"]);
				this.m_Habilitado = System.Convert.ToBoolean(dtTemaProyecto.Rows[0]["Habilitado"]);
				this.m_Menciones = getMenciones(this.m_Id);
			}
		}

		/// <summary>
		/// Eliminar los registros relacionados en la tabla "tbl_curso_mencion".
		/// </summary>
		/// <param name="IdCurso"></param>
		/// <returns></returns>
		private bool Eliminar_TemaProyecto_Mencion(System.Byte IdTemaProyecto)
		{
			bool boResult = false;
			string strSQL = "DELETE FROM " + this.m_TBL_MisMenciones + " WHERE Id_TemaProyecto=" + IdTemaProyecto + ";";
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
			strSQL = "DELETE FROM " + this.m_TBL_MisMenciones + " WHERE Id_TemaProyecto=" + this.m_Id + " AND Id_Mencion NOT IN(" + strMenciones + ");";
			oDAL.ExecCommand(strSQL);
			// Hacer el update o insert
			for(int x=0; x<=(this.m_Menciones.Length-1); x++)
			{
				strSQL = "SELECT Id FROM " + this.m_TBL_MisMenciones + " WHERE Id_TemaProyecto=" + this.m_Id + " AND Id_Mencion=" + this.m_Menciones[x].Id + ";";
				if(!(System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL))))
				{
					strSQL = "INSERT INTO " + this.m_TBL_MisMenciones + " VALUES(null, " + this.m_Menciones[x].Id + ", " + this.m_Id + ");"; 
					oDAL.ExecCommand(strSQL);
				}
			}
			return true;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve un DataTable con los registros de todos los temas de proyecto que no estén 
		/// Habilitados y los con los campos: Id, Nombre.
		/// </summary>
		/// <returns></returns>
		public DataTable getLista()
		{
			string strSQL = "SELECT Id, Nombre FROM " + this.m_TableName + " WHERE Habilitado!=0 ORDER BY Nombre;";
			DataTable dtTemaProyecto;
			clsDAL oDAL = new clsDAL();
			dtTemaProyecto = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtTemaProyecto;
		}

		/// <summary>
		/// Devuelve un DataTable con los registros de todos los temas de proyecto que no estén 
		/// Habilitados y que correspondan para el Maestrante cuyo Id se pase como valor del 
		/// parámetro "IdMaestrante", los campos devueltos son: Id, Nombre.
		/// </summary>
		/// <returns></returns>
		public DataTable getLista(System.UInt32 IdMaestrante)
		{
			clsMaestrante Maestrante = new clsMaestrante(IdMaestrante);
			clsGrupo Grupo = new clsGrupo(Maestrante.IdGrupo);
			System.Byte bytMencion = Grupo.IdMencion;
			Maestrante = null;
			Grupo = null;
			string strSQL = "SELECT DISTINCT tbl_mencion_tema_proyecto.Id_TemaProyecto AS Id, " + 
				"tbl_tema_proyecto.Nombre AS Nombre FROM tbl_mencion_tema_proyecto " + 
				"INNER JOIN tbl_tema_proyecto ON tbl_mencion_tema_proyecto.Id_TemaProyecto=tbl_tema_proyecto.Id " + 
				"WHERE tbl_mencion_tema_proyecto.Id_Mencion=" + bytMencion + " AND tbl_tema_proyecto.Habilitado!=0;";
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
				throw new System.Exception("Los temas para proyecto de investigación deben estar destinados, al menos, a una de las Menciones registradas.");
			}
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, '" + this.m_Nombre + "', " + this.m_Habilitado + ");";
			
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
				throw new System.Exception("Error al insertar tema de proyecto.", Ex);
			}
		}

		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET Nombre='" + this.m_Nombre + "', Habilitado=" + this.m_Habilitado + 
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
					boResult = boResult & Eliminar_TemaProyecto_Mencion(this.m_Id );
					oDAL.CommitTrans();
					oDAL = null;
				}

				return boResult;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al eliminar tema de proyecto.", Ex);
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
					boResult = boResult & Eliminar_TemaProyecto_Mencion(Id);
					oDAL.CommitTrans();
					oDAL = null;
				}

				return boResult;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al eliminar tema de proyecto.", Ex);
			}
		}

		public bool canBeDeleted(System.Byte Id)
		{
			bool boResult = true;
			string strSQL = "SELECT DISTINCT " + 
				"CASE WHEN tbl_maestrante_tema_proyecto.Id_TemaProyecto=tbl_tema_proyecto.Id THEN true ELSE false END AS Maestrante " +
				"FROM tbl_tema_proyecto " +
                "LEFT JOIN tbl_maestrante_tema_proyecto ON tbl_tema_proyecto.Id = tbl_maestrante_tema_proyecto.Id_TemaProyecto " +
                "WHERE tbl_tema_proyecto.Id=" + Id + ";";
			// Esta opción se elimina porque esta es una entidad extendida, o sea, que cuando borramos
			// el curso también borramos todos sus registro en la tabla 'tbl_curso_mencion'
			// "CASE WHEN tbl_curso_mencion.Id_Curso=tbl_curso.Id THEN true ELSE false END AS Mencion " + 
			// "LEFT JOIN tbl_curso_mencion ON tbl_curso.Id = tbl_curso_mencion.Id_Curso " +
			
			clsDAL oDAL = new clsDAL();
			DataTable dtTemaProyecto = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtTemaProyecto.Rows.Count==0){return false;}

			for(int x=0; x<=(dtTemaProyecto.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtTemaProyecto.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.Byte Id)
		{
			string strSQL = "SELECT DISTINCT " + 
				"CASE WHEN tbl_maestrante_tema_proyecto.Id_TemaProyecto=tbl_tema_proyecto.Id THEN true ELSE false END AS Maestrante " +
				"FROM tbl_tema_proyecto " +
				"LEFT JOIN tbl_maestrante_tema_proyecto ON tbl_tema_proyecto.Id = tbl_maestrante_tema_proyecto.Id_TemaProyecto " +
				"WHERE tbl_tema_proyecto.Id=" + Id + ";";
			// Sólo se chequea la ocurrencia de registros de tema de proyecto para la tabla tbl_maestrante_tema_proyecto porque 
			// las ocurrencias en la tabla 'tbl_mencion_tema_proyecto' se eliminan al eliminar un tema de proyecto ya que esta 
			// es una entidad extendida.
			
			clsDAL oDAL = new clsDAL();
			DataTable dtTemaProyecto = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtTemaProyecto.Rows.Count==0){return ("El tema de proyecto ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtTemaProyecto.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtTemaProyecto.Rows[0][x]))
				{
					switch(dtTemaProyecto.Columns[x].ColumnName)
					{
						case "Maestrante":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe registrado, al menos, un 'Maestrante' que solicita el tema de proyecto que intenta eliminar."); 
							break;
						}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " ORDER BY Nombre;";
			clsDAL oDAL = new clsDAL();
			DataTable dtTemaProyecto = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtTemaProyecto;
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
			string strSQL = "SELECT " + this.m_TBL_MisMenciones + ".Id, " + this.m_TBL_MisMenciones + ".Id_Mencion, tbl_mencion.Nombre " + 
				"FROM " + this.m_TBL_MisMenciones + " " +
				"INNER JOIN tbl_mencion ON " + this.m_TBL_MisMenciones + ".Id_Mencion=tbl_mencion.Id " +
				"WHERE " + this.m_TBL_MisMenciones + ".Id_TemaProyecto=" + Id + " ORDER BY tbl_mencion.Nombre;";

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
			for(int x=0; x<=(MisMenciones.Length-1); x++)
			{
				strSQL = "INSERT INTO " + this.m_TBL_MisMenciones + " VALUES(null, " + MisMenciones[x].Id + ", " + this.m_Id + ");";
				oDAL.ExecCommand(strSQL);
			}
			oDAL = null;
			return;
		}


		#endregion "*** PROCEDIMIENTOS PARA LAS MENCIONES QUE LE PERTENECEN AL CURSO ***"

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	} // Fin de la clase.

}	// Fin del namespace.
