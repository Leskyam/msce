using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsConsulta.
	/// </summary>
	public class clsConsulta
	{
		public clsConsulta()
		{
			//
			// TODO: agregar aquí la lógica del constructor
			//
		}
		public clsConsulta(System.UInt32 Id)
		{
			// Establecer los valores de los campos de esta clase.
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.UInt32 m_Id;
		private System.UInt32 m_IdUsuarioMaestrante;
		private System.UInt32 m_IdUsuarioDocente;
		private System.Byte m_IdTema;
		private System.DateTime m_datFechaHora;
		private System.String m_Consulta;
		private System.String m_TableName = "tbl_consulta";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.UInt32 Id
		{
			get{return this.m_Id;}
			set{this.m_Id = value;}
		}

		public System.UInt32 IdUsuarioMaestrante
		{
			get{return this.m_IdUsuarioMaestrante;}
			set{this.m_IdUsuarioMaestrante = value;}
		}

		public System.UInt32 IdUsuarioDocente
		{
			get{return this.m_IdUsuarioDocente;}
			set{this.m_IdUsuarioDocente = value;}
		}

		public System.Byte IdTema
		{
			get{return this.m_IdTema;}
			set{this.m_IdTema = value;}
		}

		public System.DateTime datFechaHora
		{
			get{return this.m_datFechaHora;}
			set{this.m_datFechaHora = value;}
		}

		public System.String Consulta
		{
			get{return this.m_Consulta;}
			set{this.m_Consulta = value;}
		}

		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.UInt32 Id)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtConsulta = oDAL.getDataTable("SELECT * FROM tbl_consulta WHERE tbl_consulta.Id=" + Id + ";");
			oDAL = null;
			if(dtConsulta.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToUInt32(dtConsulta.Rows[0]["Id"]);
				this.m_IdUsuarioMaestrante = System.Convert.ToUInt32(dtConsulta.Rows[0]["Id_UsuarioMaestrante"]);
				this.m_IdUsuarioDocente = System.Convert.ToUInt32(dtConsulta.Rows[0]["Id_UsuarioDocente"]);
				this.m_IdTema = System.Convert.ToByte(dtConsulta.Rows[0]["Id_Tema"]);
				this.m_datFechaHora = System.Convert.ToDateTime(dtConsulta.Rows[0]["datFechaHora"]);
				this.m_Consulta = System.Convert.ToString(dtConsulta.Rows[0]["Consulta"]);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"
		
		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Devuelve el número total de consultas que no tiene respuesta aún,
		/// sin tener en cuenta de quien proviene o a quien está dirigida.
		/// </summary>
		/// <returns></returns>
		public System.UInt16 getCantConsultasSinRespuesta()
		{
			string strSQL = "SELECT COUNT(tbl_consulta.Id) FROM tbl_consulta " +
				"WHERE tbl_consulta.Id NOT IN(SELECT Id_Consulta FROM tbl_consulta_respuesta);";
			clsDAL oDAL = new clsDAL();
			System.UInt16 intResult = System.Convert.ToUInt16(oDAL.getEscalarValue(strSQL));
            oDAL = null;
			return intResult;
		}

		/// <summary>
		/// Devuelve el número de consultas que no tiene respuesta aún,
		/// y que está dirigidas al Docente cuyo Id se pase como parámetro.
		/// </summary>
		/// <param name="IdDocente"></param>
		/// <returns></returns>
		public System.UInt16 getCantConsultasSinRespuesta(System.UInt32 IdDocente)
		{
			string strSQL = "SELECT COUNT(tbl_consulta.Id) FROM tbl_consulta " +
				"WHERE tbl_consulta.Id NOT IN(SELECT Id_Consulta FROM tbl_consulta_respuesta) " + 
				"AND tbl_consulta.Id_UsuarioDocente=" + IdDocente + ";";
			clsDAL oDAL = new clsDAL();
			System.UInt16 intResult = System.Convert.ToUInt16(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return intResult;
		}
		
		/// <summary>
		/// Devuelve el número de consultas que han sido respondidas, pero que no 
		/// han sido leídas para el Maestrante cuyo Id se pase como parámetro.
		/// </summary>
		/// <param name="IdMaestrante"></param>
		/// <returns></returns>
		public System.UInt16 getCantConsultasRespondidas(System.UInt32 IdMaestrante)
		{
			string strSQL = "SELECT COUNT(tbl_consulta.Id) FROM tbl_consulta " +
				"WHERE tbl_consulta.Id IN(SELECT Id_Consulta FROM tbl_consulta_respuesta WHERE Leida=0) " +
                "AND tbl_consulta.Id_UsuarioMaestrante=" + IdMaestrante + ";";
			clsDAL oDAL = new clsDAL();
			System.UInt16 intResult = System.Convert.ToUInt16(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return intResult;
		}

		/// <summary>
		/// Devuelve los campos: Id, IdMaestrante, NombreMaestrante, IdDocente, NombreDocente, datFechaHora, Tema y Consulta
		/// de aquellas consultas que no han sido respondidas aún.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getListSinRespuesta()
		{
			string strSQL = "SELECT tbl_consulta.Id, tbl_consulta.Id_UsuarioMaestrante AS IdMaestrante, " + 
				"CONCAT(tbl_maestrante.Nombre, ' ', tbl_maestrante.Apellidos) AS NombreMaestrante, " +
				"tbl_consulta.Id_UsuarioDocente AS IdDocente, " +
				"CONCAT(tbl_docente.Nombre, ' ', tbl_docente.Apellidos) AS NombreDocente, " +
				"tbl_consulta.datFechaHora, tbl_tema.Nombre AS Tema, tbl_consulta.Consulta FROM tbl_consulta " +
				"INNER JOIN tbl_usuario AS tbl_maestrante ON tbl_consulta.Id_UsuarioMaestrante=tbl_maestrante.Id " +
				"INNER JOIN tbl_usuario AS tbl_docente ON tbl_consulta.Id_UsuarioDocente=tbl_docente.Id " +
        "INNER JOIN tbl_tema ON tbl_consulta.Id_Tema=tbl_tema.Id " +
				"WHERE tbl_consulta.Id NOT IN(SELECT Id_Consulta FROM tbl_consulta_respuesta) " +
				"ORDER BY datFechaHora DESC;";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/// <summary>
		/// Devuelve los campos: Id, IdMaestrante, NombreMaestrante, IdDocente, NombreDocente, datFechaHora, Tema y Consulta
		/// de aquella consulta cuyo Id se pase como valor del parámetro "Id" y que no ha sido respondidas aún.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getSinRespuesta(System.UInt32 Id)
		{
			string strSQL = "SELECT tbl_consulta.Id, tbl_consulta.Id_UsuarioMaestrante AS IdMaestrante, " + 
				"CONCAT(tbl_maestrante.Nombre, ' ', tbl_maestrante.Apellidos) AS NombreMaestrante, " +
				"tbl_consulta.Id_UsuarioDocente AS IdDocente, " +
				"CONCAT(tbl_docente.Nombre, ' ', tbl_docente.Apellidos) AS NombreDocente, " +
				"tbl_consulta.datFechaHora, tbl_tema.Nombre AS Tema, tbl_consulta.Consulta FROM tbl_consulta " +
				"INNER JOIN tbl_usuario AS tbl_maestrante ON tbl_consulta.Id_UsuarioMaestrante=tbl_maestrante.Id " +
				"INNER JOIN tbl_usuario AS tbl_docente ON tbl_consulta.Id_UsuarioDocente=tbl_docente.Id " +
				"INNER JOIN tbl_tema ON tbl_consulta.Id_Tema=tbl_tema.Id " +
				"WHERE (tbl_consulta.Id NOT IN(SELECT Id_Consulta FROM tbl_consulta_respuesta)) AND (tbl_consulta.Id=" + Id + ");";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/// <summary>
		/// Devuelve los campos: Id, IdMaestrante, NombreMaestrante, IdDocente, NombreDocente, datFechaHora, Tema, Consulta y Respuesta
		/// de aquellas consultas que han sido respondidas, pero no han sido leídas.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getListRespondidasSinLeer()
		{
			string strSQL = "SELECT tbl_consulta.Id, tbl_consulta.Id_UsuarioMaestrante AS IdMaestrante, " + 
				"CONCAT(tbl_maestrante.Nombre, ' ', tbl_maestrante.Apellidos) AS NombreMaestrante, " +
				"tbl_consulta.Id_UsuarioDocente AS IdDocente, " +
				"CONCAT(tbl_docente.Nombre, ' ', tbl_docente.Apellidos) AS NombreDocente, " +
				"tbl_consulta_respuesta.datFechaHora, tbl_tema.Nombre AS Tema, tbl_consulta.Consulta, " + 
				"tbl_consulta_respuesta.Respuesta FROM tbl_consulta " +
				"INNER JOIN tbl_consulta_respuesta ON tbl_consulta.Id=tbl_consulta_respuesta.Id_Consulta " +
        "INNER JOIN tbl_usuario AS tbl_maestrante ON tbl_consulta.Id_UsuarioMaestrante=tbl_maestrante.Id " +
				"INNER JOIN tbl_usuario AS tbl_docente ON tbl_consulta.Id_UsuarioDocente=tbl_docente.Id " +
				"INNER JOIN tbl_tema ON tbl_consulta.Id_Tema=tbl_tema.Id " +
				"WHERE tbl_consulta.Id IN(SELECT Id_Consulta FROM tbl_consulta_respuesta WHERE Leida=0) " +
				"ORDER BY datFechaHora DESC;";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/// <summary>
		/// Devuelve los campos: Id, NombreMaestrante, NombreDocente, datFechaHoraConsulta, Consulta, 
		/// datFechaHoraRespuesta, Respuesta; de aquella consulta cuyo Id se pase como valor del parámetro "Id" 
		/// y que no ha sido respondidas aún.
		/// </summary>
		/// <returns></returns>
		public System.Data.DataTable getRespondidaSinLeer(System.UInt32 Id)
		{
			string strSQL = "SELECT tbl_consulta.Id, CONCAT(tbl_docente.Nombre, ' ', tbl_docente.Apellidos) AS Docente, " + 
				"tbl_tema.Nombre AS Tema, " +
				"tbl_consulta.datFechaHora AS datFechaHoraConsulta, tbl_consulta.Consulta, " +
				"tbl_consulta_respuesta.datFechaHora AS datFechaHoraRespuesta, tbl_consulta_respuesta.Respuesta " +
        "FROM tbl_consulta " +
				"INNER JOIN tbl_consulta_respuesta ON tbl_consulta.Id=tbl_consulta_respuesta.Id_Consulta " +
				"INNER JOIN tbl_usuario AS tbl_docente ON tbl_consulta.Id_UsuarioDocente=tbl_docente.Id " +
				"INNER JOIN tbl_tema ON tbl_consulta.Id_Tema=tbl_tema.Id " +
				"WHERE ((tbl_consulta.Id IN(SELECT Id_Consulta FROM tbl_consulta_respuesta WHERE Leida=0)) AND (tbl_consulta.Id=" + Id + "));";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public bool marcarComoLeida(System.UInt32 Id)
		{
			string strSQL = "UPDATE tbl_consulta_respuesta SET Leida=1 WHERE Id_Consulta=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}

		public System.UInt32 Agregar()
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, " + this.IdUsuarioMaestrante + ", " + this.IdUsuarioDocente + ", " + this.IdTema + ", '" + clsUtiles.getStringMySqlFormatedDate(this.datFechaHora) + "', '" + this.Consulta + "');";
			
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				oDAL.ExecCommand(strSQL);
				System.UInt32 intIdentity = System.Convert.ToUInt32(oDAL.getLastIDENTITY(this.m_TableName));
				oDAL.CommitTrans();
				oDAL = null;
				return intIdentity;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al insertar consulta.", Ex);
			}
		}

		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET Id_UsuarioMaestrante=" + this.m_IdUsuarioMaestrante + ", Id_UsuarioDocente=" + this.IdUsuarioDocente + ", Id_Tema=" + this.m_IdTema + ", datFechaHora= '" + clsUtiles.getStringMySqlFormatedDate(this.m_datFechaHora) + "', Consulta='" + this.m_Consulta + "'" +
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
				throw new System.Exception("Error al actualizar consulta.", Ex);
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

		public bool Eliminar(System.UInt32 Id)
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

		public bool canBeDeleted(System.UInt32 Id)
		{
			bool boResult = true;
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_consulta_respuesta.Id_Consulta=tbl_consulta.Id THEN true ELSE false END AS Respuesta " +
				"FROM tbl_consulta " +
				"LEFT JOIN tbl_consulta_respuesta ON tbl_consulta.Id = tbl_consulta_respuesta.Id_Consulta " +
				"WHERE tbl_consulta.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtConsulta = oDAL.getDataTable(strSQL);
			oDAL = null;
			// Comprobar que existe un registro.
			if(dtConsulta.Rows.Count==0){return false;}

			for(int x=0; x<=(dtConsulta.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtConsulta.Rows[0][x])){return false;}
			}
			return boResult;
		}

		public System.String[] WhyCanNotBeDeleted(System.UInt32 Id)
		{
			string strSQL = "SELECT DISTINCT " +
				"CASE WHEN tbl_consulta_respuesta.Id_Consulta=tbl_consulta.Id THEN true ELSE false END AS Respuesta " +
				"FROM tbl_consulta " +
				"LEFT JOIN tbl_consulta_respuesta ON tbl_consulta.Id = tbl_consulta_respuesta.Id_Consulta " +
				"WHERE tbl_consulta.Id=" + Id + ";";
			
			clsDAL oDAL = new clsDAL();
			DataTable dtConsulta = oDAL.getDataTable(strSQL);
			// Comprobar si existe la consulta.
			if(dtConsulta.Rows.Count==0){return ("La consulta ya no existe.").Split('|');}

			// Objeto StringBuilder donde almacenaremos el resultado temporalmente.
			System.Text.StringBuilder sbResult = new System.Text.StringBuilder();
            
			for(int x=0; x<=(dtConsulta.Columns.Count-1); x++)
			{
				if(System.Convert.ToBoolean(dtConsulta.Rows[0][x]))
				{
					switch(dtConsulta.Columns[x].ColumnName)
					{
						case "Respuesta":
						{
							if(sbResult.Length!=0){sbResult.Append("|");}
							sbResult.Append("Esta 'Consulta' ya ha sido respondida por el Docente al que fue dirigida."); 
							break;
						}
					}
				}
			}
			return sbResult.ToString().Split('|');
		}

		/// <summary>
		/// Devuelve los campos: Id, Maestrante, Docente, Tema, FechaHoraConsulta, Consulta, FechaHoraRespuesta, 
		/// Respuesta y Leida, de aquellas consultas que coincidan según los parámetros que se pasan. 
		/// </summary>
		/// <param name="criterioIdTema"></param>
		/// <param name="criterioIdUsuarioDocente"></param>
		/// <param name="criterioIdusuarioMaestrante"></param>
		/// <param name="criterioCadena"></param>
		/// <returns></returns>
		public DataTable Buscar(string criterioIdTema, string criterioIdDocente, 
			string criterioIdMaestrante, string criterioCadena)
		{
			string strSQL = "SELECT tbl_consulta.Id, CONCAT(table_maestrante.Nombre, ' ', table_maestrante.Apellidos) AS Maestrante, " + 
				"CONCAT(table_docente.Nombre, ' ', table_docente.Apellidos) AS Docente, tbl_tema.Nombre AS Tema, " +
				"tbl_consulta.datFechaHora AS FechaHoraConsulta, tbl_consulta.Consulta AS Consulta, " +
				"tbl_consulta_respuesta.datFechaHora AS FechaHoraRespuesta, " +
				"tbl_consulta_respuesta.Respuesta AS Respuesta,  tbl_consulta_respuesta.Leida AS Leida " +
        "FROM tbl_consulta " +
        "INNER JOIN tbl_usuario AS table_maestrante ON table_maestrante.Id=tbl_consulta.Id_UsuarioMaestrante " +
				"INNER JOIN tbl_usuario AS table_docente ON table_docente.Id=tbl_consulta.Id_UsuarioDocente " +
				"INNER JOIN tbl_tema ON tbl_consulta.Id_Tema=tbl_tema.Id " +
				"INNER JOIN tbl_consulta_respuesta ON tbl_consulta.Id=tbl_consulta_respuesta.Id_consulta " +
				"WHERE (tbl_consulta.Id_Tema" + criterioIdTema + ") AND " +
				"(tbl_consulta.Id_UsuarioDocente" + criterioIdDocente + ") AND " +
				"(tbl_consulta.Id_UsuarioMaestrante" + criterioIdMaestrante + ") AND " +
				"(tbl_consulta.Consulta LIKE '" + criterioCadena + "' OR tbl_consulta_respuesta.Respuesta LIKE '" + criterioCadena + "') " +
				"ORDER BY tbl_consulta_respuesta.datFechaHora DESC;";
			clsDAL oDAL = new clsDAL();
			DataTable dt;
			dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

	}	// Fin de la clase.

	/// <summary>
	/// clase para las Respuestas a las consultas.
	/// </summary>
	public class clsConsultaRespuesta
	{
		public clsConsultaRespuesta()
		{
		}
		public clsConsultaRespuesta(System.UInt32 Id)
		{
			// Establecer los valores de los campos de esta clase.
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.UInt32 m_IdConsulta;
		private System.DateTime m_datFechaHora;
		private System.String m_Respuesta;
		private System.Boolean m_Leida;
		private System.String m_TableName = "tbl_consulta_respuesta";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.UInt32 IdConsulta
		{
			get{return this.m_IdConsulta;}
			set{this.m_IdConsulta = value;}
		}

		public System.DateTime datFechaHora
		{
			get{return this.m_datFechaHora;}
			set{this.m_datFechaHora = value;}
		}

		public System.String Respuesta
		{
			get{return this.m_Respuesta;}
			set{this.m_Respuesta = value;}
		}

		public System.Boolean Leida
		{
			get{return this.m_Leida;}
			set{this.m_Leida = value;}
		}


		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.UInt32 IdConsulta)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtRespuesta = oDAL.getDataTable("SELECT * FROM " + this.m_TableName + " WHERE Id_Consulta=" + IdConsulta + ";");
			oDAL = null;
			if(dtRespuesta.Rows.Count==1)
			{
				this.m_IdConsulta = System.Convert.ToUInt32(dtRespuesta.Rows[0]["Id_Consulta"]);
				this.m_datFechaHora = System.Convert.ToDateTime(dtRespuesta.Rows[0]["datFechaHora"]);
				this.m_Respuesta = System.Convert.ToString(dtRespuesta.Rows[0]["Respuesta"]);
				this.m_Leida = System.Convert.ToBoolean(dtRespuesta.Rows[0]["Leida"]);
			}
		}

		private bool existRespuesta(System.UInt32 Id)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtRespuesta = oDAL.getDataTable("SELECT Id_Consulta FROM " + this.m_TableName + " WHERE Id_Consulta=" + Id + ";");
			oDAL = null;
			return System.Convert.ToBoolean(dtRespuesta.Rows.Count);
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"
		
		public System.UInt32 Agregar()
		{
			if(existRespuesta(this.m_IdConsulta)){return 0;}
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(" + this.m_IdConsulta + ", '" + clsUtiles.getStringMySqlFormatedDate(this.m_datFechaHora) + "', '" + this.m_Respuesta + "', " + this.m_Leida + ");";
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.ExecCommand(strSQL);
				oDAL = null;
				return this.m_IdConsulta;
			}
			catch(System.Exception Ex)
			{
				throw new System.Exception("Error al insertar respuesta de consulta.", Ex);
			}
		}

		public System.UInt32 getCantRespuestas()
		{
			string strSQL = "SELECT COUNT(Id_Consulta) AS CantRespuestas FROM tbl_consulta_respuesta;";
			clsDAL oDAL = new clsDAL();
			System.UInt32 intResult;
			intResult = System.Convert.ToUInt32(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return intResult;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

		
	} // Fin de la clase.


}	// Fin del namespace.
