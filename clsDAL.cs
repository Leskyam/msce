using System;
using System.Data; // Para los DataTable, DataSet, DataReader.
using MySql.Data.MySqlClient; // Para objetos específicos del proveedor administrado de MySql.

namespace ISPCFG.Msce
{
	/// <summary>
	/// Esta clase encapsula el acceso a datos, su nombre viene de "Data Access Layer".
	/// </summary>
	// Ejemplo de cadena de conexión utilizando ByteFX.Data.dll
	// m_oConn.ConnectionString = "server=DBServer;username=YourUserName;password=YourPassword;Database=DBName"

	public class clsDAL
	{
		#region "*** CONSTRUCTORES DE LA CLASE ***"
		
		// *******************************************************
		// *******************************************************
		/// <summary>
		/// CONSTRUCTOR DE LA CLASE QUE FUERZA A QUIEN LA INSTANCIE
		/// A PROPORCIONAR LOS VALORES PARA LA CADENA DE CONEXIÓN.
		/// </summary>
		/// <param name="strServerName">Nombre del servidor de bases de datos que se utilizará.</param>
		/// <param name="strDataBaseName">Nombre de la base de datos que almacena los datos de la aplicación.</param>
		/// <param name="strUserName">Nombre del usuario con acceso a los datos.</param>
		/// <param name="strPassword">Contraseña según como corresponda para el usuario.</param>
		public clsDAL(string strServerName, string strDataBaseName, string strUserName, string strPassword)
		{
			m_oConn = new MySql.Data.MySqlClient.MySqlConnection("Server=" + strServerName + ";Database=" + strDataBaseName + ";Username=" + strUserName + ";Password=" + strPassword + ";Connection timeout=10");
		}

		/// <summary>
		/// CONSTRUCTOR DE LA CLASE QUE PERMITE QUE SEA INSTANCIADA 
		/// SIN PROPORCIONAR LOS VALORES PARA LA CADENA DE CONEXIÓN
		/// TOMANDO LOS VALORES PREESTABLECIDOS.
		/// </summary>
		public clsDAL()
		{
			m_oConn = new MySql.Data.MySqlClient.MySqlConnection(
                "Server=" + clsSettings.DBServer + 
                ";Database=" + clsSettings.DBName + 
                ";Username=" + clsSettings.DBUserName + 
                ";Password=" + clsSettings.DBUserPassword + 
                ";Connection timeout=10");
		}

		#endregion "*** FIN DE CONSTRUCTORES DE LA CLASE ***"
		
		#region "*** VARIABLES PRIVADAS ***"

		/// <summary>
		/// Objeto MySqlConnection privado, utilizado para las conexiones a la base de datos.
		/// </summary>
		private MySql.Data.MySqlClient.MySqlConnection m_oConn;	// Objeto MySqlConnection
		/// <summary>
		/// Indicador para saber si se está en una transacción.
		/// </summary>
		private bool m_IN_TRANSACTION = false;
		/// <summary>
		/// Objeto MySqlTransaction utilizado para las transacciones.
		/// </summary>
		private MySql.Data.MySqlClient.MySqlTransaction m_oTRANSACTION;
		
		#endregion "*** FIN DE VARIABLES PRIVADAS ***"

		#region "*** PROPIEDADES PÚBLICAS ***"

		#endregion "*** FIN DE PROPIEDADES PÚBLICAS ***"

		#region "*** PROCEDIMIENTOS PRIVADOS ***"

		// **************************************************
		// DEVUELVE UN OBJETO MySqlConnection
		// **************************************************
		private MySql.Data.MySqlClient.MySqlConnection getConnection()
		{
			if(m_oConn.State == System.Data.ConnectionState.Open)
			{
				return m_oConn;
			}
			else
			{
//				try
//				{
					m_oConn.Open();
					return m_oConn;
//				}
//				catch(System.Exception Ex)
//				{
//          System.Diagnostics.Debug.WriteLine(Ex.ToString());
//					throw new System.Exception("Error al abrir la conexión con la base de datos.");
//				}
			}

		} // Fin de getConnection()

		// **************************************************
		// CIERRA LA CONEXIÓN DEL OBJETO oConn EN CASO QUE SE
		// ENCUENTRE ABIERTA.
		// **************************************************
		private void CloseConnection()
		{
			if(m_oConn.State == System.Data.ConnectionState.Open)
			{
				m_oConn.Close();
			}
			
			return;

		} // Fin de CloseConnection()

