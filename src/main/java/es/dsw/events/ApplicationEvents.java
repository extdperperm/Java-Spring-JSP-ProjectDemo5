package es.dsw.events;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.WebApplicationInitializer;


import es.dsw.configs.ApplicationData;


/* EVENTO INICIO APLICACIÓN*/
public class ApplicationEvents implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
	
		//Al arrancar la aplicación, se inicializa un atributo estático de la definición de un beans con los datos
		//del servletContext, que servirá para obtener el ApplicationContext (contenedor del hilo principal de la aplicación
		//web en spring), para suministrar un beans (cuando se requiera por parte de los hilos de los usuarios) con los datos
		//de parámetros definidos en ficheros (inyección de dependencias). Vea la definición del beans ApplicationData.java.
		ApplicationData.initializeDataContext(servletContext);

		
	
	}
	
}
