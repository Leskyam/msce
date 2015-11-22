/*
	FICHERO CON FUNCIONES DE UTILIDAD PARA EJECUCIÓN DEL LADO DEL CLIENTE
	APLICACIÓN: Maestrías a distancia
	AUTOR: Lesky Alfonos M.
	FECHA: 07 de Junio del 2006
*/


/*
	ESPERA QUE EL VALOR DEL PARÁMETRO strDate CUMPLA CON EL FORMATO 
	DD-MMM-YYYY Y SI ES ASÍ Y EL MES SE PUEDE CONVERTIR A ENTERO,
	ENTONCES DEVUELVE UN OBJETO DATE CON LOS VALORES PERTIENENTES.
*/
function getDateFromString(strDate)
{
	//var re = new RegExp("^[0-9]{1,2}$");	// Dia
	//var re = new RegExp("^[-]{1}$");			//Separator
	//var re = "^[a-zA-Z]{3}$";							// Mes
	//var re = new RegExp("^[0-9]{4}$");		// Año
	// Expresión regular para el formato "dia-Mes-Año". Ejemplo: 01-Sep-2005
	re = RegExp("^[0-9]{1,2}[-]{1}[a-zA-Z]{3}[-]{1}[0-9]{4}$");
	
	if(!strDate.match(re)==true)
	{
		hoy = new Date();
		throw "El formato de la fecha debe ser \"dd-mmm-aaaa\". Ej: \"" + getStringFromDate(hoy) + "\"";
	}
		
	// Obtener la fecha 
	var myDate = new Date();
	try
	{
		// Posiciones de los separadores.
		var sep1Pos = strDate.indexOf('-');
		var sep2Pos = strDate.lastIndexOf('-');
		myDate.setDate(strDate.substring(0,sep1Pos)); // Día
		myDate.setMonth(getMonthFromString(strDate.substring(sep1Pos+1,sep2Pos))); // Mes
		myDate.setFullYear(strDate.substring(sep2Pos+1)); // Año
	}
	catch(e)
	{
		throw "El valor de la fecha: " + strDate + " no es válido.<br>" + e.toString();
	}
	
	return myDate;
	
}


/*
	ESPERA QUE EL VALOR DEL PARÁMETRO oDate SEA UN VALOR FECHA 
	Y DEVUELVE UNA CADENA CON FORMATO DD-MMM-YYYY.
*/
function getStringFromDate(oDate)
{
	var dia = oDate.getDate();
	var mes = oDate.getMonth();
	var year = oDate.getFullYear();
	var strDate = dia<=9?"0".concat(dia):dia;
	strDate+="-";
	strDate+=getAbrFromMonth(mes);
	strDate+="-";
	strDate+=year;

	return strDate;
}

/*
	ESPERA AQUE EL PARÁMETRO strMonth ESTÉ SEA UN MES EN EL FORMATO "mmm",
	SI ES ASÍ DEVUELVE EL ENTERO QUE EQUIVALE A MES DEL MISMO.
*/
function getMonthFromString(strMonth)
{
	var tmpMonth = strMonth.toLowerCase();
	
	switch(tmpMonth)
	{
		case "ene":
		case "enero":
		{
			return 0;
			//break;
		}
		case "feb":
		case "febrero":
		{
			return 1;
			//break;
		}
		case "mar":
		case "marzo":
		{
			return 2;
			//break;
		}
		case "abr":
		case "abril":
		{
			return 3;
			//break;
		}
		case "may":
		case "mayo":
		{
			return 4;
			//break;
		}
		case "jun":
		case "junio":
		{
			return 5;
			//break;
		}
		case "jul":
		case "julio":
		{
			return 6;
			//break;
		}
		case "ago":
		case "agosto":
		{
			return 7;
			//break;
		}
		case "sep":
		case "septiembre":
		{
			return 8;
			//break;
		}
		case "oct":
		case "octubre":
		{
			return 9;
			//break;
		}
		case "nov":
		case "noviembre":
		{
			return 10;
			//break;
		}
		case "dic":
		case "diciembre":
		{
			return 11;
			//break;
		}
		default:
		{
			throw "Error: '" + strMonth + "' no es un mes válido";
		}
	}
}
	
/*
	ESPERA AQUE EL PARÁMETRO intMonth SEA	EL ENTERO QUE 
	REPRESENTA EL MES, SI ES ASÍ DEVUELVE LA ABREVIATURA
	DEL MISMO EN ESPAÑOL.
*/
function getAbrFromMonth(intMonth)
{
	switch(intMonth)
	{
		case 0:
		{
			return "ene";
			//break;
		}
		case 1:
		{
			return "feb";
			//break;
		}
		case 2:
		{
			return "mar";
			//break;
		}
		case 3:
		{
			return "abr";
			//break;
		}
		case 4:
		{
			return "may";
			//break;
		}
		case 5:
		{
			return "jun";
			//break;
		}
		case 6:
		{
			return "jul";
			//break;
		}
		case 7:
		{
			return "ago";
			//break;
		}
		case 8:
		{
			return "sep"
			//break;
		}
		case 9:
		{
			return "oct";
			//break;
		}
		case 10:
		{
			return "nov";
			//break;
		}
		case 11:
		{
			return "dic";
			//break;
		}
		default:
		{
			alert("Error: '" + intMonth + "' no es un mes válido");
		}
	}

}

