using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsModulo.
	/// </summary>
	public class clsModulo
	{
		public clsModulo()
		{
			//
			// TODO: agregar aquí la lógica del constructor
			//
		}

		public clsModulo(System.Byte Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"
        
		private System.Byte m_Id;
		private System.Byte m_NoOrden;
        private System.String m_NombreCorto;
		private System.String m_NombreCompleto;
		private System.String m_Objetivos;
		private System.String m_TableName = "tbl_modulo";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.String TableName
		{
			get{return this.m_TableName;}
		}
		public System.Byte Id
		{
			get{return this.m_Id;}
			set{this.m_Id = value;}
		}

		public System.Byte NoOrden
		{
			get{return this.m_NoOrden;}
			set{this.m_NoOrden = value;}
		}

		public System.String NombreCorto
		{
			get{return this.m_NombreCorto;}
			set{this.m_NombreCorto = value;}
		}

		public System.String NombreCompleto
		{
			get{return this.m_NombreCompleto;}
			set{this.m_NombreCompleto = value;}
		}

		public System.String Objetivos
		{
			get{return this.m_Objetivos;}
			set{this.m_Objetivos = value;}
		}

		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.Byte Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE " + this.m_TableName + ".Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dtModulo = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtModulo.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToByte(dtModulo.Rows[0]["Id"]);
				this.m_NoOrden = System.Convert.ToByte(dtModulo.Rows[0]["NoOrden"]);
				this.m_NombreCorto = System.Convert.ToString(dtModulo.Rows[0]["NombreCorto"]);
				this.m_NombreCompleto = System.Convert.ToString(dtModulo.Rows[0]["NombreCompleto"]);
				this.m_Objetivos = System.Convert.ToString(dtModulo.Rows[0]["Objetivos"]);
			}
			else
			{
				// Cuando se pasa cero (0) como parámatro Id
				if(dtModulo.Rows.Count==0 & Id==0)
				{
					this.m_Id = 0;
					this.m_NoOrden = this.m_Id;
					this.m_NombreCorto = "No hay módulo activo";
					this.m_NombreCompleto = this.m_NombreCorto;
					this.m_Objetivos = this.m_NombreCorto;
				}
			}
		}
		
		
		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve un DataTable con los registros de todos los módulo y los 
		/// campos: Id, NombreCorto.
		/// </summary>
		/// <returns></returns>
		public DataTable getLista()
		{
			string strSQL = "SELECT Id, NombreCorto AS Nombre FROM " + this.m_TableName + " ORDER BY NoOrden;";
            DataTable dtModulo;
			clsDAL oDAL = new clsDAL();
			dtModulo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtModulo;
		}

		/// <summary>
		/// Devuelve un DataTable con los registros de todos los módulo y los 
		/// campos: Id, NoOrden y NombreCorto, si withNombreCompleto=false, pero 
		/// si withNombreCompleto=true entonces devuelve tambien el campo "NombreCompleto".
		/// </summary>
		/// <returns></returns>
		public DataTable getExtendedLista(bool withNombreCompleto)
		{
			string strSQL = "SELECT Id, NoOrden, NombreCorto AS Nombre";
			if(withNombreCompleto)
			{
				strSQL += ", NombreCompleto ";
			}
			
			strSQL += " FROM " + this.m_TableName + " ORDER BY NoOrden;";
			DataTable dtModulo;
			clsDAL oDAL = new clsDAL();
			dtModulo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtModulo;
		}

		public string getNombreCorto(System.Byte Id)
		{
			string strSQL = "SELECT NombreCorto FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			string strResult = System.Convert.ToString(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return strResult;
            
		}

		public string getNombreCompleto(System.Byte Id)
		{
			string strSQL = "SELECT NombreCompleto FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			string strResult = System.Convert.ToString(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return strResult;
		}

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " ORDER BY NoOrden;";
			clsDAL oDAL = new clsDAL();
			DataTable dtModulos = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtModulos;
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

		#region "*** PROCEDIMIENTOS PARA ACTUALIZACIÓN ***"
		
		public System.Byte Agregar()
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, " + this.m_NoOrden + ", '" + this.m_NombreCorto + "', '" + this.m_NombreCompleto + "', '" + this.m_Objetivos + "');";
			
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
				System.Diagnostics.Debug.WriteLine(Ex.ToString());
				oDAL.RollBackTrans();
				throw new System.Exception("Error al insertar módulo.", Ex);
			}
		}
		
		public System.Byte Agregar(System.Byte NoOrden, System.String NombreCorto, System.String NombreCompleto, System.String Objetivos)
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, " + NoOrden + ", '" + NombreCorto + "', '" + NombreCompleto + "', '" + Objetivos + "');";
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				oDAL.ExecCommand(strSQL);
				System.Byte intIdentity = System.Convert.ToByte(oDAL.getLastIDENTITY(this.m_TableName));
				//System.Diagnostics.Debug.WriteLine(intIdentity);
				oDAL.CommitTrans();
				oDAL = null;
				return intIdentity;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al insertar módulo.", Ex);
			}
		}
		
		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET NoOrden=" + this.m_NoOrden + ", NombreCorto='" + this.m_NombreCorto + "', NombreCompleto='" + this.m_NombreCompleto + "', Objetivos='" + this.m_Objetivos + "'" +
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
				throw new System.Exception("Error al actualizar módulo.", Ex);
			}
		}

		public bool Actualizar(System.Byte Id, System.Byte NoOrden, System.String NombreCorto, System.String NombreCompleto, System.String Objetivos)
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET NoOrden=" + NoOrden + ", NombreCorto='" + NombreCorto + "', NombreCompleto='" + NombreCompleto + "', Objetivos='" + Objetivos + "'" +
				" WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.ExecCommand(strSQL);
				oDAL = null;
				return true;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al insertar módulo.", Ex);
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
		
		#endregion "*** FUN DE PROCEDIMIENTOS PARA ACTUALIZACIÓN ***"

		public System.Data.DataTable getById(System.Byte Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dtModulo = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtModulo;
		}

		public System.Byte getNextNoOrden()
		{
			string strSQL = "SELECT NoOrden FROM " + this.m_TableName + " ORDER BY NoOrden DESC LIMIT 0,1;";
			clsDAL oDAL = new clsDAL();
			System.Byte bytNoOrden = System.Convert.ToByte(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return ++bytNoOrden;
		}

		/// <summary>
		/// Comprueba que el número de orden que se pasa como parámetro no existe,
		/// si existe devuelve true.
		/// </summary>
		/// <param name="NoOrden"></param>
		/// <returns></returns>
		public bool ExistNoOrden(System.Byte NoOrden)
		{
			string strSQL = "SELECT NoOrden FROM " + this.m_TableName + " WHERE NoOrden=" + NoOrden + ";";
			clsDAL oDAL = new clsDAL();
			bool boExist = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boExist;
		}

		/// <summary>
		/// Chequea si existe algún número de orden que sea igual al pasado como parámetro NoOrden,
		/// para el que el Id sea diferente, o sea, es util para cuando se está editando el módulo
		/// y se necesita comprobar que el NoOrden que se está proponiendo no está asignado a otro 
		/// módulo.
		/// </summary>
		/// <param name="Id"></param>
		/// <param name="NoOrden"></param>
		/// <returns></returns>
		public bool ExistNoOrden(System.Byte Id, System.Byte NoOrden)
		{
			string strSQL = "SELECT NoOrden FROM " + this.m_TableName + " WHERE Id!=" + Id + " AND NoOrden=" + NoOrden + ";";
			System.Diagnostics.Debug.WriteLine(strSQL);
			clsDAL oDAL = new clsDAL();
			bool boExist = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boExist;
		}

		/// <summary>
		/// Comprueba que el Nombre corto que se pasa como parámetro no existe,
		/// si existe devuelve true.
		/// </summary>
		/// <param name="NombreCorto"></param>
		/// <returns></returns>
		public bool ExistNombreCorto(System.String NombreCorto)
		{
			string strSQL = "SELECT COUNT(NombreCorto) FROM " + this.m_TableName + " WHERE NombreCorto='" + NombreCorto + "';";
			clsDAL oDAL = new clsDAL();
			bool boExist = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boExist;
		}

		/// <summary>
		/// Chequea si existe algún Nombre corto que sea igual al pasado como parámetro NombreCorto,
		/// para el que el Id sea diferente, o sea, es util para cuando se está editando el módulo
		/// y se necesita comprobar que el NombreCorto que se está proponiendo no está asignado a otro 
		/// módulo.
		/// </summary>
		/// <param name="Id"></param>
		/// <param name="NombreCorto"></param>
		/// <returns></returns>
		public bool ExistNombreCorto(System.Byte Id, System.String NombreCorto)
		{
			string strSQL = "SELECT COUNT(NombreCorto) FROM " + this.m_TableName + " WHERE Id!=" + Id + " AND NombreCorto='" + NombreCorto + "';";
			System.Diagnostics.Debug.WriteLine(strSQL);
			clsDAL oDAL = new clsDAL();
			bool boExist = System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return boExist;
		}

		/// <summary>
		/// Devuelve true si el módulo cuyo Id se pase como parámetro puede ser borrado, 
		/// atendiendo a las reglas de integridad referencias, o sea si no existen registros
		/// en otras tablas a nombre del mismo.
		/// </summary>
		/// <param name="Id"></param>
		/// <returns></returns>
		public bool canBeDeleted(System.Byte Id)
		{
			bool boResult = true;
            string strSQL = "SELECT DISTINCT " + //tbl_modulo.Id, 
				"CASE WHEN tbl_curso.Id_Modulo=tbl_modulo.Id THEN true ELSE false END AS Curso, " +
                "CASE WHEN tbl_maestria.ModuloActual=tbl_modulo.Id THEN true ELSE false END AS Maestria " +
                "FROM tbl_modulo " + 
				"LEFT JOIN tbl_curso ON tbl_modulo.Id = tbl_curso.Id_Modulo " +
                "LEFT JOIN tbl_maestria ON tbl_modulo.Id = tbl_maestria.ModuloActual " +
                "WHERE tbl_modulo.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
            DataTable dtModulo = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtModulo.Rows.Count==0){return false;}

			for(int x=0; x<=(dtModulo.Columns.Count-1); x++)
			{
				//System.Diagnostics.Debug.WriteLine("Id: " + Id + " " + dtModulo.Columns[x].ColumnName + ": " + dtModulo.Rows[0][x].ToString());
				if(System.Convert.ToBoolean(dtModulo.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.Byte Id)
		{
			string strSQL = "SELECT DISTINCT " + //tbl_modulo.Id, 
				"CASE WHEN tbl_curso.Id_Modulo=tbl_modulo.Id THEN true ELSE false END AS Curso, " +
				"CASE WHEN tbl_maestria.ModuloActual=tbl_modulo.Id THEN true ELSE false END AS Maestria " +
				"FROM tbl_modulo " + 
				"LEFT JOIN tbl_curso ON tbl_modulo.Id = tbl_curso.Id_Modulo " +
				"LEFT JOIN tbl_maestria ON tbl_modulo.Id = tbl_maestria.ModuloActual " +
				"WHERE tbl_modulo.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtModulo = oDAL.getDataTable(strSQL);
			// Comprobar si existe el módulo.
			if(dtModulo.Rows.Count==0){return ("El módulo ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtModulo.Columns.Count-1); x++)
			{
				//System.Diagnostics.Debug.WriteLine("Id: " + Id + " " + dtModulo.Columns[x].ColumnName + ": " + dtModulo.Rows[0][x].ToString());
				if(System.Convert.ToBoolean(dtModulo.Rows[0][x]))
				{
//					if(sbResult.Length==0)
//					{
//						sbResult.Append("El módulo con nombre: '" + this.getNombreCorto(Id) + "' no puede ser eliminado por la(s) siguiente(s) causa(s): ");
//					}
					switch(dtModulo.Columns[x].ColumnName)
					{
						case "Curso":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Existe, al menos, un 'Curso' que pertenece al mismo."); 
							break;
						}
						case "Maestria":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append(System.Environment.NewLine + "Es el módulo que aparece como 'Módulo actual' para esta Maestría."); 
							break;
						}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	}	// Fin de la clase.
}	// Fin del namespace.
