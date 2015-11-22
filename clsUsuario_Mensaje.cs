using System;
using System.Data;

namespace ISPCFG.Msce
{
	/// <summary>
	/// Descripción breve de clsUsuario_Mensaje.
	/// </summary>
	public class clsUsuario_Mensaje
	{
		public clsUsuario_Mensaje()
		{
			//
			// TODO: agregar aquí la lógica del constructor
			//
		}

		public clsUsuario_Mensaje(System.UInt32 Id)
		{
			setFieldsValue(Id);			
		}

		#region "*** VARIABLES PRIVADAS ***"

		private System.UInt32 m_Id;
		private System.UInt32 m_IdUsuarioFrom;
		private System.UInt32 m_IdUsuarioTo;
        private System.DateTime m_datFechaHora;
		private System.String m_Mensaje;

		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES ***"

		public System.UInt32 Id
		{
			get{return this.m_Id;}
		}

		public System.UInt32 IdUsuarioFrom
		{
			get{return this.m_IdUsuarioFrom;}
			set{this.m_IdUsuarioFrom = value;}
		}
		
		public System.UInt32 IdUsuarioTo
		{
			get{return this.m_IdUsuarioTo;}
			set{this.m_IdUsuarioTo = value;}
		}
		
		public System.DateTime datFechaHora
		{
			get{return this.m_datFechaHora;}
			set{this.m_datFechaHora = value;}
		}

		public System.String Mensaje
		{
			get{return this.m_Mensaje;}
			set{this.m_Mensaje = value;}
		}

		#endregion "*** FIN DE PROPIEDADES ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		private void setFieldsValue(System.UInt32 Id)
		{
			clsDAL oDAL = new clsDAL();
			DataTable dtMensaje = oDAL.getDataTable("SELECT * FROM tbl_usuario_mensaje WHERE tbl_usuario_mensaje.Id=" + Id + ";");
			oDAL = null;
			if(dtMensaje.Rows.Count==1)
			{
				this.m_Id = System.Convert.ToUInt32(dtMensaje.Rows[0]["Id"]);
				this.m_IdUsuarioFrom = System.Convert.ToUInt32(dtMensaje.Rows[0]["Id_Usuario_From"]);
				this.m_IdUsuarioTo = System.Convert.ToUInt32(dtMensaje.Rows[0]["Id_Usuario_To"]);
				this.m_datFechaHora = System.Convert.ToDateTime(dtMensaje.Rows[0]["FechaHora"]);
				this.m_Mensaje = System.Convert.ToString(dtMensaje.Rows[0]["Mensaje"]);
			}
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"
        
		/// <summary>
		/// Agrega un nuevo mensaje tomando los valores del objeto Usuario_Mensaje
		/// actual, o sea, los valores de los campos son los establecidos a través 
		/// de las propiedades que expone esta clase. Y devuelve el valor del Id 
		/// que tomó el mensaje agregado.
		/// </summary>
		/// <returns></returns>
		public System.UInt32 Agregar()
		{
			string strSQL = "INSERT INTO tbl_usuario_mensaje " + 
				"VALUES(null, " + this.m_IdUsuarioFrom + ", " + 
				this.m_IdUsuarioTo + ", '" + 
				clsUtiles.getStringMySqlFormatedDate(this.m_datFechaHora) + "', '" + 
				this.m_Mensaje + "');";
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				oDAL.ExecCommand(strSQL);
				System.UInt32 intIdentity = System.Convert.ToUInt32(oDAL.getLastIDENTITY("tbl_usuario_mensaje"));
				//System.Diagnostics.Debug.WriteLine(intIdentity);
				oDAL.CommitTrans();
				oDAL = null;
				return intIdentity;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al insertar mensaje.", Ex);
			}
		}