		#endregion "*** FIN DE PROCEDIMIENTOS PRIVADOS ***"

		#region "*** PROCEDIMIENTOS PÚBLICOS ***"

		/// <summary>
		/// Abre una conexión en modo de transacción, todos los métodos que se ejecuten a continuación
		/// y hasta que se ejecute el método CommitTrans() ó RollBackTrans() se harán bajo la transacción iniciada por éste.
		/// </summary>
		/// <returns></returns>
		public bool BeginTrans()
		{
			this.m_IN_TRANSACTION = true;
			this.m_oTRANSACTION = getConnection().BeginTransaction();
			return this.m_IN_TRANSACTION;
		}
		/// <summary>
		/// Hace efectivas las modificaciones hechas desde que se inició la transacción utilizando el método BeginTrans()
		/// </summary>
		/// <returns></returns>
		public bool CommitTrans()
		{
			if(this.m_IN_TRANSACTION)
			{
				this.m_oTRANSACTION.Commit();
			}

			this.m_IN_TRANSACTION = false;
			return true;

		}
		/// <summary>
		/// Deshace los cambios hechos en caso que se halla iniciado una transacción utilizando el método BeginTrans().
		/// </summary>
		public void RollBackTrans()
		{
			if(this.m_IN_TRANSACTION)
			{
				this.m_oTRANSACTION.Rollback();
			}

			this.m_IN_TRANSACTION = false;
		}

		/// <summary>
		/// Devuelve un objeto DataTable a partir de los parámetros pasados.
		/// </summary>
		/// <param name="strSelectSQL">Sentencia SELECT para llenar el objeto DataTable.</param>
		/// <returns></returns>
		public System.Data.DataTable getDataTable(string strSelectSQL)
		{
			MySql.Data.MySqlClient.MySqlDataAdapter oDA = new MySql.Data.MySqlClient.MySqlDataAdapter(strSelectSQL, m_oConn);
			System.Data.DataTable oDT = new System.Data.DataTable();
			oDA.Fill(oDT);
			return oDT;
		}

		/// <summary>
		/// Devuelve la cantidad de registros afectados al ejecutar la sentencia SQL que se pasa como parámetro, 
		/// debe utilizarse una sentencia UPDATE ó INSERT. 
		/// </summary>
		/// <param name="strSQL">Sentencia SQL a ejecutar.</param>
		/// <returns></returns>
		public int ExecCommand(string strSQL)
		{
			int intRecordsAffected;
			MySql.Data.MySqlClient.MySqlCommand oCommand = new MySql.Data.MySqlClient.MySqlCommand(strSQL, this.m_oConn);

			if(this.m_IN_TRANSACTION)
			{
				oCommand.Transaction = this.m_oTRANSACTION;
				intRecordsAffected = oCommand.ExecuteNonQuery();
			}
			else
			{
				this.getConnection();
				intRecordsAffected = oCommand.ExecuteNonQuery();
				this.CloseConnection();
			}

			return intRecordsAffected;

		} // Fin de ExecCommand()

		/// <summary>
		/// Obtiene el valor del ID del último registro insertado en la tabla que se pase como parámetro 'strTableName'.
		/// </summary>
		/// <param name="strTableName">Nombre de la tabla de la que se desea recuperar el último Id insertado.</param>
		/// <returns></returns>
		public object getLastIDENTITY(string strTableName)
		{
			// object oIDENTITY;
			string strSQL = "SELECT @@IDENTITY FROM " + strTableName + ";";
			return getEscalarValue(strSQL);
		}

		/// <summary>
		/// Devuelve el valor del primer campo, del primer registro según la consulta que se pase como parámetro.
		/// </summary>
		/// <param name="strSQL">Sentencia SELECT para obtener el resultado.</param>
		/// <returns></returns>
		public object getEscalarValue(string strSQL)
		{
			object oResult;
			MySql.Data.MySqlClient.MySqlCommand oCommand = new MySqlCommand(strSQL, this.m_oConn);

			if(this.m_IN_TRANSACTION)
			{
				oCommand.Transaction = this.m_oTRANSACTION;
				oResult = oCommand.ExecuteScalar();
			}
			else
			{
				this.getConnection();
				oResult = oCommand.ExecuteScalar();
				this.CloseConnection();
			}

			return oResult;
		
		} // Fin de getEscalarValue()

		#endregion "*** FIN DE PROCEDIMIENTOS PÚBLICOS ***"


	}
}
