package es.dsw.configs;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

/*
 * Se define un componente (bean) que será proporcionado por el contenedor correspondiente al contexto de aplicación web. Recordar,
 * que se ha indicado que este contenedor escaneé el paquete es.dsw.configs en busca de la definición de beans (Ver app-context.xml).
 */
@Component
public class ApplicationData {
	
	//Este atributo es necesario, para poder obtener el ApplicationContext que permitirá
	//a los hilos de usuario solicitar beans de este componente (ApplicationData).
	//Como dato curioso, si se intenta obtener el ApplicationContext con el método WebApplicationContextUtils.getWebApplicationContext
	//en el evento onStartup, devolverá nulo por no estar construido todo el contexto. Por ello, invocaremos dicho método después
	//de estar seguros que el contexto está construido.
	private static ServletContext ServContext;
	
	
	//En el método onStartup de la clase ApplicationEvents (al arrancar la aplicación) se invoca a este método para obtener el ServletContext.
    public static void initializeDataContext(ServletContext arg) {
    	ServContext= arg;
    }
    
    //Método que devolverá al hilo de usuario que lo demande un bean (de esta clase) con los datos/parámetros de los ficheros planos.
    public static ApplicationData getApplicationData()  {

    	//Debes saber o recordar, que una de las particularidades de solicitar un bean a un contenedor en spring, es que estos (si no se indica
    	//lo contrario, como es en este caso), funcionan con el patrón singleton. Es decir, la primera vez que se solicita un bean, se crea. Pero la segunda
    	//o siguientes veces, se devuelve una instancia al mismo objeto (bean) proporcionado en la primera vez.
    	
    	//Por lo dicho anteriormente, la primera vez que un cliente lo solicita, se crea el bean (accediendo a Spring a los ficheros planos para realizar
    	//la inyeción de dependencias) pero las siguientes instancias (del mismo cliente, dentro de la misma sesión de usuario) no se vuelve a crear,
    	//sino que se devuelve la misma instancia al bean, por lo que se evita leer constantemente de los ficheros.
    	
    	//No obstante, tal y como tenemos programado este ejemplo, por cada cliente diferente, si se creará un nuevo bean, pues por mucho que este método sea
    	//estático, se está instanciando desde una controladora (ver MainController.java) y el bean lo crea cada instancia de usuario. 
    	
    	//Si desearamos garantizar que Spring solo realice una vez la lectura de los ficheros planos (para minimizar tiempos/costes), ¿Cómo podríamos garantizarlo?.

    	//¿PODRIAS OPTIMIZAR EL CÓDIGO PARA GARANTIZAR QUE SOLO SE REALICE LA LECTURA DE LOS FICHEROS CON PARÁMETORS UNA SOLA VEZ EN TODO EL CICLO DE EJECUCIÓN DE
    	//LA APLICACIÓN?.
    	
    
		return  WebApplicationContextUtils.getWebApplicationContext(ServContext).getBean(ApplicationData.class);
    	
    		  
    }
    
    //Se lleva a cabo una inyección de dependencia sobre atributos. En este caso, las dependencias son derivadas de ficheros planos.
	@Value("${IDE}")
	private String Ide;

	@Value("${SERVIDOR}")
	private String Servidor;
	
	@Value("${JDK}")
	private String Jdk;
	
	@Value("${GestorProyecto}")
	private String GestorProyecto;
	
	@Value("${IdArtefactoMaven}")
	private String IdArtefactoMaven;
	
	@Value("${Faceta}")
	private String Faceta;
	
	
	//definición de los geters
	public String getIde() {
		return Ide;
	}

	public String getServidor() {
		return Servidor;
	}

	public String getJdk() {
		return Jdk;
	}

	public String getGestorProyecto() {
		return GestorProyecto;
	}

	public String getIdArtefactoMaven() {
		return IdArtefactoMaven;
	}

	public String getFaceta() {
		return Faceta;
	}
	
	



}