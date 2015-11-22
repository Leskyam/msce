/**
 * Convert a single file-input element into a 'multiple' input list
 *
 * Usage:
 *
 *   1. Create a file input element (no name)
 *      eg. <input type="file" id="first_file_element">
 *
 *   2. Create a DIV for the output to be written to
 *      eg. <div id="files_list"></div>
 *
 *   3. Instantiate a MultiSelector object, passing in the DIV and an (optional) maximum number of files
 *      eg. var files_Selector = new MultiSelector( document.getElementById( 'files_list' ), 3 );
 *
 *   4. Add the first element
 *      eg. files_Selector.addElement( document.getElementById( 'first_file_element' ) );
 *
 *   5. That's it.
 *
 *   You might (will) want to play around with the addListRow() method to make the output prettier.
 *
 *   You might also want to change the line 
 *      element.name = 'file_' + this.count;
 *      ...to a naming convention that makes more sense to you.
 * 
 * Licence:
 *   Use this however/wherever you like, just don't blame me if it breaks anything.
 *
 * Credit:
 *   If you're nice, you'll leave this bit:
 *  
 *   Class by Stickman -- http://www.the-stickman.com
 *      with thanks to:
 *      [for Safari fixes]
 *         Luis Torrefranca -- http://www.law.pitt.edu
 *         and
 *         Shawn Parker & John Pennypacker -- http://www.fuzzycoconut.com
 *      [for duplicate name bug]
 *         'neal'
 */
function MultiSelector( list_target, max ){

	// Determina si se valida contra un patern.
	this.file_patern = null;
	// Where to write the list
	this.list_target = list_target;
	// How many elements?
	this.count = 0;
	// How many elements?
	this.id = 0;
	// Is there a maximum?
	if( max ){
		this.max = max;
	} else {
		this.max = -1;
	};
	
	/**
	 * Add a new file input element
	 */
	this.addElement = function( element ){

		// Asegurarse de que es un elememto INPUT de tipo "file".
		if( element.tagName == 'INPUT' && element.type == 'file' ){
			
			// Nombre del elemento -- Identificado por el número?
			element.name = 'file_' + this.id++;

			// Agregar una referencia a este elemento.
			element.files_Selector = this;

			// Qué hacer cuando un fichero es seleccionado.
			element.onchange = function(){

				if(this.files_Selector.file_patern!=null)
				{
					var i = element.value.lastIndexOf("\\"); // Para Windows
					if(i==-1){i = element.value.lastIndexOf("/");} // Para Linux
					var fileName = element.value.substring(eval(i+1), element.value.length); 
					var regExp = new RegExp(this.files_Selector.file_patern);
					if(!fileName.match(regExp))
					{
						alert("El nombre de fichero: \"" + fileName + "\" no es válido.");
						return;
					}
				}

				// Crear un nuevo elemento file.
				var new_element = document.createElement( 'input' );
				new_element.type = 'file';
				// La clase de estilo del propio control tipo "file"
				new_element.className = 'frmTextInput'; 
				// El ancho del propio control tipo "file"
				new_element.size = "50"; 

				// Agregar un nuevo elemento.
				this.parentNode.insertBefore( new_element, this );

				// Agregar el elemento.
				this.files_Selector.addElement( new_element );

				// Actualizar la lista de ficheros.
				this.files_Selector.addListRow( this );

				// Esconder el elemento: no se utiliza display:none porque "Safari" no lo entiende.
				this.style.position = 'absolute';
				this.style.left = '-1000px';

			};
			// Si se ha llegado el número máximo, deshabilitar el elemento INPUT.
			if( this.max != -1 && this.count >= this.max ){
				element.disabled = true;
			};

			// Actualizar el texto del encabezado de la lista de ficheros.
			// Actualizar el texto del encabezado de la lista de ficheros.
			if(document.getElementById('files_list_header')!=undefined)
			{
				var countFiles = this.count;
				if(countFiles>0)
				{
					document.getElementById('files_list_header').innerHTML = "<b>Ficheros seleccionados: " + countFiles + " de " + this.max + " permitidos.</b>";
				}
				else
				{
					document.getElementById('files_list_header').innerHTML = "<b>Ficheros permitidos: " + this.max + "</b>";
				}
			}

			// Comtador de los elementos File.
			this.count++;
			// El elemento file más reciente.
			this.current_element = element;
			
		} else {
			// This can only be applied to file input elements!
			alert( 'Error: Debe seleccionar un fichero válido' );
		};

	};

	/*
	 * Add a new row to the list of files
	 */
	this.addListRow = function( element ){

		// Row div
		var new_row = document.createElement( 'div' );
		new_row.style.fontSize = '7pt'; 

		// Botón Eliminar
		var new_row_button = document.createElement( 'input' );
		new_row_button.type = 'button';
		new_row_button.value = 'Eliminar';
		// Mejorar estilo del botón para eliminar el fichero registrado.
		new_row_button.className = 'frmButtonInput';
		new_row_button.style.marginLeft = '5px';

		// Referencia
		new_row.element = element;

		// Función Eliminar
		new_row_button.onclick= function(){

			// Eliminar el elemento del formulario.
			this.parentNode.element.parentNode.removeChild( this.parentNode.element );

			// Eliminar esta línea (div) de la lista
			this.parentNode.parentNode.removeChild( this.parentNode );

			// Disminuir la cuenta en el contador.
			this.parentNode.element.files_Selector.count--;

			// Re-habilitar el elemento input (si está deshabilitado)
			this.parentNode.element.files_Selector.current_element.disabled = false;
			
			// Actualizar el texto del encabezado de la lista de ficheros.
			if(document.getElementById('files_list_header')!=undefined)
			{
				var countFiles = this.parentNode.element.files_Selector.count-1;
				if(countFiles>0)
				{
					document.getElementById('files_list_header').innerHTML = "<b>Ficheros seleccionados: " + countFiles + " de " + this.parentNode.element.files_Selector.max + " permitidos.</b>";
				}
				else
				{
					document.getElementById('files_list_header').innerHTML = "<b>Ficheros permitidos: " + this.parentNode.element.files_Selector.max + "</b>";
				}
			}

			// Appease Safari
			//    without it Safari wants to reload the browser window
			//    which nixes your already queued uploads
			return false;
		};

		// Set row value
		new_row.innerHTML = element.value;

		// Add button
		new_row.appendChild( new_row_button );

		// Add it to the list
		this.list_target.appendChild( new_row );
		
	};

	/*
		Función adicionada por: Lesky Alfonso M.
		Fecha: 23 de Octubre del 2006
	*/
	this.clearFileSelection = function(){
	
		var lista = document.getElementById('files_list');
		for(i=(lista.childNodes.length-1); i>=(0); i--)
		{
			if(lista.childNodes[i].id=="")
			{
				var divNode = lista.childNodes[i]; 
				for(y=(divNode.childNodes.length-1); y>=(0); y--)
				{
					if(divNode.childNodes[y].type=="button")
					{
						eval(divNode.childNodes[y].click());
					}
				}
			}
		}
	};

}; // Fin de la definición del objeto

var files_Selector = new MultiSelector( document.getElementById( 'files_list' ), maxUploadFiles );
files_Selector.addElement( document.getElementById( 'element_input' ) );