		/// <summary>
		/// Agrega un nuevo mensaje tomando los valores que se pasan como parámetro
		/// y devuelve el valor del Id que tomó el mensaje agregado.
		/// </summary>
		/// <param name="IdUsuarioFrom">Id del Usuario que envía el mensaje.</param>
		/// <param name="IdUsuarioTo">Id del Usuario al que está destinado el mensaje.</param>
		/// <param name="datFechaHora">Fecha y hora de envío del mensaje.</param>
		/// <param name="Mensaje">Contenido del mensaje.</param>
		/// <returns></returns>
		public System.UInt32 Agregar(System.UInt32 IdUsuarioFrom, System.UInt32 IdUsuarioTo, System.DateTime datFechaHora, System.String Mensaje)
		{
			string strSQL = "INSERT INTO tbl_usuario_mensaje " + 
				"VALUES(null, " + IdUsuarioFrom + ", " + 
				IdUsuarioTo + ", '" + 
				clsUtiles.getStringMySqlFormatedDate(datFechaHora) + "', '" + 
				Mensaje + "');";
			clsDAL oDAL = new clsDAL();
			try
			{
				oDAL.BeginTrans();
				oDAL.ExecCommand(strSQL);
				System.UInt32 intIdentity = System.Convert.ToUInt32(oDAL.getLastIDENTITY("tbl_usuario_mensaje"));
				System.Diagnostics.Debug.WriteLine(intIdentity);
				oDAL.CommitTrans();
				oDAL = null;
				return intIdentity;
			}
			catch(System.Exception Ex)
			{
				oDAL.RollBackTrans();
				throw new System.Exception("Error al insertar mensaje.", Ex);
			}
		}

		/// <summary>
		/// Devuelve la cantidad de mensajes sin leer que tiene el usuario cuyo 
		/// Id se pase como valor de parámetro "IdUsuario".
		/// </summary>
		/// <param name="IdUsuario"></param>
		/// <returns></returns>
		public System.UInt16 getMensajesNoLeidos(System.UInt32 IdUsuario)
		{
			string strSQL = "SELECT COUNT(Id_Usuario_To) AS CANT FROM tbl_usuario_mensaje WHERE Id_Usuario_To=" + IdUsuario + ";";
			clsDAL oDAL = new clsDAL();
			System.UInt16 intResult = System.Convert.ToUInt16(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return intResult;
		}

		/// <summary>
		/// Devuelve la cantidad de mensajes sin leer que tiene el usuario cuyo 
		/// UserId se pase como valor de parámetro "UserId".
		/// </summary>
		/// <param name="IdUsuario"></param>
		/// <returns></returns>
		public System.UInt16 getMensajesNoLeidos(System.String UserId)
		{
			string strSQL = "SELECT COUNT(Id_Usuario_To) AS CANT FROM tbl_usuario_mensaje " + 
				"INNER JOIN tbl_usuario ON tbl_usuario_mensaje.Id_Usuario_To = tbl_usuario.Id " +
                "WHERE tbl_usuario.UserId = '" + UserId + "';";
			clsDAL oDAL = new clsDAL();
			System.UInt16 intResult = System.Convert.ToUInt16(oDAL.getEscalarValue(strSQL));
			oDAL = null;
			return intResult;
		}

		/// <summary>
		/// Devuelve un DataTable con un registro con los datos del próximo mensaje por leer 
		/// del usuario cuyo Id se pase como parámetro.
		/// </summary>
		/// <param name="IdUsuario">Identificador del usuario.</param>
		/// <returns></returns>
		public DataTable getNextMessage(System.UInt32 IdUsuario)
		{
			string strSQL = "SELECT * FROM tbl_usuario_mensaje " + 
				"WHERE Id_Usuario_To=" + IdUsuario + " ORDER BY FechaHora " + 
                "LIMIT 0,1;";
			clsDAL oDAL = new clsDAL();
			DataTable dtMessage = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtMessage;
		}

		/// <summary>
		/// Devuelve un DataTable con un registro con los datos del próximo mensaje por leer 
		/// del usuario cuyo UserId se pase como parámetro.
		/// </summary>
		/// <param name="UserId">UserId del usuario.</param>
		/// <returns></returns>
		public DataTable getNextMessage(System.String UserId)
		{
			string strSQL = "SELECT * FROM tbl_usuario_mensaje " +
				"WHERE tbl_usuario_mensaje.Id_Usuario_To = " + 
				"(SELECT Id FROM tbl_usuario WHERE UserId = '" + UserId + "')" +
                "ORDER BY FechaHora LIMIT 0,1;";
			clsDAL oDAL = new clsDAL();
			DataTable dtMessage = oDAL.getDataTable(strSQL);
			oDAL = null;
			return dtMessage;
		}


		public void Delete(System.UInt32 Id)
        {
			clsDAL oDAL = new clsDAL();
			oDAL.ExecCommand("DELETE FROM tbl_usuario_mensaje WHERE Id=" + Id + ";");
			oDAL = null;
		}

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"



	}	// Fin de la clase

}	 // Fin del manespace
