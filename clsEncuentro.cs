using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsEncuentro.
	/// </summary>
	public class clsEncuentro
	{
		public clsEncuentro()
		{

		}
		public clsEncuentro(System.UInt32 Id)
		{
			setFieldsValue(Id);
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.UInt32 m_Id;
		private System.UInt32 m_IdUsuarioDocente;
		private System.Byte m_IdGrupo;
		private System.DateTime m_datFecha;
		private System.String m_Orientaciones;
		private System.String m_TableName = "tbl_encuentro_orientaciones";

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.UInt32 Id
		{
			get{return this.m_Id;}
			set{this.m_Id = value;}
		}

		public System.UInt32 IdUsuarioDocente
		{
			get{return this.m_IdUsuarioDocente;}
			set{this.m_IdUsuarioDocente = value;}
		}

		public System.Byte IdGrupo
		{
			get{return this.m_IdGrupo;}
			set{this.m_IdGrupo = value;}
		}

		public System.DateTime datFecha
		{
			get{return this.m_datFecha;}
			set{this.m_datFecha = value;}
		}

		public System.String Orientaciones
		{
			get{return this.m_Orientaciones;}
			set{this.m_Orientaciones = value;}
		}
		
		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"
		
		private void setFieldsValue(System.UInt32 Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE " + this.m_TableName + ".Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dtEncuentro = oDAL.getDataTable(strSQL);
			oDAL = null;
			if(dtEncuentro.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToUInt32(dtEncuentro.Rows[0]["Id"]);
				this.m_IdUsuarioDocente = System.Convert.ToUInt32(dtEncuentro.Rows[0]["Id_UsuarioDocente"]);
				this.m_IdGrupo = System.Convert.ToByte(dtEncuentro.Rows[0]["Id_Grupo"]);
				this.m_datFecha = System.Convert.ToDateTime(dtEncuentro.Rows[0]["datFecha"]);
				this.m_Orientaciones = System.Convert.ToString(dtEncuentro.Rows[0]["Orientaciones"]);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		public DataTable getAllRecords()
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public DataTable getRecord(System.UInt32 Id)
		{
			string strSQL = "SELECT * FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		/// <summary>
		/// Devuelve los campos: Id, Id_UsuarioDocente, Docente (nombre completo), Sede, Grupo, datFecha, Orientaciones. 
		/// Ordenada de manera descendente por datFecha y de manera ascendente por Docente
		/// </summary>
		/// <returns></returns>
		public DataTable getLista()
		{
			string strSQL = "SELECT tbl_encuentro_orientaciones.Id, tbl_encuentro_orientaciones.Id_UsuarioDocente, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Docente, " +
				"tbl_sede.Nombre AS Sede, tbl_grupo.Nombre AS Grupo, tbl_encuentro_orientaciones.datFecha, " +
				"tbl_encuentro_orientaciones.Orientaciones, " +
				"CASE WHEN tbl_encuentro_orientaciones.datFecha>(ADDDATE(CURDATE(), INTERVAL 3 DAY)) THEN true ELSE False END AS Editable " + 
				"FROM tbl_encuentro_orientaciones " +
				"INNER JOIN tbl_usuario ON tbl_encuentro_orientaciones.Id_UsuarioDocente=tbl_usuario.Id " +
				"INNER JOIN tbl_grupo ON tbl_encuentro_orientaciones.Id_Grupo=tbl_grupo.Id " +
				"INNER JOIN tbl_sede ON tbl_grupo.Id_Sede=tbl_sede.Id " + 
				"ORDER BY tbl_encuentro_orientaciones.datFecha DESC, Docente ASC;";

			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public System.UInt32 Agregar()
		{
			string strSQL = "INSERT INTO " + this.m_TableName + " " +
				"VALUES(null, " + this.m_IdUsuarioDocente + ", " + this.m_IdGrupo + ", '" + clsUtiles.getStringMySqlFormatedDate(this.m_datFecha) + "', '" + this.m_Orientaciones + "');";
			
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
				throw new System.Exception("Error al insertar encuentro.", Ex);
			}
		}
		
		public bool Actualizar()
		{
			string strSQL = "UPDATE " + this.m_TableName + " SET Id_UsuarioDocente=" + this.m_IdUsuarioDocente + ", Id_Grupo=" + this.m_IdGrupo + ", datFecha='" + clsUtiles.getStringMySqlFormatedDate(this.m_datFecha) + "', Orientaciones='" + this.m_Orientaciones + "' WHERE Id=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}

		public bool Eliminar()
		{
			string strSQL = "DELETE FROM " + this.m_TableName + " WHERE Id=" + this.m_Id + ";";
			clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}

		public bool Eliminar(System.UInt32 Id)
		{
			string strSQL = "DELETE FROM " + this.m_TableName + " WHERE Id=" + Id + ";";
			clsDAL oDAL = new clsDAL();
			bool boResult = System.Convert.ToBoolean(oDAL.ExecCommand(strSQL));
			oDAL = null;
			return boResult;
		}

		public bool areValidKeyValuesForNew()
		{
			string strSQL = "SELECT Id FROM " + this.m_TableName + " " + 
        "WHERE (Id_UsuarioDocente=" + this.m_IdUsuarioDocente + " " + 
				"AND Id_Grupo=" + this.m_IdGrupo + " " + 
				"AND datFecha='" + clsUtiles.getStringMySqlFormatedDate(this.m_datFecha) + "');";
			clsDAL oDAL = new clsDAL();
			bool boResult = !System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
      oDAL = null;
			return  boResult;
		}

		public bool areValidKeyValuesForUpdate()
		{
			string strSQL = "SELECT Id FROM " + this.m_TableName + " " + 
				"WHERE (Id_UsuarioDocente=" + this.m_IdUsuarioDocente + " " + 
				"AND Id_Grupo=" + this.m_IdGrupo + " " + 
				"AND datFecha='" + clsUtiles.getStringMySqlFormatedDate(this.m_datFecha) + "') AND (Id<>" + this.m_Id + ");";
			clsDAL oDAL = new clsDAL();
			bool boResult = !System.Convert.ToBoolean(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return  boResult;
		}

		public DataTable getPendientesByGrupo(System.Byte IdGrupo)
		{
			string strSQL = "SELECT tbl_encuentro_orientaciones.Id, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Docente, " + 
				"tbl_encuentro_orientaciones.datFecha, tbl_encuentro_orientaciones.Orientaciones " + 
				"FROM tbl_encuentro_orientaciones " +
				"INNER JOIN tbl_usuario ON tbl_encuentro_orientaciones.Id_UsuarioDocente=tbl_usuario.Id " +
				"WHERE tbl_encuentro_orientaciones.datFecha>CURDATE()=true AND tbl_encuentro_orientaciones.Id_Grupo=" + IdGrupo + " " +
        "ORDER BY tbl_encuentro_orientaciones.datFecha ASC;";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		public DataTable getObsoletosByGrupo(System.Byte IdGrupo, int cantRegistros)
		{
			string strSQL = "SELECT tbl_encuentro_orientaciones.Id, " + 
				"CONCAT(tbl_usuario.Nombre, ' ', tbl_usuario.Apellidos) AS Docente, " + 
				"tbl_encuentro_orientaciones.datFecha, tbl_encuentro_orientaciones.Orientaciones " + 
				"FROM tbl_encuentro_orientaciones " +
				"INNER JOIN tbl_usuario ON tbl_encuentro_orientaciones.Id_UsuarioDocente=tbl_usuario.Id " +
				"WHERE tbl_encuentro_orientaciones.datFecha>CURDATE()=false AND tbl_encuentro_orientaciones.Id_Grupo=" + IdGrupo + " " +
				"ORDER BY tbl_encuentro_orientaciones.datFecha DESC LIMIT 0, " + cantRegistros + ";";
			clsDAL oDAL = new clsDAL();
			DataTable dt = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dt;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"

	}	// Fin de la clase.

}	// Fin del namespace.
