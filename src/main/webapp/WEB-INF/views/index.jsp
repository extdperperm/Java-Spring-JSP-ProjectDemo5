<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Proyect Demo 5</title>
<!-- En las vistas .jsp, se puede usar la siguiente directiva para construir las rutas a los recursos estáticos:
		 ${pageContext.request.contextPath} 
     
     En este proyecto se ha optado por indicarlas de forma estática, pero si cambia en las controladoras la ubicación lógica y relativas mapeadas, podrían producirse
     errores de acceso a los recursos (.js, .css) si no se actualizan manualmente.
-->
<link rel="stylesheet" href="./styles/index.css">

</head>
<body>
    <div class="cabecera">
        <div class="cab1"></div>
        <div class="cap2"></div>
    </div>
    <div class="cuerpo">
        <div class="panel1">
            <div class="nota"><div class="notacab1"><p>Proyecto</p></div>
                              <div class="notabody"><p style="text-align: center;"><span>#Spring Proyect Demo 5</span></p>
                            </div>
            </div>
            <div class="nota"><div class="notacab1"><p>Objetivos</p></div>
                              <div class="notabody"><p class="objetivos">- <b>I</b>nyección de dependencias.</p>
                              						<p class="objetivos">- <b>C</b>reación de ficheros de configuración o parametrización de la aplicación.</p>   
                              </div>        
                            
            </div>
            <!-- Se muestran las propiedades del proyecto, pero esta vez, algunas han sido obtenidas desde ficheros de parametrización. -->
            <div class="nota"><div class="notacab2"><p>Entorno de Desarrollo</p></div>
                              <div class="notabody"><p><span>Ide:</span> ${ProyectData.ide}</p>
                                                    <p><span>Servidor:</span> ${ProyectData.servidor}</p>
                                                    <p><span>Jdk:</span> ${ProyectData.jdk}</p>
                            </div>
            </div>
            <div class="nota"><div class="notacab2"><p>Estandar de Desarrollo</p></div>
                              <div class="notabody"><p><span>Gestor de proyecto:</span> ${ProyectData.gestorProyecto}</p>
                                                    <p><span>Id Artefacto maven:</span> ${ProyectData.idArtefactoMaven}</p>
                                                    <p><span>Faceta:</span> ${ProyectData.faceta}</p>
                            </div>
            </div> 
            <div class="nota"><div class="notacab2"><p>Dependencias</p></div>
                              <div class="notabody"><p><span>Spring Framework:</span> Spring, versión 5.3.22. Módulos: Spring Web MVC</p>
                                                    <p><span>Javax servlet:</span> versión: 4.0.1</p>
                            </div>
            </div>    
            <div class="nota"><div class="notacab2"><p>Documentación y Sitios de Interés</p></div>
                              <div class="notabody"><p><a href="https://mvnrepository.com/" target="_blank">Ir a</a> Maven Repository</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/" target="_blank">Leer</a> Documentación de Spring</p>
                                                    <p><a href="https://proitcsolution.com.ve/inyeccion-de-dependencias-spring/" target="_blank">Leer</a> Inyección de dependencias con Spring</p>
                            </div>
            </div>         
        </div>
        <div class="panel2">
            <div class="item"><p><span>Análisis 1 - Inyección de dependencias:</span> En este análisis, se le ofrece un ejemplo de como haciendo uso de la inyección de dependencias de spring se puede añadir al proyecto ficheros con parámetros.</p>
            				  <p>En primer lugar, lo que se ha hecho en el fichero app-context.xml que configura el contenedor del contexto de la aplicación, es añadir los ficheros con los parámetros; context:property-placeholder</p>
            				  <p>Por otro lado, se ha indicado en dicho fichero app-context.xml que spring escaneé los componentes (beans) que se crearán bajo es.dsw.configs.</p>
            				  <p>En es.dsw.configs, se define la clase del bean denominada ApplicationData y en ella se realiza la inyección de dependencias desde los ficheros @Value</p>
            				  <p>Además, dado que el bean se lo tenemos que solicitar al contenedor del contexto de la aplicación, se ha creado un atributo estatico que permitirá acceder al contexto de la aplicación en cualquier momento. Para ello desde el evento onStartup, se asigna un ServletContext que permitirá acceder al contexto.</p>
            </div>
            <div class="item"><p><span>Reto:</span> En este proyecto, se garantiza que spring lea los ficheros con los parámetros una vez por cada cliente/sesión. Sin embargo, por cada cliente diferente (ej: accediendo en local desde diferentes navegadores) se leé los ficheros. ¿Podrías modificar el código para garantizar que solamente se lea una única vez los ficheros con parámetros durante todo el ciclo de ejecución de la aplicación?.</p>

            </div>
        </div>
    </div>
    <div class="pie"><p><span>©</span> 2022 - Daniel Pérez Pérez</p></div>

</body>
</html>